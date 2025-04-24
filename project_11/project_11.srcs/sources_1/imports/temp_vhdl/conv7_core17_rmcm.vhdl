library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core17_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm2c5cm5c7cm29c11c2c1c5cm3cm104c3c10c13c19c9 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c3cm10c2cm15cm7c7c26cm3cm7c2cm7cm4c8cm45cm2cm12 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0cm20cm4cm3cm6c7cm1cm3c7c4c5c10c4cm40c7c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c6cm1cm11c1c4c79cm4c6c4cm7cm19cm72cm23c4cm33cm3 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm16c7c5cm3c0c2c32cm9cm4cm8cm36cm2cm20cm5cm3cm9 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1c0c28cm15c40cm2c16cm9cm4c5c6c16c4c11c10c21 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2c11c1cm6c56c8c4cm6cm16c12cm1cm5cm3c14c0cm6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c13c4c2cm10cm16cm3c17cm8c3c3c5cm2c10cm6c46cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm5cm3c1c7cm6cm18c6cm3c2cm10c6cm19cm1c10c13cm16 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1cm1cm2c11c64cm1cm5c0c1c1c6cm11cm4cm7cm6c19 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm6c0c12c15c20c10cm1c0cm3c10cm10c1c1cm6c10c39 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2c0c4cm2c1cm12c4cm2cm12c5c7cm4cm4c1cm2cm11 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm13cm7c2c3cm5c5cm1cm3c6cm9c21cm1c4c0c1cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm7c4c2cm3c8c0cm5c2cm3c6c5cm3cm4c3c1c1 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm2cm13c1cm6c12cm21c13c7cm8cm7c1c2cm3c22c16c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1c121c1cm3cm9c3cm4c1c37c5c7c10cm1cm21c8c6 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm18cm22c4cm3cm2cm2c4cm4c8cm2cm5c15c42c11cm28c6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm5c0cm2cm13cm29c0c55c0c12c0c14cm3c4cm8cm1c7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1cm1c2c3cm13c22cm2cm2c21cm13c6cm10cm13c12c5c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1cm5c3cm10c5cm5c5cm11cm21cm6c4c127cm2cm14cm9c4 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c1cm5cm5c54cm23cm4cm13cm2cm2cm1c3c4c2cm1cm1cm12 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0cm4cm12cm8cm3c13cm10cm14cm5c2cm7c3c5cm35c4cm41 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3c6c4c0c4cm10c11c2c9cm28c8c6c7cm1c6c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm6cm11cm7c11c7cm6c0cm2cm7cm8c2cm1c7c19c8c49 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm4c2c3cm1c10cm39c2c1cm12cm2c4cm3cm20cm5c9c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c17cm6cm12cm6c9c0c16c2c3c75c0c2c0c23cm43c5 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm3cm1c2c1cm1cm4c8cm16c5c25cm44cm22c2c1cm3c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm16cm7c15c1c0cm16c1c15cm9cm3c12c0c8cm29c6cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm5c7c4cm5c2cm3cm3c1c19c4cm3cm5cm5cm8cm2cm9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm3cm3cm2c3cm23c13cm28cm6c9c3c0c1cm11c7c3c14 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1c8c2c1c8cm31c1c4cm15c4c2c34c9c14c0c8 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm14c0c1c9c12cm18cm4c13c10c22c46c9c7cm52c3c10 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core17_rmcm;

