library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core29_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c3cm5c2c0cm12c4c1c4cm4cm7c4c5cm9c7c2c3 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c10c2cm15c11c5c13cm24c8cm10c10c3c9c2cm2cm55cm17 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c6c10c0c0c2c16c6cm3cm6c5c3c3cm10c13c4cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm15c0c13c21cm4c0cm35c35c7cm1c1c4cm16cm12cm3c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm26cm15cm1c18c16c8cm36c2cm6cm5cm3c19cm25cm1cm4cm26 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c4cm2cm7cm16c11cm2cm7cm20cm3c7cm17c12c2cm4cm25cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c27c4c8cm2c24cm20c2c10c31cm6c5cm30c52cm8c1c7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm27cm3cm8c17cm18cm18c5c4cm20c5cm6cm9cm4cm4cm1c9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm6cm17c6c20cm8c5c8c35cm4cm30cm1c15cm23cm42c15c25 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3c2c19c5cm9cm1c5c2cm1c1c9c13cm10cm4cm3cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c10cm21c9c2c13c3cm9cm2c4cm10cm42c4c28c25cm3cm10 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2c1cm27c7c19cm3c43c8c2c0c17c2c23c3cm45c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm20cm7cm4c5cm9cm27cm7cm1c1cm10cm8c3cm15c13cm7cm10 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm15cm4cm6c6c4c6c5cm1cm34c3cm2c4cm14c1c1cm7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm5cm18c17c14c37c3cm55c6cm2cm6c12c24c29c7c38cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm4cm24cm1cm3c1cm8cm11cm11cm3c3c2c7cm18cm17cm11c5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c4cm14c3c6c1cm9c15cm69c7cm13c4cm21cm19c10c11c36 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm17cm3c9cm4c58cm9c4c9cm10c1cm3cm4cm128cm2c0c10 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm3cm11cm5c4c8c1cm5cm1cm5c28c1cm8cm11c0cm13cm26 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm23cm6cm2cm7c2cm10c3cm32cm2c18c1cm8cm6cm4cm2cm49 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3c25c0c0c1cm19c6c1cm1c4cm3c5cm1c11c6c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm26c4c56cm21cm8cm30c11c5c4c9c27cm7cm1c31cm32c26 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0cm30cm32c11c13cm6c22cm5cm32cm8c1c4cm14c0cm29cm10 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm28c22cm31cm4c19cm62cm3cm2cm9c9cm9cm2c1c7c7cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm20cm1c0c24cm10cm5cm26cm1cm1cm2c6c2c17c0cm18c21 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm4c5c3cm2cm6c2cm6cm6c1c8cm3c3cm2c2cm2cm10 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm9c0cm1cm3cm2cm7cm4c13c7cm5cm4c2cm6c4c0cm9 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c13cm8cm3c1c1c18c1c13cm2cm15cm16cm6cm3c48cm14cm17 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm38c2c22c2c5c0cm12c8cm3cm1cm1c6cm6c2c9c11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6cm6c0cm6cm8cm7c5c2cm6c19cm16c3cm10c5cm11c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm14cm1c3c13c8c0cm1cm22cm3c3c4c2c4c2c4c21 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c3cm2c9cm52cm43cm13c9cm61cm1cm3c3cm7c24cm29cm10cm27 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core29_rmcm;

