library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core12_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c10c3c18c7c5c2cm12c2cm3c15cm1c15c5cm8c3c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm4cm4cm36c1cm50c2cm1c6c2cm32c0cm14cm6c1cm7cm18 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm12cm8cm5c2c4c7c3cm4cm3cm65c5c3c2c4cm1c0 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm4cm10cm21cm21c5c0c6cm35cm11c1cm6c1c9cm4cm1c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm40c5c21c34c3c11c11c7cm4c24cm3cm8c14c7c6cm24 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2c3c30c1cm3cm4c4cm6c1c27cm6c40cm1c6c1c13 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2cm3cm1c12c8c3c2cm6cm10c13c0cm28c18c19c13cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm33cm4cm51c30c3cm1c1c1c9cm2c4c9c10cm15c2cm9 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6c34c22cm9cm6cm12cm6c0cm9cm5cm26cm2c41cm10c3c10 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0cm3c2c2cm1cm5c1c1cm7c19c10c4c4c1c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c21cm5c0cm18cm5cm65c2c3cm42cm5cm1c71c9c0c5cm9 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm3c1c5cm7c6c3c12cm1cm2c0c2cm12c1c0cm12c15 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm23c21cm12c1c17c4c13c1cm1c3c2c0c3cm9cm1c11 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm34c2c3cm2cm9c7c1c1cm5c4c0c3cm6cm5cm8c12 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm5cm63c5cm5c4cm4cm6cm3c0cm23cm4c1cm68cm4cm1c1 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm6cm16cm2cm11c62c5c4c8c2cm31c0c7cm6c21cm3cm12 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm20cm4cm5cm6c2c4c3cm5c10c6cm43c9cm5cm5cm6cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c7c1cm6c5cm4cm3c0c0c11c8c2cm3c5c12cm4c13 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm13c10cm3cm11cm2c5c5cm3cm22cm8c7cm1c0cm3cm7cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm7cm21c5cm18c25c13c2c83cm6cm20cm18c1c1cm16cm16cm16 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c0c20c9c7c0c2cm3c0c1c7cm5cm7c3cm32cm2cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c17c5c14cm2c3c2c10c1cm18cm23cm2cm51c7c3cm12c5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1c3c4cm3c11cm4c1c3c7c3cm1cm26cm6c2cm26cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm7c0c2c9c4cm1c4c2cm3cm13c8c27cm27c3cm6cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c18cm2cm4cm5cm3c4cm2c6cm6cm5c6cm5c2cm1c7cm52 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1c22cm20cm1c3c14cm4c1cm24c1cm18cm7cm9c0c3c8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c7c1cm5c1cm2c29cm38cm18cm4c3cm1cm3cm2cm1cm4cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c14c8cm1c0cm5c1c17c3cm3cm15c4cm11c5c9cm4c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm10cm30c1cm17c14c6c4c2cm14c5cm6cm18cm5c1c36c19 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm20c1c2c7cm4cm1c2cm3cm10c10c1c24c0cm16cm9cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c11c12cm1cm10cm12c1cm1c7c5c3cm1cm7c0c7c9c8 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c4cm23cm23c8c1cm2c49cm11cm6cm19cm3c14c0c1cm4cm12 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core12_rmcm;

