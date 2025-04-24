library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core14_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm3cm5c7c1c0c0cm2c0cm4c0c4cm1c4cm5cm18c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm29c15c0c0c3c3cm1c1cm2c1cm2c2cm1c2c1c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3c0c5c2cm1cm1c3c1c2c1cm6c0c5cm11cm12c4 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c6c7c1c10c13c4c5c0cm16c12c1cm8cm3cm23cm1cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c5c0cm4c0c98c0cm1c0cm30cm1cm6c3c0c1c2c0 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm3cm13c1cm10c5c3c0cm1c2c5c0cm4c5c0cm4cm19 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1cm3c4c0c0cm9c0cm1c2cm10cm1c1cm1cm10c1cm13 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c5c0cm10c2c1c1c4c0c2cm3c5cm2c0c6c10c7 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm22cm6c12cm1c3cm3cm1c1cm4cm8cm2c6cm1cm1c2cm20 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c13cm18c14c0cm3cm2c4c1cm6cm1cm9c1cm7c0c0c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2c5cm2c8cm1c1cm3c0c1c2cm10cm3c1cm43c33c2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c62cm3c1cm1cm1c2cm41c0cm16c3cm3c3c0c4c4cm14 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm2c1c5cm1c1c0cm1c0c0c0c9c0c4cm2c5c1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm2cm4cm6c1c18c0c0cm2c11c0cm4cm1cm1c0c1c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2cm28cm1cm4c0cm3c7cm31c2c4cm8cm5cm1c1c30cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm19c1c3cm24c0cm1c1c1cm3cm1cm1c3c3c2c3c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c10c4cm1c20cm39c1c1cm6c5cm2cm1cm25c5cm1c0cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm5c3c2cm5c7cm1cm1c1c6cm4cm1c17cm5c12cm4c5 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0cm15c15cm10c1c11c14c0c0c15cm6c1cm1cm4cm3cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c8c2c14cm2c3c17c1c0c3c34cm2cm1cm1c4c5cm25 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0cm1c4c0cm1c5c0c1c2cm6c3c0cm1cm1c5c1 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c2cm2c2c11c2cm2cm11c6c2c1cm9cm58c42cm11c7cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1c5cm2c0c0cm3c0c4c6c5c2c7c5c12cm8c5 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm3c9cm10cm4c56c3c0cm1c12cm9c0cm3cm3c24c6cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1c6c2c1cm1c3c1c1cm4c2cm1c1c7c2cm6c8 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1c1c2cm3c0c1c12c0c0c1c5c1c1cm1c2c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm2cm1cm17cm2c0c1cm2c0c0c1c2cm4cm6c2cm3c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3cm31cm8cm2cm4c3cm1c1c3c2c7cm6cm16cm2cm5c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c2c1c6c0cm1c0cm2c1cm3c1c14c3cm3c7c9c1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm6cm1c43c3cm1c0c3cm2c6c1cm8c5cm8c2c7c18 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm4cm17c0c0c3cm3c1c0c1c1c3cm10c3c2cm92cm1 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c1c4cm9cm1c1c1c4cm1c0cm1c1c4c0c2c10c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core14_rmcm;