architecture arch of conv7_core29_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM5C2C0CM12C4C1C4CM4CM7C4C5CM9C7C2C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10C2CM15C11C5C13CM24C8CM10C10C3C9C2CM2CM55CM17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C10C0C0C2C16C6CM3CM6C5C3C3CM10C13C4CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15C0C13C21CM4C0CM35C35C7CM1C1C4CM16CM12CM3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM26CM15CM1C18C16C8CM36C2CM6CM5CM3C19CM25CM1CM4CM26_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM2CM7CM16C11CM2CM7CM20CM3C7CM17C12C2CM4CM25CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C27C4C8CM2C24CM20C2C10C31CM6C5CM30C52CM8C1C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM27CM3CM8C17CM18CM18C5C4CM20C5CM6CM9CM4CM4CM1C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM17C6C20CM8C5C8C35CM4CM30CM1C15CM23CM42C15C25_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C2C19C5CM9CM1C5C2CM1C1C9C13CM10CM4CM3CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10CM21C9C2C13C3CM9CM2C4CM10CM42C4C28C25CM3CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1CM27C7C19CM3C43C8C2C0C17C2C23C3CM45C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM20CM7CM4C5CM9CM27CM7CM1C1CM10CM8C3CM15C13CM7CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15CM4CM6C6C4C6C5CM1CM34C3CM2C4CM14C1C1CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM18C17C14C37C3CM55C6CM2CM6C12C24C29C7C38CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM24CM1CM3C1CM8CM11CM11CM3C3C2C7CM18CM17CM11C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM14C3C6C1CM9C15CM69C7CM13C4CM21CM19C10C11C36_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM17CM3C9CM4C58CM9C4C9CM10C1CM3CM4CM128CM2C0C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM11CM5C4C8C1CM5CM1CM5C28C1CM8CM11C0CM13CM26_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM23CM6CM2CM7C2CM10C3CM32CM2C18C1CM8CM6CM4CM2CM49_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C25C0C0C1CM19C6C1CM1C4CM3C5CM1C11C6C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM26C4C56CM21CM8CM30C11C5C4C9C27CM7CM1C31CM32C26_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM30CM32C11C13CM6C22CM5CM32CM8C1C4CM14C0CM29CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM28C22CM31CM4C19CM62CM3CM2CM9C9CM9CM2C1C7C7CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM20CM1C0C24CM10CM5CM26CM1CM1CM2C6C2C17C0CM18C21_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C5C3CM2CM6C2CM6CM6C1C8CM3C3CM2C2CM2CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C0CM1CM3CM2CM7CM4C13C7CM5CM4C2CM6C4C0CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13CM8CM3C1C1C18C1C13CM2CM15CM16CM6CM3C48CM14CM17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM38C2C22C2C5C0CM12C8CM3CM1CM1C6CM6C2C9C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM6C0CM6CM8CM7C5C2CM6C19CM16C3CM10C5CM11C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14CM1C3C13C8C0CM1CM22CM3C3C4C2C4C2C4C21_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM2C9CM52CM43CM13C9CM61CM1CM3C3CM7C24CM29CM10CM27_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c3cm5c2c0cm12c4c1c4cm4cm7c4c5cm9c7c2c3_weight : PIPELINE_TYPE_FOR_C3CM5C2C0CM12C4C1C4CM4CM7C4C5CM9C7C2C3_WEIGHT;
    -- sfix(1, -7)
    signal c10c2cm15c11c5c13cm24c8cm10c10c3c9c2cm2cm55cm17_weight : PIPELINE_TYPE_FOR_C10C2CM15C11C5C13CM24C8CM10C10C3C9C2CM2CM55CM17_WEIGHT;
    -- sfix(1, -7)
    signal c6c10c0c0c2c16c6cm3cm6c5c3c3cm10c13c4cm2_weight : PIPELINE_TYPE_FOR_C6C10C0C0C2C16C6CM3CM6C5C3C3CM10C13C4CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm15c0c13c21cm4c0cm35c35c7cm1c1c4cm16cm12cm3c0_weight : PIPELINE_TYPE_FOR_CM15C0C13C21CM4C0CM35C35C7CM1C1C4CM16CM12CM3C0_WEIGHT;
    -- sfix(1, -7)
    signal cm26cm15cm1c18c16c8cm36c2cm6cm5cm3c19cm25cm1cm4cm26_weight : PIPELINE_TYPE_FOR_CM26CM15CM1C18C16C8CM36C2CM6CM5CM3C19CM25CM1CM4CM26_WEIGHT;
    -- sfix(1, -7)
    signal c4cm2cm7cm16c11cm2cm7cm20cm3c7cm17c12c2cm4cm25cm6_weight : PIPELINE_TYPE_FOR_C4CM2CM7CM16C11CM2CM7CM20CM3C7CM17C12C2CM4CM25CM6_WEIGHT;
    -- sfix(1, -7)
    signal c27c4c8cm2c24cm20c2c10c31cm6c5cm30c52cm8c1c7_weight : PIPELINE_TYPE_FOR_C27C4C8CM2C24CM20C2C10C31CM6C5CM30C52CM8C1C7_WEIGHT;
    -- sfix(1, -7)
    signal cm27cm3cm8c17cm18cm18c5c4cm20c5cm6cm9cm4cm4cm1c9_weight : PIPELINE_TYPE_FOR_CM27CM3CM8C17CM18CM18C5C4CM20C5CM6CM9CM4CM4CM1C9_WEIGHT;
    -- sfix(1, -7)
    signal cm6cm17c6c20cm8c5c8c35cm4cm30cm1c15cm23cm42c15c25_weight : PIPELINE_TYPE_FOR_CM6CM17C6C20CM8C5C8C35CM4CM30CM1C15CM23CM42C15C25_WEIGHT;
    -- sfix(1, -7)
    signal cm3c2c19c5cm9cm1c5c2cm1c1c9c13cm10cm4cm3cm6_weight : PIPELINE_TYPE_FOR_CM3C2C19C5CM9CM1C5C2CM1C1C9C13CM10CM4CM3CM6_WEIGHT;
    -- sfix(1, -7)
    signal c10cm21c9c2c13c3cm9cm2c4cm10cm42c4c28c25cm3cm10_weight : PIPELINE_TYPE_FOR_C10CM21C9C2C13C3CM9CM2C4CM10CM42C4C28C25CM3CM10_WEIGHT;
    -- sfix(1, -7)
    signal cm2c1cm27c7c19cm3c43c8c2c0c17c2c23c3cm45c2_weight : PIPELINE_TYPE_FOR_CM2C1CM27C7C19CM3C43C8C2C0C17C2C23C3CM45C2_WEIGHT;
    -- sfix(1, -7)
    signal cm20cm7cm4c5cm9cm27cm7cm1c1cm10cm8c3cm15c13cm7cm10_weight : PIPELINE_TYPE_FOR_CM20CM7CM4C5CM9CM27CM7CM1C1CM10CM8C3CM15C13CM7CM10_WEIGHT;
    -- sfix(1, -7)
    signal cm15cm4cm6c6c4c6c5cm1cm34c3cm2c4cm14c1c1cm7_weight : PIPELINE_TYPE_FOR_CM15CM4CM6C6C4C6C5CM1CM34C3CM2C4CM14C1C1CM7_WEIGHT;
    -- sfix(1, -7)
    signal cm5cm18c17c14c37c3cm55c6cm2cm6c12c24c29c7c38cm2_weight : PIPELINE_TYPE_FOR_CM5CM18C17C14C37C3CM55C6CM2CM6C12C24C29C7C38CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm24cm1cm3c1cm8cm11cm11cm3c3c2c7cm18cm17cm11c5_weight : PIPELINE_TYPE_FOR_CM4CM24CM1CM3C1CM8CM11CM11CM3C3C2C7CM18CM17CM11C5_WEIGHT;
    -- sfix(1, -7)
    signal c4cm14c3c6c1cm9c15cm69c7cm13c4cm21cm19c10c11c36_weight : PIPELINE_TYPE_FOR_C4CM14C3C6C1CM9C15CM69C7CM13C4CM21CM19C10C11C36_WEIGHT;
    -- sfix(1, -7)
    signal cm17cm3c9cm4c58cm9c4c9cm10c1cm3cm4cm128cm2c0c10_weight : PIPELINE_TYPE_FOR_CM17CM3C9CM4C58CM9C4C9CM10C1CM3CM4CM128CM2C0C10_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm11cm5c4c8c1cm5cm1cm5c28c1cm8cm11c0cm13cm26_weight : PIPELINE_TYPE_FOR_CM3CM11CM5C4C8C1CM5CM1CM5C28C1CM8CM11C0CM13CM26_WEIGHT;
    -- sfix(1, -7)
    signal cm23cm6cm2cm7c2cm10c3cm32cm2c18c1cm8cm6cm4cm2cm49_weight : PIPELINE_TYPE_FOR_CM23CM6CM2CM7C2CM10C3CM32CM2C18C1CM8CM6CM4CM2CM49_WEIGHT;
    -- sfix(1, -7)
    signal c3c25c0c0c1cm19c6c1cm1c4cm3c5cm1c11c6c2_weight : PIPELINE_TYPE_FOR_C3C25C0C0C1CM19C6C1CM1C4CM3C5CM1C11C6C2_WEIGHT;
    -- sfix(1, -7)
    signal cm26c4c56cm21cm8cm30c11c5c4c9c27cm7cm1c31cm32c26_weight : PIPELINE_TYPE_FOR_CM26C4C56CM21CM8CM30C11C5C4C9C27CM7CM1C31CM32C26_WEIGHT;
    -- sfix(1, -7)
    signal c0cm30cm32c11c13cm6c22cm5cm32cm8c1c4cm14c0cm29cm10_weight : PIPELINE_TYPE_FOR_C0CM30CM32C11C13CM6C22CM5CM32CM8C1C4CM14C0CM29CM10_WEIGHT;
    -- sfix(1, -7)
    signal cm28c22cm31cm4c19cm62cm3cm2cm9c9cm9cm2c1c7c7cm4_weight : PIPELINE_TYPE_FOR_CM28C22CM31CM4C19CM62CM3CM2CM9C9CM9CM2C1C7C7CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm20cm1c0c24cm10cm5cm26cm1cm1cm2c6c2c17c0cm18c21_weight : PIPELINE_TYPE_FOR_CM20CM1C0C24CM10CM5CM26CM1CM1CM2C6C2C17C0CM18C21_WEIGHT;
    -- sfix(1, -7)
    signal cm4c5c3cm2cm6c2cm6cm6c1c8cm3c3cm2c2cm2cm10_weight : PIPELINE_TYPE_FOR_CM4C5C3CM2CM6C2CM6CM6C1C8CM3C3CM2C2CM2CM10_WEIGHT;
    -- sfix(1, -7)
    signal cm9c0cm1cm3cm2cm7cm4c13c7cm5cm4c2cm6c4c0cm9_weight : PIPELINE_TYPE_FOR_CM9C0CM1CM3CM2CM7CM4C13C7CM5CM4C2CM6C4C0CM9_WEIGHT;
    -- sfix(1, -7)
    signal c13cm8cm3c1c1c18c1c13cm2cm15cm16cm6cm3c48cm14cm17_weight : PIPELINE_TYPE_FOR_C13CM8CM3C1C1C18C1C13CM2CM15CM16CM6CM3C48CM14CM17_WEIGHT;
    -- sfix(1, -7)
    signal cm38c2c22c2c5c0cm12c8cm3cm1cm1c6cm6c2c9c11_weight : PIPELINE_TYPE_FOR_CM38C2C22C2C5C0CM12C8CM3CM1CM1C6CM6C2C9C11_WEIGHT;
    -- sfix(1, -7)
    signal cm6cm6c0cm6cm8cm7c5c2cm6c19cm16c3cm10c5cm11c2_weight : PIPELINE_TYPE_FOR_CM6CM6C0CM6CM8CM7C5C2CM6C19CM16C3CM10C5CM11C2_WEIGHT;
    -- sfix(1, -7)
    signal cm14cm1c3c13c8c0cm1cm22cm3c3c4c2c4c2c4c21_weight : PIPELINE_TYPE_FOR_CM14CM1C3C13C8C0CM1CM22CM3C3C4C2C4C2C4C21_WEIGHT;
    -- sfix(1, -7)
    signal c3cm2c9cm52cm43cm13c9cm61cm1cm3c3cm7c24cm29cm10cm27_weight : PIPELINE_TYPE_FOR_C3CM2C9CM52CM43CM13C9CM61CM1CM3C3CM7C24CM29CM10CM27_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core29_rmcm_weightsconstant_memory
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
        
            dout1   => c3cm5c2c0cm12c4c1c4cm4cm7c4c5cm9c7c2c3_weight(0), 
            dout2   => c10c2cm15c11c5c13cm24c8cm10c10c3c9c2cm2cm55cm17_weight(0), 
            dout3   => c6c10c0c0c2c16c6cm3cm6c5c3c3cm10c13c4cm2_weight(0), 
            dout4   => cm15c0c13c21cm4c0cm35c35c7cm1c1c4cm16cm12cm3c0_weight(0), 
            dout5   => cm26cm15cm1c18c16c8cm36c2cm6cm5cm3c19cm25cm1cm4cm26_weight(0), 
            dout6   => c4cm2cm7cm16c11cm2cm7cm20cm3c7cm17c12c2cm4cm25cm6_weight(0), 
            dout7   => c27c4c8cm2c24cm20c2c10c31cm6c5cm30c52cm8c1c7_weight(0), 
            dout8   => cm27cm3cm8c17cm18cm18c5c4cm20c5cm6cm9cm4cm4cm1c9_weight(0), 
            dout9   => cm6cm17c6c20cm8c5c8c35cm4cm30cm1c15cm23cm42c15c25_weight(0), 
            dout10   => cm3c2c19c5cm9cm1c5c2cm1c1c9c13cm10cm4cm3cm6_weight(0), 
            dout11   => c10cm21c9c2c13c3cm9cm2c4cm10cm42c4c28c25cm3cm10_weight(0), 
            dout12   => cm2c1cm27c7c19cm3c43c8c2c0c17c2c23c3cm45c2_weight(0), 
            dout13   => cm20cm7cm4c5cm9cm27cm7cm1c1cm10cm8c3cm15c13cm7cm10_weight(0), 
            dout14   => cm15cm4cm6c6c4c6c5cm1cm34c3cm2c4cm14c1c1cm7_weight(0), 
            dout15   => cm5cm18c17c14c37c3cm55c6cm2cm6c12c24c29c7c38cm2_weight(0), 
            dout16   => cm4cm24cm1cm3c1cm8cm11cm11cm3c3c2c7cm18cm17cm11c5_weight(0), 
            dout17   => c4cm14c3c6c1cm9c15cm69c7cm13c4cm21cm19c10c11c36_weight(0), 
            dout18   => cm17cm3c9cm4c58cm9c4c9cm10c1cm3cm4cm128cm2c0c10_weight(0), 
            dout19   => cm3cm11cm5c4c8c1cm5cm1cm5c28c1cm8cm11c0cm13cm26_weight(0), 
            dout20   => cm23cm6cm2cm7c2cm10c3cm32cm2c18c1cm8cm6cm4cm2cm49_weight(0), 
            dout21   => c3c25c0c0c1cm19c6c1cm1c4cm3c5cm1c11c6c2_weight(0), 
            dout22   => cm26c4c56cm21cm8cm30c11c5c4c9c27cm7cm1c31cm32c26_weight(0), 
            dout23   => c0cm30cm32c11c13cm6c22cm5cm32cm8c1c4cm14c0cm29cm10_weight(0), 
            dout24   => cm28c22cm31cm4c19cm62cm3cm2cm9c9cm9cm2c1c7c7cm4_weight(0), 
            dout25   => cm20cm1c0c24cm10cm5cm26cm1cm1cm2c6c2c17c0cm18c21_weight(0), 
            dout26   => cm4c5c3cm2cm6c2cm6cm6c1c8cm3c3cm2c2cm2cm10_weight(0), 
            dout27   => cm9c0cm1cm3cm2cm7cm4c13c7cm5cm4c2cm6c4c0cm9_weight(0), 
            dout28   => c13cm8cm3c1c1c18c1c13cm2cm15cm16cm6cm3c48cm14cm17_weight(0), 
            dout29   => cm38c2c22c2c5c0cm12c8cm3cm1cm1c6cm6c2c9c11_weight(0), 
            dout30   => cm6cm6c0cm6cm8cm7c5c2cm6c19cm16c3cm10c5cm11c2_weight(0), 
            dout31   => cm14cm1c3c13c8c0cm1cm22cm3c3c4c2c4c2c4c21_weight(0), 
            dout32   => c3cm2c9cm52cm43cm13c9cm61cm1cm3c3cm7c24cm29cm10cm27_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c3cm5c2c0cm12c4c1c4cm4cm7c4c5cm9c7c2c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm5c2c0cm12c4c1c4cm4cm7c4c5cm9c7c2c3_weight(0), c3cm5c2c0cm12c4c1c4cm4cm7c4c5cm9c7c2c3_weight(1));
    PL_STEP_0_for_c10c2cm15c11c5c13cm24c8cm10c10c3c9c2cm2cm55cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10c2cm15c11c5c13cm24c8cm10c10c3c9c2cm2cm55cm17_weight(0), c10c2cm15c11c5c13cm24c8cm10c10c3c9c2cm2cm55cm17_weight(1));
    PL_STEP_0_for_c6c10c0c0c2c16c6cm3cm6c5c3c3cm10c13c4cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c10c0c0c2c16c6cm3cm6c5c3c3cm10c13c4cm2_weight(0), c6c10c0c0c2c16c6cm3cm6c5c3c3cm10c13c4cm2_weight(1));
    PL_STEP_0_for_cm15c0c13c21cm4c0cm35c35c7cm1c1c4cm16cm12cm3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15c0c13c21cm4c0cm35c35c7cm1c1c4cm16cm12cm3c0_weight(0), cm15c0c13c21cm4c0cm35c35c7cm1c1c4cm16cm12cm3c0_weight(1));
    PL_STEP_0_for_cm26cm15cm1c18c16c8cm36c2cm6cm5cm3c19cm25cm1cm4cm26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm26cm15cm1c18c16c8cm36c2cm6cm5cm3c19cm25cm1cm4cm26_weight(0), cm26cm15cm1c18c16c8cm36c2cm6cm5cm3c19cm25cm1cm4cm26_weight(1));
    PL_STEP_0_for_c4cm2cm7cm16c11cm2cm7cm20cm3c7cm17c12c2cm4cm25cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm2cm7cm16c11cm2cm7cm20cm3c7cm17c12c2cm4cm25cm6_weight(0), c4cm2cm7cm16c11cm2cm7cm20cm3c7cm17c12c2cm4cm25cm6_weight(1));
    PL_STEP_0_for_c27c4c8cm2c24cm20c2c10c31cm6c5cm30c52cm8c1c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c27c4c8cm2c24cm20c2c10c31cm6c5cm30c52cm8c1c7_weight(0), c27c4c8cm2c24cm20c2c10c31cm6c5cm30c52cm8c1c7_weight(1));
    PL_STEP_0_for_cm27cm3cm8c17cm18cm18c5c4cm20c5cm6cm9cm4cm4cm1c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm27cm3cm8c17cm18cm18c5c4cm20c5cm6cm9cm4cm4cm1c9_weight(0), cm27cm3cm8c17cm18cm18c5c4cm20c5cm6cm9cm4cm4cm1c9_weight(1));
    PL_STEP_0_for_cm6cm17c6c20cm8c5c8c35cm4cm30cm1c15cm23cm42c15c25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm17c6c20cm8c5c8c35cm4cm30cm1c15cm23cm42c15c25_weight(0), cm6cm17c6c20cm8c5c8c35cm4cm30cm1c15cm23cm42c15c25_weight(1));
    PL_STEP_0_for_cm3c2c19c5cm9cm1c5c2cm1c1c9c13cm10cm4cm3cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c2c19c5cm9cm1c5c2cm1c1c9c13cm10cm4cm3cm6_weight(0), cm3c2c19c5cm9cm1c5c2cm1c1c9c13cm10cm4cm3cm6_weight(1));
    PL_STEP_0_for_c10cm21c9c2c13c3cm9cm2c4cm10cm42c4c28c25cm3cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10cm21c9c2c13c3cm9cm2c4cm10cm42c4c28c25cm3cm10_weight(0), c10cm21c9c2c13c3cm9cm2c4cm10cm42c4c28c25cm3cm10_weight(1));
    PL_STEP_0_for_cm2c1cm27c7c19cm3c43c8c2c0c17c2c23c3cm45c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1cm27c7c19cm3c43c8c2c0c17c2c23c3cm45c2_weight(0), cm2c1cm27c7c19cm3c43c8c2c0c17c2c23c3cm45c2_weight(1));
    PL_STEP_0_for_cm20cm7cm4c5cm9cm27cm7cm1c1cm10cm8c3cm15c13cm7cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm20cm7cm4c5cm9cm27cm7cm1c1cm10cm8c3cm15c13cm7cm10_weight(0), cm20cm7cm4c5cm9cm27cm7cm1c1cm10cm8c3cm15c13cm7cm10_weight(1));
    PL_STEP_0_for_cm15cm4cm6c6c4c6c5cm1cm34c3cm2c4cm14c1c1cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15cm4cm6c6c4c6c5cm1cm34c3cm2c4cm14c1c1cm7_weight(0), cm15cm4cm6c6c4c6c5cm1cm34c3cm2c4cm14c1c1cm7_weight(1));
    PL_STEP_0_for_cm5cm18c17c14c37c3cm55c6cm2cm6c12c24c29c7c38cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm18c17c14c37c3cm55c6cm2cm6c12c24c29c7c38cm2_weight(0), cm5cm18c17c14c37c3cm55c6cm2cm6c12c24c29c7c38cm2_weight(1));
    PL_STEP_0_for_cm4cm24cm1cm3c1cm8cm11cm11cm3c3c2c7cm18cm17cm11c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm24cm1cm3c1cm8cm11cm11cm3c3c2c7cm18cm17cm11c5_weight(0), cm4cm24cm1cm3c1cm8cm11cm11cm3c3c2c7cm18cm17cm11c5_weight(1));
    PL_STEP_0_for_c4cm14c3c6c1cm9c15cm69c7cm13c4cm21cm19c10c11c36_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm14c3c6c1cm9c15cm69c7cm13c4cm21cm19c10c11c36_weight(0), c4cm14c3c6c1cm9c15cm69c7cm13c4cm21cm19c10c11c36_weight(1));
    PL_STEP_0_for_cm17cm3c9cm4c58cm9c4c9cm10c1cm3cm4cm128cm2c0c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm17cm3c9cm4c58cm9c4c9cm10c1cm3cm4cm128cm2c0c10_weight(0), cm17cm3c9cm4c58cm9c4c9cm10c1cm3cm4cm128cm2c0c10_weight(1));
    PL_STEP_0_for_cm3cm11cm5c4c8c1cm5cm1cm5c28c1cm8cm11c0cm13cm26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm11cm5c4c8c1cm5cm1cm5c28c1cm8cm11c0cm13cm26_weight(0), cm3cm11cm5c4c8c1cm5cm1cm5c28c1cm8cm11c0cm13cm26_weight(1));
    PL_STEP_0_for_cm23cm6cm2cm7c2cm10c3cm32cm2c18c1cm8cm6cm4cm2cm49_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm23cm6cm2cm7c2cm10c3cm32cm2c18c1cm8cm6cm4cm2cm49_weight(0), cm23cm6cm2cm7c2cm10c3cm32cm2c18c1cm8cm6cm4cm2cm49_weight(1));
    PL_STEP_0_for_c3c25c0c0c1cm19c6c1cm1c4cm3c5cm1c11c6c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c25c0c0c1cm19c6c1cm1c4cm3c5cm1c11c6c2_weight(0), c3c25c0c0c1cm19c6c1cm1c4cm3c5cm1c11c6c2_weight(1));
    PL_STEP_0_for_cm26c4c56cm21cm8cm30c11c5c4c9c27cm7cm1c31cm32c26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm26c4c56cm21cm8cm30c11c5c4c9c27cm7cm1c31cm32c26_weight(0), cm26c4c56cm21cm8cm30c11c5c4c9c27cm7cm1c31cm32c26_weight(1));
    PL_STEP_0_for_c0cm30cm32c11c13cm6c22cm5cm32cm8c1c4cm14c0cm29cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm30cm32c11c13cm6c22cm5cm32cm8c1c4cm14c0cm29cm10_weight(0), c0cm30cm32c11c13cm6c22cm5cm32cm8c1c4cm14c0cm29cm10_weight(1));
    PL_STEP_0_for_cm28c22cm31cm4c19cm62cm3cm2cm9c9cm9cm2c1c7c7cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm28c22cm31cm4c19cm62cm3cm2cm9c9cm9cm2c1c7c7cm4_weight(0), cm28c22cm31cm4c19cm62cm3cm2cm9c9cm9cm2c1c7c7cm4_weight(1));
    PL_STEP_0_for_cm20cm1c0c24cm10cm5cm26cm1cm1cm2c6c2c17c0cm18c21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm20cm1c0c24cm10cm5cm26cm1cm1cm2c6c2c17c0cm18c21_weight(0), cm20cm1c0c24cm10cm5cm26cm1cm1cm2c6c2c17c0cm18c21_weight(1));
    PL_STEP_0_for_cm4c5c3cm2cm6c2cm6cm6c1c8cm3c3cm2c2cm2cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c5c3cm2cm6c2cm6cm6c1c8cm3c3cm2c2cm2cm10_weight(0), cm4c5c3cm2cm6c2cm6cm6c1c8cm3c3cm2c2cm2cm10_weight(1));
    PL_STEP_0_for_cm9c0cm1cm3cm2cm7cm4c13c7cm5cm4c2cm6c4c0cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c0cm1cm3cm2cm7cm4c13c7cm5cm4c2cm6c4c0cm9_weight(0), cm9c0cm1cm3cm2cm7cm4c13c7cm5cm4c2cm6c4c0cm9_weight(1));
    PL_STEP_0_for_c13cm8cm3c1c1c18c1c13cm2cm15cm16cm6cm3c48cm14cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13cm8cm3c1c1c18c1c13cm2cm15cm16cm6cm3c48cm14cm17_weight(0), c13cm8cm3c1c1c18c1c13cm2cm15cm16cm6cm3c48cm14cm17_weight(1));
    PL_STEP_0_for_cm38c2c22c2c5c0cm12c8cm3cm1cm1c6cm6c2c9c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm38c2c22c2c5c0cm12c8cm3cm1cm1c6cm6c2c9c11_weight(0), cm38c2c22c2c5c0cm12c8cm3cm1cm1c6cm6c2c9c11_weight(1));
    PL_STEP_0_for_cm6cm6c0cm6cm8cm7c5c2cm6c19cm16c3cm10c5cm11c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm6c0cm6cm8cm7c5c2cm6c19cm16c3cm10c5cm11c2_weight(0), cm6cm6c0cm6cm8cm7c5c2cm6c19cm16c3cm10c5cm11c2_weight(1));
    PL_STEP_0_for_cm14cm1c3c13c8c0cm1cm22cm3c3c4c2c4c2c4c21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14cm1c3c13c8c0cm1cm22cm3c3c4c2c4c2c4c21_weight(0), cm14cm1c3c13c8c0cm1cm22cm3c3c4c2c4c2c4c21_weight(1));
    PL_STEP_0_for_c3cm2c9cm52cm43cm13c9cm61cm1cm3c3cm7c24cm29cm10cm27_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm2c9cm52cm43cm13c9cm61cm1cm3c3cm7c24cm29cm10cm27_weight(0), c3cm2c9cm52cm43cm13c9cm61cm1cm3c3cm7c24cm29cm10cm27_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c4cm14c3c6c1cm9c15cm69c7cm13c4cm21cm19c10c11c36_cm9c0cm1cm3cm2cm7cm4c13c7cm5cm4c2cm6c4c0cm9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4cm14c3c6c1cm9c15cm69c7cm13c4cm21cm19c10c11c36_weight(1)(8-1 downto 0),
			B	=> cm9c0cm1cm3cm2cm7cm4c13c7cm5cm4c2cm6c4c0cm9_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4cm14c3c6c1cm9c15cm69c7cm13c4cm21cm19c10c11c36,
			CxB => R_cm9c0cm1cm3cm2cm7cm4c13c7cm5cm4c2cm6c4c0cm9
		);

    cm17cm3c9cm4c58cm9c4c9cm10c1cm3cm4cm128cm2c0c10_cm4c5c3cm2cm6c2cm6cm6c1c8cm3c3cm2c2cm2cm10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm17cm3c9cm4c58cm9c4c9cm10c1cm3cm4cm128cm2c0c10_weight(1)(8-1 downto 0),
			B	=> cm4c5c3cm2cm6c2cm6cm6c1c8cm3c3cm2c2cm2cm10_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm17cm3c9cm4c58cm9c4c9cm10c1cm3cm4cm128cm2c0c10,
			CxB => R_cm4c5c3cm2cm6c2cm6cm6c1c8cm3c3cm2c2cm2cm10
		);

    c10c2cm15c11c5c13cm24c8cm10c10c3c9c2cm2cm55cm17_c3cm5c2c0cm12c4c1c4cm4cm7c4c5cm9c7c2c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c10c2cm15c11c5c13cm24c8cm10c10c3c9c2cm2cm55cm17_weight(1)(7-1 downto 0),
			B	=> c3cm5c2c0cm12c4c1c4cm4cm7c4c5cm9c7c2c3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c10c2cm15c11c5c13cm24c8cm10c10c3c9c2cm2cm55cm17,
			CxB => R_c3cm5c2c0cm12c4c1c4cm4cm7c4c5cm9c7c2c3
		);

    cm15c0c13c21cm4c0cm35c35c7cm1c1c4cm16cm12cm3c0_cm14cm1c3c13c8c0cm1cm22cm3c3c4c2c4c2c4c21_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm15c0c13c21cm4c0cm35c35c7cm1c1c4cm16cm12cm3c0_weight(1)(7-1 downto 0),
			B	=> cm14cm1c3c13c8c0cm1cm22cm3c3c4c2c4c2c4c21_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm15c0c13c21cm4c0cm35c35c7cm1c1c4cm16cm12cm3c0,
			CxB => R_cm14cm1c3c13c8c0cm1cm22cm3c3c4c2c4c2c4c21
		);

    cm26cm15cm1c18c16c8cm36c2cm6cm5cm3c19cm25cm1cm4cm26_cm6cm6c0cm6cm8cm7c5c2cm6c19cm16c3cm10c5cm11c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm26cm15cm1c18c16c8cm36c2cm6cm5cm3c19cm25cm1cm4cm26_weight(1)(7-1 downto 0),
			B	=> cm6cm6c0cm6cm8cm7c5c2cm6c19cm16c3cm10c5cm11c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm26cm15cm1c18c16c8cm36c2cm6cm5cm3c19cm25cm1cm4cm26,
			CxB => R_cm6cm6c0cm6cm8cm7c5c2cm6c19cm16c3cm10c5cm11c2
		);

    c27c4c8cm2c24cm20c2c10c31cm6c5cm30c52cm8c1c7_cm20cm1c0c24cm10cm5cm26cm1cm1cm2c6c2c17c0cm18c21_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c27c4c8cm2c24cm20c2c10c31cm6c5cm30c52cm8c1c7_weight(1)(7-1 downto 0),
			B	=> cm20cm1c0c24cm10cm5cm26cm1cm1cm2c6c2c17c0cm18c21_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c27c4c8cm2c24cm20c2c10c31cm6c5cm30c52cm8c1c7,
			CxB => R_cm20cm1c0c24cm10cm5cm26cm1cm1cm2c6c2c17c0cm18c21
		);

    cm6cm17c6c20cm8c5c8c35cm4cm30cm1c15cm23cm42c15c25_c0cm30cm32c11c13cm6c22cm5cm32cm8c1c4cm14c0cm29cm10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6cm17c6c20cm8c5c8c35cm4cm30cm1c15cm23cm42c15c25_weight(1)(7-1 downto 0),
			B	=> c0cm30cm32c11c13cm6c22cm5cm32cm8c1c4cm14c0cm29cm10_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6cm17c6c20cm8c5c8c35cm4cm30cm1c15cm23cm42c15c25,
			CxB => R_c0cm30cm32c11c13cm6c22cm5cm32cm8c1c4cm14c0cm29cm10
		);

    c10cm21c9c2c13c3cm9cm2c4cm10cm42c4c28c25cm3cm10_c3c25c0c0c1cm19c6c1cm1c4cm3c5cm1c11c6c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c10cm21c9c2c13c3cm9cm2c4cm10cm42c4c28c25cm3cm10_weight(1)(7-1 downto 0),
			B	=> c3c25c0c0c1cm19c6c1cm1c4cm3c5cm1c11c6c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c10cm21c9c2c13c3cm9cm2c4cm10cm42c4c28c25cm3cm10,
			CxB => R_c3c25c0c0c1cm19c6c1cm1c4cm3c5cm1c11c6c2
		);

    cm2c1cm27c7c19cm3c43c8c2c0c17c2c23c3cm45c2_cm3cm11cm5c4c8c1cm5cm1cm5c28c1cm8cm11c0cm13cm26_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c1cm27c7c19cm3c43c8c2c0c17c2c23c3cm45c2_weight(1)(7-1 downto 0),
			B	=> cm3cm11cm5c4c8c1cm5cm1cm5c28c1cm8cm11c0cm13cm26_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c1cm27c7c19cm3c43c8c2c0c17c2c23c3cm45c2,
			CxB => R_cm3cm11cm5c4c8c1cm5cm1cm5c28c1cm8cm11c0cm13cm26
		);

    cm15cm4cm6c6c4c6c5cm1cm34c3cm2c4cm14c1c1cm7_cm4cm24cm1cm3c1cm8cm11cm11cm3c3c2c7cm18cm17cm11c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm15cm4cm6c6c4c6c5cm1cm34c3cm2c4cm14c1c1cm7_weight(1)(7-1 downto 0),
			B	=> cm4cm24cm1cm3c1cm8cm11cm11cm3c3c2c7cm18cm17cm11c5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm15cm4cm6c6c4c6c5cm1cm34c3cm2c4cm14c1c1cm7,
			CxB => R_cm4cm24cm1cm3c1cm8cm11cm11cm3c3c2c7cm18cm17cm11c5
		);

    cm5cm18c17c14c37c3cm55c6cm2cm6c12c24c29c7c38cm2_cm20cm7cm4c5cm9cm27cm7cm1c1cm10cm8c3cm15c13cm7cm10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5cm18c17c14c37c3cm55c6cm2cm6c12c24c29c7c38cm2_weight(1)(7-1 downto 0),
			B	=> cm20cm7cm4c5cm9cm27cm7cm1c1cm10cm8c3cm15c13cm7cm10_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5cm18c17c14c37c3cm55c6cm2cm6c12c24c29c7c38cm2,
			CxB => R_cm20cm7cm4c5cm9cm27cm7cm1c1cm10cm8c3cm15c13cm7cm10
		);

    cm23cm6cm2cm7c2cm10c3cm32cm2c18c1cm8cm6cm4cm2cm49_cm3c2c19c5cm9cm1c5c2cm1c1c9c13cm10cm4cm3cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm23cm6cm2cm7c2cm10c3cm32cm2c18c1cm8cm6cm4cm2cm49_weight(1)(7-1 downto 0),
			B	=> cm3c2c19c5cm9cm1c5c2cm1c1c9c13cm10cm4cm3cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm23cm6cm2cm7c2cm10c3cm32cm2c18c1cm8cm6cm4cm2cm49,
			CxB => R_cm3c2c19c5cm9cm1c5c2cm1c1c9c13cm10cm4cm3cm6
		);

    cm26c4c56cm21cm8cm30c11c5c4c9c27cm7cm1c31cm32c26_cm27cm3cm8c17cm18cm18c5c4cm20c5cm6cm9cm4cm4cm1c9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm26c4c56cm21cm8cm30c11c5c4c9c27cm7cm1c31cm32c26_weight(1)(7-1 downto 0),
			B	=> cm27cm3cm8c17cm18cm18c5c4cm20c5cm6cm9cm4cm4cm1c9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm26c4c56cm21cm8cm30c11c5c4c9c27cm7cm1c31cm32c26,
			CxB => R_cm27cm3cm8c17cm18cm18c5c4cm20c5cm6cm9cm4cm4cm1c9
		);

    cm28c22cm31cm4c19cm62cm3cm2cm9c9cm9cm2c1c7c7cm4_c4cm2cm7cm16c11cm2cm7cm20cm3c7cm17c12c2cm4cm25cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm28c22cm31cm4c19cm62cm3cm2cm9c9cm9cm2c1c7c7cm4_weight(1)(7-1 downto 0),
			B	=> c4cm2cm7cm16c11cm2cm7cm20cm3c7cm17c12c2cm4cm25cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm28c22cm31cm4c19cm62cm3cm2cm9c9cm9cm2c1c7c7cm4,
			CxB => R_c4cm2cm7cm16c11cm2cm7cm20cm3c7cm17c12c2cm4cm25cm6
		);

    c13cm8cm3c1c1c18c1c13cm2cm15cm16cm6cm3c48cm14cm17_c6c10c0c0c2c16c6cm3cm6c5c3c3cm10c13c4cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c13cm8cm3c1c1c18c1c13cm2cm15cm16cm6cm3c48cm14cm17_weight(1)(7-1 downto 0),
			B	=> c6c10c0c0c2c16c6cm3cm6c5c3c3cm10c13c4cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c13cm8cm3c1c1c18c1c13cm2cm15cm16cm6cm3c48cm14cm17,
			CxB => R_c6c10c0c0c2c16c6cm3cm6c5c3c3cm10c13c4cm2
		);

    cm38c2c22c2c5c0cm12c8cm3cm1cm1c6cm6c2c9c11_c3cm2c9cm52cm43cm13c9cm61cm1cm3c3cm7c24cm29cm10cm27_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm38c2c22c2c5c0cm12c8cm3cm1cm1c6cm6c2c9c11_weight(1)(7-1 downto 0),
			B	=> c3cm2c9cm52cm43cm13c9cm61cm1cm3c3cm7c24cm29cm10cm27_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm38c2c22c2c5c0cm12c8cm3cm1cm1c6cm6c2c9c11,
			CxB => R_c3cm2c9cm52cm43cm13c9cm61cm1cm3c3cm7c24cm29cm10cm27
		);




end architecture;
