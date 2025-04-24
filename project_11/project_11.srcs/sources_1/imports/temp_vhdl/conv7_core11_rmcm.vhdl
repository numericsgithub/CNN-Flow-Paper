library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core11_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm6c6cm10cm7cm2cm5cm4c2c22cm5c4cm2c4c6cm13c4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm14cm7c10cm2c3cm18cm1cm24cm5c3c22cm2cm21c10c31cm14 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm4c9cm12c2cm8c8c5c0cm2c2c2cm2c6c3cm5cm8 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm23cm5c0c14cm16c0cm2c1cm7c15cm12c2c5cm7cm11c36 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3cm15cm8c12cm15cm6cm4c12c1cm10c0c1c20c10cm18c17 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2cm6c6cm2c0cm5c0cm9c0c6cm13cm8cm9cm6c18cm15 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c87cm1cm1c23c0c3c4cm4c18c2c5cm2cm11cm1c3c17 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm4cm35c10cm8cm1c2cm4c1cm30cm7c20c3c9cm1cm6c3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3cm88c4c8c35c11c15c15c1cm7cm4c8cm1cm19cm3c9 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm1cm4cm6cm32c1c3c13c18cm4c2cm4c34c10cm2c1c9 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c5cm10c0cm9c12cm9cm15cm6c19cm8cm16c12c3cm18cm4cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c3c2c0c0cm3c0c10c5c0c0c14c4c15c2c4cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm12cm10cm14cm1c14c0cm2c8c5cm24c8c1c0cm17c0c10 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c37c5cm1cm3c5c3c5cm4cm35cm5cm8c6c7c12c11cm7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c6cm16cm10cm15cm24cm5cm12c6cm5cm10cm15c5c5c0c10c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c7cm18cm3cm1c3c10cm3c8c10c10c2c9cm9cm9cm10c7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm11cm1cm9c7cm2cm6c2cm11c9cm15cm4cm13cm9cm33c8cm19 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3c1cm4c0c4c4c1cm12cm4c0c6cm4cm14cm3cm4c2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c6c53cm3c11c2c9c10cm1c1c7c8c12cm17cm18c9cm8 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm11cm7c1cm4cm9c15c5c1cm15c4c1c5c23c30cm3c40 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2c7cm1cm1c1cm56c0c4cm1c8cm4c2c4cm8c7cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c6cm24c27cm6c5c3cm7cm9cm15c47cm15c3c9c4cm9 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6cm6c19cm1cm20cm4cm21cm1c22c3cm11c9cm18c2c1cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6cm8c20cm4c97c0cm35cm1cm3cm16cm6cm4cm6c19cm8cm1 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c10cm6cm58c2cm20c0cm1cm14c10c1c2cm7cm18c5cm10c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm4cm7c1c0c6cm1cm17cm5cm6c5cm14c6c11c11cm1c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c51c1c10cm11c8c0c6cm5cm7c3c6c4c13cm1c0c13 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c10c16c16cm41cm6cm2cm17c0c6cm25cm7cm6cm20c4c34cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0cm7c7cm6cm3cm4c18c4c3c10c8c32cm2c5c17 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3cm7c2cm3c9c6c2cm4cm8c8c2cm1cm14c4c3cm6 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm9c45c1cm1c2c5c6c1c4cm1c2c9cm9c9c7cm37 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c5cm3c13cm58cm22c14cm1c0cm1cm6cm4cm7cm9cm18cm33cm18 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core11_rmcm;

