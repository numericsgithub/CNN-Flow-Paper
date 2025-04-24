library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core6_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c7cm4cm15cm5c2cm2c9c1c6cm8c9c3c0c5cm14c7 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c8c1c4cm15cm2cm12c15c16c9c2cm10c1c3cm1c6cm26 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1cm5cm12c0cm8c4cm3cm2c28cm1c23c8c3cm16cm9cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm15cm4c13cm8cm8c20c41c30cm8c0cm13cm16cm8c6cm12c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2c6cm10c6c51cm15cm5c2cm12cm11cm13c8cm4c4c6c15 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm7c4c34c9c7c4c28cm1c2c3c3cm11c2cm13cm6cm16 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c8c12cm3c3cm2cm9c3c5c0c5c3c13cm10c13c1c0 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c23c0cm5c6cm61c4cm13c2cm3c9cm2cm2c8cm9c6cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c4c2c19cm5cm9cm30c0c8c7cm8c2c23cm9c2c5cm11 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c10cm2cm16cm8c0c2cm13c11cm2c5c11cm7cm1cm1c16c15 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c7cm1c9cm23cm24cm36c7cm2c6cm49c4cm6c4cm6c6cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3cm3c0c2cm1c1cm13c2cm4c2cm9c13cm3c1cm3cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm6c6cm2cm2cm10cm16cm7c1cm2cm11cm5c18c6cm7c0c9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c16cm12cm10c10cm59cm6cm7c8c11cm4cm4c0cm6c11c10cm9 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm23cm15cm2cm12c1cm10c1c9cm6cm4cm4c26cm14c0c4c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm16cm42c4cm22c0c17c0cm25cm3cm7c8cm5c3c127c11c44 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c3c3c1c14c33c18c8c15cm2cm16c4cm3cm17cm29c24c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c14c5cm1cm33cm6c4c9c0cm9c3c5c0cm4cm17c3cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3cm7cm19c2cm7cm10cm3c6cm4cm4cm4cm27c10c2c12c10 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1c2cm2c15cm38cm4c2cm7c27c7cm5c8c1c12c1cm6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3c7cm8cm2cm2cm15c0c5cm3c3c2c16c0cm5cm8cm40 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm14c8cm5cm1cm18c20c51cm19cm6c2c27c6cm1c1cm13cm15 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c1c7c2cm43cm23cm28cm40c1c12cm8cm3c2cm27cm5cm3c6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c1cm15c7c4cm5cm5cm9c3cm6cm1cm13cm1cm3cm4cm11c11 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm12c3c13cm5cm24cm1c3cm14cm4cm5c0c1cm25c0c6cm12 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm6cm21cm1cm6c2c8cm1cm8cm1cm14c0cm1c29cm14cm36c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm7c3cm1c5c5cm21cm3cm5c5cm25c5cm3cm5c5c3cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm12cm7c14cm5c32cm34cm5cm6c11cm22cm19c2cm35cm13c23c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm5c0cm2cm4c5cm28c1c2cm7cm11c0c11cm18c0c4cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c15c21c7cm11cm5c3c0c2c6cm3c8cm5cm4c9c1cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm9cm4c1c16cm36c14c0c8cm13c1c11c19c0c14c8c15 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c8cm9c5c15cm6c35c4cm5c1cm1c17cm18cm6cm1cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core6_rmcm;

