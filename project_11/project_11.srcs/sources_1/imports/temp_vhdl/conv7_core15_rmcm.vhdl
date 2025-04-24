library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core15_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c25cm12c6cm7c5c6cm25c3c4c5c6c6c10cm2cm2cm11 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm27c1cm21cm3c7c20c1c6cm1cm4cm2cm48c6c21cm5c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm9c4cm10c5c11cm8cm4cm5cm1cm4cm5cm4c4cm8cm1c2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm5cm30cm1c9cm8c2c19c18cm24c5c7cm9cm9c0c6c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm12cm7c8cm5cm6cm24c1cm10cm7c1c2c16c0cm17c13cm9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c7cm5cm9cm4c12cm2cm5c4c0cm8c7cm13cm3cm8c1cm9 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c20cm6c0cm4c11cm11c0cm9cm6cm1c3cm13cm20cm11c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm8cm15cm11cm3cm1cm19c9c23cm2cm3cm4cm14c16cm11c30c8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0cm6cm2cm9c2cm58c28cm25c21c8c6cm23cm3c29c8c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c19c6cm1cm22cm12cm2cm12c17cm3cm1cm10c9c3c1cm10c30 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6cm12c8c2cm9c9c11cm10c2c4c6cm8cm19c0c10c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c5c28c0c10c1c2c17cm5cm3cm2cm1c2cm1c2cm3c17 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm2cm2c3cm5cm9cm10cm6cm2c13cm12c3c4c12c8c9c5 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c1cm10cm6c3cm10cm2c1c1cm7c11c12cm7cm11cm4c7cm4 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c8c5cm1c2c11c9c10c1c3cm3c8cm5cm6cm13cm3c3 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c62cm3c31cm4c12c2cm3c15c5c127c7c9c6c9c2c4 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm2cm6cm1cm8c16c21c0cm25cm11cm20c12cm4c6c18c9c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm8c6c26c1cm35cm3c9c16cm5cm5c3cm2cm4c3cm5c13 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c5c12c2cm7cm57cm17cm6c12cm5c10c11c1c9cm11cm2c5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2c1cm5cm20c15cm15c1cm14cm3c42c7cm4cm2cm20cm8cm11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c83cm5c14cm2c2c5c4cm10cm1c56cm7c28cm1c4cm2c4 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm1c10c3c5c17c30cm13cm35cm6c8cm12cm11cm10c8c5cm6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2cm2c4c1c7cm12cm45cm1cm13c9c3cm10c5c1c5c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0cm4c0c3cm6cm51c8c10cm25cm12cm18cm3cm1cm9c7cm7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3c34cm9cm2c17cm4cm9cm19cm26cm1c3cm5c3cm1c8c18 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c6c4c9c2cm2cm38c4cm2c25c5cm30cm8cm1cm6c3cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c22cm14cm27c7cm8cm2c12cm6c3c4c1c13c13c8c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c3c13cm13c3c13c22c2c17cm33cm3c12cm5cm18c3c9cm8 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2cm2cm15cm2cm2c4c3cm6c7c1c5c2cm5cm3c1c11 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c4c1c0cm2cm33c26c4c2c2c7c2cm9cm22c15c17cm21 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm16c8cm3cm22cm36c11cm1c2c2c6c5c5cm10c1c3c14 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c13c9cm18cm19cm53c25c13cm5cm18cm8cm4c1cm7cm3cm12c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core15_rmcm;

