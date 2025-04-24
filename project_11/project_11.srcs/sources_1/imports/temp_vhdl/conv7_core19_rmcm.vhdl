library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core19_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm35cm4cm4cm11c10cm5c6c1c3c8cm3c7c2cm2c3cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c4c0cm13cm6c3c1c29cm9c7c8cm8c1c7cm7c5cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c21c7cm19cm11cm5c6cm7c3c5cm43c3c2c8cm3c0c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2cm35cm9cm11cm2c1c5cm1cm1cm2c2c11cm5c0cm11c3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2cm4cm7cm5cm1cm2cm8cm16c0c12cm9cm8c11c9c6c30 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm29c1c2cm4cm3cm8c30cm7cm1c7cm3c9c5cm5cm18c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm30cm8cm8c5cm1cm14c5c10c11c9c0cm13cm10cm5c5c23 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6c1c6c9c4c2c20c10c17c14c6c8c9c29c3cm25 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c4cm13c15cm1c6c12cm11c36c5cm8c16cm9cm8c1cm11c11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm4c3cm1c1c16cm8cm5c21c2cm5cm6c16cm3c1cm14c8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1c6c6cm1c19c12cm4c12cm12c3c6c29cm53c6c8cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm10c47cm3c2c9c0c8c15c1cm1cm6cm15c0c0c0c11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c5cm4cm14c0c10c10c14c6c10cm4c2c0c1c50c3c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2cm7c3cm3cm17cm20cm14c6cm3c1cm3c1c4cm5cm2cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c7cm8cm15cm8cm4cm1c12c15cm10cm23c3c0cm1cm7c7c9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm32cm3c17c3c5cm11c9cm1c2cm11c2c7cm3cm7c4c14 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c4cm6c9c3c22cm3cm9c7c32c26cm10c4c14c49c7cm9 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c5c2c3c2cm4c12cm4cm1c5cm3c1c1cm6c4cm3cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c7c0c2cm9cm5c30cm17c13cm15c1c2cm2cm24cm4cm5cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm12cm5c6cm7c9cm2c22c21cm4cm15cm9c10c7c24cm15c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c57cm4c7c2cm2cm10cm6c12cm1c3c0cm9c5cm12cm3cm11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0cm2cm6c4c6c5cm17cm11cm6c3cm3cm34c10cm10c14c3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c5cm2c2c4c2c17c7c5c7cm9cm5c1cm26cm3cm12c5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c5c0c3cm1c20cm16c8cm5c4cm14c2c28cm8c8cm1c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm3cm13cm8cm5c13c5c19c19cm13c0c10cm5cm18cm4cm28c7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm3cm20c5c3c0cm3cm7c7cm4cm9cm33c0c3c2cm14c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0cm25c11cm7c23cm4c2cm6c9c3cm4c0cm4cm3cm3c4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c7cm10cm8c2cm35c23cm6c1cm19c6cm1cm10cm9cm17c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6cm1cm9cm7c1cm13c6c20cm13cm3cm2cm3c14cm8c7c8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c3cm13cm23c0c20c8c9cm16cm5c19cm1c9cm3cm2c5cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c11cm6c2cm14c17c12c4c10cm11c4c0c1c5cm7c2c5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c5c13c10cm2c0c19c41cm4cm14c0c6c1cm18cm1cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core19_rmcm;