architecture arch of conv7_core6_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM4CM15CM5C2CM2C9C1C6CM8C9C3C0C5CM14C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C1C4CM15CM2CM12C15C16C9C2CM10C1C3CM1C6CM26_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM5CM12C0CM8C4CM3CM2C28CM1C23C8C3CM16CM9CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15CM4C13CM8CM8C20C41C30CM8C0CM13CM16CM8C6CM12C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C6CM10C6C51CM15CM5C2CM12CM11CM13C8CM4C4C6C15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C4C34C9C7C4C28CM1C2C3C3CM11C2CM13CM6CM16_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C12CM3C3CM2CM9C3C5C0C5C3C13CM10C13C1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C23C0CM5C6CM61C4CM13C2CM3C9CM2CM2C8CM9C6CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C2C19CM5CM9CM30C0C8C7CM8C2C23CM9C2C5CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10CM2CM16CM8C0C2CM13C11CM2C5C11CM7CM1CM1C16C15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM1C9CM23CM24CM36C7CM2C6CM49C4CM6C4CM6C6CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM3C0C2CM1C1CM13C2CM4C2CM9C13CM3C1CM3CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C6CM2CM2CM10CM16CM7C1CM2CM11CM5C18C6CM7C0C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C16CM12CM10C10CM59CM6CM7C8C11CM4CM4C0CM6C11C10CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM23CM15CM2CM12C1CM10C1C9CM6CM4CM4C26CM14C0C4C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM16CM42C4CM22C0C17C0CM25CM3CM7C8CM5C3C127C11C44_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C3C1C14C33C18C8C15CM2CM16C4CM3CM17CM29C24C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14C5CM1CM33CM6C4C9C0CM9C3C5C0CM4CM17C3CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM7CM19C2CM7CM10CM3C6CM4CM4CM4CM27C10C2C12C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C2CM2C15CM38CM4C2CM7C27C7CM5C8C1C12C1CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C7CM8CM2CM2CM15C0C5CM3C3C2C16C0CM5CM8CM40_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14C8CM5CM1CM18C20C51CM19CM6C2C27C6CM1C1CM13CM15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C7C2CM43CM23CM28CM40C1C12CM8CM3C2CM27CM5CM3C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM15C7C4CM5CM5CM9C3CM6CM1CM13CM1CM3CM4CM11C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12C3C13CM5CM24CM1C3CM14CM4CM5C0C1CM25C0C6CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM21CM1CM6C2C8CM1CM8CM1CM14C0CM1C29CM14CM36C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C3CM1C5C5CM21CM3CM5C5CM25C5CM3CM5C5C3CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12CM7C14CM5C32CM34CM5CM6C11CM22CM19C2CM35CM13C23C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C0CM2CM4C5CM28C1C2CM7CM11C0C11CM18C0C4CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C15C21C7CM11CM5C3C0C2C6CM3C8CM5CM4C9C1CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9CM4C1C16CM36C14C0C8CM13C1C11C19C0C14C8C15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C8CM9C5C15CM6C35C4CM5C1CM1C17CM18CM6CM1CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c7cm4cm15cm5c2cm2c9c1c6cm8c9c3c0c5cm14c7_weight : PIPELINE_TYPE_FOR_C7CM4CM15CM5C2CM2C9C1C6CM8C9C3C0C5CM14C7_WEIGHT;
    -- sfix(1, -7)
    signal c8c1c4cm15cm2cm12c15c16c9c2cm10c1c3cm1c6cm26_weight : PIPELINE_TYPE_FOR_C8C1C4CM15CM2CM12C15C16C9C2CM10C1C3CM1C6CM26_WEIGHT;
    -- sfix(1, -7)
    signal c1cm5cm12c0cm8c4cm3cm2c28cm1c23c8c3cm16cm9cm8_weight : PIPELINE_TYPE_FOR_C1CM5CM12C0CM8C4CM3CM2C28CM1C23C8C3CM16CM9CM8_WEIGHT;
    -- sfix(1, -7)
    signal cm15cm4c13cm8cm8c20c41c30cm8c0cm13cm16cm8c6cm12c2_weight : PIPELINE_TYPE_FOR_CM15CM4C13CM8CM8C20C41C30CM8C0CM13CM16CM8C6CM12C2_WEIGHT;
    -- sfix(1, -7)
    signal cm2c6cm10c6c51cm15cm5c2cm12cm11cm13c8cm4c4c6c15_weight : PIPELINE_TYPE_FOR_CM2C6CM10C6C51CM15CM5C2CM12CM11CM13C8CM4C4C6C15_WEIGHT;
    -- sfix(1, -7)
    signal cm7c4c34c9c7c4c28cm1c2c3c3cm11c2cm13cm6cm16_weight : PIPELINE_TYPE_FOR_CM7C4C34C9C7C4C28CM1C2C3C3CM11C2CM13CM6CM16_WEIGHT;
    -- sfix(1, -7)
    signal c8c12cm3c3cm2cm9c3c5c0c5c3c13cm10c13c1c0_weight : PIPELINE_TYPE_FOR_C8C12CM3C3CM2CM9C3C5C0C5C3C13CM10C13C1C0_WEIGHT;
    -- sfix(1, -7)
    signal c23c0cm5c6cm61c4cm13c2cm3c9cm2cm2c8cm9c6cm5_weight : PIPELINE_TYPE_FOR_C23C0CM5C6CM61C4CM13C2CM3C9CM2CM2C8CM9C6CM5_WEIGHT;
    -- sfix(1, -7)
    signal c4c2c19cm5cm9cm30c0c8c7cm8c2c23cm9c2c5cm11_weight : PIPELINE_TYPE_FOR_C4C2C19CM5CM9CM30C0C8C7CM8C2C23CM9C2C5CM11_WEIGHT;
    -- sfix(1, -7)
    signal c10cm2cm16cm8c0c2cm13c11cm2c5c11cm7cm1cm1c16c15_weight : PIPELINE_TYPE_FOR_C10CM2CM16CM8C0C2CM13C11CM2C5C11CM7CM1CM1C16C15_WEIGHT;
    -- sfix(1, -7)
    signal c7cm1c9cm23cm24cm36c7cm2c6cm49c4cm6c4cm6c6cm4_weight : PIPELINE_TYPE_FOR_C7CM1C9CM23CM24CM36C7CM2C6CM49C4CM6C4CM6C6CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm3c0c2cm1c1cm13c2cm4c2cm9c13cm3c1cm3cm1_weight : PIPELINE_TYPE_FOR_CM3CM3C0C2CM1C1CM13C2CM4C2CM9C13CM3C1CM3CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm6c6cm2cm2cm10cm16cm7c1cm2cm11cm5c18c6cm7c0c9_weight : PIPELINE_TYPE_FOR_CM6C6CM2CM2CM10CM16CM7C1CM2CM11CM5C18C6CM7C0C9_WEIGHT;
    -- sfix(1, -7)
    signal c16cm12cm10c10cm59cm6cm7c8c11cm4cm4c0cm6c11c10cm9_weight : PIPELINE_TYPE_FOR_C16CM12CM10C10CM59CM6CM7C8C11CM4CM4C0CM6C11C10CM9_WEIGHT;
    -- sfix(1, -7)
    signal cm23cm15cm2cm12c1cm10c1c9cm6cm4cm4c26cm14c0c4c0_weight : PIPELINE_TYPE_FOR_CM23CM15CM2CM12C1CM10C1C9CM6CM4CM4C26CM14C0C4C0_WEIGHT;
    -- sfix(1, -7)
    signal cm16cm42c4cm22c0c17c0cm25cm3cm7c8cm5c3c127c11c44_weight : PIPELINE_TYPE_FOR_CM16CM42C4CM22C0C17C0CM25CM3CM7C8CM5C3C127C11C44_WEIGHT;
    -- sfix(1, -7)
    signal c3c3c1c14c33c18c8c15cm2cm16c4cm3cm17cm29c24c4_weight : PIPELINE_TYPE_FOR_C3C3C1C14C33C18C8C15CM2CM16C4CM3CM17CM29C24C4_WEIGHT;
    -- sfix(1, -7)
    signal c14c5cm1cm33cm6c4c9c0cm9c3c5c0cm4cm17c3cm5_weight : PIPELINE_TYPE_FOR_C14C5CM1CM33CM6C4C9C0CM9C3C5C0CM4CM17C3CM5_WEIGHT;
    -- sfix(1, -7)
    signal c3cm7cm19c2cm7cm10cm3c6cm4cm4cm4cm27c10c2c12c10_weight : PIPELINE_TYPE_FOR_C3CM7CM19C2CM7CM10CM3C6CM4CM4CM4CM27C10C2C12C10_WEIGHT;
    -- sfix(1, -7)
    signal c1c2cm2c15cm38cm4c2cm7c27c7cm5c8c1c12c1cm6_weight : PIPELINE_TYPE_FOR_C1C2CM2C15CM38CM4C2CM7C27C7CM5C8C1C12C1CM6_WEIGHT;
    -- sfix(1, -7)
    signal c3c7cm8cm2cm2cm15c0c5cm3c3c2c16c0cm5cm8cm40_weight : PIPELINE_TYPE_FOR_C3C7CM8CM2CM2CM15C0C5CM3C3C2C16C0CM5CM8CM40_WEIGHT;
    -- sfix(1, -7)
    signal cm14c8cm5cm1cm18c20c51cm19cm6c2c27c6cm1c1cm13cm15_weight : PIPELINE_TYPE_FOR_CM14C8CM5CM1CM18C20C51CM19CM6C2C27C6CM1C1CM13CM15_WEIGHT;
    -- sfix(1, -7)
    signal c1c7c2cm43cm23cm28cm40c1c12cm8cm3c2cm27cm5cm3c6_weight : PIPELINE_TYPE_FOR_C1C7C2CM43CM23CM28CM40C1C12CM8CM3C2CM27CM5CM3C6_WEIGHT;
    -- sfix(1, -7)
    signal c1cm15c7c4cm5cm5cm9c3cm6cm1cm13cm1cm3cm4cm11c11_weight : PIPELINE_TYPE_FOR_C1CM15C7C4CM5CM5CM9C3CM6CM1CM13CM1CM3CM4CM11C11_WEIGHT;
    -- sfix(1, -7)
    signal cm12c3c13cm5cm24cm1c3cm14cm4cm5c0c1cm25c0c6cm12_weight : PIPELINE_TYPE_FOR_CM12C3C13CM5CM24CM1C3CM14CM4CM5C0C1CM25C0C6CM12_WEIGHT;
    -- sfix(1, -7)
    signal cm6cm21cm1cm6c2c8cm1cm8cm1cm14c0cm1c29cm14cm36c2_weight : PIPELINE_TYPE_FOR_CM6CM21CM1CM6C2C8CM1CM8CM1CM14C0CM1C29CM14CM36C2_WEIGHT;
    -- sfix(1, -7)
    signal cm7c3cm1c5c5cm21cm3cm5c5cm25c5cm3cm5c5c3cm1_weight : PIPELINE_TYPE_FOR_CM7C3CM1C5C5CM21CM3CM5C5CM25C5CM3CM5C5C3CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm12cm7c14cm5c32cm34cm5cm6c11cm22cm19c2cm35cm13c23c2_weight : PIPELINE_TYPE_FOR_CM12CM7C14CM5C32CM34CM5CM6C11CM22CM19C2CM35CM13C23C2_WEIGHT;
    -- sfix(1, -7)
    signal cm5c0cm2cm4c5cm28c1c2cm7cm11c0c11cm18c0c4cm2_weight : PIPELINE_TYPE_FOR_CM5C0CM2CM4C5CM28C1C2CM7CM11C0C11CM18C0C4CM2_WEIGHT;
    -- sfix(1, -7)
    signal c15c21c7cm11cm5c3c0c2c6cm3c8cm5cm4c9c1cm8_weight : PIPELINE_TYPE_FOR_C15C21C7CM11CM5C3C0C2C6CM3C8CM5CM4C9C1CM8_WEIGHT;
    -- sfix(1, -7)
    signal cm9cm4c1c16cm36c14c0c8cm13c1c11c19c0c14c8c15_weight : PIPELINE_TYPE_FOR_CM9CM4C1C16CM36C14C0C8CM13C1C11C19C0C14C8C15_WEIGHT;
    -- sfix(1, -7)
    signal c0c8cm9c5c15cm6c35c4cm5c1cm1c17cm18cm6cm1cm3_weight : PIPELINE_TYPE_FOR_C0C8CM9C5C15CM6C35C4CM5C1CM1C17CM18CM6CM1CM3_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core6_rmcm_weightsconstant_memory
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
        
            dout1   => c7cm4cm15cm5c2cm2c9c1c6cm8c9c3c0c5cm14c7_weight(0), 
            dout2   => c8c1c4cm15cm2cm12c15c16c9c2cm10c1c3cm1c6cm26_weight(0), 
            dout3   => c1cm5cm12c0cm8c4cm3cm2c28cm1c23c8c3cm16cm9cm8_weight(0), 
            dout4   => cm15cm4c13cm8cm8c20c41c30cm8c0cm13cm16cm8c6cm12c2_weight(0), 
            dout5   => cm2c6cm10c6c51cm15cm5c2cm12cm11cm13c8cm4c4c6c15_weight(0), 
            dout6   => cm7c4c34c9c7c4c28cm1c2c3c3cm11c2cm13cm6cm16_weight(0), 
            dout7   => c8c12cm3c3cm2cm9c3c5c0c5c3c13cm10c13c1c0_weight(0), 
            dout8   => c23c0cm5c6cm61c4cm13c2cm3c9cm2cm2c8cm9c6cm5_weight(0), 
            dout9   => c4c2c19cm5cm9cm30c0c8c7cm8c2c23cm9c2c5cm11_weight(0), 
            dout10   => c10cm2cm16cm8c0c2cm13c11cm2c5c11cm7cm1cm1c16c15_weight(0), 
            dout11   => c7cm1c9cm23cm24cm36c7cm2c6cm49c4cm6c4cm6c6cm4_weight(0), 
            dout12   => cm3cm3c0c2cm1c1cm13c2cm4c2cm9c13cm3c1cm3cm1_weight(0), 
            dout13   => cm6c6cm2cm2cm10cm16cm7c1cm2cm11cm5c18c6cm7c0c9_weight(0), 
            dout14   => c16cm12cm10c10cm59cm6cm7c8c11cm4cm4c0cm6c11c10cm9_weight(0), 
            dout15   => cm23cm15cm2cm12c1cm10c1c9cm6cm4cm4c26cm14c0c4c0_weight(0), 
            dout16   => cm16cm42c4cm22c0c17c0cm25cm3cm7c8cm5c3c127c11c44_weight(0), 
            dout17   => c3c3c1c14c33c18c8c15cm2cm16c4cm3cm17cm29c24c4_weight(0), 
            dout18   => c14c5cm1cm33cm6c4c9c0cm9c3c5c0cm4cm17c3cm5_weight(0), 
            dout19   => c3cm7cm19c2cm7cm10cm3c6cm4cm4cm4cm27c10c2c12c10_weight(0), 
            dout20   => c1c2cm2c15cm38cm4c2cm7c27c7cm5c8c1c12c1cm6_weight(0), 
            dout21   => c3c7cm8cm2cm2cm15c0c5cm3c3c2c16c0cm5cm8cm40_weight(0), 
            dout22   => cm14c8cm5cm1cm18c20c51cm19cm6c2c27c6cm1c1cm13cm15_weight(0), 
            dout23   => c1c7c2cm43cm23cm28cm40c1c12cm8cm3c2cm27cm5cm3c6_weight(0), 
            dout24   => c1cm15c7c4cm5cm5cm9c3cm6cm1cm13cm1cm3cm4cm11c11_weight(0), 
            dout25   => cm12c3c13cm5cm24cm1c3cm14cm4cm5c0c1cm25c0c6cm12_weight(0), 
            dout26   => cm6cm21cm1cm6c2c8cm1cm8cm1cm14c0cm1c29cm14cm36c2_weight(0), 
            dout27   => cm7c3cm1c5c5cm21cm3cm5c5cm25c5cm3cm5c5c3cm1_weight(0), 
            dout28   => cm12cm7c14cm5c32cm34cm5cm6c11cm22cm19c2cm35cm13c23c2_weight(0), 
            dout29   => cm5c0cm2cm4c5cm28c1c2cm7cm11c0c11cm18c0c4cm2_weight(0), 
            dout30   => c15c21c7cm11cm5c3c0c2c6cm3c8cm5cm4c9c1cm8_weight(0), 
            dout31   => cm9cm4c1c16cm36c14c0c8cm13c1c11c19c0c14c8c15_weight(0), 
            dout32   => c0c8cm9c5c15cm6c35c4cm5c1cm1c17cm18cm6cm1cm3_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c7cm4cm15cm5c2cm2c9c1c6cm8c9c3c0c5cm14c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm4cm15cm5c2cm2c9c1c6cm8c9c3c0c5cm14c7_weight(0), c7cm4cm15cm5c2cm2c9c1c6cm8c9c3c0c5cm14c7_weight(1));
    PL_STEP_0_for_c8c1c4cm15cm2cm12c15c16c9c2cm10c1c3cm1c6cm26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c1c4cm15cm2cm12c15c16c9c2cm10c1c3cm1c6cm26_weight(0), c8c1c4cm15cm2cm12c15c16c9c2cm10c1c3cm1c6cm26_weight(1));
    PL_STEP_0_for_c1cm5cm12c0cm8c4cm3cm2c28cm1c23c8c3cm16cm9cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm5cm12c0cm8c4cm3cm2c28cm1c23c8c3cm16cm9cm8_weight(0), c1cm5cm12c0cm8c4cm3cm2c28cm1c23c8c3cm16cm9cm8_weight(1));
    PL_STEP_0_for_cm15cm4c13cm8cm8c20c41c30cm8c0cm13cm16cm8c6cm12c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15cm4c13cm8cm8c20c41c30cm8c0cm13cm16cm8c6cm12c2_weight(0), cm15cm4c13cm8cm8c20c41c30cm8c0cm13cm16cm8c6cm12c2_weight(1));
    PL_STEP_0_for_cm2c6cm10c6c51cm15cm5c2cm12cm11cm13c8cm4c4c6c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c6cm10c6c51cm15cm5c2cm12cm11cm13c8cm4c4c6c15_weight(0), cm2c6cm10c6c51cm15cm5c2cm12cm11cm13c8cm4c4c6c15_weight(1));
    PL_STEP_0_for_cm7c4c34c9c7c4c28cm1c2c3c3cm11c2cm13cm6cm16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c4c34c9c7c4c28cm1c2c3c3cm11c2cm13cm6cm16_weight(0), cm7c4c34c9c7c4c28cm1c2c3c3cm11c2cm13cm6cm16_weight(1));
    PL_STEP_0_for_c8c12cm3c3cm2cm9c3c5c0c5c3c13cm10c13c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c12cm3c3cm2cm9c3c5c0c5c3c13cm10c13c1c0_weight(0), c8c12cm3c3cm2cm9c3c5c0c5c3c13cm10c13c1c0_weight(1));
    PL_STEP_0_for_c23c0cm5c6cm61c4cm13c2cm3c9cm2cm2c8cm9c6cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c23c0cm5c6cm61c4cm13c2cm3c9cm2cm2c8cm9c6cm5_weight(0), c23c0cm5c6cm61c4cm13c2cm3c9cm2cm2c8cm9c6cm5_weight(1));
    PL_STEP_0_for_c4c2c19cm5cm9cm30c0c8c7cm8c2c23cm9c2c5cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c2c19cm5cm9cm30c0c8c7cm8c2c23cm9c2c5cm11_weight(0), c4c2c19cm5cm9cm30c0c8c7cm8c2c23cm9c2c5cm11_weight(1));
    PL_STEP_0_for_c10cm2cm16cm8c0c2cm13c11cm2c5c11cm7cm1cm1c16c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10cm2cm16cm8c0c2cm13c11cm2c5c11cm7cm1cm1c16c15_weight(0), c10cm2cm16cm8c0c2cm13c11cm2c5c11cm7cm1cm1c16c15_weight(1));
    PL_STEP_0_for_c7cm1c9cm23cm24cm36c7cm2c6cm49c4cm6c4cm6c6cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm1c9cm23cm24cm36c7cm2c6cm49c4cm6c4cm6c6cm4_weight(0), c7cm1c9cm23cm24cm36c7cm2c6cm49c4cm6c4cm6c6cm4_weight(1));
    PL_STEP_0_for_cm3cm3c0c2cm1c1cm13c2cm4c2cm9c13cm3c1cm3cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm3c0c2cm1c1cm13c2cm4c2cm9c13cm3c1cm3cm1_weight(0), cm3cm3c0c2cm1c1cm13c2cm4c2cm9c13cm3c1cm3cm1_weight(1));
    PL_STEP_0_for_cm6c6cm2cm2cm10cm16cm7c1cm2cm11cm5c18c6cm7c0c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c6cm2cm2cm10cm16cm7c1cm2cm11cm5c18c6cm7c0c9_weight(0), cm6c6cm2cm2cm10cm16cm7c1cm2cm11cm5c18c6cm7c0c9_weight(1));
    PL_STEP_0_for_c16cm12cm10c10cm59cm6cm7c8c11cm4cm4c0cm6c11c10cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c16cm12cm10c10cm59cm6cm7c8c11cm4cm4c0cm6c11c10cm9_weight(0), c16cm12cm10c10cm59cm6cm7c8c11cm4cm4c0cm6c11c10cm9_weight(1));
    PL_STEP_0_for_cm23cm15cm2cm12c1cm10c1c9cm6cm4cm4c26cm14c0c4c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm23cm15cm2cm12c1cm10c1c9cm6cm4cm4c26cm14c0c4c0_weight(0), cm23cm15cm2cm12c1cm10c1c9cm6cm4cm4c26cm14c0c4c0_weight(1));
    PL_STEP_0_for_cm16cm42c4cm22c0c17c0cm25cm3cm7c8cm5c3c127c11c44_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm16cm42c4cm22c0c17c0cm25cm3cm7c8cm5c3c127c11c44_weight(0), cm16cm42c4cm22c0c17c0cm25cm3cm7c8cm5c3c127c11c44_weight(1));
    PL_STEP_0_for_c3c3c1c14c33c18c8c15cm2cm16c4cm3cm17cm29c24c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c3c1c14c33c18c8c15cm2cm16c4cm3cm17cm29c24c4_weight(0), c3c3c1c14c33c18c8c15cm2cm16c4cm3cm17cm29c24c4_weight(1));
    PL_STEP_0_for_c14c5cm1cm33cm6c4c9c0cm9c3c5c0cm4cm17c3cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14c5cm1cm33cm6c4c9c0cm9c3c5c0cm4cm17c3cm5_weight(0), c14c5cm1cm33cm6c4c9c0cm9c3c5c0cm4cm17c3cm5_weight(1));
    PL_STEP_0_for_c3cm7cm19c2cm7cm10cm3c6cm4cm4cm4cm27c10c2c12c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm7cm19c2cm7cm10cm3c6cm4cm4cm4cm27c10c2c12c10_weight(0), c3cm7cm19c2cm7cm10cm3c6cm4cm4cm4cm27c10c2c12c10_weight(1));
    PL_STEP_0_for_c1c2cm2c15cm38cm4c2cm7c27c7cm5c8c1c12c1cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c2cm2c15cm38cm4c2cm7c27c7cm5c8c1c12c1cm6_weight(0), c1c2cm2c15cm38cm4c2cm7c27c7cm5c8c1c12c1cm6_weight(1));
    PL_STEP_0_for_c3c7cm8cm2cm2cm15c0c5cm3c3c2c16c0cm5cm8cm40_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c7cm8cm2cm2cm15c0c5cm3c3c2c16c0cm5cm8cm40_weight(0), c3c7cm8cm2cm2cm15c0c5cm3c3c2c16c0cm5cm8cm40_weight(1));
    PL_STEP_0_for_cm14c8cm5cm1cm18c20c51cm19cm6c2c27c6cm1c1cm13cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14c8cm5cm1cm18c20c51cm19cm6c2c27c6cm1c1cm13cm15_weight(0), cm14c8cm5cm1cm18c20c51cm19cm6c2c27c6cm1c1cm13cm15_weight(1));
    PL_STEP_0_for_c1c7c2cm43cm23cm28cm40c1c12cm8cm3c2cm27cm5cm3c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c7c2cm43cm23cm28cm40c1c12cm8cm3c2cm27cm5cm3c6_weight(0), c1c7c2cm43cm23cm28cm40c1c12cm8cm3c2cm27cm5cm3c6_weight(1));
    PL_STEP_0_for_c1cm15c7c4cm5cm5cm9c3cm6cm1cm13cm1cm3cm4cm11c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm15c7c4cm5cm5cm9c3cm6cm1cm13cm1cm3cm4cm11c11_weight(0), c1cm15c7c4cm5cm5cm9c3cm6cm1cm13cm1cm3cm4cm11c11_weight(1));
    PL_STEP_0_for_cm12c3c13cm5cm24cm1c3cm14cm4cm5c0c1cm25c0c6cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12c3c13cm5cm24cm1c3cm14cm4cm5c0c1cm25c0c6cm12_weight(0), cm12c3c13cm5cm24cm1c3cm14cm4cm5c0c1cm25c0c6cm12_weight(1));
    PL_STEP_0_for_cm6cm21cm1cm6c2c8cm1cm8cm1cm14c0cm1c29cm14cm36c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm21cm1cm6c2c8cm1cm8cm1cm14c0cm1c29cm14cm36c2_weight(0), cm6cm21cm1cm6c2c8cm1cm8cm1cm14c0cm1c29cm14cm36c2_weight(1));
    PL_STEP_0_for_cm7c3cm1c5c5cm21cm3cm5c5cm25c5cm3cm5c5c3cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c3cm1c5c5cm21cm3cm5c5cm25c5cm3cm5c5c3cm1_weight(0), cm7c3cm1c5c5cm21cm3cm5c5cm25c5cm3cm5c5c3cm1_weight(1));
    PL_STEP_0_for_cm12cm7c14cm5c32cm34cm5cm6c11cm22cm19c2cm35cm13c23c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12cm7c14cm5c32cm34cm5cm6c11cm22cm19c2cm35cm13c23c2_weight(0), cm12cm7c14cm5c32cm34cm5cm6c11cm22cm19c2cm35cm13c23c2_weight(1));
    PL_STEP_0_for_cm5c0cm2cm4c5cm28c1c2cm7cm11c0c11cm18c0c4cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c0cm2cm4c5cm28c1c2cm7cm11c0c11cm18c0c4cm2_weight(0), cm5c0cm2cm4c5cm28c1c2cm7cm11c0c11cm18c0c4cm2_weight(1));
    PL_STEP_0_for_c15c21c7cm11cm5c3c0c2c6cm3c8cm5cm4c9c1cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c15c21c7cm11cm5c3c0c2c6cm3c8cm5cm4c9c1cm8_weight(0), c15c21c7cm11cm5c3c0c2c6cm3c8cm5cm4c9c1cm8_weight(1));
    PL_STEP_0_for_cm9cm4c1c16cm36c14c0c8cm13c1c11c19c0c14c8c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9cm4c1c16cm36c14c0c8cm13c1c11c19c0c14c8c15_weight(0), cm9cm4c1c16cm36c14c0c8cm13c1c11c19c0c14c8c15_weight(1));
    PL_STEP_0_for_c0c8cm9c5c15cm6c35c4cm5c1cm1c17cm18cm6cm1cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c8cm9c5c15cm6c35c4cm5c1cm1c17cm18cm6cm1cm3_weight(0), c0c8cm9c5c15cm6c35c4cm5c1cm1c17cm18cm6cm1cm3_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm16cm42c4cm22c0c17c0cm25cm3cm7c8cm5c3c127c11c44_c1cm15c7c4cm5cm5cm9c3cm6cm1cm13cm1cm3cm4cm11c11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm16cm42c4cm22c0c17c0cm25cm3cm7c8cm5c3c127c11c44_weight(1)(8-1 downto 0),
			B	=> c1cm15c7c4cm5cm5cm9c3cm6cm1cm13cm1cm3cm4cm11c11_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm16cm42c4cm22c0c17c0cm25cm3cm7c8cm5c3c127c11c44,
			CxB => R_c1cm15c7c4cm5cm5cm9c3cm6cm1cm13cm1cm3cm4cm11c11
		);

    cm15cm4c13cm8cm8c20c41c30cm8c0cm13cm16cm8c6cm12c2_cm3cm3c0c2cm1c1cm13c2cm4c2cm9c13cm3c1cm3cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm15cm4c13cm8cm8c20c41c30cm8c0cm13cm16cm8c6cm12c2_weight(1)(7-1 downto 0),
			B	=> cm3cm3c0c2cm1c1cm13c2cm4c2cm9c13cm3c1cm3cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm15cm4c13cm8cm8c20c41c30cm8c0cm13cm16cm8c6cm12c2,
			CxB => R_cm3cm3c0c2cm1c1cm13c2cm4c2cm9c13cm3c1cm3cm1
		);

    cm2c6cm10c6c51cm15cm5c2cm12cm11cm13c8cm4c4c6c15_c8c12cm3c3cm2cm9c3c5c0c5c3c13cm10c13c1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c6cm10c6c51cm15cm5c2cm12cm11cm13c8cm4c4c6c15_weight(1)(7-1 downto 0),
			B	=> c8c12cm3c3cm2cm9c3c5c0c5c3c13cm10c13c1c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c6cm10c6c51cm15cm5c2cm12cm11cm13c8cm4c4c6c15,
			CxB => R_c8c12cm3c3cm2cm9c3c5c0c5c3c13cm10c13c1c0
		);

    cm7c4c34c9c7c4c28cm1c2c3c3cm11c2cm13cm6cm16_c7cm4cm15cm5c2cm2c9c1c6cm8c9c3c0c5cm14c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm7c4c34c9c7c4c28cm1c2c3c3cm11c2cm13cm6cm16_weight(1)(7-1 downto 0),
			B	=> c7cm4cm15cm5c2cm2c9c1c6cm8c9c3c0c5cm14c7_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7c4c34c9c7c4c28cm1c2c3c3cm11c2cm13cm6cm16,
			CxB => R_c7cm4cm15cm5c2cm2c9c1c6cm8c9c3c0c5cm14c7
		);

    c23c0cm5c6cm61c4cm13c2cm3c9cm2cm2c8cm9c6cm5_c15c21c7cm11cm5c3c0c2c6cm3c8cm5cm4c9c1cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c23c0cm5c6cm61c4cm13c2cm3c9cm2cm2c8cm9c6cm5_weight(1)(7-1 downto 0),
			B	=> c15c21c7cm11cm5c3c0c2c6cm3c8cm5cm4c9c1cm8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c23c0cm5c6cm61c4cm13c2cm3c9cm2cm2c8cm9c6cm5,
			CxB => R_c15c21c7cm11cm5c3c0c2c6cm3c8cm5cm4c9c1cm8
		);

    c7cm1c9cm23cm24cm36c7cm2c6cm49c4cm6c4cm6c6cm4_cm5c0cm2cm4c5cm28c1c2cm7cm11c0c11cm18c0c4cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7cm1c9cm23cm24cm36c7cm2c6cm49c4cm6c4cm6c6cm4_weight(1)(7-1 downto 0),
			B	=> cm5c0cm2cm4c5cm28c1c2cm7cm11c0c11cm18c0c4cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7cm1c9cm23cm24cm36c7cm2c6cm49c4cm6c4cm6c6cm4,
			CxB => R_cm5c0cm2cm4c5cm28c1c2cm7cm11c0c11cm18c0c4cm2
		);

    c16cm12cm10c10cm59cm6cm7c8c11cm4cm4c0cm6c11c10cm9_cm7c3cm1c5c5cm21cm3cm5c5cm25c5cm3cm5c5c3cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c16cm12cm10c10cm59cm6cm7c8c11cm4cm4c0cm6c11c10cm9_weight(1)(7-1 downto 0),
			B	=> cm7c3cm1c5c5cm21cm3cm5c5cm25c5cm3cm5c5c3cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c16cm12cm10c10cm59cm6cm7c8c11cm4cm4c0cm6c11c10cm9,
			CxB => R_cm7c3cm1c5c5cm21cm3cm5c5cm25c5cm3cm5c5c3cm1
		);

    c3c3c1c14c33c18c8c15cm2cm16c4cm3cm17cm29c24c4_cm12c3c13cm5cm24cm1c3cm14cm4cm5c0c1cm25c0c6cm12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c3c1c14c33c18c8c15cm2cm16c4cm3cm17cm29c24c4_weight(1)(7-1 downto 0),
			B	=> cm12c3c13cm5cm24cm1c3cm14cm4cm5c0c1cm25c0c6cm12_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c3c1c14c33c18c8c15cm2cm16c4cm3cm17cm29c24c4,
			CxB => R_cm12c3c13cm5cm24cm1c3cm14cm4cm5c0c1cm25c0c6cm12
		);

    c14c5cm1cm33cm6c4c9c0cm9c3c5c0cm4cm17c3cm5_c3cm7cm19c2cm7cm10cm3c6cm4cm4cm4cm27c10c2c12c10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c14c5cm1cm33cm6c4c9c0cm9c3c5c0cm4cm17c3cm5_weight(1)(7-1 downto 0),
			B	=> c3cm7cm19c2cm7cm10cm3c6cm4cm4cm4cm27c10c2c12c10_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c14c5cm1cm33cm6c4c9c0cm9c3c5c0cm4cm17c3cm5,
			CxB => R_c3cm7cm19c2cm7cm10cm3c6cm4cm4cm4cm27c10c2c12c10
		);

    c1c2cm2c15cm38cm4c2cm7c27c7cm5c8c1c12c1cm6_cm23cm15cm2cm12c1cm10c1c9cm6cm4cm4c26cm14c0c4c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c2cm2c15cm38cm4c2cm7c27c7cm5c8c1c12c1cm6_weight(1)(7-1 downto 0),
			B	=> cm23cm15cm2cm12c1cm10c1c9cm6cm4cm4c26cm14c0c4c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c2cm2c15cm38cm4c2cm7c27c7cm5c8c1c12c1cm6,
			CxB => R_cm23cm15cm2cm12c1cm10c1c9cm6cm4cm4c26cm14c0c4c0
		);

    c3c7cm8cm2cm2cm15c0c5cm3c3c2c16c0cm5cm8cm40_cm6c6cm2cm2cm10cm16cm7c1cm2cm11cm5c18c6cm7c0c9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c7cm8cm2cm2cm15c0c5cm3c3c2c16c0cm5cm8cm40_weight(1)(7-1 downto 0),
			B	=> cm6c6cm2cm2cm10cm16cm7c1cm2cm11cm5c18c6cm7c0c9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c7cm8cm2cm2cm15c0c5cm3c3c2c16c0cm5cm8cm40,
			CxB => R_cm6c6cm2cm2cm10cm16cm7c1cm2cm11cm5c18c6cm7c0c9
		);

    cm14c8cm5cm1cm18c20c51cm19cm6c2c27c6cm1c1cm13cm15_c10cm2cm16cm8c0c2cm13c11cm2c5c11cm7cm1cm1c16c15_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm14c8cm5cm1cm18c20c51cm19cm6c2c27c6cm1c1cm13cm15_weight(1)(7-1 downto 0),
			B	=> c10cm2cm16cm8c0c2cm13c11cm2c5c11cm7cm1cm1c16c15_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm14c8cm5cm1cm18c20c51cm19cm6c2c27c6cm1c1cm13cm15,
			CxB => R_c10cm2cm16cm8c0c2cm13c11cm2c5c11cm7cm1cm1c16c15
		);

    c1c7c2cm43cm23cm28cm40c1c12cm8cm3c2cm27cm5cm3c6_c4c2c19cm5cm9cm30c0c8c7cm8c2c23cm9c2c5cm11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c7c2cm43cm23cm28cm40c1c12cm8cm3c2cm27cm5cm3c6_weight(1)(7-1 downto 0),
			B	=> c4c2c19cm5cm9cm30c0c8c7cm8c2c23cm9c2c5cm11_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c7c2cm43cm23cm28cm40c1c12cm8cm3c2cm27cm5cm3c6,
			CxB => R_c4c2c19cm5cm9cm30c0c8c7cm8c2c23cm9c2c5cm11
		);

    cm6cm21cm1cm6c2c8cm1cm8cm1cm14c0cm1c29cm14cm36c2_c1cm5cm12c0cm8c4cm3cm2c28cm1c23c8c3cm16cm9cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6cm21cm1cm6c2c8cm1cm8cm1cm14c0cm1c29cm14cm36c2_weight(1)(7-1 downto 0),
			B	=> c1cm5cm12c0cm8c4cm3cm2c28cm1c23c8c3cm16cm9cm8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6cm21cm1cm6c2c8cm1cm8cm1cm14c0cm1c29cm14cm36c2,
			CxB => R_c1cm5cm12c0cm8c4cm3cm2c28cm1c23c8c3cm16cm9cm8
		);

    cm12cm7c14cm5c32cm34cm5cm6c11cm22cm19c2cm35cm13c23c2_c8c1c4cm15cm2cm12c15c16c9c2cm10c1c3cm1c6cm26_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm12cm7c14cm5c32cm34cm5cm6c11cm22cm19c2cm35cm13c23c2_weight(1)(7-1 downto 0),
			B	=> c8c1c4cm15cm2cm12c15c16c9c2cm10c1c3cm1c6cm26_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm12cm7c14cm5c32cm34cm5cm6c11cm22cm19c2cm35cm13c23c2,
			CxB => R_c8c1c4cm15cm2cm12c15c16c9c2cm10c1c3cm1c6cm26
		);

    cm9cm4c1c16cm36c14c0c8cm13c1c11c19c0c14c8c15_c0c8cm9c5c15cm6c35c4cm5c1cm1c17cm18cm6cm1cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9cm4c1c16cm36c14c0c8cm13c1c11c19c0c14c8c15_weight(1)(7-1 downto 0),
			B	=> c0c8cm9c5c15cm6c35c4cm5c1cm1c17cm18cm6cm1cm3_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9cm4c1c16cm36c14c0c8cm13c1c11c19c0c14c8c15,
			CxB => R_c0c8cm9c5c15cm6c35c4cm5c1cm1c17cm18cm6cm1cm3
		);




end architecture;