architecture arch of conv7_core15_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C25CM12C6CM7C5C6CM25C3C4C5C6C6C10CM2CM2CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM27C1CM21CM3C7C20C1C6CM1CM4CM2CM48C6C21CM5C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C4CM10C5C11CM8CM4CM5CM1CM4CM5CM4C4CM8CM1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM30CM1C9CM8C2C19C18CM24C5C7CM9CM9C0C6C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12CM7C8CM5CM6CM24C1CM10CM7C1C2C16C0CM17C13CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM5CM9CM4C12CM2CM5C4C0CM8C7CM13CM3CM8C1CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C20CM6C0CM4C11CM11C0CM9CM6CM1C3CM13CM20CM11C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8CM15CM11CM3CM1CM19C9C23CM2CM3CM4CM14C16CM11C30C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM6CM2CM9C2CM58C28CM25C21C8C6CM23CM3C29C8C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C19C6CM1CM22CM12CM2CM12C17CM3CM1CM10C9C3C1CM10C30_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM12C8C2CM9C9C11CM10C2C4C6CM8CM19C0C10C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C28C0C10C1C2C17CM5CM3CM2CM1C2CM1C2CM3C17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM2C3CM5CM9CM10CM6CM2C13CM12C3C4C12C8C9C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM10CM6C3CM10CM2C1C1CM7C11C12CM7CM11CM4C7CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C5CM1C2C11C9C10C1C3CM3C8CM5CM6CM13CM3C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C62CM3C31CM4C12C2CM3C15C5C127C7C9C6C9C2C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM6CM1CM8C16C21C0CM25CM11CM20C12CM4C6C18C9C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8C6C26C1CM35CM3C9C16CM5CM5C3CM2CM4C3CM5C13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C12C2CM7CM57CM17CM6C12CM5C10C11C1C9CM11CM2C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1CM5CM20C15CM15C1CM14CM3C42C7CM4CM2CM20CM8CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C83CM5C14CM2C2C5C4CM10CM1C56CM7C28CM1C4CM2C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C10C3C5C17C30CM13CM35CM6C8CM12CM11CM10C8C5CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM2C4C1C7CM12CM45CM1CM13C9C3CM10C5C1C5C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM4C0C3CM6CM51C8C10CM25CM12CM18CM3CM1CM9C7CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C34CM9CM2C17CM4CM9CM19CM26CM1C3CM5C3CM1C8C18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C4C9C2CM2CM38C4CM2C25C5CM30CM8CM1CM6C3CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C22CM14CM27C7CM8CM2C12CM6C3C4C1C13C13C8C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C13CM13C3C13C22C2C17CM33CM3C12CM5CM18C3C9CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM2CM15CM2CM2C4C3CM6C7C1C5C2CM5CM3C1C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C1C0CM2CM33C26C4C2C2C7C2CM9CM22C15C17CM21_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM16C8CM3CM22CM36C11CM1C2C2C6C5C5CM10C1C3C14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13C9CM18CM19CM53C25C13CM5CM18CM8CM4C1CM7CM3CM12C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c25cm12c6cm7c5c6cm25c3c4c5c6c6c10cm2cm2cm11_weight : PIPELINE_TYPE_FOR_C25CM12C6CM7C5C6CM25C3C4C5C6C6C10CM2CM2CM11_WEIGHT;
    -- sfix(1, -7)
    signal cm27c1cm21cm3c7c20c1c6cm1cm4cm2cm48c6c21cm5c4_weight : PIPELINE_TYPE_FOR_CM27C1CM21CM3C7C20C1C6CM1CM4CM2CM48C6C21CM5C4_WEIGHT;
    -- sfix(1, -7)
    signal cm9c4cm10c5c11cm8cm4cm5cm1cm4cm5cm4c4cm8cm1c2_weight : PIPELINE_TYPE_FOR_CM9C4CM10C5C11CM8CM4CM5CM1CM4CM5CM4C4CM8CM1C2_WEIGHT;
    -- sfix(1, -7)
    signal cm5cm30cm1c9cm8c2c19c18cm24c5c7cm9cm9c0c6c0_weight : PIPELINE_TYPE_FOR_CM5CM30CM1C9CM8C2C19C18CM24C5C7CM9CM9C0C6C0_WEIGHT;
    -- sfix(1, -7)
    signal cm12cm7c8cm5cm6cm24c1cm10cm7c1c2c16c0cm17c13cm9_weight : PIPELINE_TYPE_FOR_CM12CM7C8CM5CM6CM24C1CM10CM7C1C2C16C0CM17C13CM9_WEIGHT;
    -- sfix(1, -7)
    signal c7cm5cm9cm4c12cm2cm5c4c0cm8c7cm13cm3cm8c1cm9_weight : PIPELINE_TYPE_FOR_C7CM5CM9CM4C12CM2CM5C4C0CM8C7CM13CM3CM8C1CM9_WEIGHT;
    -- sfix(1, -7)
    signal c20cm6c0cm4c11cm11c0cm9cm6cm1c3cm13cm20cm11c0c0_weight : PIPELINE_TYPE_FOR_C20CM6C0CM4C11CM11C0CM9CM6CM1C3CM13CM20CM11C0C0_WEIGHT;
    -- sfix(1, -7)
    signal cm8cm15cm11cm3cm1cm19c9c23cm2cm3cm4cm14c16cm11c30c8_weight : PIPELINE_TYPE_FOR_CM8CM15CM11CM3CM1CM19C9C23CM2CM3CM4CM14C16CM11C30C8_WEIGHT;
    -- sfix(1, -7)
    signal c0cm6cm2cm9c2cm58c28cm25c21c8c6cm23cm3c29c8c4_weight : PIPELINE_TYPE_FOR_C0CM6CM2CM9C2CM58C28CM25C21C8C6CM23CM3C29C8C4_WEIGHT;
    -- sfix(1, -7)
    signal c19c6cm1cm22cm12cm2cm12c17cm3cm1cm10c9c3c1cm10c30_weight : PIPELINE_TYPE_FOR_C19C6CM1CM22CM12CM2CM12C17CM3CM1CM10C9C3C1CM10C30_WEIGHT;
    -- sfix(1, -7)
    signal c6cm12c8c2cm9c9c11cm10c2c4c6cm8cm19c0c10c0_weight : PIPELINE_TYPE_FOR_C6CM12C8C2CM9C9C11CM10C2C4C6CM8CM19C0C10C0_WEIGHT;
    -- sfix(1, -7)
    signal c5c28c0c10c1c2c17cm5cm3cm2cm1c2cm1c2cm3c17_weight : PIPELINE_TYPE_FOR_C5C28C0C10C1C2C17CM5CM3CM2CM1C2CM1C2CM3C17_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm2c3cm5cm9cm10cm6cm2c13cm12c3c4c12c8c9c5_weight : PIPELINE_TYPE_FOR_CM2CM2C3CM5CM9CM10CM6CM2C13CM12C3C4C12C8C9C5_WEIGHT;
    -- sfix(1, -7)
    signal c1cm10cm6c3cm10cm2c1c1cm7c11c12cm7cm11cm4c7cm4_weight : PIPELINE_TYPE_FOR_C1CM10CM6C3CM10CM2C1C1CM7C11C12CM7CM11CM4C7CM4_WEIGHT;
    -- sfix(1, -7)
    signal c8c5cm1c2c11c9c10c1c3cm3c8cm5cm6cm13cm3c3_weight : PIPELINE_TYPE_FOR_C8C5CM1C2C11C9C10C1C3CM3C8CM5CM6CM13CM3C3_WEIGHT;
    -- sfix(1, -7)
    signal c62cm3c31cm4c12c2cm3c15c5c127c7c9c6c9c2c4_weight : PIPELINE_TYPE_FOR_C62CM3C31CM4C12C2CM3C15C5C127C7C9C6C9C2C4_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm6cm1cm8c16c21c0cm25cm11cm20c12cm4c6c18c9c0_weight : PIPELINE_TYPE_FOR_CM2CM6CM1CM8C16C21C0CM25CM11CM20C12CM4C6C18C9C0_WEIGHT;
    -- sfix(1, -7)
    signal cm8c6c26c1cm35cm3c9c16cm5cm5c3cm2cm4c3cm5c13_weight : PIPELINE_TYPE_FOR_CM8C6C26C1CM35CM3C9C16CM5CM5C3CM2CM4C3CM5C13_WEIGHT;
    -- sfix(1, -7)
    signal c5c12c2cm7cm57cm17cm6c12cm5c10c11c1c9cm11cm2c5_weight : PIPELINE_TYPE_FOR_C5C12C2CM7CM57CM17CM6C12CM5C10C11C1C9CM11CM2C5_WEIGHT;
    -- sfix(1, -7)
    signal cm2c1cm5cm20c15cm15c1cm14cm3c42c7cm4cm2cm20cm8cm11_weight : PIPELINE_TYPE_FOR_CM2C1CM5CM20C15CM15C1CM14CM3C42C7CM4CM2CM20CM8CM11_WEIGHT;
    -- sfix(1, -7)
    signal c83cm5c14cm2c2c5c4cm10cm1c56cm7c28cm1c4cm2c4_weight : PIPELINE_TYPE_FOR_C83CM5C14CM2C2C5C4CM10CM1C56CM7C28CM1C4CM2C4_WEIGHT;
    -- sfix(1, -7)
    signal cm1c10c3c5c17c30cm13cm35cm6c8cm12cm11cm10c8c5cm6_weight : PIPELINE_TYPE_FOR_CM1C10C3C5C17C30CM13CM35CM6C8CM12CM11CM10C8C5CM6_WEIGHT;
    -- sfix(1, -7)
    signal c2cm2c4c1c7cm12cm45cm1cm13c9c3cm10c5c1c5c4_weight : PIPELINE_TYPE_FOR_C2CM2C4C1C7CM12CM45CM1CM13C9C3CM10C5C1C5C4_WEIGHT;
    -- sfix(1, -7)
    signal c0cm4c0c3cm6cm51c8c10cm25cm12cm18cm3cm1cm9c7cm7_weight : PIPELINE_TYPE_FOR_C0CM4C0C3CM6CM51C8C10CM25CM12CM18CM3CM1CM9C7CM7_WEIGHT;
    -- sfix(1, -7)
    signal cm3c34cm9cm2c17cm4cm9cm19cm26cm1c3cm5c3cm1c8c18_weight : PIPELINE_TYPE_FOR_CM3C34CM9CM2C17CM4CM9CM19CM26CM1C3CM5C3CM1C8C18_WEIGHT;
    -- sfix(1, -7)
    signal c6c4c9c2cm2cm38c4cm2c25c5cm30cm8cm1cm6c3cm1_weight : PIPELINE_TYPE_FOR_C6C4C9C2CM2CM38C4CM2C25C5CM30CM8CM1CM6C3CM1_WEIGHT;
    -- sfix(1, -7)
    signal c0c22cm14cm27c7cm8cm2c12cm6c3c4c1c13c13c8c0_weight : PIPELINE_TYPE_FOR_C0C22CM14CM27C7CM8CM2C12CM6C3C4C1C13C13C8C0_WEIGHT;
    -- sfix(1, -7)
    signal c3c13cm13c3c13c22c2c17cm33cm3c12cm5cm18c3c9cm8_weight : PIPELINE_TYPE_FOR_C3C13CM13C3C13C22C2C17CM33CM3C12CM5CM18C3C9CM8_WEIGHT;
    -- sfix(1, -7)
    signal c2cm2cm15cm2cm2c4c3cm6c7c1c5c2cm5cm3c1c11_weight : PIPELINE_TYPE_FOR_C2CM2CM15CM2CM2C4C3CM6C7C1C5C2CM5CM3C1C11_WEIGHT;
    -- sfix(1, -7)
    signal c4c1c0cm2cm33c26c4c2c2c7c2cm9cm22c15c17cm21_weight : PIPELINE_TYPE_FOR_C4C1C0CM2CM33C26C4C2C2C7C2CM9CM22C15C17CM21_WEIGHT;
    -- sfix(1, -7)
    signal cm16c8cm3cm22cm36c11cm1c2c2c6c5c5cm10c1c3c14_weight : PIPELINE_TYPE_FOR_CM16C8CM3CM22CM36C11CM1C2C2C6C5C5CM10C1C3C14_WEIGHT;
    -- sfix(1, -7)
    signal c13c9cm18cm19cm53c25c13cm5cm18cm8cm4c1cm7cm3cm12c2_weight : PIPELINE_TYPE_FOR_C13C9CM18CM19CM53C25C13CM5CM18CM8CM4C1CM7CM3CM12C2_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core15_rmcm_weightsconstant_memory
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
        
            dout1   => c25cm12c6cm7c5c6cm25c3c4c5c6c6c10cm2cm2cm11_weight(0), 
            dout2   => cm27c1cm21cm3c7c20c1c6cm1cm4cm2cm48c6c21cm5c4_weight(0), 
            dout3   => cm9c4cm10c5c11cm8cm4cm5cm1cm4cm5cm4c4cm8cm1c2_weight(0), 
            dout4   => cm5cm30cm1c9cm8c2c19c18cm24c5c7cm9cm9c0c6c0_weight(0), 
            dout5   => cm12cm7c8cm5cm6cm24c1cm10cm7c1c2c16c0cm17c13cm9_weight(0), 
            dout6   => c7cm5cm9cm4c12cm2cm5c4c0cm8c7cm13cm3cm8c1cm9_weight(0), 
            dout7   => c20cm6c0cm4c11cm11c0cm9cm6cm1c3cm13cm20cm11c0c0_weight(0), 
            dout8   => cm8cm15cm11cm3cm1cm19c9c23cm2cm3cm4cm14c16cm11c30c8_weight(0), 
            dout9   => c0cm6cm2cm9c2cm58c28cm25c21c8c6cm23cm3c29c8c4_weight(0), 
            dout10   => c19c6cm1cm22cm12cm2cm12c17cm3cm1cm10c9c3c1cm10c30_weight(0), 
            dout11   => c6cm12c8c2cm9c9c11cm10c2c4c6cm8cm19c0c10c0_weight(0), 
            dout12   => c5c28c0c10c1c2c17cm5cm3cm2cm1c2cm1c2cm3c17_weight(0), 
            dout13   => cm2cm2c3cm5cm9cm10cm6cm2c13cm12c3c4c12c8c9c5_weight(0), 
            dout14   => c1cm10cm6c3cm10cm2c1c1cm7c11c12cm7cm11cm4c7cm4_weight(0), 
            dout15   => c8c5cm1c2c11c9c10c1c3cm3c8cm5cm6cm13cm3c3_weight(0), 
            dout16   => c62cm3c31cm4c12c2cm3c15c5c127c7c9c6c9c2c4_weight(0), 
            dout17   => cm2cm6cm1cm8c16c21c0cm25cm11cm20c12cm4c6c18c9c0_weight(0), 
            dout18   => cm8c6c26c1cm35cm3c9c16cm5cm5c3cm2cm4c3cm5c13_weight(0), 
            dout19   => c5c12c2cm7cm57cm17cm6c12cm5c10c11c1c9cm11cm2c5_weight(0), 
            dout20   => cm2c1cm5cm20c15cm15c1cm14cm3c42c7cm4cm2cm20cm8cm11_weight(0), 
            dout21   => c83cm5c14cm2c2c5c4cm10cm1c56cm7c28cm1c4cm2c4_weight(0), 
            dout22   => cm1c10c3c5c17c30cm13cm35cm6c8cm12cm11cm10c8c5cm6_weight(0), 
            dout23   => c2cm2c4c1c7cm12cm45cm1cm13c9c3cm10c5c1c5c4_weight(0), 
            dout24   => c0cm4c0c3cm6cm51c8c10cm25cm12cm18cm3cm1cm9c7cm7_weight(0), 
            dout25   => cm3c34cm9cm2c17cm4cm9cm19cm26cm1c3cm5c3cm1c8c18_weight(0), 
            dout26   => c6c4c9c2cm2cm38c4cm2c25c5cm30cm8cm1cm6c3cm1_weight(0), 
            dout27   => c0c22cm14cm27c7cm8cm2c12cm6c3c4c1c13c13c8c0_weight(0), 
            dout28   => c3c13cm13c3c13c22c2c17cm33cm3c12cm5cm18c3c9cm8_weight(0), 
            dout29   => c2cm2cm15cm2cm2c4c3cm6c7c1c5c2cm5cm3c1c11_weight(0), 
            dout30   => c4c1c0cm2cm33c26c4c2c2c7c2cm9cm22c15c17cm21_weight(0), 
            dout31   => cm16c8cm3cm22cm36c11cm1c2c2c6c5c5cm10c1c3c14_weight(0), 
            dout32   => c13c9cm18cm19cm53c25c13cm5cm18cm8cm4c1cm7cm3cm12c2_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c25cm12c6cm7c5c6cm25c3c4c5c6c6c10cm2cm2cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c25cm12c6cm7c5c6cm25c3c4c5c6c6c10cm2cm2cm11_weight(0), c25cm12c6cm7c5c6cm25c3c4c5c6c6c10cm2cm2cm11_weight(1));
    PL_STEP_0_for_cm27c1cm21cm3c7c20c1c6cm1cm4cm2cm48c6c21cm5c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm27c1cm21cm3c7c20c1c6cm1cm4cm2cm48c6c21cm5c4_weight(0), cm27c1cm21cm3c7c20c1c6cm1cm4cm2cm48c6c21cm5c4_weight(1));
    PL_STEP_0_for_cm9c4cm10c5c11cm8cm4cm5cm1cm4cm5cm4c4cm8cm1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c4cm10c5c11cm8cm4cm5cm1cm4cm5cm4c4cm8cm1c2_weight(0), cm9c4cm10c5c11cm8cm4cm5cm1cm4cm5cm4c4cm8cm1c2_weight(1));
    PL_STEP_0_for_cm5cm30cm1c9cm8c2c19c18cm24c5c7cm9cm9c0c6c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm30cm1c9cm8c2c19c18cm24c5c7cm9cm9c0c6c0_weight(0), cm5cm30cm1c9cm8c2c19c18cm24c5c7cm9cm9c0c6c0_weight(1));
    PL_STEP_0_for_cm12cm7c8cm5cm6cm24c1cm10cm7c1c2c16c0cm17c13cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12cm7c8cm5cm6cm24c1cm10cm7c1c2c16c0cm17c13cm9_weight(0), cm12cm7c8cm5cm6cm24c1cm10cm7c1c2c16c0cm17c13cm9_weight(1));
    PL_STEP_0_for_c7cm5cm9cm4c12cm2cm5c4c0cm8c7cm13cm3cm8c1cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm5cm9cm4c12cm2cm5c4c0cm8c7cm13cm3cm8c1cm9_weight(0), c7cm5cm9cm4c12cm2cm5c4c0cm8c7cm13cm3cm8c1cm9_weight(1));
    PL_STEP_0_for_c20cm6c0cm4c11cm11c0cm9cm6cm1c3cm13cm20cm11c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c20cm6c0cm4c11cm11c0cm9cm6cm1c3cm13cm20cm11c0c0_weight(0), c20cm6c0cm4c11cm11c0cm9cm6cm1c3cm13cm20cm11c0c0_weight(1));
    PL_STEP_0_for_cm8cm15cm11cm3cm1cm19c9c23cm2cm3cm4cm14c16cm11c30c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8cm15cm11cm3cm1cm19c9c23cm2cm3cm4cm14c16cm11c30c8_weight(0), cm8cm15cm11cm3cm1cm19c9c23cm2cm3cm4cm14c16cm11c30c8_weight(1));
    PL_STEP_0_for_c0cm6cm2cm9c2cm58c28cm25c21c8c6cm23cm3c29c8c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm6cm2cm9c2cm58c28cm25c21c8c6cm23cm3c29c8c4_weight(0), c0cm6cm2cm9c2cm58c28cm25c21c8c6cm23cm3c29c8c4_weight(1));
    PL_STEP_0_for_c19c6cm1cm22cm12cm2cm12c17cm3cm1cm10c9c3c1cm10c30_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c19c6cm1cm22cm12cm2cm12c17cm3cm1cm10c9c3c1cm10c30_weight(0), c19c6cm1cm22cm12cm2cm12c17cm3cm1cm10c9c3c1cm10c30_weight(1));
    PL_STEP_0_for_c6cm12c8c2cm9c9c11cm10c2c4c6cm8cm19c0c10c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm12c8c2cm9c9c11cm10c2c4c6cm8cm19c0c10c0_weight(0), c6cm12c8c2cm9c9c11cm10c2c4c6cm8cm19c0c10c0_weight(1));
    PL_STEP_0_for_c5c28c0c10c1c2c17cm5cm3cm2cm1c2cm1c2cm3c17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c28c0c10c1c2c17cm5cm3cm2cm1c2cm1c2cm3c17_weight(0), c5c28c0c10c1c2c17cm5cm3cm2cm1c2cm1c2cm3c17_weight(1));
    PL_STEP_0_for_cm2cm2c3cm5cm9cm10cm6cm2c13cm12c3c4c12c8c9c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm2c3cm5cm9cm10cm6cm2c13cm12c3c4c12c8c9c5_weight(0), cm2cm2c3cm5cm9cm10cm6cm2c13cm12c3c4c12c8c9c5_weight(1));
    PL_STEP_0_for_c1cm10cm6c3cm10cm2c1c1cm7c11c12cm7cm11cm4c7cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm10cm6c3cm10cm2c1c1cm7c11c12cm7cm11cm4c7cm4_weight(0), c1cm10cm6c3cm10cm2c1c1cm7c11c12cm7cm11cm4c7cm4_weight(1));
    PL_STEP_0_for_c8c5cm1c2c11c9c10c1c3cm3c8cm5cm6cm13cm3c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c5cm1c2c11c9c10c1c3cm3c8cm5cm6cm13cm3c3_weight(0), c8c5cm1c2c11c9c10c1c3cm3c8cm5cm6cm13cm3c3_weight(1));
    PL_STEP_0_for_c62cm3c31cm4c12c2cm3c15c5c127c7c9c6c9c2c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c62cm3c31cm4c12c2cm3c15c5c127c7c9c6c9c2c4_weight(0), c62cm3c31cm4c12c2cm3c15c5c127c7c9c6c9c2c4_weight(1));
    PL_STEP_0_for_cm2cm6cm1cm8c16c21c0cm25cm11cm20c12cm4c6c18c9c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm6cm1cm8c16c21c0cm25cm11cm20c12cm4c6c18c9c0_weight(0), cm2cm6cm1cm8c16c21c0cm25cm11cm20c12cm4c6c18c9c0_weight(1));
    PL_STEP_0_for_cm8c6c26c1cm35cm3c9c16cm5cm5c3cm2cm4c3cm5c13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8c6c26c1cm35cm3c9c16cm5cm5c3cm2cm4c3cm5c13_weight(0), cm8c6c26c1cm35cm3c9c16cm5cm5c3cm2cm4c3cm5c13_weight(1));
    PL_STEP_0_for_c5c12c2cm7cm57cm17cm6c12cm5c10c11c1c9cm11cm2c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c12c2cm7cm57cm17cm6c12cm5c10c11c1c9cm11cm2c5_weight(0), c5c12c2cm7cm57cm17cm6c12cm5c10c11c1c9cm11cm2c5_weight(1));
    PL_STEP_0_for_cm2c1cm5cm20c15cm15c1cm14cm3c42c7cm4cm2cm20cm8cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1cm5cm20c15cm15c1cm14cm3c42c7cm4cm2cm20cm8cm11_weight(0), cm2c1cm5cm20c15cm15c1cm14cm3c42c7cm4cm2cm20cm8cm11_weight(1));
    PL_STEP_0_for_c83cm5c14cm2c2c5c4cm10cm1c56cm7c28cm1c4cm2c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c83cm5c14cm2c2c5c4cm10cm1c56cm7c28cm1c4cm2c4_weight(0), c83cm5c14cm2c2c5c4cm10cm1c56cm7c28cm1c4cm2c4_weight(1));
    PL_STEP_0_for_cm1c10c3c5c17c30cm13cm35cm6c8cm12cm11cm10c8c5cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c10c3c5c17c30cm13cm35cm6c8cm12cm11cm10c8c5cm6_weight(0), cm1c10c3c5c17c30cm13cm35cm6c8cm12cm11cm10c8c5cm6_weight(1));
    PL_STEP_0_for_c2cm2c4c1c7cm12cm45cm1cm13c9c3cm10c5c1c5c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm2c4c1c7cm12cm45cm1cm13c9c3cm10c5c1c5c4_weight(0), c2cm2c4c1c7cm12cm45cm1cm13c9c3cm10c5c1c5c4_weight(1));
    PL_STEP_0_for_c0cm4c0c3cm6cm51c8c10cm25cm12cm18cm3cm1cm9c7cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm4c0c3cm6cm51c8c10cm25cm12cm18cm3cm1cm9c7cm7_weight(0), c0cm4c0c3cm6cm51c8c10cm25cm12cm18cm3cm1cm9c7cm7_weight(1));
    PL_STEP_0_for_cm3c34cm9cm2c17cm4cm9cm19cm26cm1c3cm5c3cm1c8c18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c34cm9cm2c17cm4cm9cm19cm26cm1c3cm5c3cm1c8c18_weight(0), cm3c34cm9cm2c17cm4cm9cm19cm26cm1c3cm5c3cm1c8c18_weight(1));
    PL_STEP_0_for_c6c4c9c2cm2cm38c4cm2c25c5cm30cm8cm1cm6c3cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c4c9c2cm2cm38c4cm2c25c5cm30cm8cm1cm6c3cm1_weight(0), c6c4c9c2cm2cm38c4cm2c25c5cm30cm8cm1cm6c3cm1_weight(1));
    PL_STEP_0_for_c0c22cm14cm27c7cm8cm2c12cm6c3c4c1c13c13c8c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c22cm14cm27c7cm8cm2c12cm6c3c4c1c13c13c8c0_weight(0), c0c22cm14cm27c7cm8cm2c12cm6c3c4c1c13c13c8c0_weight(1));
    PL_STEP_0_for_c3c13cm13c3c13c22c2c17cm33cm3c12cm5cm18c3c9cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c13cm13c3c13c22c2c17cm33cm3c12cm5cm18c3c9cm8_weight(0), c3c13cm13c3c13c22c2c17cm33cm3c12cm5cm18c3c9cm8_weight(1));
    PL_STEP_0_for_c2cm2cm15cm2cm2c4c3cm6c7c1c5c2cm5cm3c1c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm2cm15cm2cm2c4c3cm6c7c1c5c2cm5cm3c1c11_weight(0), c2cm2cm15cm2cm2c4c3cm6c7c1c5c2cm5cm3c1c11_weight(1));
    PL_STEP_0_for_c4c1c0cm2cm33c26c4c2c2c7c2cm9cm22c15c17cm21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c1c0cm2cm33c26c4c2c2c7c2cm9cm22c15c17cm21_weight(0), c4c1c0cm2cm33c26c4c2c2c7c2cm9cm22c15c17cm21_weight(1));
    PL_STEP_0_for_cm16c8cm3cm22cm36c11cm1c2c2c6c5c5cm10c1c3c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm16c8cm3cm22cm36c11cm1c2c2c6c5c5cm10c1c3c14_weight(0), cm16c8cm3cm22cm36c11cm1c2c2c6c5c5cm10c1c3c14_weight(1));
    PL_STEP_0_for_c13c9cm18cm19cm53c25c13cm5cm18cm8cm4c1cm7cm3cm12c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13c9cm18cm19cm53c25c13cm5cm18cm8cm4c1cm7cm3cm12c2_weight(0), c13c9cm18cm19cm53c25c13cm5cm18cm8cm4c1cm7cm3cm12c2_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c62cm3c31cm4c12c2cm3c15c5c127c7c9c6c9c2c4_c2cm2cm15cm2cm2c4c3cm6c7c1c5c2cm5cm3c1c11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c62cm3c31cm4c12c2cm3c15c5c127c7c9c6c9c2c4_weight(1)(8-1 downto 0),
			B	=> c2cm2cm15cm2cm2c4c3cm6c7c1c5c2cm5cm3c1c11_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c62cm3c31cm4c12c2cm3c15c5c127c7c9c6c9c2c4,
			CxB => R_c2cm2cm15cm2cm2c4c3cm6c7c1c5c2cm5cm3c1c11
		);

    c83cm5c14cm2c2c5c4cm10cm1c56cm7c28cm1c4cm2c4_c8c5cm1c2c11c9c10c1c3cm3c8cm5cm6cm13cm3c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c83cm5c14cm2c2c5c4cm10cm1c56cm7c28cm1c4cm2c4_weight(1)(8-1 downto 0),
			B	=> c8c5cm1c2c11c9c10c1c3cm3c8cm5cm6cm13cm3c3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c83cm5c14cm2c2c5c4cm10cm1c56cm7c28cm1c4cm2c4,
			CxB => R_c8c5cm1c2c11c9c10c1c3cm3c8cm5cm6cm13cm3c3
		);

    cm27c1cm21cm3c7c20c1c6cm1cm4cm2cm48c6c21cm5c4_c1cm10cm6c3cm10cm2c1c1cm7c11c12cm7cm11cm4c7cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm27c1cm21cm3c7c20c1c6cm1cm4cm2cm48c6c21cm5c4_weight(1)(7-1 downto 0),
			B	=> c1cm10cm6c3cm10cm2c1c1cm7c11c12cm7cm11cm4c7cm4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm27c1cm21cm3c7c20c1c6cm1cm4cm2cm48c6c21cm5c4,
			CxB => R_c1cm10cm6c3cm10cm2c1c1cm7c11c12cm7cm11cm4c7cm4
		);

    c0cm6cm2cm9c2cm58c28cm25c21c8c6cm23cm3c29c8c4_cm2cm2c3cm5cm9cm10cm6cm2c13cm12c3c4c12c8c9c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm6cm2cm9c2cm58c28cm25c21c8c6cm23cm3c29c8c4_weight(1)(7-1 downto 0),
			B	=> cm2cm2c3cm5cm9cm10cm6cm2c13cm12c3c4c12c8c9c5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm6cm2cm9c2cm58c28cm25c21c8c6cm23cm3c29c8c4,
			CxB => R_cm2cm2c3cm5cm9cm10cm6cm2c13cm12c3c4c12c8c9c5
		);

    cm8c6c26c1cm35cm3c9c16cm5cm5c3cm2cm4c3cm5c13_c7cm5cm9cm4c12cm2cm5c4c0cm8c7cm13cm3cm8c1cm9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm8c6c26c1cm35cm3c9c16cm5cm5c3cm2cm4c3cm5c13_weight(1)(7-1 downto 0),
			B	=> c7cm5cm9cm4c12cm2cm5c4c0cm8c7cm13cm3cm8c1cm9_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm8c6c26c1cm35cm3c9c16cm5cm5c3cm2cm4c3cm5c13,
			CxB => R_c7cm5cm9cm4c12cm2cm5c4c0cm8c7cm13cm3cm8c1cm9
		);

    c5c12c2cm7cm57cm17cm6c12cm5c10c11c1c9cm11cm2c5_cm9c4cm10c5c11cm8cm4cm5cm1cm4cm5cm4c4cm8cm1c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5c12c2cm7cm57cm17cm6c12cm5c10c11c1c9cm11cm2c5_weight(1)(7-1 downto 0),
			B	=> cm9c4cm10c5c11cm8cm4cm5cm1cm4cm5cm4c4cm8cm1c2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c12c2cm7cm57cm17cm6c12cm5c10c11c1c9cm11cm2c5,
			CxB => R_cm9c4cm10c5c11cm8cm4cm5cm1cm4cm5cm4c4cm8cm1c2
		);

    cm2c1cm5cm20c15cm15c1cm14cm3c42c7cm4cm2cm20cm8cm11_c0c22cm14cm27c7cm8cm2c12cm6c3c4c1c13c13c8c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c1cm5cm20c15cm15c1cm14cm3c42c7cm4cm2cm20cm8cm11_weight(1)(7-1 downto 0),
			B	=> c0c22cm14cm27c7cm8cm2c12cm6c3c4c1c13c13c8c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c1cm5cm20c15cm15c1cm14cm3c42c7cm4cm2cm20cm8cm11,
			CxB => R_c0c22cm14cm27c7cm8cm2c12cm6c3c4c1c13c13c8c0
		);

    cm1c10c3c5c17c30cm13cm35cm6c8cm12cm11cm10c8c5cm6_cm2cm6cm1cm8c16c21c0cm25cm11cm20c12cm4c6c18c9c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c10c3c5c17c30cm13cm35cm6c8cm12cm11cm10c8c5cm6_weight(1)(7-1 downto 0),
			B	=> cm2cm6cm1cm8c16c21c0cm25cm11cm20c12cm4c6c18c9c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c10c3c5c17c30cm13cm35cm6c8cm12cm11cm10c8c5cm6,
			CxB => R_cm2cm6cm1cm8c16c21c0cm25cm11cm20c12cm4c6c18c9c0
		);

    c2cm2c4c1c7cm12cm45cm1cm13c9c3cm10c5c1c5c4_c5c28c0c10c1c2c17cm5cm3cm2cm1c2cm1c2cm3c17_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2cm2c4c1c7cm12cm45cm1cm13c9c3cm10c5c1c5c4_weight(1)(7-1 downto 0),
			B	=> c5c28c0c10c1c2c17cm5cm3cm2cm1c2cm1c2cm3c17_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm2c4c1c7cm12cm45cm1cm13c9c3cm10c5c1c5c4,
			CxB => R_c5c28c0c10c1c2c17cm5cm3cm2cm1c2cm1c2cm3c17
		);

    c0cm4c0c3cm6cm51c8c10cm25cm12cm18cm3cm1cm9c7cm7_c6cm12c8c2cm9c9c11cm10c2c4c6cm8cm19c0c10c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm4c0c3cm6cm51c8c10cm25cm12cm18cm3cm1cm9c7cm7_weight(1)(7-1 downto 0),
			B	=> c6cm12c8c2cm9c9c11cm10c2c4c6cm8cm19c0c10c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm4c0c3cm6cm51c8c10cm25cm12cm18cm3cm1cm9c7cm7,
			CxB => R_c6cm12c8c2cm9c9c11cm10c2c4c6cm8cm19c0c10c0
		);

    cm3c34cm9cm2c17cm4cm9cm19cm26cm1c3cm5c3cm1c8c18_c19c6cm1cm22cm12cm2cm12c17cm3cm1cm10c9c3c1cm10c30_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c34cm9cm2c17cm4cm9cm19cm26cm1c3cm5c3cm1c8c18_weight(1)(7-1 downto 0),
			B	=> c19c6cm1cm22cm12cm2cm12c17cm3cm1cm10c9c3c1cm10c30_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c34cm9cm2c17cm4cm9cm19cm26cm1c3cm5c3cm1c8c18,
			CxB => R_c19c6cm1cm22cm12cm2cm12c17cm3cm1cm10c9c3c1cm10c30
		);

    c6c4c9c2cm2cm38c4cm2c25c5cm30cm8cm1cm6c3cm1_cm8cm15cm11cm3cm1cm19c9c23cm2cm3cm4cm14c16cm11c30c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6c4c9c2cm2cm38c4cm2c25c5cm30cm8cm1cm6c3cm1_weight(1)(7-1 downto 0),
			B	=> cm8cm15cm11cm3cm1cm19c9c23cm2cm3cm4cm14c16cm11c30c8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6c4c9c2cm2cm38c4cm2c25c5cm30cm8cm1cm6c3cm1,
			CxB => R_cm8cm15cm11cm3cm1cm19c9c23cm2cm3cm4cm14c16cm11c30c8
		);

    c3c13cm13c3c13c22c2c17cm33cm3c12cm5cm18c3c9cm8_c20cm6c0cm4c11cm11c0cm9cm6cm1c3cm13cm20cm11c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c13cm13c3c13c22c2c17cm33cm3c12cm5cm18c3c9cm8_weight(1)(7-1 downto 0),
			B	=> c20cm6c0cm4c11cm11c0cm9cm6cm1c3cm13cm20cm11c0c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c13cm13c3c13c22c2c17cm33cm3c12cm5cm18c3c9cm8,
			CxB => R_c20cm6c0cm4c11cm11c0cm9cm6cm1c3cm13cm20cm11c0c0
		);

    c4c1c0cm2cm33c26c4c2c2c7c2cm9cm22c15c17cm21_cm12cm7c8cm5cm6cm24c1cm10cm7c1c2c16c0cm17c13cm9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c1c0cm2cm33c26c4c2c2c7c2cm9cm22c15c17cm21_weight(1)(7-1 downto 0),
			B	=> cm12cm7c8cm5cm6cm24c1cm10cm7c1c2c16c0cm17c13cm9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c1c0cm2cm33c26c4c2c2c7c2cm9cm22c15c17cm21,
			CxB => R_cm12cm7c8cm5cm6cm24c1cm10cm7c1c2c16c0cm17c13cm9
		);

    cm16c8cm3cm22cm36c11cm1c2c2c6c5c5cm10c1c3c14_cm5cm30cm1c9cm8c2c19c18cm24c5c7cm9cm9c0c6c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm16c8cm3cm22cm36c11cm1c2c2c6c5c5cm10c1c3c14_weight(1)(7-1 downto 0),
			B	=> cm5cm30cm1c9cm8c2c19c18cm24c5c7cm9cm9c0c6c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm16c8cm3cm22cm36c11cm1c2c2c6c5c5cm10c1c3c14,
			CxB => R_cm5cm30cm1c9cm8c2c19c18cm24c5c7cm9cm9c0c6c0
		);

    c13c9cm18cm19cm53c25c13cm5cm18cm8cm4c1cm7cm3cm12c2_c25cm12c6cm7c5c6cm25c3c4c5c6c6c10cm2cm2cm11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c13c9cm18cm19cm53c25c13cm5cm18cm8cm4c1cm7cm3cm12c2_weight(1)(7-1 downto 0),
			B	=> c25cm12c6cm7c5c6cm25c3c4c5c6c6c10cm2cm2cm11_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c13c9cm18cm19cm53c25c13cm5cm18cm8cm4c1cm7cm3cm12c2,
			CxB => R_c25cm12c6cm7c5c6cm25c3c4c5c6c6c10cm2cm2cm11
		);




end architecture;