architecture arch of conv5_core14_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM5C7C1C0C0CM2C0CM4C0C4CM1C4CM5CM18C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM29C15C0C0C3C3CM1C1CM2C1CM2C2CM1C2C1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0C5C2CM1CM1C3C1C2C1CM6C0C5CM11CM12C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C7C1C10C13C4C5C0CM16C12C1CM8CM3CM23CM1CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C0CM4C0C98C0CM1C0CM30CM1CM6C3C0C1C2C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM13C1CM10C5C3C0CM1C2C5C0CM4C5C0CM4CM19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM3C4C0C0CM9C0CM1C2CM10CM1C1CM1CM10C1CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C0CM10C2C1C1C4C0C2CM3C5CM2C0C6C10C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM22CM6C12CM1C3CM3CM1C1CM4CM8CM2C6CM1CM1C2CM20_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13CM18C14C0CM3CM2C4C1CM6CM1CM9C1CM7C0C0C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C5CM2C8CM1C1CM3C0C1C2CM10CM3C1CM43C33C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C62CM3C1CM1CM1C2CM41C0CM16C3CM3C3C0C4C4CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1C5CM1C1C0CM1C0C0C0C9C0C4CM2C5C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM4CM6C1C18C0C0CM2C11C0CM4CM1CM1C0C1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM28CM1CM4C0CM3C7CM31C2C4CM8CM5CM1C1C30CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM19C1C3CM24C0CM1C1C1CM3CM1CM1C3C3C2C3C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10C4CM1C20CM39C1C1CM6C5CM2CM1CM25C5CM1C0CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C3C2CM5C7CM1CM1C1C6CM4CM1C17CM5C12CM4C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM15C15CM10C1C11C14C0C0C15CM6C1CM1CM4CM3CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C2C14CM2C3C17C1C0C3C34CM2CM1CM1C4C5CM25_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C4C0CM1C5C0C1C2CM6C3C0CM1CM1C5C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM2C2C11C2CM2CM11C6C2C1CM9CM58C42CM11C7CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C5CM2C0C0CM3C0C4C6C5C2C7C5C12CM8C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C9CM10CM4C56C3C0CM1C12CM9C0CM3CM3C24C6CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C6C2C1CM1C3C1C1CM4C2CM1C1C7C2CM6C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1C2CM3C0C1C12C0C0C1C5C1C1CM1C2C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM1CM17CM2C0C1CM2C0C0C1C2CM4CM6C2CM3C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM31CM8CM2CM4C3CM1C1C3C2C7CM6CM16CM2CM5C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1C6C0CM1C0CM2C1CM3C1C14C3CM3C7C9C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM1C43C3CM1C0C3CM2C6C1CM8C5CM8C2C7C18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM17C0C0C3CM3C1C0C1C1C3CM10C3C2CM92CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C4CM9CM1C1C1C4CM1C0CM1C1C4C0C2C10C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal cm3cm5c7c1c0c0cm2c0cm4c0c4cm1c4cm5cm18c1_weight : PIPELINE_TYPE_FOR_CM3CM5C7C1C0C0CM2C0CM4C0C4CM1C4CM5CM18C1_WEIGHT;
    -- sfix(2, -6)
    signal cm29c15c0c0c3c3cm1c1cm2c1cm2c2cm1c2c1c2_weight : PIPELINE_TYPE_FOR_CM29C15C0C0C3C3CM1C1CM2C1CM2C2CM1C2C1C2_WEIGHT;
    -- sfix(2, -6)
    signal c3c0c5c2cm1cm1c3c1c2c1cm6c0c5cm11cm12c4_weight : PIPELINE_TYPE_FOR_C3C0C5C2CM1CM1C3C1C2C1CM6C0C5CM11CM12C4_WEIGHT;
    -- sfix(2, -6)
    signal c6c7c1c10c13c4c5c0cm16c12c1cm8cm3cm23cm1cm4_weight : PIPELINE_TYPE_FOR_C6C7C1C10C13C4C5C0CM16C12C1CM8CM3CM23CM1CM4_WEIGHT;
    -- sfix(2, -6)
    signal c5c0cm4c0c98c0cm1c0cm30cm1cm6c3c0c1c2c0_weight : PIPELINE_TYPE_FOR_C5C0CM4C0C98C0CM1C0CM30CM1CM6C3C0C1C2C0_WEIGHT;
    -- sfix(2, -6)
    signal cm3cm13c1cm10c5c3c0cm1c2c5c0cm4c5c0cm4cm19_weight : PIPELINE_TYPE_FOR_CM3CM13C1CM10C5C3C0CM1C2C5C0CM4C5C0CM4CM19_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm3c4c0c0cm9c0cm1c2cm10cm1c1cm1cm10c1cm13_weight : PIPELINE_TYPE_FOR_CM1CM3C4C0C0CM9C0CM1C2CM10CM1C1CM1CM10C1CM13_WEIGHT;
    -- sfix(2, -6)
    signal c5c0cm10c2c1c1c4c0c2cm3c5cm2c0c6c10c7_weight : PIPELINE_TYPE_FOR_C5C0CM10C2C1C1C4C0C2CM3C5CM2C0C6C10C7_WEIGHT;
    -- sfix(2, -6)
    signal cm22cm6c12cm1c3cm3cm1c1cm4cm8cm2c6cm1cm1c2cm20_weight : PIPELINE_TYPE_FOR_CM22CM6C12CM1C3CM3CM1C1CM4CM8CM2C6CM1CM1C2CM20_WEIGHT;
    -- sfix(2, -6)
    signal c13cm18c14c0cm3cm2c4c1cm6cm1cm9c1cm7c0c0c2_weight : PIPELINE_TYPE_FOR_C13CM18C14C0CM3CM2C4C1CM6CM1CM9C1CM7C0C0C2_WEIGHT;
    -- sfix(2, -6)
    signal cm2c5cm2c8cm1c1cm3c0c1c2cm10cm3c1cm43c33c2_weight : PIPELINE_TYPE_FOR_CM2C5CM2C8CM1C1CM3C0C1C2CM10CM3C1CM43C33C2_WEIGHT;
    -- sfix(2, -6)
    signal c62cm3c1cm1cm1c2cm41c0cm16c3cm3c3c0c4c4cm14_weight : PIPELINE_TYPE_FOR_C62CM3C1CM1CM1C2CM41C0CM16C3CM3C3C0C4C4CM14_WEIGHT;
    -- sfix(2, -6)
    signal cm2c1c5cm1c1c0cm1c0c0c0c9c0c4cm2c5c1_weight : PIPELINE_TYPE_FOR_CM2C1C5CM1C1C0CM1C0C0C0C9C0C4CM2C5C1_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm4cm6c1c18c0c0cm2c11c0cm4cm1cm1c0c1c1_weight : PIPELINE_TYPE_FOR_CM2CM4CM6C1C18C0C0CM2C11C0CM4CM1CM1C0C1C1_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm28cm1cm4c0cm3c7cm31c2c4cm8cm5cm1c1c30cm1_weight : PIPELINE_TYPE_FOR_CM2CM28CM1CM4C0CM3C7CM31C2C4CM8CM5CM1C1C30CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm19c1c3cm24c0cm1c1c1cm3cm1cm1c3c3c2c3c2_weight : PIPELINE_TYPE_FOR_CM19C1C3CM24C0CM1C1C1CM3CM1CM1C3C3C2C3C2_WEIGHT;
    -- sfix(2, -6)
    signal c10c4cm1c20cm39c1c1cm6c5cm2cm1cm25c5cm1c0cm3_weight : PIPELINE_TYPE_FOR_C10C4CM1C20CM39C1C1CM6C5CM2CM1CM25C5CM1C0CM3_WEIGHT;
    -- sfix(2, -6)
    signal cm5c3c2cm5c7cm1cm1c1c6cm4cm1c17cm5c12cm4c5_weight : PIPELINE_TYPE_FOR_CM5C3C2CM5C7CM1CM1C1C6CM4CM1C17CM5C12CM4C5_WEIGHT;
    -- sfix(2, -6)
    signal c0cm15c15cm10c1c11c14c0c0c15cm6c1cm1cm4cm3cm1_weight : PIPELINE_TYPE_FOR_C0CM15C15CM10C1C11C14C0C0C15CM6C1CM1CM4CM3CM1_WEIGHT;
    -- sfix(2, -6)
    signal c8c2c14cm2c3c17c1c0c3c34cm2cm1cm1c4c5cm25_weight : PIPELINE_TYPE_FOR_C8C2C14CM2C3C17C1C0C3C34CM2CM1CM1C4C5CM25_WEIGHT;
    -- sfix(2, -6)
    signal c0cm1c4c0cm1c5c0c1c2cm6c3c0cm1cm1c5c1_weight : PIPELINE_TYPE_FOR_C0CM1C4C0CM1C5C0C1C2CM6C3C0CM1CM1C5C1_WEIGHT;
    -- sfix(2, -6)
    signal c2cm2c2c11c2cm2cm11c6c2c1cm9cm58c42cm11c7cm3_weight : PIPELINE_TYPE_FOR_C2CM2C2C11C2CM2CM11C6C2C1CM9CM58C42CM11C7CM3_WEIGHT;
    -- sfix(2, -6)
    signal c1c5cm2c0c0cm3c0c4c6c5c2c7c5c12cm8c5_weight : PIPELINE_TYPE_FOR_C1C5CM2C0C0CM3C0C4C6C5C2C7C5C12CM8C5_WEIGHT;
    -- sfix(2, -6)
    signal cm3c9cm10cm4c56c3c0cm1c12cm9c0cm3cm3c24c6cm1_weight : PIPELINE_TYPE_FOR_CM3C9CM10CM4C56C3C0CM1C12CM9C0CM3CM3C24C6CM1_WEIGHT;
    -- sfix(2, -6)
    signal c1c6c2c1cm1c3c1c1cm4c2cm1c1c7c2cm6c8_weight : PIPELINE_TYPE_FOR_C1C6C2C1CM1C3C1C1CM4C2CM1C1C7C2CM6C8_WEIGHT;
    -- sfix(2, -6)
    signal c1c1c2cm3c0c1c12c0c0c1c5c1c1cm1c2c0_weight : PIPELINE_TYPE_FOR_C1C1C2CM3C0C1C12C0C0C1C5C1C1CM1C2C0_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm1cm17cm2c0c1cm2c0c0c1c2cm4cm6c2cm3c2_weight : PIPELINE_TYPE_FOR_CM2CM1CM17CM2C0C1CM2C0C0C1C2CM4CM6C2CM3C2_WEIGHT;
    -- sfix(2, -6)
    signal c3cm31cm8cm2cm4c3cm1c1c3c2c7cm6cm16cm2cm5c1_weight : PIPELINE_TYPE_FOR_C3CM31CM8CM2CM4C3CM1C1C3C2C7CM6CM16CM2CM5C1_WEIGHT;
    -- sfix(2, -6)
    signal c2c1c6c0cm1c0cm2c1cm3c1c14c3cm3c7c9c1_weight : PIPELINE_TYPE_FOR_C2C1C6C0CM1C0CM2C1CM3C1C14C3CM3C7C9C1_WEIGHT;
    -- sfix(2, -6)
    signal cm6cm1c43c3cm1c0c3cm2c6c1cm8c5cm8c2c7c18_weight : PIPELINE_TYPE_FOR_CM6CM1C43C3CM1C0C3CM2C6C1CM8C5CM8C2C7C18_WEIGHT;
    -- sfix(2, -6)
    signal cm4cm17c0c0c3cm3c1c0c1c1c3cm10c3c2cm92cm1_weight : PIPELINE_TYPE_FOR_CM4CM17C0C0C3CM3C1C0C1C1C3CM10C3C2CM92CM1_WEIGHT;
    -- sfix(2, -6)
    signal c1c4cm9cm1c1c1c4cm1c0cm1c1c4c0c2c10c0_weight : PIPELINE_TYPE_FOR_C1C4CM9CM1C1C1C4CM1C0CM1C1C4C0C2C10C0_WEIGHT;
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



    WEIGHT_ROM: entity work.conv5_core14_rmcm_weightsconstant_memory
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
        
            dout1   => cm3cm5c7c1c0c0cm2c0cm4c0c4cm1c4cm5cm18c1_weight(0), 
            dout2   => cm29c15c0c0c3c3cm1c1cm2c1cm2c2cm1c2c1c2_weight(0), 
            dout3   => c3c0c5c2cm1cm1c3c1c2c1cm6c0c5cm11cm12c4_weight(0), 
            dout4   => c6c7c1c10c13c4c5c0cm16c12c1cm8cm3cm23cm1cm4_weight(0), 
            dout5   => c5c0cm4c0c98c0cm1c0cm30cm1cm6c3c0c1c2c0_weight(0), 
            dout6   => cm3cm13c1cm10c5c3c0cm1c2c5c0cm4c5c0cm4cm19_weight(0), 
            dout7   => cm1cm3c4c0c0cm9c0cm1c2cm10cm1c1cm1cm10c1cm13_weight(0), 
            dout8   => c5c0cm10c2c1c1c4c0c2cm3c5cm2c0c6c10c7_weight(0), 
            dout9   => cm22cm6c12cm1c3cm3cm1c1cm4cm8cm2c6cm1cm1c2cm20_weight(0), 
            dout10   => c13cm18c14c0cm3cm2c4c1cm6cm1cm9c1cm7c0c0c2_weight(0), 
            dout11   => cm2c5cm2c8cm1c1cm3c0c1c2cm10cm3c1cm43c33c2_weight(0), 
            dout12   => c62cm3c1cm1cm1c2cm41c0cm16c3cm3c3c0c4c4cm14_weight(0), 
            dout13   => cm2c1c5cm1c1c0cm1c0c0c0c9c0c4cm2c5c1_weight(0), 
            dout14   => cm2cm4cm6c1c18c0c0cm2c11c0cm4cm1cm1c0c1c1_weight(0), 
            dout15   => cm2cm28cm1cm4c0cm3c7cm31c2c4cm8cm5cm1c1c30cm1_weight(0), 
            dout16   => cm19c1c3cm24c0cm1c1c1cm3cm1cm1c3c3c2c3c2_weight(0), 
            dout17   => c10c4cm1c20cm39c1c1cm6c5cm2cm1cm25c5cm1c0cm3_weight(0), 
            dout18   => cm5c3c2cm5c7cm1cm1c1c6cm4cm1c17cm5c12cm4c5_weight(0), 
            dout19   => c0cm15c15cm10c1c11c14c0c0c15cm6c1cm1cm4cm3cm1_weight(0), 
            dout20   => c8c2c14cm2c3c17c1c0c3c34cm2cm1cm1c4c5cm25_weight(0), 
            dout21   => c0cm1c4c0cm1c5c0c1c2cm6c3c0cm1cm1c5c1_weight(0), 
            dout22   => c2cm2c2c11c2cm2cm11c6c2c1cm9cm58c42cm11c7cm3_weight(0), 
            dout23   => c1c5cm2c0c0cm3c0c4c6c5c2c7c5c12cm8c5_weight(0), 
            dout24   => cm3c9cm10cm4c56c3c0cm1c12cm9c0cm3cm3c24c6cm1_weight(0), 
            dout25   => c1c6c2c1cm1c3c1c1cm4c2cm1c1c7c2cm6c8_weight(0), 
            dout26   => c1c1c2cm3c0c1c12c0c0c1c5c1c1cm1c2c0_weight(0), 
            dout27   => cm2cm1cm17cm2c0c1cm2c0c0c1c2cm4cm6c2cm3c2_weight(0), 
            dout28   => c3cm31cm8cm2cm4c3cm1c1c3c2c7cm6cm16cm2cm5c1_weight(0), 
            dout29   => c2c1c6c0cm1c0cm2c1cm3c1c14c3cm3c7c9c1_weight(0), 
            dout30   => cm6cm1c43c3cm1c0c3cm2c6c1cm8c5cm8c2c7c18_weight(0), 
            dout31   => cm4cm17c0c0c3cm3c1c0c1c1c3cm10c3c2cm92cm1_weight(0), 
            dout32   => c1c4cm9cm1c1c1c4cm1c0cm1c1c4c0c2c10c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm3cm5c7c1c0c0cm2c0cm4c0c4cm1c4cm5cm18c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm5c7c1c0c0cm2c0cm4c0c4cm1c4cm5cm18c1_weight(0), cm3cm5c7c1c0c0cm2c0cm4c0c4cm1c4cm5cm18c1_weight(1));
    PL_STEP_0_for_cm29c15c0c0c3c3cm1c1cm2c1cm2c2cm1c2c1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm29c15c0c0c3c3cm1c1cm2c1cm2c2cm1c2c1c2_weight(0), cm29c15c0c0c3c3cm1c1cm2c1cm2c2cm1c2c1c2_weight(1));
    PL_STEP_0_for_c3c0c5c2cm1cm1c3c1c2c1cm6c0c5cm11cm12c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0c5c2cm1cm1c3c1c2c1cm6c0c5cm11cm12c4_weight(0), c3c0c5c2cm1cm1c3c1c2c1cm6c0c5cm11cm12c4_weight(1));
    PL_STEP_0_for_c6c7c1c10c13c4c5c0cm16c12c1cm8cm3cm23cm1cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c7c1c10c13c4c5c0cm16c12c1cm8cm3cm23cm1cm4_weight(0), c6c7c1c10c13c4c5c0cm16c12c1cm8cm3cm23cm1cm4_weight(1));
    PL_STEP_0_for_c5c0cm4c0c98c0cm1c0cm30cm1cm6c3c0c1c2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c0cm4c0c98c0cm1c0cm30cm1cm6c3c0c1c2c0_weight(0), c5c0cm4c0c98c0cm1c0cm30cm1cm6c3c0c1c2c0_weight(1));
    PL_STEP_0_for_cm3cm13c1cm10c5c3c0cm1c2c5c0cm4c5c0cm4cm19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm13c1cm10c5c3c0cm1c2c5c0cm4c5c0cm4cm19_weight(0), cm3cm13c1cm10c5c3c0cm1c2c5c0cm4c5c0cm4cm19_weight(1));
    PL_STEP_0_for_cm1cm3c4c0c0cm9c0cm1c2cm10cm1c1cm1cm10c1cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm3c4c0c0cm9c0cm1c2cm10cm1c1cm1cm10c1cm13_weight(0), cm1cm3c4c0c0cm9c0cm1c2cm10cm1c1cm1cm10c1cm13_weight(1));
    PL_STEP_0_for_c5c0cm10c2c1c1c4c0c2cm3c5cm2c0c6c10c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c0cm10c2c1c1c4c0c2cm3c5cm2c0c6c10c7_weight(0), c5c0cm10c2c1c1c4c0c2cm3c5cm2c0c6c10c7_weight(1));
    PL_STEP_0_for_cm22cm6c12cm1c3cm3cm1c1cm4cm8cm2c6cm1cm1c2cm20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm22cm6c12cm1c3cm3cm1c1cm4cm8cm2c6cm1cm1c2cm20_weight(0), cm22cm6c12cm1c3cm3cm1c1cm4cm8cm2c6cm1cm1c2cm20_weight(1));
    PL_STEP_0_for_c13cm18c14c0cm3cm2c4c1cm6cm1cm9c1cm7c0c0c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13cm18c14c0cm3cm2c4c1cm6cm1cm9c1cm7c0c0c2_weight(0), c13cm18c14c0cm3cm2c4c1cm6cm1cm9c1cm7c0c0c2_weight(1));
    PL_STEP_0_for_cm2c5cm2c8cm1c1cm3c0c1c2cm10cm3c1cm43c33c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c5cm2c8cm1c1cm3c0c1c2cm10cm3c1cm43c33c2_weight(0), cm2c5cm2c8cm1c1cm3c0c1c2cm10cm3c1cm43c33c2_weight(1));
    PL_STEP_0_for_c62cm3c1cm1cm1c2cm41c0cm16c3cm3c3c0c4c4cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c62cm3c1cm1cm1c2cm41c0cm16c3cm3c3c0c4c4cm14_weight(0), c62cm3c1cm1cm1c2cm41c0cm16c3cm3c3c0c4c4cm14_weight(1));
    PL_STEP_0_for_cm2c1c5cm1c1c0cm1c0c0c0c9c0c4cm2c5c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1c5cm1c1c0cm1c0c0c0c9c0c4cm2c5c1_weight(0), cm2c1c5cm1c1c0cm1c0c0c0c9c0c4cm2c5c1_weight(1));
    PL_STEP_0_for_cm2cm4cm6c1c18c0c0cm2c11c0cm4cm1cm1c0c1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm4cm6c1c18c0c0cm2c11c0cm4cm1cm1c0c1c1_weight(0), cm2cm4cm6c1c18c0c0cm2c11c0cm4cm1cm1c0c1c1_weight(1));
    PL_STEP_0_for_cm2cm28cm1cm4c0cm3c7cm31c2c4cm8cm5cm1c1c30cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm28cm1cm4c0cm3c7cm31c2c4cm8cm5cm1c1c30cm1_weight(0), cm2cm28cm1cm4c0cm3c7cm31c2c4cm8cm5cm1c1c30cm1_weight(1));
    PL_STEP_0_for_cm19c1c3cm24c0cm1c1c1cm3cm1cm1c3c3c2c3c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm19c1c3cm24c0cm1c1c1cm3cm1cm1c3c3c2c3c2_weight(0), cm19c1c3cm24c0cm1c1c1cm3cm1cm1c3c3c2c3c2_weight(1));
    PL_STEP_0_for_c10c4cm1c20cm39c1c1cm6c5cm2cm1cm25c5cm1c0cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10c4cm1c20cm39c1c1cm6c5cm2cm1cm25c5cm1c0cm3_weight(0), c10c4cm1c20cm39c1c1cm6c5cm2cm1cm25c5cm1c0cm3_weight(1));
    PL_STEP_0_for_cm5c3c2cm5c7cm1cm1c1c6cm4cm1c17cm5c12cm4c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c3c2cm5c7cm1cm1c1c6cm4cm1c17cm5c12cm4c5_weight(0), cm5c3c2cm5c7cm1cm1c1c6cm4cm1c17cm5c12cm4c5_weight(1));
    PL_STEP_0_for_c0cm15c15cm10c1c11c14c0c0c15cm6c1cm1cm4cm3cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm15c15cm10c1c11c14c0c0c15cm6c1cm1cm4cm3cm1_weight(0), c0cm15c15cm10c1c11c14c0c0c15cm6c1cm1cm4cm3cm1_weight(1));
    PL_STEP_0_for_c8c2c14cm2c3c17c1c0c3c34cm2cm1cm1c4c5cm25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c2c14cm2c3c17c1c0c3c34cm2cm1cm1c4c5cm25_weight(0), c8c2c14cm2c3c17c1c0c3c34cm2cm1cm1c4c5cm25_weight(1));
    PL_STEP_0_for_c0cm1c4c0cm1c5c0c1c2cm6c3c0cm1cm1c5c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c4c0cm1c5c0c1c2cm6c3c0cm1cm1c5c1_weight(0), c0cm1c4c0cm1c5c0c1c2cm6c3c0cm1cm1c5c1_weight(1));
    PL_STEP_0_for_c2cm2c2c11c2cm2cm11c6c2c1cm9cm58c42cm11c7cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm2c2c11c2cm2cm11c6c2c1cm9cm58c42cm11c7cm3_weight(0), c2cm2c2c11c2cm2cm11c6c2c1cm9cm58c42cm11c7cm3_weight(1));
    PL_STEP_0_for_c1c5cm2c0c0cm3c0c4c6c5c2c7c5c12cm8c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c5cm2c0c0cm3c0c4c6c5c2c7c5c12cm8c5_weight(0), c1c5cm2c0c0cm3c0c4c6c5c2c7c5c12cm8c5_weight(1));
    PL_STEP_0_for_cm3c9cm10cm4c56c3c0cm1c12cm9c0cm3cm3c24c6cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c9cm10cm4c56c3c0cm1c12cm9c0cm3cm3c24c6cm1_weight(0), cm3c9cm10cm4c56c3c0cm1c12cm9c0cm3cm3c24c6cm1_weight(1));
    PL_STEP_0_for_c1c6c2c1cm1c3c1c1cm4c2cm1c1c7c2cm6c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c6c2c1cm1c3c1c1cm4c2cm1c1c7c2cm6c8_weight(0), c1c6c2c1cm1c3c1c1cm4c2cm1c1c7c2cm6c8_weight(1));
    PL_STEP_0_for_c1c1c2cm3c0c1c12c0c0c1c5c1c1cm1c2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1c2cm3c0c1c12c0c0c1c5c1c1cm1c2c0_weight(0), c1c1c2cm3c0c1c12c0c0c1c5c1c1cm1c2c0_weight(1));
    PL_STEP_0_for_cm2cm1cm17cm2c0c1cm2c0c0c1c2cm4cm6c2cm3c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm1cm17cm2c0c1cm2c0c0c1c2cm4cm6c2cm3c2_weight(0), cm2cm1cm17cm2c0c1cm2c0c0c1c2cm4cm6c2cm3c2_weight(1));
    PL_STEP_0_for_c3cm31cm8cm2cm4c3cm1c1c3c2c7cm6cm16cm2cm5c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm31cm8cm2cm4c3cm1c1c3c2c7cm6cm16cm2cm5c1_weight(0), c3cm31cm8cm2cm4c3cm1c1c3c2c7cm6cm16cm2cm5c1_weight(1));
    PL_STEP_0_for_c2c1c6c0cm1c0cm2c1cm3c1c14c3cm3c7c9c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1c6c0cm1c0cm2c1cm3c1c14c3cm3c7c9c1_weight(0), c2c1c6c0cm1c0cm2c1cm3c1c14c3cm3c7c9c1_weight(1));
    PL_STEP_0_for_cm6cm1c43c3cm1c0c3cm2c6c1cm8c5cm8c2c7c18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm1c43c3cm1c0c3cm2c6c1cm8c5cm8c2c7c18_weight(0), cm6cm1c43c3cm1c0c3cm2c6c1cm8c5cm8c2c7c18_weight(1));
    PL_STEP_0_for_cm4cm17c0c0c3cm3c1c0c1c1c3cm10c3c2cm92cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm17c0c0c3cm3c1c0c1c1c3cm10c3c2cm92cm1_weight(0), cm4cm17c0c0c3cm3c1c0c1c1c3cm10c3c2cm92cm1_weight(1));
    PL_STEP_0_for_c1c4cm9cm1c1c1c4cm1c0cm1c1c4c0c2c10c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c4cm9cm1c1c1c4cm1c0cm1c1c4c0c2c10c0_weight(0), c1c4cm9cm1c1c1c4cm1c0cm1c1c4c0c2c10c0_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c5c0cm4c0c98c0cm1c0cm30cm1cm6c3c0c1c2c0_c0cm1c4c0cm1c5c0c1c2cm6c3c0cm1cm1c5c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5c0cm4c0c98c0cm1c0cm30cm1cm6c3c0c1c2c0_weight(1)(8-1 downto 0),
			B	=> c0cm1c4c0cm1c5c0c1c2cm6c3c0cm1cm1c5c1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c0cm4c0c98c0cm1c0cm30cm1cm6c3c0c1c2c0,
			CxB => R_c0cm1c4c0cm1c5c0c1c2cm6c3c0cm1cm1c5c1
		);

    cm4cm17c0c0c3cm3c1c0c1c1c3cm10c3c2cm92cm1_c1c4cm9cm1c1c1c4cm1c0cm1c1c4c0c2c10c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm17c0c0c3cm3c1c0c1c1c3cm10c3c2cm92cm1_weight(1)(8-1 downto 0),
			B	=> c1c4cm9cm1c1c1c4cm1c0cm1c1c4c0c2c10c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm17c0c0c3cm3c1c0c1c1c3cm10c3c2cm92cm1,
			CxB => R_c1c4cm9cm1c1c1c4cm1c0cm1c1c4c0c2c10c0
		);

    cm2c5cm2c8cm1c1cm3c0c1c2cm10cm3c1cm43c33c2_c2c1c6c0cm1c0cm2c1cm3c1c14c3cm3c7c9c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c5cm2c8cm1c1cm3c0c1c2cm10cm3c1cm43c33c2_weight(1)(7-1 downto 0),
			B	=> c2c1c6c0cm1c0cm2c1cm3c1c14c3cm3c7c9c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c5cm2c8cm1c1cm3c0c1c2cm10cm3c1cm43c33c2,
			CxB => R_c2c1c6c0cm1c0cm2c1cm3c1c14c3cm3c7c9c1
		);

    c62cm3c1cm1cm1c2cm41c0cm16c3cm3c3c0c4c4cm14_c1c1c2cm3c0c1c12c0c0c1c5c1c1cm1c2c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c62cm3c1cm1cm1c2cm41c0cm16c3cm3c3c0c4c4cm14_weight(1)(7-1 downto 0),
			B	=> c1c1c2cm3c0c1c12c0c0c1c5c1c1cm1c2c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c62cm3c1cm1cm1c2cm41c0cm16c3cm3c3c0c4c4cm14,
			CxB => R_c1c1c2cm3c0c1c12c0c0c1c5c1c1cm1c2c0
		);

    c10c4cm1c20cm39c1c1cm6c5cm2cm1cm25c5cm1c0cm3_c1c6c2c1cm1c3c1c1cm4c2cm1c1c7c2cm6c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c10c4cm1c20cm39c1c1cm6c5cm2cm1cm25c5cm1c0cm3_weight(1)(7-1 downto 0),
			B	=> c1c6c2c1cm1c3c1c1cm4c2cm1c1c7c2cm6c8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c10c4cm1c20cm39c1c1cm6c5cm2cm1cm25c5cm1c0cm3,
			CxB => R_c1c6c2c1cm1c3c1c1cm4c2cm1c1c7c2cm6c8
		);

    c8c2c14cm2c3c17c1c0c3c34cm2cm1cm1c4c5cm25_c1c5cm2c0c0cm3c0c4c6c5c2c7c5c12cm8c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c8c2c14cm2c3c17c1c0c3c34cm2cm1cm1c4c5cm25_weight(1)(7-1 downto 0),
			B	=> c1c5cm2c0c0cm3c0c4c6c5c2c7c5c12cm8c5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c8c2c14cm2c3c17c1c0c3c34cm2cm1cm1c4c5cm25,
			CxB => R_c1c5cm2c0c0cm3c0c4c6c5c2c7c5c12cm8c5
		);

    c2cm2c2c11c2cm2cm11c6c2c1cm9cm58c42cm11c7cm3_c0cm15c15cm10c1c11c14c0c0c15cm6c1cm1cm4cm3cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2cm2c2c11c2cm2cm11c6c2c1cm9cm58c42cm11c7cm3_weight(1)(7-1 downto 0),
			B	=> c0cm15c15cm10c1c11c14c0c0c15cm6c1cm1cm4cm3cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm2c2c11c2cm2cm11c6c2c1cm9cm58c42cm11c7cm3,
			CxB => R_c0cm15c15cm10c1c11c14c0c0c15cm6c1cm1cm4cm3cm1
		);

    cm3c9cm10cm4c56c3c0cm1c12cm9c0cm3cm3c24c6cm1_cm2c1c5cm1c1c0cm1c0c0c0c9c0c4cm2c5c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c9cm10cm4c56c3c0cm1c12cm9c0cm3cm3c24c6cm1_weight(1)(7-1 downto 0),
			B	=> cm2c1c5cm1c1c0cm1c0c0c0c9c0c4cm2c5c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c9cm10cm4c56c3c0cm1c12cm9c0cm3cm3c24c6cm1,
			CxB => R_cm2c1c5cm1c1c0cm1c0c0c0c9c0c4cm2c5c1
		);

    cm6cm1c43c3cm1c0c3cm2c6c1cm8c5cm8c2c7c18_c5c0cm10c2c1c1c4c0c2cm3c5cm2c0c6c10c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6cm1c43c3cm1c0c3cm2c6c1cm8c5cm8c2c7c18_weight(1)(7-1 downto 0),
			B	=> c5c0cm10c2c1c1c4c0c2cm3c5cm2c0c6c10c7_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6cm1c43c3cm1c0c3cm2c6c1cm8c5cm8c2c7c18,
			CxB => R_c5c0cm10c2c1c1c4c0c2cm3c5cm2c0c6c10c7
		);

    cm3cm5c7c1c0c0cm2c0cm4c0c4cm1c4cm5cm18c1_cm1cm3c4c0c0cm9c0cm1c2cm10cm1c1cm1cm10c1cm13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3cm5c7c1c0c0cm2c0cm4c0c4cm1c4cm5cm18c1_weight(1)(6-1 downto 0),
			B	=> cm1cm3c4c0c0cm9c0cm1c2cm10cm1c1cm1cm10c1cm13_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3cm5c7c1c0c0cm2c0cm4c0c4cm1c4cm5cm18c1,
			CxB => R_cm1cm3c4c0c0cm9c0cm1c2cm10cm1c1cm1cm10c1cm13
		);

    cm29c15c0c0c3c3cm1c1cm2c1cm2c2cm1c2c1c2_c3c0c5c2cm1cm1c3c1c2c1cm6c0c5cm11cm12c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm29c15c0c0c3c3cm1c1cm2c1cm2c2cm1c2c1c2_weight(1)(6-1 downto 0),
			B	=> c3c0c5c2cm1cm1c3c1c2c1cm6c0c5cm11cm12c4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm29c15c0c0c3c3cm1c1cm2c1cm2c2cm1c2c1c2,
			CxB => R_c3c0c5c2cm1cm1c3c1c2c1cm6c0c5cm11cm12c4
		);

    c6c7c1c10c13c4c5c0cm16c12c1cm8cm3cm23cm1cm4_c3cm31cm8cm2cm4c3cm1c1c3c2c7cm6cm16cm2cm5c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6c7c1c10c13c4c5c0cm16c12c1cm8cm3cm23cm1cm4_weight(1)(6-1 downto 0),
			B	=> c3cm31cm8cm2cm4c3cm1c1c3c2c7cm6cm16cm2cm5c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6c7c1c10c13c4c5c0cm16c12c1cm8cm3cm23cm1cm4,
			CxB => R_c3cm31cm8cm2cm4c3cm1c1c3c2c7cm6cm16cm2cm5c1
		);

    cm3cm13c1cm10c5c3c0cm1c2c5c0cm4c5c0cm4cm19_cm2cm1cm17cm2c0c1cm2c0c0c1c2cm4cm6c2cm3c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3cm13c1cm10c5c3c0cm1c2c5c0cm4c5c0cm4cm19_weight(1)(6-1 downto 0),
			B	=> cm2cm1cm17cm2c0c1cm2c0c0c1c2cm4cm6c2cm3c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3cm13c1cm10c5c3c0cm1c2c5c0cm4c5c0cm4cm19,
			CxB => R_cm2cm1cm17cm2c0c1cm2c0c0c1c2cm4cm6c2cm3c2
		);

    cm22cm6c12cm1c3cm3cm1c1cm4cm8cm2c6cm1cm1c2cm20_cm5c3c2cm5c7cm1cm1c1c6cm4cm1c17cm5c12cm4c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm22cm6c12cm1c3cm3cm1c1cm4cm8cm2c6cm1cm1c2cm20_weight(1)(6-1 downto 0),
			B	=> cm5c3c2cm5c7cm1cm1c1c6cm4cm1c17cm5c12cm4c5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm22cm6c12cm1c3cm3cm1c1cm4cm8cm2c6cm1cm1c2cm20,
			CxB => R_cm5c3c2cm5c7cm1cm1c1c6cm4cm1c17cm5c12cm4c5
		);

    c13cm18c14c0cm3cm2c4c1cm6cm1cm9c1cm7c0c0c2_cm19c1c3cm24c0cm1c1c1cm3cm1cm1c3c3c2c3c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c13cm18c14c0cm3cm2c4c1cm6cm1cm9c1cm7c0c0c2_weight(1)(6-1 downto 0),
			B	=> cm19c1c3cm24c0cm1c1c1cm3cm1cm1c3c3c2c3c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c13cm18c14c0cm3cm2c4c1cm6cm1cm9c1cm7c0c0c2,
			CxB => R_cm19c1c3cm24c0cm1c1c1cm3cm1cm1c3c3c2c3c2
		);

    cm2cm4cm6c1c18c0c0cm2c11c0cm4cm1cm1c0c1c1_cm2cm28cm1cm4c0cm3c7cm31c2c4cm8cm5cm1c1c30cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm4cm6c1c18c0c0cm2c11c0cm4cm1cm1c0c1c1_weight(1)(6-1 downto 0),
			B	=> cm2cm28cm1cm4c0cm3c7cm31c2c4cm8cm5cm1c1c30cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm4cm6c1c18c0c0cm2c11c0cm4cm1cm1c0c1c1,
			CxB => R_cm2cm28cm1cm4c0cm3c7cm31c2c4cm8cm5cm1c1c30cm1
		);




end architecture;