architecture arch of conv7_core19_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM35CM4CM4CM11C10CM5C6C1C3C8CM3C7C2CM2C3CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C0CM13CM6C3C1C29CM9C7C8CM8C1C7CM7C5CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C21C7CM19CM11CM5C6CM7C3C5CM43C3C2C8CM3C0C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM35CM9CM11CM2C1C5CM1CM1CM2C2C11CM5C0CM11C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM4CM7CM5CM1CM2CM8CM16C0C12CM9CM8C11C9C6C30_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM29C1C2CM4CM3CM8C30CM7CM1C7CM3C9C5CM5CM18C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM30CM8CM8C5CM1CM14C5C10C11C9C0CM13CM10CM5C5C23_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C1C6C9C4C2C20C10C17C14C6C8C9C29C3CM25_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM13C15CM1C6C12CM11C36C5CM8C16CM9CM8C1CM11C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C3CM1C1C16CM8CM5C21C2CM5CM6C16CM3C1CM14C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C6C6CM1C19C12CM4C12CM12C3C6C29CM53C6C8CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C47CM3C2C9C0C8C15C1CM1CM6CM15C0C0C0C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM4CM14C0C10C10C14C6C10CM4C2C0C1C50C3C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM7C3CM3CM17CM20CM14C6CM3C1CM3C1C4CM5CM2CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM8CM15CM8CM4CM1C12C15CM10CM23C3C0CM1CM7C7C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM32CM3C17C3C5CM11C9CM1C2CM11C2C7CM3CM7C4C14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM6C9C3C22CM3CM9C7C32C26CM10C4C14C49C7CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C2C3C2CM4C12CM4CM1C5CM3C1C1CM6C4CM3CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C0C2CM9CM5C30CM17C13CM15C1C2CM2CM24CM4CM5CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12CM5C6CM7C9CM2C22C21CM4CM15CM9C10C7C24CM15C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C57CM4C7C2CM2CM10CM6C12CM1C3C0CM9C5CM12CM3CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2CM6C4C6C5CM17CM11CM6C3CM3CM34C10CM10C14C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM2C2C4C2C17C7C5C7CM9CM5C1CM26CM3CM12C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C0C3CM1C20CM16C8CM5C4CM14C2C28CM8C8CM1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM13CM8CM5C13C5C19C19CM13C0C10CM5CM18CM4CM28C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM20C5C3C0CM3CM7C7CM4CM9CM33C0C3C2CM14C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM25C11CM7C23CM4C2CM6C9C3CM4C0CM4CM3CM3C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C7CM10CM8C2CM35C23CM6C1CM19C6CM1CM10CM9CM17C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM1CM9CM7C1CM13C6C20CM13CM3CM2CM3C14CM8C7C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM13CM23C0C20C8C9CM16CM5C19CM1C9CM3CM2C5CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11CM6C2CM14C17C12C4C10CM11C4C0C1C5CM7C2C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C5C13C10CM2C0C19C41CM4CM14C0C6C1CM18CM1CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm35cm4cm4cm11c10cm5c6c1c3c8cm3c7c2cm2c3cm5_weight : PIPELINE_TYPE_FOR_CM35CM4CM4CM11C10CM5C6C1C3C8CM3C7C2CM2C3CM5_WEIGHT;
    -- sfix(1, -7)
    signal c4c0cm13cm6c3c1c29cm9c7c8cm8c1c7cm7c5cm6_weight : PIPELINE_TYPE_FOR_C4C0CM13CM6C3C1C29CM9C7C8CM8C1C7CM7C5CM6_WEIGHT;
    -- sfix(1, -7)
    signal c21c7cm19cm11cm5c6cm7c3c5cm43c3c2c8cm3c0c1_weight : PIPELINE_TYPE_FOR_C21C7CM19CM11CM5C6CM7C3C5CM43C3C2C8CM3C0C1_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm35cm9cm11cm2c1c5cm1cm1cm2c2c11cm5c0cm11c3_weight : PIPELINE_TYPE_FOR_CM2CM35CM9CM11CM2C1C5CM1CM1CM2C2C11CM5C0CM11C3_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm4cm7cm5cm1cm2cm8cm16c0c12cm9cm8c11c9c6c30_weight : PIPELINE_TYPE_FOR_CM2CM4CM7CM5CM1CM2CM8CM16C0C12CM9CM8C11C9C6C30_WEIGHT;
    -- sfix(1, -7)
    signal cm29c1c2cm4cm3cm8c30cm7cm1c7cm3c9c5cm5cm18c0_weight : PIPELINE_TYPE_FOR_CM29C1C2CM4CM3CM8C30CM7CM1C7CM3C9C5CM5CM18C0_WEIGHT;
    -- sfix(1, -7)
    signal cm30cm8cm8c5cm1cm14c5c10c11c9c0cm13cm10cm5c5c23_weight : PIPELINE_TYPE_FOR_CM30CM8CM8C5CM1CM14C5C10C11C9C0CM13CM10CM5C5C23_WEIGHT;
    -- sfix(1, -7)
    signal c6c1c6c9c4c2c20c10c17c14c6c8c9c29c3cm25_weight : PIPELINE_TYPE_FOR_C6C1C6C9C4C2C20C10C17C14C6C8C9C29C3CM25_WEIGHT;
    -- sfix(1, -7)
    signal c4cm13c15cm1c6c12cm11c36c5cm8c16cm9cm8c1cm11c11_weight : PIPELINE_TYPE_FOR_C4CM13C15CM1C6C12CM11C36C5CM8C16CM9CM8C1CM11C11_WEIGHT;
    -- sfix(1, -7)
    signal cm4c3cm1c1c16cm8cm5c21c2cm5cm6c16cm3c1cm14c8_weight : PIPELINE_TYPE_FOR_CM4C3CM1C1C16CM8CM5C21C2CM5CM6C16CM3C1CM14C8_WEIGHT;
    -- sfix(1, -7)
    signal c1c6c6cm1c19c12cm4c12cm12c3c6c29cm53c6c8cm4_weight : PIPELINE_TYPE_FOR_C1C6C6CM1C19C12CM4C12CM12C3C6C29CM53C6C8CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm10c47cm3c2c9c0c8c15c1cm1cm6cm15c0c0c0c11_weight : PIPELINE_TYPE_FOR_CM10C47CM3C2C9C0C8C15C1CM1CM6CM15C0C0C0C11_WEIGHT;
    -- sfix(1, -7)
    signal c5cm4cm14c0c10c10c14c6c10cm4c2c0c1c50c3c1_weight : PIPELINE_TYPE_FOR_C5CM4CM14C0C10C10C14C6C10CM4C2C0C1C50C3C1_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm7c3cm3cm17cm20cm14c6cm3c1cm3c1c4cm5cm2cm3_weight : PIPELINE_TYPE_FOR_CM2CM7C3CM3CM17CM20CM14C6CM3C1CM3C1C4CM5CM2CM3_WEIGHT;
    -- sfix(1, -7)
    signal c7cm8cm15cm8cm4cm1c12c15cm10cm23c3c0cm1cm7c7c9_weight : PIPELINE_TYPE_FOR_C7CM8CM15CM8CM4CM1C12C15CM10CM23C3C0CM1CM7C7C9_WEIGHT;
    -- sfix(1, -7)
    signal cm32cm3c17c3c5cm11c9cm1c2cm11c2c7cm3cm7c4c14_weight : PIPELINE_TYPE_FOR_CM32CM3C17C3C5CM11C9CM1C2CM11C2C7CM3CM7C4C14_WEIGHT;
    -- sfix(1, -7)
    signal c4cm6c9c3c22cm3cm9c7c32c26cm10c4c14c49c7cm9_weight : PIPELINE_TYPE_FOR_C4CM6C9C3C22CM3CM9C7C32C26CM10C4C14C49C7CM9_WEIGHT;
    -- sfix(1, -7)
    signal c5c2c3c2cm4c12cm4cm1c5cm3c1c1cm6c4cm3cm2_weight : PIPELINE_TYPE_FOR_C5C2C3C2CM4C12CM4CM1C5CM3C1C1CM6C4CM3CM2_WEIGHT;
    -- sfix(1, -7)
    signal c7c0c2cm9cm5c30cm17c13cm15c1c2cm2cm24cm4cm5cm5_weight : PIPELINE_TYPE_FOR_C7C0C2CM9CM5C30CM17C13CM15C1C2CM2CM24CM4CM5CM5_WEIGHT;
    -- sfix(1, -7)
    signal cm12cm5c6cm7c9cm2c22c21cm4cm15cm9c10c7c24cm15c1_weight : PIPELINE_TYPE_FOR_CM12CM5C6CM7C9CM2C22C21CM4CM15CM9C10C7C24CM15C1_WEIGHT;
    -- sfix(1, -7)
    signal c57cm4c7c2cm2cm10cm6c12cm1c3c0cm9c5cm12cm3cm11_weight : PIPELINE_TYPE_FOR_C57CM4C7C2CM2CM10CM6C12CM1C3C0CM9C5CM12CM3CM11_WEIGHT;
    -- sfix(1, -7)
    signal c0cm2cm6c4c6c5cm17cm11cm6c3cm3cm34c10cm10c14c3_weight : PIPELINE_TYPE_FOR_C0CM2CM6C4C6C5CM17CM11CM6C3CM3CM34C10CM10C14C3_WEIGHT;
    -- sfix(1, -7)
    signal c5cm2c2c4c2c17c7c5c7cm9cm5c1cm26cm3cm12c5_weight : PIPELINE_TYPE_FOR_C5CM2C2C4C2C17C7C5C7CM9CM5C1CM26CM3CM12C5_WEIGHT;
    -- sfix(1, -7)
    signal c5c0c3cm1c20cm16c8cm5c4cm14c2c28cm8c8cm1c0_weight : PIPELINE_TYPE_FOR_C5C0C3CM1C20CM16C8CM5C4CM14C2C28CM8C8CM1C0_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm13cm8cm5c13c5c19c19cm13c0c10cm5cm18cm4cm28c7_weight : PIPELINE_TYPE_FOR_CM3CM13CM8CM5C13C5C19C19CM13C0C10CM5CM18CM4CM28C7_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm20c5c3c0cm3cm7c7cm4cm9cm33c0c3c2cm14c2_weight : PIPELINE_TYPE_FOR_CM3CM20C5C3C0CM3CM7C7CM4CM9CM33C0C3C2CM14C2_WEIGHT;
    -- sfix(1, -7)
    signal c0cm25c11cm7c23cm4c2cm6c9c3cm4c0cm4cm3cm3c4_weight : PIPELINE_TYPE_FOR_C0CM25C11CM7C23CM4C2CM6C9C3CM4C0CM4CM3CM3C4_WEIGHT;
    -- sfix(1, -7)
    signal c0c7cm10cm8c2cm35c23cm6c1cm19c6cm1cm10cm9cm17c4_weight : PIPELINE_TYPE_FOR_C0C7CM10CM8C2CM35C23CM6C1CM19C6CM1CM10CM9CM17C4_WEIGHT;
    -- sfix(1, -7)
    signal cm6cm1cm9cm7c1cm13c6c20cm13cm3cm2cm3c14cm8c7c8_weight : PIPELINE_TYPE_FOR_CM6CM1CM9CM7C1CM13C6C20CM13CM3CM2CM3C14CM8C7C8_WEIGHT;
    -- sfix(1, -7)
    signal c3cm13cm23c0c20c8c9cm16cm5c19cm1c9cm3cm2c5cm5_weight : PIPELINE_TYPE_FOR_C3CM13CM23C0C20C8C9CM16CM5C19CM1C9CM3CM2C5CM5_WEIGHT;
    -- sfix(1, -7)
    signal c11cm6c2cm14c17c12c4c10cm11c4c0c1c5cm7c2c5_weight : PIPELINE_TYPE_FOR_C11CM6C2CM14C17C12C4C10CM11C4C0C1C5CM7C2C5_WEIGHT;
    -- sfix(1, -7)
    signal c0c5c13c10cm2c0c19c41cm4cm14c0c6c1cm18cm1cm4_weight : PIPELINE_TYPE_FOR_C0C5C13C10CM2C0C19C41CM4CM14C0C6C1CM18CM1CM4_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core19_rmcm_weightsconstant_memory
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
        
            dout1   => cm35cm4cm4cm11c10cm5c6c1c3c8cm3c7c2cm2c3cm5_weight(0), 
            dout2   => c4c0cm13cm6c3c1c29cm9c7c8cm8c1c7cm7c5cm6_weight(0), 
            dout3   => c21c7cm19cm11cm5c6cm7c3c5cm43c3c2c8cm3c0c1_weight(0), 
            dout4   => cm2cm35cm9cm11cm2c1c5cm1cm1cm2c2c11cm5c0cm11c3_weight(0), 
            dout5   => cm2cm4cm7cm5cm1cm2cm8cm16c0c12cm9cm8c11c9c6c30_weight(0), 
            dout6   => cm29c1c2cm4cm3cm8c30cm7cm1c7cm3c9c5cm5cm18c0_weight(0), 
            dout7   => cm30cm8cm8c5cm1cm14c5c10c11c9c0cm13cm10cm5c5c23_weight(0), 
            dout8   => c6c1c6c9c4c2c20c10c17c14c6c8c9c29c3cm25_weight(0), 
            dout9   => c4cm13c15cm1c6c12cm11c36c5cm8c16cm9cm8c1cm11c11_weight(0), 
            dout10   => cm4c3cm1c1c16cm8cm5c21c2cm5cm6c16cm3c1cm14c8_weight(0), 
            dout11   => c1c6c6cm1c19c12cm4c12cm12c3c6c29cm53c6c8cm4_weight(0), 
            dout12   => cm10c47cm3c2c9c0c8c15c1cm1cm6cm15c0c0c0c11_weight(0), 
            dout13   => c5cm4cm14c0c10c10c14c6c10cm4c2c0c1c50c3c1_weight(0), 
            dout14   => cm2cm7c3cm3cm17cm20cm14c6cm3c1cm3c1c4cm5cm2cm3_weight(0), 
            dout15   => c7cm8cm15cm8cm4cm1c12c15cm10cm23c3c0cm1cm7c7c9_weight(0), 
            dout16   => cm32cm3c17c3c5cm11c9cm1c2cm11c2c7cm3cm7c4c14_weight(0), 
            dout17   => c4cm6c9c3c22cm3cm9c7c32c26cm10c4c14c49c7cm9_weight(0), 
            dout18   => c5c2c3c2cm4c12cm4cm1c5cm3c1c1cm6c4cm3cm2_weight(0), 
            dout19   => c7c0c2cm9cm5c30cm17c13cm15c1c2cm2cm24cm4cm5cm5_weight(0), 
            dout20   => cm12cm5c6cm7c9cm2c22c21cm4cm15cm9c10c7c24cm15c1_weight(0), 
            dout21   => c57cm4c7c2cm2cm10cm6c12cm1c3c0cm9c5cm12cm3cm11_weight(0), 
            dout22   => c0cm2cm6c4c6c5cm17cm11cm6c3cm3cm34c10cm10c14c3_weight(0), 
            dout23   => c5cm2c2c4c2c17c7c5c7cm9cm5c1cm26cm3cm12c5_weight(0), 
            dout24   => c5c0c3cm1c20cm16c8cm5c4cm14c2c28cm8c8cm1c0_weight(0), 
            dout25   => cm3cm13cm8cm5c13c5c19c19cm13c0c10cm5cm18cm4cm28c7_weight(0), 
            dout26   => cm3cm20c5c3c0cm3cm7c7cm4cm9cm33c0c3c2cm14c2_weight(0), 
            dout27   => c0cm25c11cm7c23cm4c2cm6c9c3cm4c0cm4cm3cm3c4_weight(0), 
            dout28   => c0c7cm10cm8c2cm35c23cm6c1cm19c6cm1cm10cm9cm17c4_weight(0), 
            dout29   => cm6cm1cm9cm7c1cm13c6c20cm13cm3cm2cm3c14cm8c7c8_weight(0), 
            dout30   => c3cm13cm23c0c20c8c9cm16cm5c19cm1c9cm3cm2c5cm5_weight(0), 
            dout31   => c11cm6c2cm14c17c12c4c10cm11c4c0c1c5cm7c2c5_weight(0), 
            dout32   => c0c5c13c10cm2c0c19c41cm4cm14c0c6c1cm18cm1cm4_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm35cm4cm4cm11c10cm5c6c1c3c8cm3c7c2cm2c3cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm35cm4cm4cm11c10cm5c6c1c3c8cm3c7c2cm2c3cm5_weight(0), cm35cm4cm4cm11c10cm5c6c1c3c8cm3c7c2cm2c3cm5_weight(1));
    PL_STEP_0_for_c4c0cm13cm6c3c1c29cm9c7c8cm8c1c7cm7c5cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c0cm13cm6c3c1c29cm9c7c8cm8c1c7cm7c5cm6_weight(0), c4c0cm13cm6c3c1c29cm9c7c8cm8c1c7cm7c5cm6_weight(1));
    PL_STEP_0_for_c21c7cm19cm11cm5c6cm7c3c5cm43c3c2c8cm3c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c21c7cm19cm11cm5c6cm7c3c5cm43c3c2c8cm3c0c1_weight(0), c21c7cm19cm11cm5c6cm7c3c5cm43c3c2c8cm3c0c1_weight(1));
    PL_STEP_0_for_cm2cm35cm9cm11cm2c1c5cm1cm1cm2c2c11cm5c0cm11c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm35cm9cm11cm2c1c5cm1cm1cm2c2c11cm5c0cm11c3_weight(0), cm2cm35cm9cm11cm2c1c5cm1cm1cm2c2c11cm5c0cm11c3_weight(1));
    PL_STEP_0_for_cm2cm4cm7cm5cm1cm2cm8cm16c0c12cm9cm8c11c9c6c30_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm4cm7cm5cm1cm2cm8cm16c0c12cm9cm8c11c9c6c30_weight(0), cm2cm4cm7cm5cm1cm2cm8cm16c0c12cm9cm8c11c9c6c30_weight(1));
    PL_STEP_0_for_cm29c1c2cm4cm3cm8c30cm7cm1c7cm3c9c5cm5cm18c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm29c1c2cm4cm3cm8c30cm7cm1c7cm3c9c5cm5cm18c0_weight(0), cm29c1c2cm4cm3cm8c30cm7cm1c7cm3c9c5cm5cm18c0_weight(1));
    PL_STEP_0_for_cm30cm8cm8c5cm1cm14c5c10c11c9c0cm13cm10cm5c5c23_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm30cm8cm8c5cm1cm14c5c10c11c9c0cm13cm10cm5c5c23_weight(0), cm30cm8cm8c5cm1cm14c5c10c11c9c0cm13cm10cm5c5c23_weight(1));
    PL_STEP_0_for_c6c1c6c9c4c2c20c10c17c14c6c8c9c29c3cm25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c1c6c9c4c2c20c10c17c14c6c8c9c29c3cm25_weight(0), c6c1c6c9c4c2c20c10c17c14c6c8c9c29c3cm25_weight(1));
    PL_STEP_0_for_c4cm13c15cm1c6c12cm11c36c5cm8c16cm9cm8c1cm11c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm13c15cm1c6c12cm11c36c5cm8c16cm9cm8c1cm11c11_weight(0), c4cm13c15cm1c6c12cm11c36c5cm8c16cm9cm8c1cm11c11_weight(1));
    PL_STEP_0_for_cm4c3cm1c1c16cm8cm5c21c2cm5cm6c16cm3c1cm14c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c3cm1c1c16cm8cm5c21c2cm5cm6c16cm3c1cm14c8_weight(0), cm4c3cm1c1c16cm8cm5c21c2cm5cm6c16cm3c1cm14c8_weight(1));
    PL_STEP_0_for_c1c6c6cm1c19c12cm4c12cm12c3c6c29cm53c6c8cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c6c6cm1c19c12cm4c12cm12c3c6c29cm53c6c8cm4_weight(0), c1c6c6cm1c19c12cm4c12cm12c3c6c29cm53c6c8cm4_weight(1));
    PL_STEP_0_for_cm10c47cm3c2c9c0c8c15c1cm1cm6cm15c0c0c0c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c47cm3c2c9c0c8c15c1cm1cm6cm15c0c0c0c11_weight(0), cm10c47cm3c2c9c0c8c15c1cm1cm6cm15c0c0c0c11_weight(1));
    PL_STEP_0_for_c5cm4cm14c0c10c10c14c6c10cm4c2c0c1c50c3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm4cm14c0c10c10c14c6c10cm4c2c0c1c50c3c1_weight(0), c5cm4cm14c0c10c10c14c6c10cm4c2c0c1c50c3c1_weight(1));
    PL_STEP_0_for_cm2cm7c3cm3cm17cm20cm14c6cm3c1cm3c1c4cm5cm2cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm7c3cm3cm17cm20cm14c6cm3c1cm3c1c4cm5cm2cm3_weight(0), cm2cm7c3cm3cm17cm20cm14c6cm3c1cm3c1c4cm5cm2cm3_weight(1));
    PL_STEP_0_for_c7cm8cm15cm8cm4cm1c12c15cm10cm23c3c0cm1cm7c7c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm8cm15cm8cm4cm1c12c15cm10cm23c3c0cm1cm7c7c9_weight(0), c7cm8cm15cm8cm4cm1c12c15cm10cm23c3c0cm1cm7c7c9_weight(1));
    PL_STEP_0_for_cm32cm3c17c3c5cm11c9cm1c2cm11c2c7cm3cm7c4c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm32cm3c17c3c5cm11c9cm1c2cm11c2c7cm3cm7c4c14_weight(0), cm32cm3c17c3c5cm11c9cm1c2cm11c2c7cm3cm7c4c14_weight(1));
    PL_STEP_0_for_c4cm6c9c3c22cm3cm9c7c32c26cm10c4c14c49c7cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm6c9c3c22cm3cm9c7c32c26cm10c4c14c49c7cm9_weight(0), c4cm6c9c3c22cm3cm9c7c32c26cm10c4c14c49c7cm9_weight(1));
    PL_STEP_0_for_c5c2c3c2cm4c12cm4cm1c5cm3c1c1cm6c4cm3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c2c3c2cm4c12cm4cm1c5cm3c1c1cm6c4cm3cm2_weight(0), c5c2c3c2cm4c12cm4cm1c5cm3c1c1cm6c4cm3cm2_weight(1));
    PL_STEP_0_for_c7c0c2cm9cm5c30cm17c13cm15c1c2cm2cm24cm4cm5cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c0c2cm9cm5c30cm17c13cm15c1c2cm2cm24cm4cm5cm5_weight(0), c7c0c2cm9cm5c30cm17c13cm15c1c2cm2cm24cm4cm5cm5_weight(1));
    PL_STEP_0_for_cm12cm5c6cm7c9cm2c22c21cm4cm15cm9c10c7c24cm15c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12cm5c6cm7c9cm2c22c21cm4cm15cm9c10c7c24cm15c1_weight(0), cm12cm5c6cm7c9cm2c22c21cm4cm15cm9c10c7c24cm15c1_weight(1));
    PL_STEP_0_for_c57cm4c7c2cm2cm10cm6c12cm1c3c0cm9c5cm12cm3cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c57cm4c7c2cm2cm10cm6c12cm1c3c0cm9c5cm12cm3cm11_weight(0), c57cm4c7c2cm2cm10cm6c12cm1c3c0cm9c5cm12cm3cm11_weight(1));
    PL_STEP_0_for_c0cm2cm6c4c6c5cm17cm11cm6c3cm3cm34c10cm10c14c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2cm6c4c6c5cm17cm11cm6c3cm3cm34c10cm10c14c3_weight(0), c0cm2cm6c4c6c5cm17cm11cm6c3cm3cm34c10cm10c14c3_weight(1));
    PL_STEP_0_for_c5cm2c2c4c2c17c7c5c7cm9cm5c1cm26cm3cm12c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm2c2c4c2c17c7c5c7cm9cm5c1cm26cm3cm12c5_weight(0), c5cm2c2c4c2c17c7c5c7cm9cm5c1cm26cm3cm12c5_weight(1));
    PL_STEP_0_for_c5c0c3cm1c20cm16c8cm5c4cm14c2c28cm8c8cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c0c3cm1c20cm16c8cm5c4cm14c2c28cm8c8cm1c0_weight(0), c5c0c3cm1c20cm16c8cm5c4cm14c2c28cm8c8cm1c0_weight(1));
    PL_STEP_0_for_cm3cm13cm8cm5c13c5c19c19cm13c0c10cm5cm18cm4cm28c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm13cm8cm5c13c5c19c19cm13c0c10cm5cm18cm4cm28c7_weight(0), cm3cm13cm8cm5c13c5c19c19cm13c0c10cm5cm18cm4cm28c7_weight(1));
    PL_STEP_0_for_cm3cm20c5c3c0cm3cm7c7cm4cm9cm33c0c3c2cm14c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm20c5c3c0cm3cm7c7cm4cm9cm33c0c3c2cm14c2_weight(0), cm3cm20c5c3c0cm3cm7c7cm4cm9cm33c0c3c2cm14c2_weight(1));
    PL_STEP_0_for_c0cm25c11cm7c23cm4c2cm6c9c3cm4c0cm4cm3cm3c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm25c11cm7c23cm4c2cm6c9c3cm4c0cm4cm3cm3c4_weight(0), c0cm25c11cm7c23cm4c2cm6c9c3cm4c0cm4cm3cm3c4_weight(1));
    PL_STEP_0_for_c0c7cm10cm8c2cm35c23cm6c1cm19c6cm1cm10cm9cm17c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c7cm10cm8c2cm35c23cm6c1cm19c6cm1cm10cm9cm17c4_weight(0), c0c7cm10cm8c2cm35c23cm6c1cm19c6cm1cm10cm9cm17c4_weight(1));
    PL_STEP_0_for_cm6cm1cm9cm7c1cm13c6c20cm13cm3cm2cm3c14cm8c7c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm1cm9cm7c1cm13c6c20cm13cm3cm2cm3c14cm8c7c8_weight(0), cm6cm1cm9cm7c1cm13c6c20cm13cm3cm2cm3c14cm8c7c8_weight(1));
    PL_STEP_0_for_c3cm13cm23c0c20c8c9cm16cm5c19cm1c9cm3cm2c5cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm13cm23c0c20c8c9cm16cm5c19cm1c9cm3cm2c5cm5_weight(0), c3cm13cm23c0c20c8c9cm16cm5c19cm1c9cm3cm2c5cm5_weight(1));
    PL_STEP_0_for_c11cm6c2cm14c17c12c4c10cm11c4c0c1c5cm7c2c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11cm6c2cm14c17c12c4c10cm11c4c0c1c5cm7c2c5_weight(0), c11cm6c2cm14c17c12c4c10cm11c4c0c1c5cm7c2c5_weight(1));
    PL_STEP_0_for_c0c5c13c10cm2c0c19c41cm4cm14c0c6c1cm18cm1cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c5c13c10cm2c0c19c41cm4cm14c0c6c1cm18cm1cm4_weight(0), c0c5c13c10cm2c0c19c41cm4cm14c0c6c1cm18cm1cm4_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm35cm4cm4cm11c10cm5c6c1c3c8cm3c7c2cm2c3cm5_c5c2c3c2cm4c12cm4cm1c5cm3c1c1cm6c4cm3cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm35cm4cm4cm11c10cm5c6c1c3c8cm3c7c2cm2c3cm5_weight(1)(7-1 downto 0),
			B	=> c5c2c3c2cm4c12cm4cm1c5cm3c1c1cm6c4cm3cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm35cm4cm4cm11c10cm5c6c1c3c8cm3c7c2cm2c3cm5,
			CxB => R_c5c2c3c2cm4c12cm4cm1c5cm3c1c1cm6c4cm3cm2
		);

    c21c7cm19cm11cm5c6cm7c3c5cm43c3c2c8cm3c0c1_c11cm6c2cm14c17c12c4c10cm11c4c0c1c5cm7c2c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c21c7cm19cm11cm5c6cm7c3c5cm43c3c2c8cm3c0c1_weight(1)(7-1 downto 0),
			B	=> c11cm6c2cm14c17c12c4c10cm11c4c0c1c5cm7c2c5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c21c7cm19cm11cm5c6cm7c3c5cm43c3c2c8cm3c0c1,
			CxB => R_c11cm6c2cm14c17c12c4c10cm11c4c0c1c5cm7c2c5
		);

    cm2cm35cm9cm11cm2c1c5cm1cm1cm2c2c11cm5c0cm11c3_c3cm13cm23c0c20c8c9cm16cm5c19cm1c9cm3cm2c5cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm35cm9cm11cm2c1c5cm1cm1cm2c2c11cm5c0cm11c3_weight(1)(7-1 downto 0),
			B	=> c3cm13cm23c0c20c8c9cm16cm5c19cm1c9cm3cm2c5cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm35cm9cm11cm2c1c5cm1cm1cm2c2c11cm5c0cm11c3,
			CxB => R_c3cm13cm23c0c20c8c9cm16cm5c19cm1c9cm3cm2c5cm5
		);

    c4cm13c15cm1c6c12cm11c36c5cm8c16cm9cm8c1cm11c11_cm6cm1cm9cm7c1cm13c6c20cm13cm3cm2cm3c14cm8c7c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4cm13c15cm1c6c12cm11c36c5cm8c16cm9cm8c1cm11c11_weight(1)(7-1 downto 0),
			B	=> cm6cm1cm9cm7c1cm13c6c20cm13cm3cm2cm3c14cm8c7c8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4cm13c15cm1c6c12cm11c36c5cm8c16cm9cm8c1cm11c11,
			CxB => R_cm6cm1cm9cm7c1cm13c6c20cm13cm3cm2cm3c14cm8c7c8
		);

    c1c6c6cm1c19c12cm4c12cm12c3c6c29cm53c6c8cm4_c0cm25c11cm7c23cm4c2cm6c9c3cm4c0cm4cm3cm3c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c6c6cm1c19c12cm4c12cm12c3c6c29cm53c6c8cm4_weight(1)(7-1 downto 0),
			B	=> c0cm25c11cm7c23cm4c2cm6c9c3cm4c0cm4cm3cm3c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c6c6cm1c19c12cm4c12cm12c3c6c29cm53c6c8cm4,
			CxB => R_c0cm25c11cm7c23cm4c2cm6c9c3cm4c0cm4cm3cm3c4
		);

    cm10c47cm3c2c9c0c8c15c1cm1cm6cm15c0c0c0c11_cm3cm13cm8cm5c13c5c19c19cm13c0c10cm5cm18cm4cm28c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm10c47cm3c2c9c0c8c15c1cm1cm6cm15c0c0c0c11_weight(1)(7-1 downto 0),
			B	=> cm3cm13cm8cm5c13c5c19c19cm13c0c10cm5cm18cm4cm28c7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10c47cm3c2c9c0c8c15c1cm1cm6cm15c0c0c0c11,
			CxB => R_cm3cm13cm8cm5c13c5c19c19cm13c0c10cm5cm18cm4cm28c7
		);

    c5cm4cm14c0c10c10c14c6c10cm4c2c0c1c50c3c1_c5c0c3cm1c20cm16c8cm5c4cm14c2c28cm8c8cm1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5cm4cm14c0c10c10c14c6c10cm4c2c0c1c50c3c1_weight(1)(7-1 downto 0),
			B	=> c5c0c3cm1c20cm16c8cm5c4cm14c2c28cm8c8cm1c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5cm4cm14c0c10c10c14c6c10cm4c2c0c1c50c3c1,
			CxB => R_c5c0c3cm1c20cm16c8cm5c4cm14c2c28cm8c8cm1c0
		);

    c4cm6c9c3c22cm3cm9c7c32c26cm10c4c14c49c7cm9_c5cm2c2c4c2c17c7c5c7cm9cm5c1cm26cm3cm12c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4cm6c9c3c22cm3cm9c7c32c26cm10c4c14c49c7cm9_weight(1)(7-1 downto 0),
			B	=> c5cm2c2c4c2c17c7c5c7cm9cm5c1cm26cm3cm12c5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4cm6c9c3c22cm3cm9c7c32c26cm10c4c14c49c7cm9,
			CxB => R_c5cm2c2c4c2c17c7c5c7cm9cm5c1cm26cm3cm12c5
		);

    c57cm4c7c2cm2cm10cm6c12cm1c3c0cm9c5cm12cm3cm11_cm12cm5c6cm7c9cm2c22c21cm4cm15cm9c10c7c24cm15c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c57cm4c7c2cm2cm10cm6c12cm1c3c0cm9c5cm12cm3cm11_weight(1)(7-1 downto 0),
			B	=> cm12cm5c6cm7c9cm2c22c21cm4cm15cm9c10c7c24cm15c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c57cm4c7c2cm2cm10cm6c12cm1c3c0cm9c5cm12cm3cm11,
			CxB => R_cm12cm5c6cm7c9cm2c22c21cm4cm15cm9c10c7c24cm15c1
		);

    c0cm2cm6c4c6c5cm17cm11cm6c3cm3cm34c10cm10c14c3_c7c0c2cm9cm5c30cm17c13cm15c1c2cm2cm24cm4cm5cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm2cm6c4c6c5cm17cm11cm6c3cm3cm34c10cm10c14c3_weight(1)(7-1 downto 0),
			B	=> c7c0c2cm9cm5c30cm17c13cm15c1c2cm2cm24cm4cm5cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm2cm6c4c6c5cm17cm11cm6c3cm3cm34c10cm10c14c3,
			CxB => R_c7c0c2cm9cm5c30cm17c13cm15c1c2cm2cm24cm4cm5cm5
		);

    cm3cm20c5c3c0cm3cm7c7cm4cm9cm33c0c3c2cm14c2_cm32cm3c17c3c5cm11c9cm1c2cm11c2c7cm3cm7c4c14_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3cm20c5c3c0cm3cm7c7cm4cm9cm33c0c3c2cm14c2_weight(1)(7-1 downto 0),
			B	=> cm32cm3c17c3c5cm11c9cm1c2cm11c2c7cm3cm7c4c14_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3cm20c5c3c0cm3cm7c7cm4cm9cm33c0c3c2cm14c2,
			CxB => R_cm32cm3c17c3c5cm11c9cm1c2cm11c2c7cm3cm7c4c14
		);

    c0c7cm10cm8c2cm35c23cm6c1cm19c6cm1cm10cm9cm17c4_c7cm8cm15cm8cm4cm1c12c15cm10cm23c3c0cm1cm7c7c9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c7cm10cm8c2cm35c23cm6c1cm19c6cm1cm10cm9cm17c4_weight(1)(7-1 downto 0),
			B	=> c7cm8cm15cm8cm4cm1c12c15cm10cm23c3c0cm1cm7c7c9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c7cm10cm8c2cm35c23cm6c1cm19c6cm1cm10cm9cm17c4,
			CxB => R_c7cm8cm15cm8cm4cm1c12c15cm10cm23c3c0cm1cm7c7c9
		);

    c0c5c13c10cm2c0c19c41cm4cm14c0c6c1cm18cm1cm4_cm2cm7c3cm3cm17cm20cm14c6cm3c1cm3c1c4cm5cm2cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c5c13c10cm2c0c19c41cm4cm14c0c6c1cm18cm1cm4_weight(1)(7-1 downto 0),
			B	=> cm2cm7c3cm3cm17cm20cm14c6cm3c1cm3c1c4cm5cm2cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c5c13c10cm2c0c19c41cm4cm14c0c6c1cm18cm1cm4,
			CxB => R_cm2cm7c3cm3cm17cm20cm14c6cm3c1cm3c1c4cm5cm2cm3
		);

    c4c0cm13cm6c3c1c29cm9c7c8cm8c1c7cm7c5cm6_cm4c3cm1c1c16cm8cm5c21c2cm5cm6c16cm3c1cm14c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c0cm13cm6c3c1c29cm9c7c8cm8c1c7cm7c5cm6_weight(1)(6-1 downto 0),
			B	=> cm4c3cm1c1c16cm8cm5c21c2cm5cm6c16cm3c1cm14c8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c0cm13cm6c3c1c29cm9c7c8cm8c1c7cm7c5cm6,
			CxB => R_cm4c3cm1c1c16cm8cm5c21c2cm5cm6c16cm3c1cm14c8
		);

    cm2cm4cm7cm5cm1cm2cm8cm16c0c12cm9cm8c11c9c6c30_c6c1c6c9c4c2c20c10c17c14c6c8c9c29c3cm25_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm4cm7cm5cm1cm2cm8cm16c0c12cm9cm8c11c9c6c30_weight(1)(6-1 downto 0),
			B	=> c6c1c6c9c4c2c20c10c17c14c6c8c9c29c3cm25_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm4cm7cm5cm1cm2cm8cm16c0c12cm9cm8c11c9c6c30,
			CxB => R_c6c1c6c9c4c2c20c10c17c14c6c8c9c29c3cm25
		);

    cm29c1c2cm4cm3cm8c30cm7cm1c7cm3c9c5cm5cm18c0_cm30cm8cm8c5cm1cm14c5c10c11c9c0cm13cm10cm5c5c23_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm29c1c2cm4cm3cm8c30cm7cm1c7cm3c9c5cm5cm18c0_weight(1)(6-1 downto 0),
			B	=> cm30cm8cm8c5cm1cm14c5c10c11c9c0cm13cm10cm5c5c23_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm29c1c2cm4cm3cm8c30cm7cm1c7cm3c9c5cm5cm18c0,
			CxB => R_cm30cm8cm8c5cm1cm14c5c10c11c9c0cm13cm10cm5c5c23
		);




end architecture;