architecture arch of conv7_core11_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C6CM10CM7CM2CM5CM4C2C22CM5C4CM2C4C6CM13C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14CM7C10CM2C3CM18CM1CM24CM5C3C22CM2CM21C10C31CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C9CM12C2CM8C8C5C0CM2C2C2CM2C6C3CM5CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM23CM5C0C14CM16C0CM2C1CM7C15CM12C2C5CM7CM11C36_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM15CM8C12CM15CM6CM4C12C1CM10C0C1C20C10CM18C17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM6C6CM2C0CM5C0CM9C0C6CM13CM8CM9CM6C18CM15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C87CM1CM1C23C0C3C4CM4C18C2C5CM2CM11CM1C3C17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM35C10CM8CM1C2CM4C1CM30CM7C20C3C9CM1CM6C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM88C4C8C35C11C15C15C1CM7CM4C8CM1CM19CM3C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM4CM6CM32C1C3C13C18CM4C2CM4C34C10CM2C1C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM10C0CM9C12CM9CM15CM6C19CM8CM16C12C3CM18CM4CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C2C0C0CM3C0C10C5C0C0C14C4C15C2C4CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12CM10CM14CM1C14C0CM2C8C5CM24C8C1C0CM17C0C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C37C5CM1CM3C5C3C5CM4CM35CM5CM8C6C7C12C11CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM16CM10CM15CM24CM5CM12C6CM5CM10CM15C5C5C0C10C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM18CM3CM1C3C10CM3C8C10C10C2C9CM9CM9CM10C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11CM1CM9C7CM2CM6C2CM11C9CM15CM4CM13CM9CM33C8CM19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C1CM4C0C4C4C1CM12CM4C0C6CM4CM14CM3CM4C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C53CM3C11C2C9C10CM1C1C7C8C12CM17CM18C9CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11CM7C1CM4CM9C15C5C1CM15C4C1C5C23C30CM3C40_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C7CM1CM1C1CM56C0C4CM1C8CM4C2C4CM8C7CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C6CM24C27CM6C5C3CM7CM9CM15C47CM15C3C9C4CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM6C19CM1CM20CM4CM21CM1C22C3CM11C9CM18C2C1CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM8C20CM4C97C0CM35CM1CM3CM16CM6CM4CM6C19CM8CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10CM6CM58C2CM20C0CM1CM14C10C1C2CM7CM18C5CM10C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM7C1C0C6CM1CM17CM5CM6C5CM14C6C11C11CM1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C51C1C10CM11C8C0C6CM5CM7C3C6C4C13CM1C0C13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10C16C16CM41CM6CM2CM17C0C6CM25CM7CM6CM20C4C34CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM7C7CM6CM3CM4C18C4C3C10C8C32CM2C5C17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM7C2CM3C9C6C2CM4CM8C8C2CM1CM14C4C3CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C45C1CM1C2C5C6C1C4CM1C2C9CM9C9C7CM37_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM3C13CM58CM22C14CM1C0CM1CM6CM4CM7CM9CM18CM33CM18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm6c6cm10cm7cm2cm5cm4c2c22cm5c4cm2c4c6cm13c4_weight : PIPELINE_TYPE_FOR_CM6C6CM10CM7CM2CM5CM4C2C22CM5C4CM2C4C6CM13C4_WEIGHT;
    -- sfix(1, -7)
    signal cm14cm7c10cm2c3cm18cm1cm24cm5c3c22cm2cm21c10c31cm14_weight : PIPELINE_TYPE_FOR_CM14CM7C10CM2C3CM18CM1CM24CM5C3C22CM2CM21C10C31CM14_WEIGHT;
    -- sfix(1, -7)
    signal cm4c9cm12c2cm8c8c5c0cm2c2c2cm2c6c3cm5cm8_weight : PIPELINE_TYPE_FOR_CM4C9CM12C2CM8C8C5C0CM2C2C2CM2C6C3CM5CM8_WEIGHT;
    -- sfix(1, -7)
    signal cm23cm5c0c14cm16c0cm2c1cm7c15cm12c2c5cm7cm11c36_weight : PIPELINE_TYPE_FOR_CM23CM5C0C14CM16C0CM2C1CM7C15CM12C2C5CM7CM11C36_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm15cm8c12cm15cm6cm4c12c1cm10c0c1c20c10cm18c17_weight : PIPELINE_TYPE_FOR_CM3CM15CM8C12CM15CM6CM4C12C1CM10C0C1C20C10CM18C17_WEIGHT;
    -- sfix(1, -7)
    signal c2cm6c6cm2c0cm5c0cm9c0c6cm13cm8cm9cm6c18cm15_weight : PIPELINE_TYPE_FOR_C2CM6C6CM2C0CM5C0CM9C0C6CM13CM8CM9CM6C18CM15_WEIGHT;
    -- sfix(1, -7)
    signal c87cm1cm1c23c0c3c4cm4c18c2c5cm2cm11cm1c3c17_weight : PIPELINE_TYPE_FOR_C87CM1CM1C23C0C3C4CM4C18C2C5CM2CM11CM1C3C17_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm35c10cm8cm1c2cm4c1cm30cm7c20c3c9cm1cm6c3_weight : PIPELINE_TYPE_FOR_CM4CM35C10CM8CM1C2CM4C1CM30CM7C20C3C9CM1CM6C3_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm88c4c8c35c11c15c15c1cm7cm4c8cm1cm19cm3c9_weight : PIPELINE_TYPE_FOR_CM3CM88C4C8C35C11C15C15C1CM7CM4C8CM1CM19CM3C9_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm4cm6cm32c1c3c13c18cm4c2cm4c34c10cm2c1c9_weight : PIPELINE_TYPE_FOR_CM1CM4CM6CM32C1C3C13C18CM4C2CM4C34C10CM2C1C9_WEIGHT;
    -- sfix(1, -7)
    signal c5cm10c0cm9c12cm9cm15cm6c19cm8cm16c12c3cm18cm4cm1_weight : PIPELINE_TYPE_FOR_C5CM10C0CM9C12CM9CM15CM6C19CM8CM16C12C3CM18CM4CM1_WEIGHT;
    -- sfix(1, -7)
    signal c3c2c0c0cm3c0c10c5c0c0c14c4c15c2c4cm1_weight : PIPELINE_TYPE_FOR_C3C2C0C0CM3C0C10C5C0C0C14C4C15C2C4CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm12cm10cm14cm1c14c0cm2c8c5cm24c8c1c0cm17c0c10_weight : PIPELINE_TYPE_FOR_CM12CM10CM14CM1C14C0CM2C8C5CM24C8C1C0CM17C0C10_WEIGHT;
    -- sfix(1, -7)
    signal c37c5cm1cm3c5c3c5cm4cm35cm5cm8c6c7c12c11cm7_weight : PIPELINE_TYPE_FOR_C37C5CM1CM3C5C3C5CM4CM35CM5CM8C6C7C12C11CM7_WEIGHT;
    -- sfix(1, -7)
    signal c6cm16cm10cm15cm24cm5cm12c6cm5cm10cm15c5c5c0c10c0_weight : PIPELINE_TYPE_FOR_C6CM16CM10CM15CM24CM5CM12C6CM5CM10CM15C5C5C0C10C0_WEIGHT;
    -- sfix(1, -7)
    signal c7cm18cm3cm1c3c10cm3c8c10c10c2c9cm9cm9cm10c7_weight : PIPELINE_TYPE_FOR_C7CM18CM3CM1C3C10CM3C8C10C10C2C9CM9CM9CM10C7_WEIGHT;
    -- sfix(1, -7)
    signal cm11cm1cm9c7cm2cm6c2cm11c9cm15cm4cm13cm9cm33c8cm19_weight : PIPELINE_TYPE_FOR_CM11CM1CM9C7CM2CM6C2CM11C9CM15CM4CM13CM9CM33C8CM19_WEIGHT;
    -- sfix(1, -7)
    signal c3c1cm4c0c4c4c1cm12cm4c0c6cm4cm14cm3cm4c2_weight : PIPELINE_TYPE_FOR_C3C1CM4C0C4C4C1CM12CM4C0C6CM4CM14CM3CM4C2_WEIGHT;
    -- sfix(1, -7)
    signal c6c53cm3c11c2c9c10cm1c1c7c8c12cm17cm18c9cm8_weight : PIPELINE_TYPE_FOR_C6C53CM3C11C2C9C10CM1C1C7C8C12CM17CM18C9CM8_WEIGHT;
    -- sfix(1, -7)
    signal cm11cm7c1cm4cm9c15c5c1cm15c4c1c5c23c30cm3c40_weight : PIPELINE_TYPE_FOR_CM11CM7C1CM4CM9C15C5C1CM15C4C1C5C23C30CM3C40_WEIGHT;
    -- sfix(1, -7)
    signal cm2c7cm1cm1c1cm56c0c4cm1c8cm4c2c4cm8c7cm2_weight : PIPELINE_TYPE_FOR_CM2C7CM1CM1C1CM56C0C4CM1C8CM4C2C4CM8C7CM2_WEIGHT;
    -- sfix(1, -7)
    signal c0c6cm24c27cm6c5c3cm7cm9cm15c47cm15c3c9c4cm9_weight : PIPELINE_TYPE_FOR_C0C6CM24C27CM6C5C3CM7CM9CM15C47CM15C3C9C4CM9_WEIGHT;
    -- sfix(1, -7)
    signal cm6cm6c19cm1cm20cm4cm21cm1c22c3cm11c9cm18c2c1cm8_weight : PIPELINE_TYPE_FOR_CM6CM6C19CM1CM20CM4CM21CM1C22C3CM11C9CM18C2C1CM8_WEIGHT;
    -- sfix(1, -7)
    signal c6cm8c20cm4c97c0cm35cm1cm3cm16cm6cm4cm6c19cm8cm1_weight : PIPELINE_TYPE_FOR_C6CM8C20CM4C97C0CM35CM1CM3CM16CM6CM4CM6C19CM8CM1_WEIGHT;
    -- sfix(1, -7)
    signal c10cm6cm58c2cm20c0cm1cm14c10c1c2cm7cm18c5cm10c2_weight : PIPELINE_TYPE_FOR_C10CM6CM58C2CM20C0CM1CM14C10C1C2CM7CM18C5CM10C2_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm7c1c0c6cm1cm17cm5cm6c5cm14c6c11c11cm1c0_weight : PIPELINE_TYPE_FOR_CM4CM7C1C0C6CM1CM17CM5CM6C5CM14C6C11C11CM1C0_WEIGHT;
    -- sfix(1, -7)
    signal c51c1c10cm11c8c0c6cm5cm7c3c6c4c13cm1c0c13_weight : PIPELINE_TYPE_FOR_C51C1C10CM11C8C0C6CM5CM7C3C6C4C13CM1C0C13_WEIGHT;
    -- sfix(1, -7)
    signal c10c16c16cm41cm6cm2cm17c0c6cm25cm7cm6cm20c4c34cm2_weight : PIPELINE_TYPE_FOR_C10C16C16CM41CM6CM2CM17C0C6CM25CM7CM6CM20C4C34CM2_WEIGHT;
    -- sfix(1, -7)
    signal c0c0cm7c7cm6cm3cm4c18c4c3c10c8c32cm2c5c17_weight : PIPELINE_TYPE_FOR_C0C0CM7C7CM6CM3CM4C18C4C3C10C8C32CM2C5C17_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm7c2cm3c9c6c2cm4cm8c8c2cm1cm14c4c3cm6_weight : PIPELINE_TYPE_FOR_CM3CM7C2CM3C9C6C2CM4CM8C8C2CM1CM14C4C3CM6_WEIGHT;
    -- sfix(1, -7)
    signal cm9c45c1cm1c2c5c6c1c4cm1c2c9cm9c9c7cm37_weight : PIPELINE_TYPE_FOR_CM9C45C1CM1C2C5C6C1C4CM1C2C9CM9C9C7CM37_WEIGHT;
    -- sfix(1, -7)
    signal c5cm3c13cm58cm22c14cm1c0cm1cm6cm4cm7cm9cm18cm33cm18_weight : PIPELINE_TYPE_FOR_C5CM3C13CM58CM22C14CM1C0CM1CM6CM4CM7CM9CM18CM33CM18_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core11_rmcm_weightsconstant_memory
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
        
            dout1   => cm6c6cm10cm7cm2cm5cm4c2c22cm5c4cm2c4c6cm13c4_weight(0), 
            dout2   => cm14cm7c10cm2c3cm18cm1cm24cm5c3c22cm2cm21c10c31cm14_weight(0), 
            dout3   => cm4c9cm12c2cm8c8c5c0cm2c2c2cm2c6c3cm5cm8_weight(0), 
            dout4   => cm23cm5c0c14cm16c0cm2c1cm7c15cm12c2c5cm7cm11c36_weight(0), 
            dout5   => cm3cm15cm8c12cm15cm6cm4c12c1cm10c0c1c20c10cm18c17_weight(0), 
            dout6   => c2cm6c6cm2c0cm5c0cm9c0c6cm13cm8cm9cm6c18cm15_weight(0), 
            dout7   => c87cm1cm1c23c0c3c4cm4c18c2c5cm2cm11cm1c3c17_weight(0), 
            dout8   => cm4cm35c10cm8cm1c2cm4c1cm30cm7c20c3c9cm1cm6c3_weight(0), 
            dout9   => cm3cm88c4c8c35c11c15c15c1cm7cm4c8cm1cm19cm3c9_weight(0), 
            dout10   => cm1cm4cm6cm32c1c3c13c18cm4c2cm4c34c10cm2c1c9_weight(0), 
            dout11   => c5cm10c0cm9c12cm9cm15cm6c19cm8cm16c12c3cm18cm4cm1_weight(0), 
            dout12   => c3c2c0c0cm3c0c10c5c0c0c14c4c15c2c4cm1_weight(0), 
            dout13   => cm12cm10cm14cm1c14c0cm2c8c5cm24c8c1c0cm17c0c10_weight(0), 
            dout14   => c37c5cm1cm3c5c3c5cm4cm35cm5cm8c6c7c12c11cm7_weight(0), 
            dout15   => c6cm16cm10cm15cm24cm5cm12c6cm5cm10cm15c5c5c0c10c0_weight(0), 
            dout16   => c7cm18cm3cm1c3c10cm3c8c10c10c2c9cm9cm9cm10c7_weight(0), 
            dout17   => cm11cm1cm9c7cm2cm6c2cm11c9cm15cm4cm13cm9cm33c8cm19_weight(0), 
            dout18   => c3c1cm4c0c4c4c1cm12cm4c0c6cm4cm14cm3cm4c2_weight(0), 
            dout19   => c6c53cm3c11c2c9c10cm1c1c7c8c12cm17cm18c9cm8_weight(0), 
            dout20   => cm11cm7c1cm4cm9c15c5c1cm15c4c1c5c23c30cm3c40_weight(0), 
            dout21   => cm2c7cm1cm1c1cm56c0c4cm1c8cm4c2c4cm8c7cm2_weight(0), 
            dout22   => c0c6cm24c27cm6c5c3cm7cm9cm15c47cm15c3c9c4cm9_weight(0), 
            dout23   => cm6cm6c19cm1cm20cm4cm21cm1c22c3cm11c9cm18c2c1cm8_weight(0), 
            dout24   => c6cm8c20cm4c97c0cm35cm1cm3cm16cm6cm4cm6c19cm8cm1_weight(0), 
            dout25   => c10cm6cm58c2cm20c0cm1cm14c10c1c2cm7cm18c5cm10c2_weight(0), 
            dout26   => cm4cm7c1c0c6cm1cm17cm5cm6c5cm14c6c11c11cm1c0_weight(0), 
            dout27   => c51c1c10cm11c8c0c6cm5cm7c3c6c4c13cm1c0c13_weight(0), 
            dout28   => c10c16c16cm41cm6cm2cm17c0c6cm25cm7cm6cm20c4c34cm2_weight(0), 
            dout29   => c0c0cm7c7cm6cm3cm4c18c4c3c10c8c32cm2c5c17_weight(0), 
            dout30   => cm3cm7c2cm3c9c6c2cm4cm8c8c2cm1cm14c4c3cm6_weight(0), 
            dout31   => cm9c45c1cm1c2c5c6c1c4cm1c2c9cm9c9c7cm37_weight(0), 
            dout32   => c5cm3c13cm58cm22c14cm1c0cm1cm6cm4cm7cm9cm18cm33cm18_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm6c6cm10cm7cm2cm5cm4c2c22cm5c4cm2c4c6cm13c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c6cm10cm7cm2cm5cm4c2c22cm5c4cm2c4c6cm13c4_weight(0), cm6c6cm10cm7cm2cm5cm4c2c22cm5c4cm2c4c6cm13c4_weight(1));
    PL_STEP_0_for_cm14cm7c10cm2c3cm18cm1cm24cm5c3c22cm2cm21c10c31cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14cm7c10cm2c3cm18cm1cm24cm5c3c22cm2cm21c10c31cm14_weight(0), cm14cm7c10cm2c3cm18cm1cm24cm5c3c22cm2cm21c10c31cm14_weight(1));
    PL_STEP_0_for_cm4c9cm12c2cm8c8c5c0cm2c2c2cm2c6c3cm5cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c9cm12c2cm8c8c5c0cm2c2c2cm2c6c3cm5cm8_weight(0), cm4c9cm12c2cm8c8c5c0cm2c2c2cm2c6c3cm5cm8_weight(1));
    PL_STEP_0_for_cm23cm5c0c14cm16c0cm2c1cm7c15cm12c2c5cm7cm11c36_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm23cm5c0c14cm16c0cm2c1cm7c15cm12c2c5cm7cm11c36_weight(0), cm23cm5c0c14cm16c0cm2c1cm7c15cm12c2c5cm7cm11c36_weight(1));
    PL_STEP_0_for_cm3cm15cm8c12cm15cm6cm4c12c1cm10c0c1c20c10cm18c17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm15cm8c12cm15cm6cm4c12c1cm10c0c1c20c10cm18c17_weight(0), cm3cm15cm8c12cm15cm6cm4c12c1cm10c0c1c20c10cm18c17_weight(1));
    PL_STEP_0_for_c2cm6c6cm2c0cm5c0cm9c0c6cm13cm8cm9cm6c18cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm6c6cm2c0cm5c0cm9c0c6cm13cm8cm9cm6c18cm15_weight(0), c2cm6c6cm2c0cm5c0cm9c0c6cm13cm8cm9cm6c18cm15_weight(1));
    PL_STEP_0_for_c87cm1cm1c23c0c3c4cm4c18c2c5cm2cm11cm1c3c17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c87cm1cm1c23c0c3c4cm4c18c2c5cm2cm11cm1c3c17_weight(0), c87cm1cm1c23c0c3c4cm4c18c2c5cm2cm11cm1c3c17_weight(1));
    PL_STEP_0_for_cm4cm35c10cm8cm1c2cm4c1cm30cm7c20c3c9cm1cm6c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm35c10cm8cm1c2cm4c1cm30cm7c20c3c9cm1cm6c3_weight(0), cm4cm35c10cm8cm1c2cm4c1cm30cm7c20c3c9cm1cm6c3_weight(1));
    PL_STEP_0_for_cm3cm88c4c8c35c11c15c15c1cm7cm4c8cm1cm19cm3c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm88c4c8c35c11c15c15c1cm7cm4c8cm1cm19cm3c9_weight(0), cm3cm88c4c8c35c11c15c15c1cm7cm4c8cm1cm19cm3c9_weight(1));
    PL_STEP_0_for_cm1cm4cm6cm32c1c3c13c18cm4c2cm4c34c10cm2c1c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm4cm6cm32c1c3c13c18cm4c2cm4c34c10cm2c1c9_weight(0), cm1cm4cm6cm32c1c3c13c18cm4c2cm4c34c10cm2c1c9_weight(1));
    PL_STEP_0_for_c5cm10c0cm9c12cm9cm15cm6c19cm8cm16c12c3cm18cm4cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm10c0cm9c12cm9cm15cm6c19cm8cm16c12c3cm18cm4cm1_weight(0), c5cm10c0cm9c12cm9cm15cm6c19cm8cm16c12c3cm18cm4cm1_weight(1));
    PL_STEP_0_for_c3c2c0c0cm3c0c10c5c0c0c14c4c15c2c4cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c2c0c0cm3c0c10c5c0c0c14c4c15c2c4cm1_weight(0), c3c2c0c0cm3c0c10c5c0c0c14c4c15c2c4cm1_weight(1));
    PL_STEP_0_for_cm12cm10cm14cm1c14c0cm2c8c5cm24c8c1c0cm17c0c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12cm10cm14cm1c14c0cm2c8c5cm24c8c1c0cm17c0c10_weight(0), cm12cm10cm14cm1c14c0cm2c8c5cm24c8c1c0cm17c0c10_weight(1));
    PL_STEP_0_for_c37c5cm1cm3c5c3c5cm4cm35cm5cm8c6c7c12c11cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c37c5cm1cm3c5c3c5cm4cm35cm5cm8c6c7c12c11cm7_weight(0), c37c5cm1cm3c5c3c5cm4cm35cm5cm8c6c7c12c11cm7_weight(1));
    PL_STEP_0_for_c6cm16cm10cm15cm24cm5cm12c6cm5cm10cm15c5c5c0c10c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm16cm10cm15cm24cm5cm12c6cm5cm10cm15c5c5c0c10c0_weight(0), c6cm16cm10cm15cm24cm5cm12c6cm5cm10cm15c5c5c0c10c0_weight(1));
    PL_STEP_0_for_c7cm18cm3cm1c3c10cm3c8c10c10c2c9cm9cm9cm10c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm18cm3cm1c3c10cm3c8c10c10c2c9cm9cm9cm10c7_weight(0), c7cm18cm3cm1c3c10cm3c8c10c10c2c9cm9cm9cm10c7_weight(1));
    PL_STEP_0_for_cm11cm1cm9c7cm2cm6c2cm11c9cm15cm4cm13cm9cm33c8cm19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11cm1cm9c7cm2cm6c2cm11c9cm15cm4cm13cm9cm33c8cm19_weight(0), cm11cm1cm9c7cm2cm6c2cm11c9cm15cm4cm13cm9cm33c8cm19_weight(1));
    PL_STEP_0_for_c3c1cm4c0c4c4c1cm12cm4c0c6cm4cm14cm3cm4c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c1cm4c0c4c4c1cm12cm4c0c6cm4cm14cm3cm4c2_weight(0), c3c1cm4c0c4c4c1cm12cm4c0c6cm4cm14cm3cm4c2_weight(1));
    PL_STEP_0_for_c6c53cm3c11c2c9c10cm1c1c7c8c12cm17cm18c9cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c53cm3c11c2c9c10cm1c1c7c8c12cm17cm18c9cm8_weight(0), c6c53cm3c11c2c9c10cm1c1c7c8c12cm17cm18c9cm8_weight(1));
    PL_STEP_0_for_cm11cm7c1cm4cm9c15c5c1cm15c4c1c5c23c30cm3c40_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11cm7c1cm4cm9c15c5c1cm15c4c1c5c23c30cm3c40_weight(0), cm11cm7c1cm4cm9c15c5c1cm15c4c1c5c23c30cm3c40_weight(1));
    PL_STEP_0_for_cm2c7cm1cm1c1cm56c0c4cm1c8cm4c2c4cm8c7cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c7cm1cm1c1cm56c0c4cm1c8cm4c2c4cm8c7cm2_weight(0), cm2c7cm1cm1c1cm56c0c4cm1c8cm4c2c4cm8c7cm2_weight(1));
    PL_STEP_0_for_c0c6cm24c27cm6c5c3cm7cm9cm15c47cm15c3c9c4cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c6cm24c27cm6c5c3cm7cm9cm15c47cm15c3c9c4cm9_weight(0), c0c6cm24c27cm6c5c3cm7cm9cm15c47cm15c3c9c4cm9_weight(1));
    PL_STEP_0_for_cm6cm6c19cm1cm20cm4cm21cm1c22c3cm11c9cm18c2c1cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm6c19cm1cm20cm4cm21cm1c22c3cm11c9cm18c2c1cm8_weight(0), cm6cm6c19cm1cm20cm4cm21cm1c22c3cm11c9cm18c2c1cm8_weight(1));
    PL_STEP_0_for_c6cm8c20cm4c97c0cm35cm1cm3cm16cm6cm4cm6c19cm8cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm8c20cm4c97c0cm35cm1cm3cm16cm6cm4cm6c19cm8cm1_weight(0), c6cm8c20cm4c97c0cm35cm1cm3cm16cm6cm4cm6c19cm8cm1_weight(1));
    PL_STEP_0_for_c10cm6cm58c2cm20c0cm1cm14c10c1c2cm7cm18c5cm10c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10cm6cm58c2cm20c0cm1cm14c10c1c2cm7cm18c5cm10c2_weight(0), c10cm6cm58c2cm20c0cm1cm14c10c1c2cm7cm18c5cm10c2_weight(1));
    PL_STEP_0_for_cm4cm7c1c0c6cm1cm17cm5cm6c5cm14c6c11c11cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm7c1c0c6cm1cm17cm5cm6c5cm14c6c11c11cm1c0_weight(0), cm4cm7c1c0c6cm1cm17cm5cm6c5cm14c6c11c11cm1c0_weight(1));
    PL_STEP_0_for_c51c1c10cm11c8c0c6cm5cm7c3c6c4c13cm1c0c13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c51c1c10cm11c8c0c6cm5cm7c3c6c4c13cm1c0c13_weight(0), c51c1c10cm11c8c0c6cm5cm7c3c6c4c13cm1c0c13_weight(1));
    PL_STEP_0_for_c10c16c16cm41cm6cm2cm17c0c6cm25cm7cm6cm20c4c34cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10c16c16cm41cm6cm2cm17c0c6cm25cm7cm6cm20c4c34cm2_weight(0), c10c16c16cm41cm6cm2cm17c0c6cm25cm7cm6cm20c4c34cm2_weight(1));
    PL_STEP_0_for_c0c0cm7c7cm6cm3cm4c18c4c3c10c8c32cm2c5c17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm7c7cm6cm3cm4c18c4c3c10c8c32cm2c5c17_weight(0), c0c0cm7c7cm6cm3cm4c18c4c3c10c8c32cm2c5c17_weight(1));
    PL_STEP_0_for_cm3cm7c2cm3c9c6c2cm4cm8c8c2cm1cm14c4c3cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm7c2cm3c9c6c2cm4cm8c8c2cm1cm14c4c3cm6_weight(0), cm3cm7c2cm3c9c6c2cm4cm8c8c2cm1cm14c4c3cm6_weight(1));
    PL_STEP_0_for_cm9c45c1cm1c2c5c6c1c4cm1c2c9cm9c9c7cm37_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c45c1cm1c2c5c6c1c4cm1c2c9cm9c9c7cm37_weight(0), cm9c45c1cm1c2c5c6c1c4cm1c2c9cm9c9c7cm37_weight(1));
    PL_STEP_0_for_c5cm3c13cm58cm22c14cm1c0cm1cm6cm4cm7cm9cm18cm33cm18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm3c13cm58cm22c14cm1c0cm1cm6cm4cm7cm9cm18cm33cm18_weight(0), c5cm3c13cm58cm22c14cm1c0cm1cm6cm4cm7cm9cm18cm33cm18_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c87cm1cm1c23c0c3c4cm4c18c2c5cm2cm11cm1c3c17_cm3cm7c2cm3c9c6c2cm4cm8c8c2cm1cm14c4c3cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c87cm1cm1c23c0c3c4cm4c18c2c5cm2cm11cm1c3c17_weight(1)(8-1 downto 0),
			B	=> cm3cm7c2cm3c9c6c2cm4cm8c8c2cm1cm14c4c3cm6_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c87cm1cm1c23c0c3c4cm4c18c2c5cm2cm11cm1c3c17,
			CxB => R_cm3cm7c2cm3c9c6c2cm4cm8c8c2cm1cm14c4c3cm6
		);

    cm3cm88c4c8c35c11c15c15c1cm7cm4c8cm1cm19cm3c9_c3c1cm4c0c4c4c1cm12cm4c0c6cm4cm14cm3cm4c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3cm88c4c8c35c11c15c15c1cm7cm4c8cm1cm19cm3c9_weight(1)(8-1 downto 0),
			B	=> c3c1cm4c0c4c4c1cm12cm4c0c6cm4cm14cm3cm4c2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3cm88c4c8c35c11c15c15c1cm7cm4c8cm1cm19cm3c9,
			CxB => R_c3c1cm4c0c4c4c1cm12cm4c0c6cm4cm14cm3cm4c2
		);

    c6cm8c20cm4c97c0cm35cm1cm3cm16cm6cm4cm6c19cm8cm1_c3c2c0c0cm3c0c10c5c0c0c14c4c15c2c4cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6cm8c20cm4c97c0cm35cm1cm3cm16cm6cm4cm6c19cm8cm1_weight(1)(8-1 downto 0),
			B	=> c3c2c0c0cm3c0c10c5c0c0c14c4c15c2c4cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm8c20cm4c97c0cm35cm1cm3cm16cm6cm4cm6c19cm8cm1,
			CxB => R_c3c2c0c0cm3c0c10c5c0c0c14c4c15c2c4cm1
		);

    cm23cm5c0c14cm16c0cm2c1cm7c15cm12c2c5cm7cm11c36_cm4c9cm12c2cm8c8c5c0cm2c2c2cm2c6c3cm5cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm23cm5c0c14cm16c0cm2c1cm7c15cm12c2c5cm7cm11c36_weight(1)(7-1 downto 0),
			B	=> cm4c9cm12c2cm8c8c5c0cm2c2c2cm2c6c3cm5cm8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm23cm5c0c14cm16c0cm2c1cm7c15cm12c2c5cm7cm11c36,
			CxB => R_cm4c9cm12c2cm8c8c5c0cm2c2c2cm2c6c3cm5cm8
		);

    cm4cm35c10cm8cm1c2cm4c1cm30cm7c20c3c9cm1cm6c3_cm4cm7c1c0c6cm1cm17cm5cm6c5cm14c6c11c11cm1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm35c10cm8cm1c2cm4c1cm30cm7c20c3c9cm1cm6c3_weight(1)(7-1 downto 0),
			B	=> cm4cm7c1c0c6cm1cm17cm5cm6c5cm14c6c11c11cm1c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm35c10cm8cm1c2cm4c1cm30cm7c20c3c9cm1cm6c3,
			CxB => R_cm4cm7c1c0c6cm1cm17cm5cm6c5cm14c6c11c11cm1c0
		);

    cm1cm4cm6cm32c1c3c13c18cm4c2cm4c34c10cm2c1c9_cm6cm6c19cm1cm20cm4cm21cm1c22c3cm11c9cm18c2c1cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm4cm6cm32c1c3c13c18cm4c2cm4c34c10cm2c1c9_weight(1)(7-1 downto 0),
			B	=> cm6cm6c19cm1cm20cm4cm21cm1c22c3cm11c9cm18c2c1cm8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm4cm6cm32c1c3c13c18cm4c2cm4c34c10cm2c1c9,
			CxB => R_cm6cm6c19cm1cm20cm4cm21cm1c22c3cm11c9cm18c2c1cm8
		);

    c37c5cm1cm3c5c3c5cm4cm35cm5cm8c6c7c12c11cm7_c7cm18cm3cm1c3c10cm3c8c10c10c2c9cm9cm9cm10c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c37c5cm1cm3c5c3c5cm4cm35cm5cm8c6c7c12c11cm7_weight(1)(7-1 downto 0),
			B	=> c7cm18cm3cm1c3c10cm3c8c10c10c2c9cm9cm9cm10c7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c37c5cm1cm3c5c3c5cm4cm35cm5cm8c6c7c12c11cm7,
			CxB => R_c7cm18cm3cm1c3c10cm3c8c10c10c2c9cm9cm9cm10c7
		);

    cm11cm1cm9c7cm2cm6c2cm11c9cm15cm4cm13cm9cm33c8cm19_c6cm16cm10cm15cm24cm5cm12c6cm5cm10cm15c5c5c0c10c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm11cm1cm9c7cm2cm6c2cm11c9cm15cm4cm13cm9cm33c8cm19_weight(1)(7-1 downto 0),
			B	=> c6cm16cm10cm15cm24cm5cm12c6cm5cm10cm15c5c5c0c10c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm11cm1cm9c7cm2cm6c2cm11c9cm15cm4cm13cm9cm33c8cm19,
			CxB => R_c6cm16cm10cm15cm24cm5cm12c6cm5cm10cm15c5c5c0c10c0
		);

    c6c53cm3c11c2c9c10cm1c1c7c8c12cm17cm18c9cm8_cm12cm10cm14cm1c14c0cm2c8c5cm24c8c1c0cm17c0c10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6c53cm3c11c2c9c10cm1c1c7c8c12cm17cm18c9cm8_weight(1)(7-1 downto 0),
			B	=> cm12cm10cm14cm1c14c0cm2c8c5cm24c8c1c0cm17c0c10_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6c53cm3c11c2c9c10cm1c1c7c8c12cm17cm18c9cm8,
			CxB => R_cm12cm10cm14cm1c14c0cm2c8c5cm24c8c1c0cm17c0c10
		);

    cm11cm7c1cm4cm9c15c5c1cm15c4c1c5c23c30cm3c40_c5cm10c0cm9c12cm9cm15cm6c19cm8cm16c12c3cm18cm4cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm11cm7c1cm4cm9c15c5c1cm15c4c1c5c23c30cm3c40_weight(1)(7-1 downto 0),
			B	=> c5cm10c0cm9c12cm9cm15cm6c19cm8cm16c12c3cm18cm4cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm11cm7c1cm4cm9c15c5c1cm15c4c1c5c23c30cm3c40,
			CxB => R_c5cm10c0cm9c12cm9cm15cm6c19cm8cm16c12c3cm18cm4cm1
		);

    cm2c7cm1cm1c1cm56c0c4cm1c8cm4c2c4cm8c7cm2_c2cm6c6cm2c0cm5c0cm9c0c6cm13cm8cm9cm6c18cm15_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c7cm1cm1c1cm56c0c4cm1c8cm4c2c4cm8c7cm2_weight(1)(7-1 downto 0),
			B	=> c2cm6c6cm2c0cm5c0cm9c0c6cm13cm8cm9cm6c18cm15_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c7cm1cm1c1cm56c0c4cm1c8cm4c2c4cm8c7cm2,
			CxB => R_c2cm6c6cm2c0cm5c0cm9c0c6cm13cm8cm9cm6c18cm15
		);

    c0c6cm24c27cm6c5c3cm7cm9cm15c47cm15c3c9c4cm9_cm3cm15cm8c12cm15cm6cm4c12c1cm10c0c1c20c10cm18c17_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c6cm24c27cm6c5c3cm7cm9cm15c47cm15c3c9c4cm9_weight(1)(7-1 downto 0),
			B	=> cm3cm15cm8c12cm15cm6cm4c12c1cm10c0c1c20c10cm18c17_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c6cm24c27cm6c5c3cm7cm9cm15c47cm15c3c9c4cm9,
			CxB => R_cm3cm15cm8c12cm15cm6cm4c12c1cm10c0c1c20c10cm18c17
		);

    c10cm6cm58c2cm20c0cm1cm14c10c1c2cm7cm18c5cm10c2_cm14cm7c10cm2c3cm18cm1cm24cm5c3c22cm2cm21c10c31cm14_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c10cm6cm58c2cm20c0cm1cm14c10c1c2cm7cm18c5cm10c2_weight(1)(7-1 downto 0),
			B	=> cm14cm7c10cm2c3cm18cm1cm24cm5c3c22cm2cm21c10c31cm14_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c10cm6cm58c2cm20c0cm1cm14c10c1c2cm7cm18c5cm10c2,
			CxB => R_cm14cm7c10cm2c3cm18cm1cm24cm5c3c22cm2cm21c10c31cm14
		);

    c51c1c10cm11c8c0c6cm5cm7c3c6c4c13cm1c0c13_cm6c6cm10cm7cm2cm5cm4c2c22cm5c4cm2c4c6cm13c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c51c1c10cm11c8c0c6cm5cm7c3c6c4c13cm1c0c13_weight(1)(7-1 downto 0),
			B	=> cm6c6cm10cm7cm2cm5cm4c2c22cm5c4cm2c4c6cm13c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c51c1c10cm11c8c0c6cm5cm7c3c6c4c13cm1c0c13,
			CxB => R_cm6c6cm10cm7cm2cm5cm4c2c22cm5c4cm2c4c6cm13c4
		);

    c10c16c16cm41cm6cm2cm17c0c6cm25cm7cm6cm20c4c34cm2_c5cm3c13cm58cm22c14cm1c0cm1cm6cm4cm7cm9cm18cm33cm18_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c10c16c16cm41cm6cm2cm17c0c6cm25cm7cm6cm20c4c34cm2_weight(1)(7-1 downto 0),
			B	=> c5cm3c13cm58cm22c14cm1c0cm1cm6cm4cm7cm9cm18cm33cm18_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c10c16c16cm41cm6cm2cm17c0c6cm25cm7cm6cm20c4c34cm2,
			CxB => R_c5cm3c13cm58cm22c14cm1c0cm1cm6cm4cm7cm9cm18cm33cm18
		);

    c0c0cm7c7cm6cm3cm4c18c4c3c10c8c32cm2c5c17_cm9c45c1cm1c2c5c6c1c4cm1c2c9cm9c9c7cm37_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c0cm7c7cm6cm3cm4c18c4c3c10c8c32cm2c5c17_weight(1)(7-1 downto 0),
			B	=> cm9c45c1cm1c2c5c6c1c4cm1c2c9cm9c9c7cm37_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0cm7c7cm6cm3cm4c18c4c3c10c8c32cm2c5c17,
			CxB => R_cm9c45c1cm1c2c5c6c1c4cm1c2c9cm9c9c7cm37
		);




end architecture;