architecture arch of conv7_core12_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C10C3C18C7C5C2CM12C2CM3C15CM1C15C5CM8C3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM4CM36C1CM50C2CM1C6C2CM32C0CM14CM6C1CM7CM18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12CM8CM5C2C4C7C3CM4CM3CM65C5C3C2C4CM1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM10CM21CM21C5C0C6CM35CM11C1CM6C1C9CM4CM1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM40C5C21C34C3C11C11C7CM4C24CM3CM8C14C7C6CM24_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C3C30C1CM3CM4C4CM6C1C27CM6C40CM1C6C1C13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM3CM1C12C8C3C2CM6CM10C13C0CM28C18C19C13CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM33CM4CM51C30C3CM1C1C1C9CM2C4C9C10CM15C2CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C34C22CM9CM6CM12CM6C0CM9CM5CM26CM2C41CM10C3C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM3C2C2CM1CM5C1C1CM7C19C10C4C4C1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C21CM5C0CM18CM5CM65C2C3CM42CM5CM1C71C9C0C5CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C1C5CM7C6C3C12CM1CM2C0C2CM12C1C0CM12C15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM23C21CM12C1C17C4C13C1CM1C3C2C0C3CM9CM1C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM34C2C3CM2CM9C7C1C1CM5C4C0C3CM6CM5CM8C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM63C5CM5C4CM4CM6CM3C0CM23CM4C1CM68CM4CM1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM16CM2CM11C62C5C4C8C2CM31C0C7CM6C21CM3CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM20CM4CM5CM6C2C4C3CM5C10C6CM43C9CM5CM5CM6CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C1CM6C5CM4CM3C0C0C11C8C2CM3C5C12CM4C13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C10CM3CM11CM2C5C5CM3CM22CM8C7CM1C0CM3CM7CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7CM21C5CM18C25C13C2C83CM6CM20CM18C1C1CM16CM16CM16_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C20C9C7C0C2CM3C0C1C7CM5CM7C3CM32CM2CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C17C5C14CM2C3C2C10C1CM18CM23CM2CM51C7C3CM12C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C3C4CM3C11CM4C1C3C7C3CM1CM26CM6C2CM26CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C0C2C9C4CM1C4C2CM3CM13C8C27CM27C3CM6CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C18CM2CM4CM5CM3C4CM2C6CM6CM5C6CM5C2CM1C7CM52_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C22CM20CM1C3C14CM4C1CM24C1CM18CM7CM9C0C3C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C1CM5C1CM2C29CM38CM18CM4C3CM1CM3CM2CM1CM4CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14C8CM1C0CM5C1C17C3CM3CM15C4CM11C5C9CM4C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10CM30C1CM17C14C6C4C2CM14C5CM6CM18CM5C1C36C19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM20C1C2C7CM4CM1C2CM3CM10C10C1C24C0CM16CM9CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C12CM1CM10CM12C1CM1C7C5C3CM1CM7C0C7C9C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM23CM23C8C1CM2C49CM11CM6CM19CM3C14C0C1CM4CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c10c3c18c7c5c2cm12c2cm3c15cm1c15c5cm8c3c0_weight : PIPELINE_TYPE_FOR_C10C3C18C7C5C2CM12C2CM3C15CM1C15C5CM8C3C0_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm4cm36c1cm50c2cm1c6c2cm32c0cm14cm6c1cm7cm18_weight : PIPELINE_TYPE_FOR_CM4CM4CM36C1CM50C2CM1C6C2CM32C0CM14CM6C1CM7CM18_WEIGHT;
    -- sfix(1, -7)
    signal cm12cm8cm5c2c4c7c3cm4cm3cm65c5c3c2c4cm1c0_weight : PIPELINE_TYPE_FOR_CM12CM8CM5C2C4C7C3CM4CM3CM65C5C3C2C4CM1C0_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm10cm21cm21c5c0c6cm35cm11c1cm6c1c9cm4cm1c2_weight : PIPELINE_TYPE_FOR_CM4CM10CM21CM21C5C0C6CM35CM11C1CM6C1C9CM4CM1C2_WEIGHT;
    -- sfix(1, -7)
    signal cm40c5c21c34c3c11c11c7cm4c24cm3cm8c14c7c6cm24_weight : PIPELINE_TYPE_FOR_CM40C5C21C34C3C11C11C7CM4C24CM3CM8C14C7C6CM24_WEIGHT;
    -- sfix(1, -7)
    signal c2c3c30c1cm3cm4c4cm6c1c27cm6c40cm1c6c1c13_weight : PIPELINE_TYPE_FOR_C2C3C30C1CM3CM4C4CM6C1C27CM6C40CM1C6C1C13_WEIGHT;
    -- sfix(1, -7)
    signal c2cm3cm1c12c8c3c2cm6cm10c13c0cm28c18c19c13cm7_weight : PIPELINE_TYPE_FOR_C2CM3CM1C12C8C3C2CM6CM10C13C0CM28C18C19C13CM7_WEIGHT;
    -- sfix(1, -7)
    signal cm33cm4cm51c30c3cm1c1c1c9cm2c4c9c10cm15c2cm9_weight : PIPELINE_TYPE_FOR_CM33CM4CM51C30C3CM1C1C1C9CM2C4C9C10CM15C2CM9_WEIGHT;
    -- sfix(1, -7)
    signal cm6c34c22cm9cm6cm12cm6c0cm9cm5cm26cm2c41cm10c3c10_weight : PIPELINE_TYPE_FOR_CM6C34C22CM9CM6CM12CM6C0CM9CM5CM26CM2C41CM10C3C10_WEIGHT;
    -- sfix(1, -7)
    signal c0c0cm3c2c2cm1cm5c1c1cm7c19c10c4c4c1c3_weight : PIPELINE_TYPE_FOR_C0C0CM3C2C2CM1CM5C1C1CM7C19C10C4C4C1C3_WEIGHT;
    -- sfix(1, -7)
    signal c21cm5c0cm18cm5cm65c2c3cm42cm5cm1c71c9c0c5cm9_weight : PIPELINE_TYPE_FOR_C21CM5C0CM18CM5CM65C2C3CM42CM5CM1C71C9C0C5CM9_WEIGHT;
    -- sfix(1, -7)
    signal cm3c1c5cm7c6c3c12cm1cm2c0c2cm12c1c0cm12c15_weight : PIPELINE_TYPE_FOR_CM3C1C5CM7C6C3C12CM1CM2C0C2CM12C1C0CM12C15_WEIGHT;
    -- sfix(1, -7)
    signal cm23c21cm12c1c17c4c13c1cm1c3c2c0c3cm9cm1c11_weight : PIPELINE_TYPE_FOR_CM23C21CM12C1C17C4C13C1CM1C3C2C0C3CM9CM1C11_WEIGHT;
    -- sfix(1, -7)
    signal cm34c2c3cm2cm9c7c1c1cm5c4c0c3cm6cm5cm8c12_weight : PIPELINE_TYPE_FOR_CM34C2C3CM2CM9C7C1C1CM5C4C0C3CM6CM5CM8C12_WEIGHT;
    -- sfix(1, -7)
    signal cm5cm63c5cm5c4cm4cm6cm3c0cm23cm4c1cm68cm4cm1c1_weight : PIPELINE_TYPE_FOR_CM5CM63C5CM5C4CM4CM6CM3C0CM23CM4C1CM68CM4CM1C1_WEIGHT;
    -- sfix(1, -7)
    signal cm6cm16cm2cm11c62c5c4c8c2cm31c0c7cm6c21cm3cm12_weight : PIPELINE_TYPE_FOR_CM6CM16CM2CM11C62C5C4C8C2CM31C0C7CM6C21CM3CM12_WEIGHT;
    -- sfix(1, -7)
    signal cm20cm4cm5cm6c2c4c3cm5c10c6cm43c9cm5cm5cm6cm4_weight : PIPELINE_TYPE_FOR_CM20CM4CM5CM6C2C4C3CM5C10C6CM43C9CM5CM5CM6CM4_WEIGHT;
    -- sfix(1, -7)
    signal c7c1cm6c5cm4cm3c0c0c11c8c2cm3c5c12cm4c13_weight : PIPELINE_TYPE_FOR_C7C1CM6C5CM4CM3C0C0C11C8C2CM3C5C12CM4C13_WEIGHT;
    -- sfix(1, -7)
    signal cm13c10cm3cm11cm2c5c5cm3cm22cm8c7cm1c0cm3cm7cm5_weight : PIPELINE_TYPE_FOR_CM13C10CM3CM11CM2C5C5CM3CM22CM8C7CM1C0CM3CM7CM5_WEIGHT;
    -- sfix(1, -7)
    signal cm7cm21c5cm18c25c13c2c83cm6cm20cm18c1c1cm16cm16cm16_weight : PIPELINE_TYPE_FOR_CM7CM21C5CM18C25C13C2C83CM6CM20CM18C1C1CM16CM16CM16_WEIGHT;
    -- sfix(1, -7)
    signal c0c20c9c7c0c2cm3c0c1c7cm5cm7c3cm32cm2cm7_weight : PIPELINE_TYPE_FOR_C0C20C9C7C0C2CM3C0C1C7CM5CM7C3CM32CM2CM7_WEIGHT;
    -- sfix(1, -7)
    signal c17c5c14cm2c3c2c10c1cm18cm23cm2cm51c7c3cm12c5_weight : PIPELINE_TYPE_FOR_C17C5C14CM2C3C2C10C1CM18CM23CM2CM51C7C3CM12C5_WEIGHT;
    -- sfix(1, -7)
    signal cm1c3c4cm3c11cm4c1c3c7c3cm1cm26cm6c2cm26cm8_weight : PIPELINE_TYPE_FOR_CM1C3C4CM3C11CM4C1C3C7C3CM1CM26CM6C2CM26CM8_WEIGHT;
    -- sfix(1, -7)
    signal cm7c0c2c9c4cm1c4c2cm3cm13c8c27cm27c3cm6cm1_weight : PIPELINE_TYPE_FOR_CM7C0C2C9C4CM1C4C2CM3CM13C8C27CM27C3CM6CM1_WEIGHT;
    -- sfix(1, -7)
    signal c18cm2cm4cm5cm3c4cm2c6cm6cm5c6cm5c2cm1c7cm52_weight : PIPELINE_TYPE_FOR_C18CM2CM4CM5CM3C4CM2C6CM6CM5C6CM5C2CM1C7CM52_WEIGHT;
    -- sfix(1, -7)
    signal cm1c22cm20cm1c3c14cm4c1cm24c1cm18cm7cm9c0c3c8_weight : PIPELINE_TYPE_FOR_CM1C22CM20CM1C3C14CM4C1CM24C1CM18CM7CM9C0C3C8_WEIGHT;
    -- sfix(1, -7)
    signal c7c1cm5c1cm2c29cm38cm18cm4c3cm1cm3cm2cm1cm4cm1_weight : PIPELINE_TYPE_FOR_C7C1CM5C1CM2C29CM38CM18CM4C3CM1CM3CM2CM1CM4CM1_WEIGHT;
    -- sfix(1, -7)
    signal c14c8cm1c0cm5c1c17c3cm3cm15c4cm11c5c9cm4c0_weight : PIPELINE_TYPE_FOR_C14C8CM1C0CM5C1C17C3CM3CM15C4CM11C5C9CM4C0_WEIGHT;
    -- sfix(1, -7)
    signal cm10cm30c1cm17c14c6c4c2cm14c5cm6cm18cm5c1c36c19_weight : PIPELINE_TYPE_FOR_CM10CM30C1CM17C14C6C4C2CM14C5CM6CM18CM5C1C36C19_WEIGHT;
    -- sfix(1, -7)
    signal cm20c1c2c7cm4cm1c2cm3cm10c10c1c24c0cm16cm9cm8_weight : PIPELINE_TYPE_FOR_CM20C1C2C7CM4CM1C2CM3CM10C10C1C24C0CM16CM9CM8_WEIGHT;
    -- sfix(1, -7)
    signal c11c12cm1cm10cm12c1cm1c7c5c3cm1cm7c0c7c9c8_weight : PIPELINE_TYPE_FOR_C11C12CM1CM10CM12C1CM1C7C5C3CM1CM7C0C7C9C8_WEIGHT;
    -- sfix(1, -7)
    signal c4cm23cm23c8c1cm2c49cm11cm6cm19cm3c14c0c1cm4cm12_weight : PIPELINE_TYPE_FOR_C4CM23CM23C8C1CM2C49CM11CM6CM19CM3C14C0C1CM4CM12_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core12_rmcm_weightsconstant_memory
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
        
            dout1   => c10c3c18c7c5c2cm12c2cm3c15cm1c15c5cm8c3c0_weight(0), 
            dout2   => cm4cm4cm36c1cm50c2cm1c6c2cm32c0cm14cm6c1cm7cm18_weight(0), 
            dout3   => cm12cm8cm5c2c4c7c3cm4cm3cm65c5c3c2c4cm1c0_weight(0), 
            dout4   => cm4cm10cm21cm21c5c0c6cm35cm11c1cm6c1c9cm4cm1c2_weight(0), 
            dout5   => cm40c5c21c34c3c11c11c7cm4c24cm3cm8c14c7c6cm24_weight(0), 
            dout6   => c2c3c30c1cm3cm4c4cm6c1c27cm6c40cm1c6c1c13_weight(0), 
            dout7   => c2cm3cm1c12c8c3c2cm6cm10c13c0cm28c18c19c13cm7_weight(0), 
            dout8   => cm33cm4cm51c30c3cm1c1c1c9cm2c4c9c10cm15c2cm9_weight(0), 
            dout9   => cm6c34c22cm9cm6cm12cm6c0cm9cm5cm26cm2c41cm10c3c10_weight(0), 
            dout10   => c0c0cm3c2c2cm1cm5c1c1cm7c19c10c4c4c1c3_weight(0), 
            dout11   => c21cm5c0cm18cm5cm65c2c3cm42cm5cm1c71c9c0c5cm9_weight(0), 
            dout12   => cm3c1c5cm7c6c3c12cm1cm2c0c2cm12c1c0cm12c15_weight(0), 
            dout13   => cm23c21cm12c1c17c4c13c1cm1c3c2c0c3cm9cm1c11_weight(0), 
            dout14   => cm34c2c3cm2cm9c7c1c1cm5c4c0c3cm6cm5cm8c12_weight(0), 
            dout15   => cm5cm63c5cm5c4cm4cm6cm3c0cm23cm4c1cm68cm4cm1c1_weight(0), 
            dout16   => cm6cm16cm2cm11c62c5c4c8c2cm31c0c7cm6c21cm3cm12_weight(0), 
            dout17   => cm20cm4cm5cm6c2c4c3cm5c10c6cm43c9cm5cm5cm6cm4_weight(0), 
            dout18   => c7c1cm6c5cm4cm3c0c0c11c8c2cm3c5c12cm4c13_weight(0), 
            dout19   => cm13c10cm3cm11cm2c5c5cm3cm22cm8c7cm1c0cm3cm7cm5_weight(0), 
            dout20   => cm7cm21c5cm18c25c13c2c83cm6cm20cm18c1c1cm16cm16cm16_weight(0), 
            dout21   => c0c20c9c7c0c2cm3c0c1c7cm5cm7c3cm32cm2cm7_weight(0), 
            dout22   => c17c5c14cm2c3c2c10c1cm18cm23cm2cm51c7c3cm12c5_weight(0), 
            dout23   => cm1c3c4cm3c11cm4c1c3c7c3cm1cm26cm6c2cm26cm8_weight(0), 
            dout24   => cm7c0c2c9c4cm1c4c2cm3cm13c8c27cm27c3cm6cm1_weight(0), 
            dout25   => c18cm2cm4cm5cm3c4cm2c6cm6cm5c6cm5c2cm1c7cm52_weight(0), 
            dout26   => cm1c22cm20cm1c3c14cm4c1cm24c1cm18cm7cm9c0c3c8_weight(0), 
            dout27   => c7c1cm5c1cm2c29cm38cm18cm4c3cm1cm3cm2cm1cm4cm1_weight(0), 
            dout28   => c14c8cm1c0cm5c1c17c3cm3cm15c4cm11c5c9cm4c0_weight(0), 
            dout29   => cm10cm30c1cm17c14c6c4c2cm14c5cm6cm18cm5c1c36c19_weight(0), 
            dout30   => cm20c1c2c7cm4cm1c2cm3cm10c10c1c24c0cm16cm9cm8_weight(0), 
            dout31   => c11c12cm1cm10cm12c1cm1c7c5c3cm1cm7c0c7c9c8_weight(0), 
            dout32   => c4cm23cm23c8c1cm2c49cm11cm6cm19cm3c14c0c1cm4cm12_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c10c3c18c7c5c2cm12c2cm3c15cm1c15c5cm8c3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10c3c18c7c5c2cm12c2cm3c15cm1c15c5cm8c3c0_weight(0), c10c3c18c7c5c2cm12c2cm3c15cm1c15c5cm8c3c0_weight(1));
    PL_STEP_0_for_cm4cm4cm36c1cm50c2cm1c6c2cm32c0cm14cm6c1cm7cm18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm4cm36c1cm50c2cm1c6c2cm32c0cm14cm6c1cm7cm18_weight(0), cm4cm4cm36c1cm50c2cm1c6c2cm32c0cm14cm6c1cm7cm18_weight(1));
    PL_STEP_0_for_cm12cm8cm5c2c4c7c3cm4cm3cm65c5c3c2c4cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12cm8cm5c2c4c7c3cm4cm3cm65c5c3c2c4cm1c0_weight(0), cm12cm8cm5c2c4c7c3cm4cm3cm65c5c3c2c4cm1c0_weight(1));
    PL_STEP_0_for_cm4cm10cm21cm21c5c0c6cm35cm11c1cm6c1c9cm4cm1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm10cm21cm21c5c0c6cm35cm11c1cm6c1c9cm4cm1c2_weight(0), cm4cm10cm21cm21c5c0c6cm35cm11c1cm6c1c9cm4cm1c2_weight(1));
    PL_STEP_0_for_cm40c5c21c34c3c11c11c7cm4c24cm3cm8c14c7c6cm24_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm40c5c21c34c3c11c11c7cm4c24cm3cm8c14c7c6cm24_weight(0), cm40c5c21c34c3c11c11c7cm4c24cm3cm8c14c7c6cm24_weight(1));
    PL_STEP_0_for_c2c3c30c1cm3cm4c4cm6c1c27cm6c40cm1c6c1c13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c3c30c1cm3cm4c4cm6c1c27cm6c40cm1c6c1c13_weight(0), c2c3c30c1cm3cm4c4cm6c1c27cm6c40cm1c6c1c13_weight(1));
    PL_STEP_0_for_c2cm3cm1c12c8c3c2cm6cm10c13c0cm28c18c19c13cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm3cm1c12c8c3c2cm6cm10c13c0cm28c18c19c13cm7_weight(0), c2cm3cm1c12c8c3c2cm6cm10c13c0cm28c18c19c13cm7_weight(1));
    PL_STEP_0_for_cm33cm4cm51c30c3cm1c1c1c9cm2c4c9c10cm15c2cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm33cm4cm51c30c3cm1c1c1c9cm2c4c9c10cm15c2cm9_weight(0), cm33cm4cm51c30c3cm1c1c1c9cm2c4c9c10cm15c2cm9_weight(1));
    PL_STEP_0_for_cm6c34c22cm9cm6cm12cm6c0cm9cm5cm26cm2c41cm10c3c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c34c22cm9cm6cm12cm6c0cm9cm5cm26cm2c41cm10c3c10_weight(0), cm6c34c22cm9cm6cm12cm6c0cm9cm5cm26cm2c41cm10c3c10_weight(1));
    PL_STEP_0_for_c0c0cm3c2c2cm1cm5c1c1cm7c19c10c4c4c1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm3c2c2cm1cm5c1c1cm7c19c10c4c4c1c3_weight(0), c0c0cm3c2c2cm1cm5c1c1cm7c19c10c4c4c1c3_weight(1));
    PL_STEP_0_for_c21cm5c0cm18cm5cm65c2c3cm42cm5cm1c71c9c0c5cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c21cm5c0cm18cm5cm65c2c3cm42cm5cm1c71c9c0c5cm9_weight(0), c21cm5c0cm18cm5cm65c2c3cm42cm5cm1c71c9c0c5cm9_weight(1));
    PL_STEP_0_for_cm3c1c5cm7c6c3c12cm1cm2c0c2cm12c1c0cm12c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c1c5cm7c6c3c12cm1cm2c0c2cm12c1c0cm12c15_weight(0), cm3c1c5cm7c6c3c12cm1cm2c0c2cm12c1c0cm12c15_weight(1));
    PL_STEP_0_for_cm23c21cm12c1c17c4c13c1cm1c3c2c0c3cm9cm1c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm23c21cm12c1c17c4c13c1cm1c3c2c0c3cm9cm1c11_weight(0), cm23c21cm12c1c17c4c13c1cm1c3c2c0c3cm9cm1c11_weight(1));
    PL_STEP_0_for_cm34c2c3cm2cm9c7c1c1cm5c4c0c3cm6cm5cm8c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm34c2c3cm2cm9c7c1c1cm5c4c0c3cm6cm5cm8c12_weight(0), cm34c2c3cm2cm9c7c1c1cm5c4c0c3cm6cm5cm8c12_weight(1));
    PL_STEP_0_for_cm5cm63c5cm5c4cm4cm6cm3c0cm23cm4c1cm68cm4cm1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm63c5cm5c4cm4cm6cm3c0cm23cm4c1cm68cm4cm1c1_weight(0), cm5cm63c5cm5c4cm4cm6cm3c0cm23cm4c1cm68cm4cm1c1_weight(1));
    PL_STEP_0_for_cm6cm16cm2cm11c62c5c4c8c2cm31c0c7cm6c21cm3cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm16cm2cm11c62c5c4c8c2cm31c0c7cm6c21cm3cm12_weight(0), cm6cm16cm2cm11c62c5c4c8c2cm31c0c7cm6c21cm3cm12_weight(1));
    PL_STEP_0_for_cm20cm4cm5cm6c2c4c3cm5c10c6cm43c9cm5cm5cm6cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm20cm4cm5cm6c2c4c3cm5c10c6cm43c9cm5cm5cm6cm4_weight(0), cm20cm4cm5cm6c2c4c3cm5c10c6cm43c9cm5cm5cm6cm4_weight(1));
    PL_STEP_0_for_c7c1cm6c5cm4cm3c0c0c11c8c2cm3c5c12cm4c13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c1cm6c5cm4cm3c0c0c11c8c2cm3c5c12cm4c13_weight(0), c7c1cm6c5cm4cm3c0c0c11c8c2cm3c5c12cm4c13_weight(1));
    PL_STEP_0_for_cm13c10cm3cm11cm2c5c5cm3cm22cm8c7cm1c0cm3cm7cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c10cm3cm11cm2c5c5cm3cm22cm8c7cm1c0cm3cm7cm5_weight(0), cm13c10cm3cm11cm2c5c5cm3cm22cm8c7cm1c0cm3cm7cm5_weight(1));
    PL_STEP_0_for_cm7cm21c5cm18c25c13c2c83cm6cm20cm18c1c1cm16cm16cm16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7cm21c5cm18c25c13c2c83cm6cm20cm18c1c1cm16cm16cm16_weight(0), cm7cm21c5cm18c25c13c2c83cm6cm20cm18c1c1cm16cm16cm16_weight(1));
    PL_STEP_0_for_c0c20c9c7c0c2cm3c0c1c7cm5cm7c3cm32cm2cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c20c9c7c0c2cm3c0c1c7cm5cm7c3cm32cm2cm7_weight(0), c0c20c9c7c0c2cm3c0c1c7cm5cm7c3cm32cm2cm7_weight(1));
    PL_STEP_0_for_c17c5c14cm2c3c2c10c1cm18cm23cm2cm51c7c3cm12c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c17c5c14cm2c3c2c10c1cm18cm23cm2cm51c7c3cm12c5_weight(0), c17c5c14cm2c3c2c10c1cm18cm23cm2cm51c7c3cm12c5_weight(1));
    PL_STEP_0_for_cm1c3c4cm3c11cm4c1c3c7c3cm1cm26cm6c2cm26cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c3c4cm3c11cm4c1c3c7c3cm1cm26cm6c2cm26cm8_weight(0), cm1c3c4cm3c11cm4c1c3c7c3cm1cm26cm6c2cm26cm8_weight(1));
    PL_STEP_0_for_cm7c0c2c9c4cm1c4c2cm3cm13c8c27cm27c3cm6cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c0c2c9c4cm1c4c2cm3cm13c8c27cm27c3cm6cm1_weight(0), cm7c0c2c9c4cm1c4c2cm3cm13c8c27cm27c3cm6cm1_weight(1));
    PL_STEP_0_for_c18cm2cm4cm5cm3c4cm2c6cm6cm5c6cm5c2cm1c7cm52_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c18cm2cm4cm5cm3c4cm2c6cm6cm5c6cm5c2cm1c7cm52_weight(0), c18cm2cm4cm5cm3c4cm2c6cm6cm5c6cm5c2cm1c7cm52_weight(1));
    PL_STEP_0_for_cm1c22cm20cm1c3c14cm4c1cm24c1cm18cm7cm9c0c3c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c22cm20cm1c3c14cm4c1cm24c1cm18cm7cm9c0c3c8_weight(0), cm1c22cm20cm1c3c14cm4c1cm24c1cm18cm7cm9c0c3c8_weight(1));
    PL_STEP_0_for_c7c1cm5c1cm2c29cm38cm18cm4c3cm1cm3cm2cm1cm4cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c1cm5c1cm2c29cm38cm18cm4c3cm1cm3cm2cm1cm4cm1_weight(0), c7c1cm5c1cm2c29cm38cm18cm4c3cm1cm3cm2cm1cm4cm1_weight(1));
    PL_STEP_0_for_c14c8cm1c0cm5c1c17c3cm3cm15c4cm11c5c9cm4c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14c8cm1c0cm5c1c17c3cm3cm15c4cm11c5c9cm4c0_weight(0), c14c8cm1c0cm5c1c17c3cm3cm15c4cm11c5c9cm4c0_weight(1));
    PL_STEP_0_for_cm10cm30c1cm17c14c6c4c2cm14c5cm6cm18cm5c1c36c19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10cm30c1cm17c14c6c4c2cm14c5cm6cm18cm5c1c36c19_weight(0), cm10cm30c1cm17c14c6c4c2cm14c5cm6cm18cm5c1c36c19_weight(1));
    PL_STEP_0_for_cm20c1c2c7cm4cm1c2cm3cm10c10c1c24c0cm16cm9cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm20c1c2c7cm4cm1c2cm3cm10c10c1c24c0cm16cm9cm8_weight(0), cm20c1c2c7cm4cm1c2cm3cm10c10c1c24c0cm16cm9cm8_weight(1));
    PL_STEP_0_for_c11c12cm1cm10cm12c1cm1c7c5c3cm1cm7c0c7c9c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c12cm1cm10cm12c1cm1c7c5c3cm1cm7c0c7c9c8_weight(0), c11c12cm1cm10cm12c1cm1c7c5c3cm1cm7c0c7c9c8_weight(1));
    PL_STEP_0_for_c4cm23cm23c8c1cm2c49cm11cm6cm19cm3c14c0c1cm4cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm23cm23c8c1cm2c49cm11cm6cm19cm3c14c0c1cm4cm12_weight(0), c4cm23cm23c8c1cm2c49cm11cm6cm19cm3c14c0c1cm4cm12_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm12cm8cm5c2c4c7c3cm4cm3cm65c5c3c2c4cm1c0_c11c12cm1cm10cm12c1cm1c7c5c3cm1cm7c0c7c9c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm12cm8cm5c2c4c7c3cm4cm3cm65c5c3c2c4cm1c0_weight(1)(8-1 downto 0),
			B	=> c11c12cm1cm10cm12c1cm1c7c5c3cm1cm7c0c7c9c8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm12cm8cm5c2c4c7c3cm4cm3cm65c5c3c2c4cm1c0,
			CxB => R_c11c12cm1cm10cm12c1cm1c7c5c3cm1cm7c0c7c9c8
		);

    c21cm5c0cm18cm5cm65c2c3cm42cm5cm1c71c9c0c5cm9_c7c1cm6c5cm4cm3c0c0c11c8c2cm3c5c12cm4c13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c21cm5c0cm18cm5cm65c2c3cm42cm5cm1c71c9c0c5cm9_weight(1)(8-1 downto 0),
			B	=> c7c1cm6c5cm4cm3c0c0c11c8c2cm3c5c12cm4c13_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c21cm5c0cm18cm5cm65c2c3cm42cm5cm1c71c9c0c5cm9,
			CxB => R_c7c1cm6c5cm4cm3c0c0c11c8c2cm3c5c12cm4c13
		);

    cm5cm63c5cm5c4cm4cm6cm3c0cm23cm4c1cm68cm4cm1c1_cm3c1c5cm7c6c3c12cm1cm2c0c2cm12c1c0cm12c15_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5cm63c5cm5c4cm4cm6cm3c0cm23cm4c1cm68cm4cm1c1_weight(1)(8-1 downto 0),
			B	=> cm3c1c5cm7c6c3c12cm1cm2c0c2cm12c1c0cm12c15_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5cm63c5cm5c4cm4cm6cm3c0cm23cm4c1cm68cm4cm1c1,
			CxB => R_cm3c1c5cm7c6c3c12cm1cm2c0c2cm12c1c0cm12c15
		);

    cm7cm21c5cm18c25c13c2c83cm6cm20cm18c1c1cm16cm16cm16_cm20c1c2c7cm4cm1c2cm3cm10c10c1c24c0cm16cm9cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm7cm21c5cm18c25c13c2c83cm6cm20cm18c1c1cm16cm16cm16_weight(1)(8-1 downto 0),
			B	=> cm20c1c2c7cm4cm1c2cm3cm10c10c1c24c0cm16cm9cm8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7cm21c5cm18c25c13c2c83cm6cm20cm18c1c1cm16cm16cm16,
			CxB => R_cm20c1c2c7cm4cm1c2cm3cm10c10c1c24c0cm16cm9cm8
		);

    cm4cm4cm36c1cm50c2cm1c6c2cm32c0cm14cm6c1cm7cm18_c14c8cm1c0cm5c1c17c3cm3cm15c4cm11c5c9cm4c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm4cm36c1cm50c2cm1c6c2cm32c0cm14cm6c1cm7cm18_weight(1)(7-1 downto 0),
			B	=> c14c8cm1c0cm5c1c17c3cm3cm15c4cm11c5c9cm4c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm4cm36c1cm50c2cm1c6c2cm32c0cm14cm6c1cm7cm18,
			CxB => R_c14c8cm1c0cm5c1c17c3cm3cm15c4cm11c5c9cm4c0
		);

    cm4cm10cm21cm21c5c0c6cm35cm11c1cm6c1c9cm4cm1c2_cm1c22cm20cm1c3c14cm4c1cm24c1cm18cm7cm9c0c3c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm10cm21cm21c5c0c6cm35cm11c1cm6c1c9cm4cm1c2_weight(1)(7-1 downto 0),
			B	=> cm1c22cm20cm1c3c14cm4c1cm24c1cm18cm7cm9c0c3c8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm10cm21cm21c5c0c6cm35cm11c1cm6c1c9cm4cm1c2,
			CxB => R_cm1c22cm20cm1c3c14cm4c1cm24c1cm18cm7cm9c0c3c8
		);

    cm40c5c21c34c3c11c11c7cm4c24cm3cm8c14c7c6cm24_cm7c0c2c9c4cm1c4c2cm3cm13c8c27cm27c3cm6cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm40c5c21c34c3c11c11c7cm4c24cm3cm8c14c7c6cm24_weight(1)(7-1 downto 0),
			B	=> cm7c0c2c9c4cm1c4c2cm3cm13c8c27cm27c3cm6cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm40c5c21c34c3c11c11c7cm4c24cm3cm8c14c7c6cm24,
			CxB => R_cm7c0c2c9c4cm1c4c2cm3cm13c8c27cm27c3cm6cm1
		);

    c2c3c30c1cm3cm4c4cm6c1c27cm6c40cm1c6c1c13_cm1c3c4cm3c11cm4c1c3c7c3cm1cm26cm6c2cm26cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c3c30c1cm3cm4c4cm6c1c27cm6c40cm1c6c1c13_weight(1)(7-1 downto 0),
			B	=> cm1c3c4cm3c11cm4c1c3c7c3cm1cm26cm6c2cm26cm8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c3c30c1cm3cm4c4cm6c1c27cm6c40cm1c6c1c13,
			CxB => R_cm1c3c4cm3c11cm4c1c3c7c3cm1cm26cm6c2cm26cm8
		);

    cm33cm4cm51c30c3cm1c1c1c9cm2c4c9c10cm15c2cm9_c0c20c9c7c0c2cm3c0c1c7cm5cm7c3cm32cm2cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm33cm4cm51c30c3cm1c1c1c9cm2c4c9c10cm15c2cm9_weight(1)(7-1 downto 0),
			B	=> c0c20c9c7c0c2cm3c0c1c7cm5cm7c3cm32cm2cm7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm33cm4cm51c30c3cm1c1c1c9cm2c4c9c10cm15c2cm9,
			CxB => R_c0c20c9c7c0c2cm3c0c1c7cm5cm7c3cm32cm2cm7
		);

    cm6c34c22cm9cm6cm12cm6c0cm9cm5cm26cm2c41cm10c3c10_cm13c10cm3cm11cm2c5c5cm3cm22cm8c7cm1c0cm3cm7cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6c34c22cm9cm6cm12cm6c0cm9cm5cm26cm2c41cm10c3c10_weight(1)(7-1 downto 0),
			B	=> cm13c10cm3cm11cm2c5c5cm3cm22cm8c7cm1c0cm3cm7cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c34c22cm9cm6cm12cm6c0cm9cm5cm26cm2c41cm10c3c10,
			CxB => R_cm13c10cm3cm11cm2c5c5cm3cm22cm8c7cm1c0cm3cm7cm5
		);

    cm34c2c3cm2cm9c7c1c1cm5c4c0c3cm6cm5cm8c12_cm23c21cm12c1c17c4c13c1cm1c3c2c0c3cm9cm1c11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm34c2c3cm2cm9c7c1c1cm5c4c0c3cm6cm5cm8c12_weight(1)(7-1 downto 0),
			B	=> cm23c21cm12c1c17c4c13c1cm1c3c2c0c3cm9cm1c11_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm34c2c3cm2cm9c7c1c1cm5c4c0c3cm6cm5cm8c12,
			CxB => R_cm23c21cm12c1c17c4c13c1cm1c3c2c0c3cm9cm1c11
		);

    cm6cm16cm2cm11c62c5c4c8c2cm31c0c7cm6c21cm3cm12_c0c0cm3c2c2cm1cm5c1c1cm7c19c10c4c4c1c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6cm16cm2cm11c62c5c4c8c2cm31c0c7cm6c21cm3cm12_weight(1)(7-1 downto 0),
			B	=> c0c0cm3c2c2cm1cm5c1c1cm7c19c10c4c4c1c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6cm16cm2cm11c62c5c4c8c2cm31c0c7cm6c21cm3cm12,
			CxB => R_c0c0cm3c2c2cm1cm5c1c1cm7c19c10c4c4c1c3
		);

    cm20cm4cm5cm6c2c4c3cm5c10c6cm43c9cm5cm5cm6cm4_c2cm3cm1c12c8c3c2cm6cm10c13c0cm28c18c19c13cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm20cm4cm5cm6c2c4c3cm5c10c6cm43c9cm5cm5cm6cm4_weight(1)(7-1 downto 0),
			B	=> c2cm3cm1c12c8c3c2cm6cm10c13c0cm28c18c19c13cm7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm20cm4cm5cm6c2c4c3cm5c10c6cm43c9cm5cm5cm6cm4,
			CxB => R_c2cm3cm1c12c8c3c2cm6cm10c13c0cm28c18c19c13cm7
		);

    c17c5c14cm2c3c2c10c1cm18cm23cm2cm51c7c3cm12c5_c10c3c18c7c5c2cm12c2cm3c15cm1c15c5cm8c3c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c17c5c14cm2c3c2c10c1cm18cm23cm2cm51c7c3cm12c5_weight(1)(7-1 downto 0),
			B	=> c10c3c18c7c5c2cm12c2cm3c15cm1c15c5cm8c3c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c17c5c14cm2c3c2c10c1cm18cm23cm2cm51c7c3cm12c5,
			CxB => R_c10c3c18c7c5c2cm12c2cm3c15cm1c15c5cm8c3c0
		);

    c18cm2cm4cm5cm3c4cm2c6cm6cm5c6cm5c2cm1c7cm52_c4cm23cm23c8c1cm2c49cm11cm6cm19cm3c14c0c1cm4cm12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c18cm2cm4cm5cm3c4cm2c6cm6cm5c6cm5c2cm1c7cm52_weight(1)(7-1 downto 0),
			B	=> c4cm23cm23c8c1cm2c49cm11cm6cm19cm3c14c0c1cm4cm12_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c18cm2cm4cm5cm3c4cm2c6cm6cm5c6cm5c2cm1c7cm52,
			CxB => R_c4cm23cm23c8c1cm2c49cm11cm6cm19cm3c14c0c1cm4cm12
		);

    c7c1cm5c1cm2c29cm38cm18cm4c3cm1cm3cm2cm1cm4cm1_cm10cm30c1cm17c14c6c4c2cm14c5cm6cm18cm5c1c36c19_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7c1cm5c1cm2c29cm38cm18cm4c3cm1cm3cm2cm1cm4cm1_weight(1)(7-1 downto 0),
			B	=> cm10cm30c1cm17c14c6c4c2cm14c5cm6cm18cm5c1c36c19_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7c1cm5c1cm2c29cm38cm18cm4c3cm1cm3cm2cm1cm4cm1,
			CxB => R_cm10cm30c1cm17c14c6c4c2cm14c5cm6cm18cm5c1c36c19
		);




end architecture;