architecture arch of conv7_core17_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C5CM5C7CM29C11C2C1C5CM3CM104C3C10C13C19C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM10C2CM15CM7C7C26CM3CM7C2CM7CM4C8CM45CM2CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM20CM4CM3CM6C7CM1CM3C7C4C5C10C4CM40C7C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM1CM11C1C4C79CM4C6C4CM7CM19CM72CM23C4CM33CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM16C7C5CM3C0C2C32CM9CM4CM8CM36CM2CM20CM5CM3CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0C28CM15C40CM2C16CM9CM4C5C6C16C4C11C10C21_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C11C1CM6C56C8C4CM6CM16C12CM1CM5CM3C14C0CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13C4C2CM10CM16CM3C17CM8C3C3C5CM2C10CM6C46CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM3C1C7CM6CM18C6CM3C2CM10C6CM19CM1C10C13CM16_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM1CM2C11C64CM1CM5C0C1C1C6CM11CM4CM7CM6C19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C0C12C15C20C10CM1C0CM3C10CM10C1C1CM6C10C39_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C0C4CM2C1CM12C4CM2CM12C5C7CM4CM4C1CM2CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13CM7C2C3CM5C5CM1CM3C6CM9C21CM1C4C0C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C4C2CM3C8C0CM5C2CM3C6C5CM3CM4C3C1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM13C1CM6C12CM21C13C7CM8CM7C1C2CM3C22C16C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C121C1CM3CM9C3CM4C1C37C5C7C10CM1CM21C8C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM18CM22C4CM3CM2CM2C4CM4C8CM2CM5C15C42C11CM28C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C0CM2CM13CM29C0C55C0C12C0C14CM3C4CM8CM1C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C2C3CM13C22CM2CM2C21CM13C6CM10CM13C12C5C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM5C3CM10C5CM5C5CM11CM21CM6C4C127CM2CM14CM9C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM5CM5C54CM23CM4CM13CM2CM2CM1C3C4C2CM1CM1CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM4CM12CM8CM3C13CM10CM14CM5C2CM7C3C5CM35C4CM41_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C6C4C0C4CM10C11C2C9CM28C8C6C7CM1C6C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM11CM7C11C7CM6C0CM2CM7CM8C2CM1C7C19C8C49_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C2C3CM1C10CM39C2C1CM12CM2C4CM3CM20CM5C9C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C17CM6CM12CM6C9C0C16C2C3C75C0C2C0C23CM43C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM1C2C1CM1CM4C8CM16C5C25CM44CM22C2C1CM3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM16CM7C15C1C0CM16C1C15CM9CM3C12C0C8CM29C6CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C7C4CM5C2CM3CM3C1C19C4CM3CM5CM5CM8CM2CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM3CM2C3CM23C13CM28CM6C9C3C0C1CM11C7C3C14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C8C2C1C8CM31C1C4CM15C4C2C34C9C14C0C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14C0C1C9C12CM18CM4C13C10C22C46C9C7CM52C3C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm2c5cm5c7cm29c11c2c1c5cm3cm104c3c10c13c19c9_weight : PIPELINE_TYPE_FOR_CM2C5CM5C7CM29C11C2C1C5CM3CM104C3C10C13C19C9_WEIGHT;
    -- sfix(1, -7)
    signal c3cm10c2cm15cm7c7c26cm3cm7c2cm7cm4c8cm45cm2cm12_weight : PIPELINE_TYPE_FOR_C3CM10C2CM15CM7C7C26CM3CM7C2CM7CM4C8CM45CM2CM12_WEIGHT;
    -- sfix(1, -7)
    signal c0cm20cm4cm3cm6c7cm1cm3c7c4c5c10c4cm40c7c1_weight : PIPELINE_TYPE_FOR_C0CM20CM4CM3CM6C7CM1CM3C7C4C5C10C4CM40C7C1_WEIGHT;
    -- sfix(1, -7)
    signal c6cm1cm11c1c4c79cm4c6c4cm7cm19cm72cm23c4cm33cm3_weight : PIPELINE_TYPE_FOR_C6CM1CM11C1C4C79CM4C6C4CM7CM19CM72CM23C4CM33CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm16c7c5cm3c0c2c32cm9cm4cm8cm36cm2cm20cm5cm3cm9_weight : PIPELINE_TYPE_FOR_CM16C7C5CM3C0C2C32CM9CM4CM8CM36CM2CM20CM5CM3CM9_WEIGHT;
    -- sfix(1, -7)
    signal cm1c0c28cm15c40cm2c16cm9cm4c5c6c16c4c11c10c21_weight : PIPELINE_TYPE_FOR_CM1C0C28CM15C40CM2C16CM9CM4C5C6C16C4C11C10C21_WEIGHT;
    -- sfix(1, -7)
    signal cm2c11c1cm6c56c8c4cm6cm16c12cm1cm5cm3c14c0cm6_weight : PIPELINE_TYPE_FOR_CM2C11C1CM6C56C8C4CM6CM16C12CM1CM5CM3C14C0CM6_WEIGHT;
    -- sfix(1, -7)
    signal c13c4c2cm10cm16cm3c17cm8c3c3c5cm2c10cm6c46cm3_weight : PIPELINE_TYPE_FOR_C13C4C2CM10CM16CM3C17CM8C3C3C5CM2C10CM6C46CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm5cm3c1c7cm6cm18c6cm3c2cm10c6cm19cm1c10c13cm16_weight : PIPELINE_TYPE_FOR_CM5CM3C1C7CM6CM18C6CM3C2CM10C6CM19CM1C10C13CM16_WEIGHT;
    -- sfix(1, -7)
    signal c1cm1cm2c11c64cm1cm5c0c1c1c6cm11cm4cm7cm6c19_weight : PIPELINE_TYPE_FOR_C1CM1CM2C11C64CM1CM5C0C1C1C6CM11CM4CM7CM6C19_WEIGHT;
    -- sfix(1, -7)
    signal cm6c0c12c15c20c10cm1c0cm3c10cm10c1c1cm6c10c39_weight : PIPELINE_TYPE_FOR_CM6C0C12C15C20C10CM1C0CM3C10CM10C1C1CM6C10C39_WEIGHT;
    -- sfix(1, -7)
    signal c2c0c4cm2c1cm12c4cm2cm12c5c7cm4cm4c1cm2cm11_weight : PIPELINE_TYPE_FOR_C2C0C4CM2C1CM12C4CM2CM12C5C7CM4CM4C1CM2CM11_WEIGHT;
    -- sfix(1, -7)
    signal cm13cm7c2c3cm5c5cm1cm3c6cm9c21cm1c4c0c1cm1_weight : PIPELINE_TYPE_FOR_CM13CM7C2C3CM5C5CM1CM3C6CM9C21CM1C4C0C1CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm7c4c2cm3c8c0cm5c2cm3c6c5cm3cm4c3c1c1_weight : PIPELINE_TYPE_FOR_CM7C4C2CM3C8C0CM5C2CM3C6C5CM3CM4C3C1C1_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm13c1cm6c12cm21c13c7cm8cm7c1c2cm3c22c16c0_weight : PIPELINE_TYPE_FOR_CM2CM13C1CM6C12CM21C13C7CM8CM7C1C2CM3C22C16C0_WEIGHT;
    -- sfix(1, -7)
    signal cm1c121c1cm3cm9c3cm4c1c37c5c7c10cm1cm21c8c6_weight : PIPELINE_TYPE_FOR_CM1C121C1CM3CM9C3CM4C1C37C5C7C10CM1CM21C8C6_WEIGHT;
    -- sfix(1, -7)
    signal cm18cm22c4cm3cm2cm2c4cm4c8cm2cm5c15c42c11cm28c6_weight : PIPELINE_TYPE_FOR_CM18CM22C4CM3CM2CM2C4CM4C8CM2CM5C15C42C11CM28C6_WEIGHT;
    -- sfix(1, -7)
    signal cm5c0cm2cm13cm29c0c55c0c12c0c14cm3c4cm8cm1c7_weight : PIPELINE_TYPE_FOR_CM5C0CM2CM13CM29C0C55C0C12C0C14CM3C4CM8CM1C7_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm1c2c3cm13c22cm2cm2c21cm13c6cm10cm13c12c5c2_weight : PIPELINE_TYPE_FOR_CM1CM1C2C3CM13C22CM2CM2C21CM13C6CM10CM13C12C5C2_WEIGHT;
    -- sfix(1, -7)
    signal c1cm5c3cm10c5cm5c5cm11cm21cm6c4c127cm2cm14cm9c4_weight : PIPELINE_TYPE_FOR_C1CM5C3CM10C5CM5C5CM11CM21CM6C4C127CM2CM14CM9C4_WEIGHT;
    -- sfix(1, -7)
    signal c1cm5cm5c54cm23cm4cm13cm2cm2cm1c3c4c2cm1cm1cm12_weight : PIPELINE_TYPE_FOR_C1CM5CM5C54CM23CM4CM13CM2CM2CM1C3C4C2CM1CM1CM12_WEIGHT;
    -- sfix(1, -7)
    signal c0cm4cm12cm8cm3c13cm10cm14cm5c2cm7c3c5cm35c4cm41_weight : PIPELINE_TYPE_FOR_C0CM4CM12CM8CM3C13CM10CM14CM5C2CM7C3C5CM35C4CM41_WEIGHT;
    -- sfix(1, -7)
    signal cm3c6c4c0c4cm10c11c2c9cm28c8c6c7cm1c6c2_weight : PIPELINE_TYPE_FOR_CM3C6C4C0C4CM10C11C2C9CM28C8C6C7CM1C6C2_WEIGHT;
    -- sfix(1, -7)
    signal cm6cm11cm7c11c7cm6c0cm2cm7cm8c2cm1c7c19c8c49_weight : PIPELINE_TYPE_FOR_CM6CM11CM7C11C7CM6C0CM2CM7CM8C2CM1C7C19C8C49_WEIGHT;
    -- sfix(1, -7)
    signal cm4c2c3cm1c10cm39c2c1cm12cm2c4cm3cm20cm5c9c0_weight : PIPELINE_TYPE_FOR_CM4C2C3CM1C10CM39C2C1CM12CM2C4CM3CM20CM5C9C0_WEIGHT;
    -- sfix(1, -7)
    signal c17cm6cm12cm6c9c0c16c2c3c75c0c2c0c23cm43c5_weight : PIPELINE_TYPE_FOR_C17CM6CM12CM6C9C0C16C2C3C75C0C2C0C23CM43C5_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm1c2c1cm1cm4c8cm16c5c25cm44cm22c2c1cm3c0_weight : PIPELINE_TYPE_FOR_CM3CM1C2C1CM1CM4C8CM16C5C25CM44CM22C2C1CM3C0_WEIGHT;
    -- sfix(1, -7)
    signal cm16cm7c15c1c0cm16c1c15cm9cm3c12c0c8cm29c6cm1_weight : PIPELINE_TYPE_FOR_CM16CM7C15C1C0CM16C1C15CM9CM3C12C0C8CM29C6CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm5c7c4cm5c2cm3cm3c1c19c4cm3cm5cm5cm8cm2cm9_weight : PIPELINE_TYPE_FOR_CM5C7C4CM5C2CM3CM3C1C19C4CM3CM5CM5CM8CM2CM9_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm3cm2c3cm23c13cm28cm6c9c3c0c1cm11c7c3c14_weight : PIPELINE_TYPE_FOR_CM3CM3CM2C3CM23C13CM28CM6C9C3C0C1CM11C7C3C14_WEIGHT;
    -- sfix(1, -7)
    signal c1c8c2c1c8cm31c1c4cm15c4c2c34c9c14c0c8_weight : PIPELINE_TYPE_FOR_C1C8C2C1C8CM31C1C4CM15C4C2C34C9C14C0C8_WEIGHT;
    -- sfix(1, -7)
    signal cm14c0c1c9c12cm18cm4c13c10c22c46c9c7cm52c3c10_weight : PIPELINE_TYPE_FOR_CM14C0C1C9C12CM18CM4C13C10C22C46C9C7CM52C3C10_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core17_rmcm_weightsconstant_memory
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
        
            dout1   => cm2c5cm5c7cm29c11c2c1c5cm3cm104c3c10c13c19c9_weight(0), 
            dout2   => c3cm10c2cm15cm7c7c26cm3cm7c2cm7cm4c8cm45cm2cm12_weight(0), 
            dout3   => c0cm20cm4cm3cm6c7cm1cm3c7c4c5c10c4cm40c7c1_weight(0), 
            dout4   => c6cm1cm11c1c4c79cm4c6c4cm7cm19cm72cm23c4cm33cm3_weight(0), 
            dout5   => cm16c7c5cm3c0c2c32cm9cm4cm8cm36cm2cm20cm5cm3cm9_weight(0), 
            dout6   => cm1c0c28cm15c40cm2c16cm9cm4c5c6c16c4c11c10c21_weight(0), 
            dout7   => cm2c11c1cm6c56c8c4cm6cm16c12cm1cm5cm3c14c0cm6_weight(0), 
            dout8   => c13c4c2cm10cm16cm3c17cm8c3c3c5cm2c10cm6c46cm3_weight(0), 
            dout9   => cm5cm3c1c7cm6cm18c6cm3c2cm10c6cm19cm1c10c13cm16_weight(0), 
            dout10   => c1cm1cm2c11c64cm1cm5c0c1c1c6cm11cm4cm7cm6c19_weight(0), 
            dout11   => cm6c0c12c15c20c10cm1c0cm3c10cm10c1c1cm6c10c39_weight(0), 
            dout12   => c2c0c4cm2c1cm12c4cm2cm12c5c7cm4cm4c1cm2cm11_weight(0), 
            dout13   => cm13cm7c2c3cm5c5cm1cm3c6cm9c21cm1c4c0c1cm1_weight(0), 
            dout14   => cm7c4c2cm3c8c0cm5c2cm3c6c5cm3cm4c3c1c1_weight(0), 
            dout15   => cm2cm13c1cm6c12cm21c13c7cm8cm7c1c2cm3c22c16c0_weight(0), 
            dout16   => cm1c121c1cm3cm9c3cm4c1c37c5c7c10cm1cm21c8c6_weight(0), 
            dout17   => cm18cm22c4cm3cm2cm2c4cm4c8cm2cm5c15c42c11cm28c6_weight(0), 
            dout18   => cm5c0cm2cm13cm29c0c55c0c12c0c14cm3c4cm8cm1c7_weight(0), 
            dout19   => cm1cm1c2c3cm13c22cm2cm2c21cm13c6cm10cm13c12c5c2_weight(0), 
            dout20   => c1cm5c3cm10c5cm5c5cm11cm21cm6c4c127cm2cm14cm9c4_weight(0), 
            dout21   => c1cm5cm5c54cm23cm4cm13cm2cm2cm1c3c4c2cm1cm1cm12_weight(0), 
            dout22   => c0cm4cm12cm8cm3c13cm10cm14cm5c2cm7c3c5cm35c4cm41_weight(0), 
            dout23   => cm3c6c4c0c4cm10c11c2c9cm28c8c6c7cm1c6c2_weight(0), 
            dout24   => cm6cm11cm7c11c7cm6c0cm2cm7cm8c2cm1c7c19c8c49_weight(0), 
            dout25   => cm4c2c3cm1c10cm39c2c1cm12cm2c4cm3cm20cm5c9c0_weight(0), 
            dout26   => c17cm6cm12cm6c9c0c16c2c3c75c0c2c0c23cm43c5_weight(0), 
            dout27   => cm3cm1c2c1cm1cm4c8cm16c5c25cm44cm22c2c1cm3c0_weight(0), 
            dout28   => cm16cm7c15c1c0cm16c1c15cm9cm3c12c0c8cm29c6cm1_weight(0), 
            dout29   => cm5c7c4cm5c2cm3cm3c1c19c4cm3cm5cm5cm8cm2cm9_weight(0), 
            dout30   => cm3cm3cm2c3cm23c13cm28cm6c9c3c0c1cm11c7c3c14_weight(0), 
            dout31   => c1c8c2c1c8cm31c1c4cm15c4c2c34c9c14c0c8_weight(0), 
            dout32   => cm14c0c1c9c12cm18cm4c13c10c22c46c9c7cm52c3c10_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm2c5cm5c7cm29c11c2c1c5cm3cm104c3c10c13c19c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c5cm5c7cm29c11c2c1c5cm3cm104c3c10c13c19c9_weight(0), cm2c5cm5c7cm29c11c2c1c5cm3cm104c3c10c13c19c9_weight(1));
    PL_STEP_0_for_c3cm10c2cm15cm7c7c26cm3cm7c2cm7cm4c8cm45cm2cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm10c2cm15cm7c7c26cm3cm7c2cm7cm4c8cm45cm2cm12_weight(0), c3cm10c2cm15cm7c7c26cm3cm7c2cm7cm4c8cm45cm2cm12_weight(1));
    PL_STEP_0_for_c0cm20cm4cm3cm6c7cm1cm3c7c4c5c10c4cm40c7c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm20cm4cm3cm6c7cm1cm3c7c4c5c10c4cm40c7c1_weight(0), c0cm20cm4cm3cm6c7cm1cm3c7c4c5c10c4cm40c7c1_weight(1));
    PL_STEP_0_for_c6cm1cm11c1c4c79cm4c6c4cm7cm19cm72cm23c4cm33cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm1cm11c1c4c79cm4c6c4cm7cm19cm72cm23c4cm33cm3_weight(0), c6cm1cm11c1c4c79cm4c6c4cm7cm19cm72cm23c4cm33cm3_weight(1));
    PL_STEP_0_for_cm16c7c5cm3c0c2c32cm9cm4cm8cm36cm2cm20cm5cm3cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm16c7c5cm3c0c2c32cm9cm4cm8cm36cm2cm20cm5cm3cm9_weight(0), cm16c7c5cm3c0c2c32cm9cm4cm8cm36cm2cm20cm5cm3cm9_weight(1));
    PL_STEP_0_for_cm1c0c28cm15c40cm2c16cm9cm4c5c6c16c4c11c10c21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0c28cm15c40cm2c16cm9cm4c5c6c16c4c11c10c21_weight(0), cm1c0c28cm15c40cm2c16cm9cm4c5c6c16c4c11c10c21_weight(1));
    PL_STEP_0_for_cm2c11c1cm6c56c8c4cm6cm16c12cm1cm5cm3c14c0cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c11c1cm6c56c8c4cm6cm16c12cm1cm5cm3c14c0cm6_weight(0), cm2c11c1cm6c56c8c4cm6cm16c12cm1cm5cm3c14c0cm6_weight(1));
    PL_STEP_0_for_c13c4c2cm10cm16cm3c17cm8c3c3c5cm2c10cm6c46cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13c4c2cm10cm16cm3c17cm8c3c3c5cm2c10cm6c46cm3_weight(0), c13c4c2cm10cm16cm3c17cm8c3c3c5cm2c10cm6c46cm3_weight(1));
    PL_STEP_0_for_cm5cm3c1c7cm6cm18c6cm3c2cm10c6cm19cm1c10c13cm16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm3c1c7cm6cm18c6cm3c2cm10c6cm19cm1c10c13cm16_weight(0), cm5cm3c1c7cm6cm18c6cm3c2cm10c6cm19cm1c10c13cm16_weight(1));
    PL_STEP_0_for_c1cm1cm2c11c64cm1cm5c0c1c1c6cm11cm4cm7cm6c19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm1cm2c11c64cm1cm5c0c1c1c6cm11cm4cm7cm6c19_weight(0), c1cm1cm2c11c64cm1cm5c0c1c1c6cm11cm4cm7cm6c19_weight(1));
    PL_STEP_0_for_cm6c0c12c15c20c10cm1c0cm3c10cm10c1c1cm6c10c39_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c0c12c15c20c10cm1c0cm3c10cm10c1c1cm6c10c39_weight(0), cm6c0c12c15c20c10cm1c0cm3c10cm10c1c1cm6c10c39_weight(1));
    PL_STEP_0_for_c2c0c4cm2c1cm12c4cm2cm12c5c7cm4cm4c1cm2cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c0c4cm2c1cm12c4cm2cm12c5c7cm4cm4c1cm2cm11_weight(0), c2c0c4cm2c1cm12c4cm2cm12c5c7cm4cm4c1cm2cm11_weight(1));
    PL_STEP_0_for_cm13cm7c2c3cm5c5cm1cm3c6cm9c21cm1c4c0c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13cm7c2c3cm5c5cm1cm3c6cm9c21cm1c4c0c1cm1_weight(0), cm13cm7c2c3cm5c5cm1cm3c6cm9c21cm1c4c0c1cm1_weight(1));
    PL_STEP_0_for_cm7c4c2cm3c8c0cm5c2cm3c6c5cm3cm4c3c1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c4c2cm3c8c0cm5c2cm3c6c5cm3cm4c3c1c1_weight(0), cm7c4c2cm3c8c0cm5c2cm3c6c5cm3cm4c3c1c1_weight(1));
    PL_STEP_0_for_cm2cm13c1cm6c12cm21c13c7cm8cm7c1c2cm3c22c16c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm13c1cm6c12cm21c13c7cm8cm7c1c2cm3c22c16c0_weight(0), cm2cm13c1cm6c12cm21c13c7cm8cm7c1c2cm3c22c16c0_weight(1));
    PL_STEP_0_for_cm1c121c1cm3cm9c3cm4c1c37c5c7c10cm1cm21c8c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c121c1cm3cm9c3cm4c1c37c5c7c10cm1cm21c8c6_weight(0), cm1c121c1cm3cm9c3cm4c1c37c5c7c10cm1cm21c8c6_weight(1));
    PL_STEP_0_for_cm18cm22c4cm3cm2cm2c4cm4c8cm2cm5c15c42c11cm28c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm18cm22c4cm3cm2cm2c4cm4c8cm2cm5c15c42c11cm28c6_weight(0), cm18cm22c4cm3cm2cm2c4cm4c8cm2cm5c15c42c11cm28c6_weight(1));
    PL_STEP_0_for_cm5c0cm2cm13cm29c0c55c0c12c0c14cm3c4cm8cm1c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c0cm2cm13cm29c0c55c0c12c0c14cm3c4cm8cm1c7_weight(0), cm5c0cm2cm13cm29c0c55c0c12c0c14cm3c4cm8cm1c7_weight(1));
    PL_STEP_0_for_cm1cm1c2c3cm13c22cm2cm2c21cm13c6cm10cm13c12c5c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c2c3cm13c22cm2cm2c21cm13c6cm10cm13c12c5c2_weight(0), cm1cm1c2c3cm13c22cm2cm2c21cm13c6cm10cm13c12c5c2_weight(1));
    PL_STEP_0_for_c1cm5c3cm10c5cm5c5cm11cm21cm6c4c127cm2cm14cm9c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm5c3cm10c5cm5c5cm11cm21cm6c4c127cm2cm14cm9c4_weight(0), c1cm5c3cm10c5cm5c5cm11cm21cm6c4c127cm2cm14cm9c4_weight(1));
    PL_STEP_0_for_c1cm5cm5c54cm23cm4cm13cm2cm2cm1c3c4c2cm1cm1cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm5cm5c54cm23cm4cm13cm2cm2cm1c3c4c2cm1cm1cm12_weight(0), c1cm5cm5c54cm23cm4cm13cm2cm2cm1c3c4c2cm1cm1cm12_weight(1));
    PL_STEP_0_for_c0cm4cm12cm8cm3c13cm10cm14cm5c2cm7c3c5cm35c4cm41_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm4cm12cm8cm3c13cm10cm14cm5c2cm7c3c5cm35c4cm41_weight(0), c0cm4cm12cm8cm3c13cm10cm14cm5c2cm7c3c5cm35c4cm41_weight(1));
    PL_STEP_0_for_cm3c6c4c0c4cm10c11c2c9cm28c8c6c7cm1c6c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c6c4c0c4cm10c11c2c9cm28c8c6c7cm1c6c2_weight(0), cm3c6c4c0c4cm10c11c2c9cm28c8c6c7cm1c6c2_weight(1));
    PL_STEP_0_for_cm6cm11cm7c11c7cm6c0cm2cm7cm8c2cm1c7c19c8c49_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm11cm7c11c7cm6c0cm2cm7cm8c2cm1c7c19c8c49_weight(0), cm6cm11cm7c11c7cm6c0cm2cm7cm8c2cm1c7c19c8c49_weight(1));
    PL_STEP_0_for_cm4c2c3cm1c10cm39c2c1cm12cm2c4cm3cm20cm5c9c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c2c3cm1c10cm39c2c1cm12cm2c4cm3cm20cm5c9c0_weight(0), cm4c2c3cm1c10cm39c2c1cm12cm2c4cm3cm20cm5c9c0_weight(1));
    PL_STEP_0_for_c17cm6cm12cm6c9c0c16c2c3c75c0c2c0c23cm43c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c17cm6cm12cm6c9c0c16c2c3c75c0c2c0c23cm43c5_weight(0), c17cm6cm12cm6c9c0c16c2c3c75c0c2c0c23cm43c5_weight(1));
    PL_STEP_0_for_cm3cm1c2c1cm1cm4c8cm16c5c25cm44cm22c2c1cm3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm1c2c1cm1cm4c8cm16c5c25cm44cm22c2c1cm3c0_weight(0), cm3cm1c2c1cm1cm4c8cm16c5c25cm44cm22c2c1cm3c0_weight(1));
    PL_STEP_0_for_cm16cm7c15c1c0cm16c1c15cm9cm3c12c0c8cm29c6cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm16cm7c15c1c0cm16c1c15cm9cm3c12c0c8cm29c6cm1_weight(0), cm16cm7c15c1c0cm16c1c15cm9cm3c12c0c8cm29c6cm1_weight(1));
    PL_STEP_0_for_cm5c7c4cm5c2cm3cm3c1c19c4cm3cm5cm5cm8cm2cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c7c4cm5c2cm3cm3c1c19c4cm3cm5cm5cm8cm2cm9_weight(0), cm5c7c4cm5c2cm3cm3c1c19c4cm3cm5cm5cm8cm2cm9_weight(1));
    PL_STEP_0_for_cm3cm3cm2c3cm23c13cm28cm6c9c3c0c1cm11c7c3c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm3cm2c3cm23c13cm28cm6c9c3c0c1cm11c7c3c14_weight(0), cm3cm3cm2c3cm23c13cm28cm6c9c3c0c1cm11c7c3c14_weight(1));
    PL_STEP_0_for_c1c8c2c1c8cm31c1c4cm15c4c2c34c9c14c0c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c8c2c1c8cm31c1c4cm15c4c2c34c9c14c0c8_weight(0), c1c8c2c1c8cm31c1c4cm15c4c2c34c9c14c0c8_weight(1));
    PL_STEP_0_for_cm14c0c1c9c12cm18cm4c13c10c22c46c9c7cm52c3c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14c0c1c9c12cm18cm4c13c10c22c46c9c7cm52c3c10_weight(0), cm14c0c1c9c12cm18cm4c13c10c22c46c9c7cm52c3c10_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm2c5cm5c7cm29c11c2c1c5cm3cm104c3c10c13c19c9_cm7c4c2cm3c8c0cm5c2cm3c6c5cm3cm4c3c1c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c5cm5c7cm29c11c2c1c5cm3cm104c3c10c13c19c9_weight(1)(8-1 downto 0),
			B	=> cm7c4c2cm3c8c0cm5c2cm3c6c5cm3cm4c3c1c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c5cm5c7cm29c11c2c1c5cm3cm104c3c10c13c19c9,
			CxB => R_cm7c4c2cm3c8c0cm5c2cm3c6c5cm3cm4c3c1c1
		);

    c6cm1cm11c1c4c79cm4c6c4cm7cm19cm72cm23c4cm33cm3_c2c0c4cm2c1cm12c4cm2cm12c5c7cm4cm4c1cm2cm11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6cm1cm11c1c4c79cm4c6c4cm7cm19cm72cm23c4cm33cm3_weight(1)(8-1 downto 0),
			B	=> c2c0c4cm2c1cm12c4cm2cm12c5c7cm4cm4c1cm2cm11_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm1cm11c1c4c79cm4c6c4cm7cm19cm72cm23c4cm33cm3,
			CxB => R_c2c0c4cm2c1cm12c4cm2cm12c5c7cm4cm4c1cm2cm11
		);

    c1cm1cm2c11c64cm1cm5c0c1c1c6cm11cm4cm7cm6c19_cm3cm3cm2c3cm23c13cm28cm6c9c3c0c1cm11c7c3c14_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm1cm2c11c64cm1cm5c0c1c1c6cm11cm4cm7cm6c19_weight(1)(8-1 downto 0),
			B	=> cm3cm3cm2c3cm23c13cm28cm6c9c3c0c1cm11c7c3c14_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm1cm2c11c64cm1cm5c0c1c1c6cm11cm4cm7cm6c19,
			CxB => R_cm3cm3cm2c3cm23c13cm28cm6c9c3c0c1cm11c7c3c14
		);

    cm1c121c1cm3cm9c3cm4c1c37c5c7c10cm1cm21c8c6_cm5c7c4cm5c2cm3cm3c1c19c4cm3cm5cm5cm8cm2cm9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c121c1cm3cm9c3cm4c1c37c5c7c10cm1cm21c8c6_weight(1)(8-1 downto 0),
			B	=> cm5c7c4cm5c2cm3cm3c1c19c4cm3cm5cm5cm8cm2cm9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c121c1cm3cm9c3cm4c1c37c5c7c10cm1cm21c8c6,
			CxB => R_cm5c7c4cm5c2cm3cm3c1c19c4cm3cm5cm5cm8cm2cm9
		);

    c1cm5c3cm10c5cm5c5cm11cm21cm6c4c127cm2cm14cm9c4_cm16cm7c15c1c0cm16c1c15cm9cm3c12c0c8cm29c6cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm5c3cm10c5cm5c5cm11cm21cm6c4c127cm2cm14cm9c4_weight(1)(8-1 downto 0),
			B	=> cm16cm7c15c1c0cm16c1c15cm9cm3c12c0c8cm29c6cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm5c3cm10c5cm5c5cm11cm21cm6c4c127cm2cm14cm9c4,
			CxB => R_cm16cm7c15c1c0cm16c1c15cm9cm3c12c0c8cm29c6cm1
		);

    c17cm6cm12cm6c9c0c16c2c3c75c0c2c0c23cm43c5_cm3c6c4c0c4cm10c11c2c9cm28c8c6c7cm1c6c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c17cm6cm12cm6c9c0c16c2c3c75c0c2c0c23cm43c5_weight(1)(8-1 downto 0),
			B	=> cm3c6c4c0c4cm10c11c2c9cm28c8c6c7cm1c6c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c17cm6cm12cm6c9c0c16c2c3c75c0c2c0c23cm43c5,
			CxB => R_cm3c6c4c0c4cm10c11c2c9cm28c8c6c7cm1c6c2
		);

    c3cm10c2cm15cm7c7c26cm3cm7c2cm7cm4c8cm45cm2cm12_cm1cm1c2c3cm13c22cm2cm2c21cm13c6cm10cm13c12c5c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3cm10c2cm15cm7c7c26cm3cm7c2cm7cm4c8cm45cm2cm12_weight(1)(7-1 downto 0),
			B	=> cm1cm1c2c3cm13c22cm2cm2c21cm13c6cm10cm13c12c5c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm10c2cm15cm7c7c26cm3cm7c2cm7cm4c8cm45cm2cm12,
			CxB => R_cm1cm1c2c3cm13c22cm2cm2c21cm13c6cm10cm13c12c5c2
		);

    c0cm20cm4cm3cm6c7cm1cm3c7c4c5c10c4cm40c7c1_cm2cm13c1cm6c12cm21c13c7cm8cm7c1c2cm3c22c16c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm20cm4cm3cm6c7cm1cm3c7c4c5c10c4cm40c7c1_weight(1)(7-1 downto 0),
			B	=> cm2cm13c1cm6c12cm21c13c7cm8cm7c1c2cm3c22c16c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm20cm4cm3cm6c7cm1cm3c7c4c5c10c4cm40c7c1,
			CxB => R_cm2cm13c1cm6c12cm21c13c7cm8cm7c1c2cm3c22c16c0
		);

    cm16c7c5cm3c0c2c32cm9cm4cm8cm36cm2cm20cm5cm3cm9_cm13cm7c2c3cm5c5cm1cm3c6cm9c21cm1c4c0c1cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm16c7c5cm3c0c2c32cm9cm4cm8cm36cm2cm20cm5cm3cm9_weight(1)(7-1 downto 0),
			B	=> cm13cm7c2c3cm5c5cm1cm3c6cm9c21cm1c4c0c1cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm16c7c5cm3c0c2c32cm9cm4cm8cm36cm2cm20cm5cm3cm9,
			CxB => R_cm13cm7c2c3cm5c5cm1cm3c6cm9c21cm1c4c0c1cm1
		);

    cm1c0c28cm15c40cm2c16cm9cm4c5c6c16c4c11c10c21_cm5cm3c1c7cm6cm18c6cm3c2cm10c6cm19cm1c10c13cm16_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c0c28cm15c40cm2c16cm9cm4c5c6c16c4c11c10c21_weight(1)(7-1 downto 0),
			B	=> cm5cm3c1c7cm6cm18c6cm3c2cm10c6cm19cm1c10c13cm16_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c0c28cm15c40cm2c16cm9cm4c5c6c16c4c11c10c21,
			CxB => R_cm5cm3c1c7cm6cm18c6cm3c2cm10c6cm19cm1c10c13cm16
		);

    cm2c11c1cm6c56c8c4cm6cm16c12cm1cm5cm3c14c0cm6_cm14c0c1c9c12cm18cm4c13c10c22c46c9c7cm52c3c10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c11c1cm6c56c8c4cm6cm16c12cm1cm5cm3c14c0cm6_weight(1)(7-1 downto 0),
			B	=> cm14c0c1c9c12cm18cm4c13c10c22c46c9c7cm52c3c10_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c11c1cm6c56c8c4cm6cm16c12cm1cm5cm3c14c0cm6,
			CxB => R_cm14c0c1c9c12cm18cm4c13c10c22c46c9c7cm52c3c10
		);

    c13c4c2cm10cm16cm3c17cm8c3c3c5cm2c10cm6c46cm3_c1c8c2c1c8cm31c1c4cm15c4c2c34c9c14c0c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c13c4c2cm10cm16cm3c17cm8c3c3c5cm2c10cm6c46cm3_weight(1)(7-1 downto 0),
			B	=> c1c8c2c1c8cm31c1c4cm15c4c2c34c9c14c0c8_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c13c4c2cm10cm16cm3c17cm8c3c3c5cm2c10cm6c46cm3,
			CxB => R_c1c8c2c1c8cm31c1c4cm15c4c2c34c9c14c0c8
		);

    cm6c0c12c15c20c10cm1c0cm3c10cm10c1c1cm6c10c39_cm3cm1c2c1cm1cm4c8cm16c5c25cm44cm22c2c1cm3c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6c0c12c15c20c10cm1c0cm3c10cm10c1c1cm6c10c39_weight(1)(7-1 downto 0),
			B	=> cm3cm1c2c1cm1cm4c8cm16c5c25cm44cm22c2c1cm3c0_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c0c12c15c20c10cm1c0cm3c10cm10c1c1cm6c10c39,
			CxB => R_cm3cm1c2c1cm1cm4c8cm16c5c25cm44cm22c2c1cm3c0
		);

    cm18cm22c4cm3cm2cm2c4cm4c8cm2cm5c15c42c11cm28c6_cm4c2c3cm1c10cm39c2c1cm12cm2c4cm3cm20cm5c9c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm18cm22c4cm3cm2cm2c4cm4c8cm2cm5c15c42c11cm28c6_weight(1)(7-1 downto 0),
			B	=> cm4c2c3cm1c10cm39c2c1cm12cm2c4cm3cm20cm5c9c0_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm18cm22c4cm3cm2cm2c4cm4c8cm2cm5c15c42c11cm28c6,
			CxB => R_cm4c2c3cm1c10cm39c2c1cm12cm2c4cm3cm20cm5c9c0
		);

    cm5c0cm2cm13cm29c0c55c0c12c0c14cm3c4cm8cm1c7_cm6cm11cm7c11c7cm6c0cm2cm7cm8c2cm1c7c19c8c49_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5c0cm2cm13cm29c0c55c0c12c0c14cm3c4cm8cm1c7_weight(1)(7-1 downto 0),
			B	=> cm6cm11cm7c11c7cm6c0cm2cm7cm8c2cm1c7c19c8c49_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5c0cm2cm13cm29c0c55c0c12c0c14cm3c4cm8cm1c7,
			CxB => R_cm6cm11cm7c11c7cm6c0cm2cm7cm8c2cm1c7c19c8c49
		);

    c1cm5cm5c54cm23cm4cm13cm2cm2cm1c3c4c2cm1cm1cm12_c0cm4cm12cm8cm3c13cm10cm14cm5c2cm7c3c5cm35c4cm41_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm5cm5c54cm23cm4cm13cm2cm2cm1c3c4c2cm1cm1cm12_weight(1)(7-1 downto 0),
			B	=> c0cm4cm12cm8cm3c13cm10cm14cm5c2cm7c3c5cm35c4cm41_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm5cm5c54cm23cm4cm13cm2cm2cm1c3c4c2cm1cm1cm12,
			CxB => R_c0cm4cm12cm8cm3c13cm10cm14cm5c2cm7c3c5cm35c4cm41
		);




end architecture;
