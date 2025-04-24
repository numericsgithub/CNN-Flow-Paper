library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core30_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c16cm2cm8c3c5c11c7cm8cm8c10c10c1cm2cm6cm5c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c4cm37cm27c1c1cm1c8c11c4cm10cm38cm9cm5c8c1cm11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm4c3c2c1cm9cm21c9c6cm8cm1c4c2cm3c15c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm10cm5cm15cm12c46c13cm3cm4cm15cm3cm35c7c4cm5cm1c3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm15cm26c3cm12c27c14c15c13c9c19cm65cm5c8c23c1cm2 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm1cm3cm21cm10cm1c8c17cm1c8c1c10c8cm5c1c2c29 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm13c0c6cm12c48c20c2cm57cm4cm20cm2cm12c5c13c15c3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c21cm3c1cm28c7c58c80c1c15cm8cm8c2cm2cm6cm12c18 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm6c41c11c15c3cm29cm5cm21cm4c31c33cm23c73cm2c2cm4 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c4c1c1c16c1cm11cm4c118cm11cm3cm4c15c8c3cm20c5 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c3c17c22cm3c13cm2cm1cm18cm5c3c12cm14c1cm14c8cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm12c1c6c4c4c1c19cm12cm1c0c1cm7c1cm2c0c19 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c17c7cm4c5c0c0c6c10c3c1cm3cm2cm13c18cm5c10 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c29cm2cm8c8cm13cm2cm1c8cm1c7c5cm7cm3cm5cm9c13 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1c1cm25c6cm1cm84c47c11c5cm3c20cm9cm84cm9cm14cm1 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c4cm30cm1cm2cm7c38c4c12c13c10cm8cm5cm8cm4cm2cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm16c12c8c15c18c23c9cm42cm1c7c4cm19cm3c0cm2c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3c0cm7cm4cm25cm4c12cm1cm26c1c5c20c1c12cm4c28 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm6cm24cm10cm4cm58c31cm8c3c23cm3c8cm14c5c4cm4c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c25cm2c5cm6c1c10cm30cm3c3cm7c2cm16c2cm11cm8cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c4cm13cm2cm14c0c2c8cm12c1cm4c4cm5cm1c21c1cm15 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c27c22cm54c11c12cm28c14cm77cm8cm47cm6cm16cm9c1c1c3 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c23c15cm35c10cm34c12cm31cm3cm8c7c15cm3c20c2cm1cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm4cm10c0c1c8cm9cm31cm1c23c24c20c2cm84c7cm20c0 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c30c1cm12cm3c0cm4c53c8cm22cm5cm13c10cm24c5c0c27 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c7cm4c6cm7c4c8c36c14c10c15c7cm2cm12cm9c10c13 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm10c0cm1c15cm21c5cm13cm7cm9c2c0cm4c6c0c2c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c24cm1c1c8cm5cm69c75c5cm3c27c0cm40c12c4cm26cm2 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm3c2c14c0cm34cm6c0c8cm6cm15c1cm21c6cm1c38c25 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm4cm7c36cm4cm11c8c3cm6c40c11c7c4cm3cm16cm8cm13 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c20cm4c0cm3c21c2c11c18c16cm3cm1cm24c4c4c10c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c40c5cm15c11cm26cm45cm13c80c30cm93cm7cm17cm6c4cm2cm11 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core30_rmcm;

architecture arch of conv7_core30_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C16CM2CM8C3C5C11C7CM8CM8C10C10C1CM2CM6CM5C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM37CM27C1C1CM1C8C11C4CM10CM38CM9CM5C8C1CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C3C2C1CM9CM21C9C6CM8CM1C4C2CM3C15C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10CM5CM15CM12C46C13CM3CM4CM15CM3CM35C7C4CM5CM1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15CM26C3CM12C27C14C15C13C9C19CM65CM5C8C23C1CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM3CM21CM10CM1C8C17CM1C8C1C10C8CM5C1C2C29_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C0C6CM12C48C20C2CM57CM4CM20CM2CM12C5C13C15C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C21CM3C1CM28C7C58C80C1C15CM8CM8C2CM2CM6CM12C18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C41C11C15C3CM29CM5CM21CM4C31C33CM23C73CM2C2CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C1C1C16C1CM11CM4C118CM11CM3CM4C15C8C3CM20C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C17C22CM3C13CM2CM1CM18CM5C3C12CM14C1CM14C8CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12C1C6C4C4C1C19CM12CM1C0C1CM7C1CM2C0C19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C17C7CM4C5C0C0C6C10C3C1CM3CM2CM13C18CM5C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C29CM2CM8C8CM13CM2CM1C8CM1C7C5CM7CM3CM5CM9C13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1CM25C6CM1CM84C47C11C5CM3C20CM9CM84CM9CM14CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM30CM1CM2CM7C38C4C12C13C10CM8CM5CM8CM4CM2CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM16C12C8C15C18C23C9CM42CM1C7C4CM19CM3C0CM2C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C0CM7CM4CM25CM4C12CM1CM26C1C5C20C1C12CM4C28_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM24CM10CM4CM58C31CM8C3C23CM3C8CM14C5C4CM4C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C25CM2C5CM6C1C10CM30CM3C3CM7C2CM16C2CM11CM8CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM13CM2CM14C0C2C8CM12C1CM4C4CM5CM1C21C1CM15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C27C22CM54C11C12CM28C14CM77CM8CM47CM6CM16CM9C1C1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C23C15CM35C10CM34C12CM31CM3CM8C7C15CM3C20C2CM1CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM10C0C1C8CM9CM31CM1C23C24C20C2CM84C7CM20C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C30C1CM12CM3C0CM4C53C8CM22CM5CM13C10CM24C5C0C27_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM4C6CM7C4C8C36C14C10C15C7CM2CM12CM9C10C13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C0CM1C15CM21C5CM13CM7CM9C2C0CM4C6C0C2C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C24CM1C1C8CM5CM69C75C5CM3C27C0CM40C12C4CM26CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C2C14C0CM34CM6C0C8CM6CM15C1CM21C6CM1C38C25_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM7C36CM4CM11C8C3CM6C40C11C7C4CM3CM16CM8CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C20CM4C0CM3C21C2C11C18C16CM3CM1CM24C4C4C10C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C40C5CM15C11CM26CM45CM13C80C30CM93CM7CM17CM6C4CM2CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c16cm2cm8c3c5c11c7cm8cm8c10c10c1cm2cm6cm5c0_weight : PIPELINE_TYPE_FOR_C16CM2CM8C3C5C11C7CM8CM8C10C10C1CM2CM6CM5C0_WEIGHT;
    -- sfix(1, -7)
    signal c4cm37cm27c1c1cm1c8c11c4cm10cm38cm9cm5c8c1cm11_weight : PIPELINE_TYPE_FOR_C4CM37CM27C1C1CM1C8C11C4CM10CM38CM9CM5C8C1CM11_WEIGHT;
    -- sfix(1, -7)
    signal cm4c3c2c1cm9cm21c9c6cm8cm1c4c2cm3c15c0c0_weight : PIPELINE_TYPE_FOR_CM4C3C2C1CM9CM21C9C6CM8CM1C4C2CM3C15C0C0_WEIGHT;
    -- sfix(1, -7)
    signal cm10cm5cm15cm12c46c13cm3cm4cm15cm3cm35c7c4cm5cm1c3_weight : PIPELINE_TYPE_FOR_CM10CM5CM15CM12C46C13CM3CM4CM15CM3CM35C7C4CM5CM1C3_WEIGHT;
    -- sfix(1, -7)
    signal cm15cm26c3cm12c27c14c15c13c9c19cm65cm5c8c23c1cm2_weight : PIPELINE_TYPE_FOR_CM15CM26C3CM12C27C14C15C13C9C19CM65CM5C8C23C1CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm3cm21cm10cm1c8c17cm1c8c1c10c8cm5c1c2c29_weight : PIPELINE_TYPE_FOR_CM1CM3CM21CM10CM1C8C17CM1C8C1C10C8CM5C1C2C29_WEIGHT;
    -- sfix(1, -7)
    signal cm13c0c6cm12c48c20c2cm57cm4cm20cm2cm12c5c13c15c3_weight : PIPELINE_TYPE_FOR_CM13C0C6CM12C48C20C2CM57CM4CM20CM2CM12C5C13C15C3_WEIGHT;
    -- sfix(1, -7)
    signal c21cm3c1cm28c7c58c80c1c15cm8cm8c2cm2cm6cm12c18_weight : PIPELINE_TYPE_FOR_C21CM3C1CM28C7C58C80C1C15CM8CM8C2CM2CM6CM12C18_WEIGHT;
    -- sfix(1, -7)
    signal cm6c41c11c15c3cm29cm5cm21cm4c31c33cm23c73cm2c2cm4_weight : PIPELINE_TYPE_FOR_CM6C41C11C15C3CM29CM5CM21CM4C31C33CM23C73CM2C2CM4_WEIGHT;
    -- sfix(1, -7)
    signal c4c1c1c16c1cm11cm4c118cm11cm3cm4c15c8c3cm20c5_weight : PIPELINE_TYPE_FOR_C4C1C1C16C1CM11CM4C118CM11CM3CM4C15C8C3CM20C5_WEIGHT;
    -- sfix(1, -7)
    signal c3c17c22cm3c13cm2cm1cm18cm5c3c12cm14c1cm14c8cm6_weight : PIPELINE_TYPE_FOR_C3C17C22CM3C13CM2CM1CM18CM5C3C12CM14C1CM14C8CM6_WEIGHT;
    -- sfix(1, -7)
    signal cm12c1c6c4c4c1c19cm12cm1c0c1cm7c1cm2c0c19_weight : PIPELINE_TYPE_FOR_CM12C1C6C4C4C1C19CM12CM1C0C1CM7C1CM2C0C19_WEIGHT;
    -- sfix(1, -7)
    signal c17c7cm4c5c0c0c6c10c3c1cm3cm2cm13c18cm5c10_weight : PIPELINE_TYPE_FOR_C17C7CM4C5C0C0C6C10C3C1CM3CM2CM13C18CM5C10_WEIGHT;
    -- sfix(1, -7)
    signal c29cm2cm8c8cm13cm2cm1c8cm1c7c5cm7cm3cm5cm9c13_weight : PIPELINE_TYPE_FOR_C29CM2CM8C8CM13CM2CM1C8CM1C7C5CM7CM3CM5CM9C13_WEIGHT;
    -- sfix(1, -7)
    signal c1c1cm25c6cm1cm84c47c11c5cm3c20cm9cm84cm9cm14cm1_weight : PIPELINE_TYPE_FOR_C1C1CM25C6CM1CM84C47C11C5CM3C20CM9CM84CM9CM14CM1_WEIGHT;
    -- sfix(1, -7)
    signal c4cm30cm1cm2cm7c38c4c12c13c10cm8cm5cm8cm4cm2cm4_weight : PIPELINE_TYPE_FOR_C4CM30CM1CM2CM7C38C4C12C13C10CM8CM5CM8CM4CM2CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm16c12c8c15c18c23c9cm42cm1c7c4cm19cm3c0cm2c4_weight : PIPELINE_TYPE_FOR_CM16C12C8C15C18C23C9CM42CM1C7C4CM19CM3C0CM2C4_WEIGHT;
    -- sfix(1, -7)
    signal cm3c0cm7cm4cm25cm4c12cm1cm26c1c5c20c1c12cm4c28_weight : PIPELINE_TYPE_FOR_CM3C0CM7CM4CM25CM4C12CM1CM26C1C5C20C1C12CM4C28_WEIGHT;
    -- sfix(1, -7)
    signal cm6cm24cm10cm4cm58c31cm8c3c23cm3c8cm14c5c4cm4c1_weight : PIPELINE_TYPE_FOR_CM6CM24CM10CM4CM58C31CM8C3C23CM3C8CM14C5C4CM4C1_WEIGHT;
    -- sfix(1, -7)
    signal c25cm2c5cm6c1c10cm30cm3c3cm7c2cm16c2cm11cm8cm6_weight : PIPELINE_TYPE_FOR_C25CM2C5CM6C1C10CM30CM3C3CM7C2CM16C2CM11CM8CM6_WEIGHT;
    -- sfix(1, -7)
    signal c4cm13cm2cm14c0c2c8cm12c1cm4c4cm5cm1c21c1cm15_weight : PIPELINE_TYPE_FOR_C4CM13CM2CM14C0C2C8CM12C1CM4C4CM5CM1C21C1CM15_WEIGHT;
    -- sfix(1, -7)
    signal c27c22cm54c11c12cm28c14cm77cm8cm47cm6cm16cm9c1c1c3_weight : PIPELINE_TYPE_FOR_C27C22CM54C11C12CM28C14CM77CM8CM47CM6CM16CM9C1C1C3_WEIGHT;
    -- sfix(1, -7)
    signal c23c15cm35c10cm34c12cm31cm3cm8c7c15cm3c20c2cm1cm2_weight : PIPELINE_TYPE_FOR_C23C15CM35C10CM34C12CM31CM3CM8C7C15CM3C20C2CM1CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm10c0c1c8cm9cm31cm1c23c24c20c2cm84c7cm20c0_weight : PIPELINE_TYPE_FOR_CM4CM10C0C1C8CM9CM31CM1C23C24C20C2CM84C7CM20C0_WEIGHT;
    -- sfix(1, -7)
    signal c30c1cm12cm3c0cm4c53c8cm22cm5cm13c10cm24c5c0c27_weight : PIPELINE_TYPE_FOR_C30C1CM12CM3C0CM4C53C8CM22CM5CM13C10CM24C5C0C27_WEIGHT;
    -- sfix(1, -7)
    signal c7cm4c6cm7c4c8c36c14c10c15c7cm2cm12cm9c10c13_weight : PIPELINE_TYPE_FOR_C7CM4C6CM7C4C8C36C14C10C15C7CM2CM12CM9C10C13_WEIGHT;
    -- sfix(1, -7)
    signal cm10c0cm1c15cm21c5cm13cm7cm9c2c0cm4c6c0c2c0_weight : PIPELINE_TYPE_FOR_CM10C0CM1C15CM21C5CM13CM7CM9C2C0CM4C6C0C2C0_WEIGHT;
    -- sfix(1, -7)
    signal c24cm1c1c8cm5cm69c75c5cm3c27c0cm40c12c4cm26cm2_weight : PIPELINE_TYPE_FOR_C24CM1C1C8CM5CM69C75C5CM3C27C0CM40C12C4CM26CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm3c2c14c0cm34cm6c0c8cm6cm15c1cm21c6cm1c38c25_weight : PIPELINE_TYPE_FOR_CM3C2C14C0CM34CM6C0C8CM6CM15C1CM21C6CM1C38C25_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm7c36cm4cm11c8c3cm6c40c11c7c4cm3cm16cm8cm13_weight : PIPELINE_TYPE_FOR_CM4CM7C36CM4CM11C8C3CM6C40C11C7C4CM3CM16CM8CM13_WEIGHT;
    -- sfix(1, -7)
    signal c20cm4c0cm3c21c2c11c18c16cm3cm1cm24c4c4c10c2_weight : PIPELINE_TYPE_FOR_C20CM4C0CM3C21C2C11C18C16CM3CM1CM24C4C4C10C2_WEIGHT;
    -- sfix(1, -7)
    signal c40c5cm15c11cm26cm45cm13c80c30cm93cm7cm17cm6c4cm2cm11_weight : PIPELINE_TYPE_FOR_C40C5CM15C11CM26CM45CM13C80C30CM93CM7CM17CM6C4CM2CM11_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core30_rmcm_weightsconstant_memory
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
        
            dout1   => c16cm2cm8c3c5c11c7cm8cm8c10c10c1cm2cm6cm5c0_weight(0), 
            dout2   => c4cm37cm27c1c1cm1c8c11c4cm10cm38cm9cm5c8c1cm11_weight(0), 
            dout3   => cm4c3c2c1cm9cm21c9c6cm8cm1c4c2cm3c15c0c0_weight(0), 
            dout4   => cm10cm5cm15cm12c46c13cm3cm4cm15cm3cm35c7c4cm5cm1c3_weight(0), 
            dout5   => cm15cm26c3cm12c27c14c15c13c9c19cm65cm5c8c23c1cm2_weight(0), 
            dout6   => cm1cm3cm21cm10cm1c8c17cm1c8c1c10c8cm5c1c2c29_weight(0), 
            dout7   => cm13c0c6cm12c48c20c2cm57cm4cm20cm2cm12c5c13c15c3_weight(0), 
            dout8   => c21cm3c1cm28c7c58c80c1c15cm8cm8c2cm2cm6cm12c18_weight(0), 
            dout9   => cm6c41c11c15c3cm29cm5cm21cm4c31c33cm23c73cm2c2cm4_weight(0), 
            dout10   => c4c1c1c16c1cm11cm4c118cm11cm3cm4c15c8c3cm20c5_weight(0), 
            dout11   => c3c17c22cm3c13cm2cm1cm18cm5c3c12cm14c1cm14c8cm6_weight(0), 
            dout12   => cm12c1c6c4c4c1c19cm12cm1c0c1cm7c1cm2c0c19_weight(0), 
            dout13   => c17c7cm4c5c0c0c6c10c3c1cm3cm2cm13c18cm5c10_weight(0), 
            dout14   => c29cm2cm8c8cm13cm2cm1c8cm1c7c5cm7cm3cm5cm9c13_weight(0), 
            dout15   => c1c1cm25c6cm1cm84c47c11c5cm3c20cm9cm84cm9cm14cm1_weight(0), 
            dout16   => c4cm30cm1cm2cm7c38c4c12c13c10cm8cm5cm8cm4cm2cm4_weight(0), 
            dout17   => cm16c12c8c15c18c23c9cm42cm1c7c4cm19cm3c0cm2c4_weight(0), 
            dout18   => cm3c0cm7cm4cm25cm4c12cm1cm26c1c5c20c1c12cm4c28_weight(0), 
            dout19   => cm6cm24cm10cm4cm58c31cm8c3c23cm3c8cm14c5c4cm4c1_weight(0), 
            dout20   => c25cm2c5cm6c1c10cm30cm3c3cm7c2cm16c2cm11cm8cm6_weight(0), 
            dout21   => c4cm13cm2cm14c0c2c8cm12c1cm4c4cm5cm1c21c1cm15_weight(0), 
            dout22   => c27c22cm54c11c12cm28c14cm77cm8cm47cm6cm16cm9c1c1c3_weight(0), 
            dout23   => c23c15cm35c10cm34c12cm31cm3cm8c7c15cm3c20c2cm1cm2_weight(0), 
            dout24   => cm4cm10c0c1c8cm9cm31cm1c23c24c20c2cm84c7cm20c0_weight(0), 
            dout25   => c30c1cm12cm3c0cm4c53c8cm22cm5cm13c10cm24c5c0c27_weight(0), 
            dout26   => c7cm4c6cm7c4c8c36c14c10c15c7cm2cm12cm9c10c13_weight(0), 
            dout27   => cm10c0cm1c15cm21c5cm13cm7cm9c2c0cm4c6c0c2c0_weight(0), 
            dout28   => c24cm1c1c8cm5cm69c75c5cm3c27c0cm40c12c4cm26cm2_weight(0), 
            dout29   => cm3c2c14c0cm34cm6c0c8cm6cm15c1cm21c6cm1c38c25_weight(0), 
            dout30   => cm4cm7c36cm4cm11c8c3cm6c40c11c7c4cm3cm16cm8cm13_weight(0), 
            dout31   => c20cm4c0cm3c21c2c11c18c16cm3cm1cm24c4c4c10c2_weight(0), 
            dout32   => c40c5cm15c11cm26cm45cm13c80c30cm93cm7cm17cm6c4cm2cm11_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c16cm2cm8c3c5c11c7cm8cm8c10c10c1cm2cm6cm5c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c16cm2cm8c3c5c11c7cm8cm8c10c10c1cm2cm6cm5c0_weight(0), c16cm2cm8c3c5c11c7cm8cm8c10c10c1cm2cm6cm5c0_weight(1));
    PL_STEP_0_for_c4cm37cm27c1c1cm1c8c11c4cm10cm38cm9cm5c8c1cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm37cm27c1c1cm1c8c11c4cm10cm38cm9cm5c8c1cm11_weight(0), c4cm37cm27c1c1cm1c8c11c4cm10cm38cm9cm5c8c1cm11_weight(1));
    PL_STEP_0_for_cm4c3c2c1cm9cm21c9c6cm8cm1c4c2cm3c15c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c3c2c1cm9cm21c9c6cm8cm1c4c2cm3c15c0c0_weight(0), cm4c3c2c1cm9cm21c9c6cm8cm1c4c2cm3c15c0c0_weight(1));
    PL_STEP_0_for_cm10cm5cm15cm12c46c13cm3cm4cm15cm3cm35c7c4cm5cm1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10cm5cm15cm12c46c13cm3cm4cm15cm3cm35c7c4cm5cm1c3_weight(0), cm10cm5cm15cm12c46c13cm3cm4cm15cm3cm35c7c4cm5cm1c3_weight(1));
    PL_STEP_0_for_cm15cm26c3cm12c27c14c15c13c9c19cm65cm5c8c23c1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15cm26c3cm12c27c14c15c13c9c19cm65cm5c8c23c1cm2_weight(0), cm15cm26c3cm12c27c14c15c13c9c19cm65cm5c8c23c1cm2_weight(1));
    PL_STEP_0_for_cm1cm3cm21cm10cm1c8c17cm1c8c1c10c8cm5c1c2c29_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm3cm21cm10cm1c8c17cm1c8c1c10c8cm5c1c2c29_weight(0), cm1cm3cm21cm10cm1c8c17cm1c8c1c10c8cm5c1c2c29_weight(1));
    PL_STEP_0_for_cm13c0c6cm12c48c20c2cm57cm4cm20cm2cm12c5c13c15c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c0c6cm12c48c20c2cm57cm4cm20cm2cm12c5c13c15c3_weight(0), cm13c0c6cm12c48c20c2cm57cm4cm20cm2cm12c5c13c15c3_weight(1));
    PL_STEP_0_for_c21cm3c1cm28c7c58c80c1c15cm8cm8c2cm2cm6cm12c18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c21cm3c1cm28c7c58c80c1c15cm8cm8c2cm2cm6cm12c18_weight(0), c21cm3c1cm28c7c58c80c1c15cm8cm8c2cm2cm6cm12c18_weight(1));
    PL_STEP_0_for_cm6c41c11c15c3cm29cm5cm21cm4c31c33cm23c73cm2c2cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c41c11c15c3cm29cm5cm21cm4c31c33cm23c73cm2c2cm4_weight(0), cm6c41c11c15c3cm29cm5cm21cm4c31c33cm23c73cm2c2cm4_weight(1));
    PL_STEP_0_for_c4c1c1c16c1cm11cm4c118cm11cm3cm4c15c8c3cm20c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c1c1c16c1cm11cm4c118cm11cm3cm4c15c8c3cm20c5_weight(0), c4c1c1c16c1cm11cm4c118cm11cm3cm4c15c8c3cm20c5_weight(1));
    PL_STEP_0_for_c3c17c22cm3c13cm2cm1cm18cm5c3c12cm14c1cm14c8cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c17c22cm3c13cm2cm1cm18cm5c3c12cm14c1cm14c8cm6_weight(0), c3c17c22cm3c13cm2cm1cm18cm5c3c12cm14c1cm14c8cm6_weight(1));
    PL_STEP_0_for_cm12c1c6c4c4c1c19cm12cm1c0c1cm7c1cm2c0c19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12c1c6c4c4c1c19cm12cm1c0c1cm7c1cm2c0c19_weight(0), cm12c1c6c4c4c1c19cm12cm1c0c1cm7c1cm2c0c19_weight(1));
    PL_STEP_0_for_c17c7cm4c5c0c0c6c10c3c1cm3cm2cm13c18cm5c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c17c7cm4c5c0c0c6c10c3c1cm3cm2cm13c18cm5c10_weight(0), c17c7cm4c5c0c0c6c10c3c1cm3cm2cm13c18cm5c10_weight(1));
    PL_STEP_0_for_c29cm2cm8c8cm13cm2cm1c8cm1c7c5cm7cm3cm5cm9c13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c29cm2cm8c8cm13cm2cm1c8cm1c7c5cm7cm3cm5cm9c13_weight(0), c29cm2cm8c8cm13cm2cm1c8cm1c7c5cm7cm3cm5cm9c13_weight(1));
    PL_STEP_0_for_c1c1cm25c6cm1cm84c47c11c5cm3c20cm9cm84cm9cm14cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1cm25c6cm1cm84c47c11c5cm3c20cm9cm84cm9cm14cm1_weight(0), c1c1cm25c6cm1cm84c47c11c5cm3c20cm9cm84cm9cm14cm1_weight(1));
    PL_STEP_0_for_c4cm30cm1cm2cm7c38c4c12c13c10cm8cm5cm8cm4cm2cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm30cm1cm2cm7c38c4c12c13c10cm8cm5cm8cm4cm2cm4_weight(0), c4cm30cm1cm2cm7c38c4c12c13c10cm8cm5cm8cm4cm2cm4_weight(1));
    PL_STEP_0_for_cm16c12c8c15c18c23c9cm42cm1c7c4cm19cm3c0cm2c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm16c12c8c15c18c23c9cm42cm1c7c4cm19cm3c0cm2c4_weight(0), cm16c12c8c15c18c23c9cm42cm1c7c4cm19cm3c0cm2c4_weight(1));
    PL_STEP_0_for_cm3c0cm7cm4cm25cm4c12cm1cm26c1c5c20c1c12cm4c28_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c0cm7cm4cm25cm4c12cm1cm26c1c5c20c1c12cm4c28_weight(0), cm3c0cm7cm4cm25cm4c12cm1cm26c1c5c20c1c12cm4c28_weight(1));
    PL_STEP_0_for_cm6cm24cm10cm4cm58c31cm8c3c23cm3c8cm14c5c4cm4c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm24cm10cm4cm58c31cm8c3c23cm3c8cm14c5c4cm4c1_weight(0), cm6cm24cm10cm4cm58c31cm8c3c23cm3c8cm14c5c4cm4c1_weight(1));
    PL_STEP_0_for_c25cm2c5cm6c1c10cm30cm3c3cm7c2cm16c2cm11cm8cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c25cm2c5cm6c1c10cm30cm3c3cm7c2cm16c2cm11cm8cm6_weight(0), c25cm2c5cm6c1c10cm30cm3c3cm7c2cm16c2cm11cm8cm6_weight(1));
    PL_STEP_0_for_c4cm13cm2cm14c0c2c8cm12c1cm4c4cm5cm1c21c1cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm13cm2cm14c0c2c8cm12c1cm4c4cm5cm1c21c1cm15_weight(0), c4cm13cm2cm14c0c2c8cm12c1cm4c4cm5cm1c21c1cm15_weight(1));
    PL_STEP_0_for_c27c22cm54c11c12cm28c14cm77cm8cm47cm6cm16cm9c1c1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c27c22cm54c11c12cm28c14cm77cm8cm47cm6cm16cm9c1c1c3_weight(0), c27c22cm54c11c12cm28c14cm77cm8cm47cm6cm16cm9c1c1c3_weight(1));
    PL_STEP_0_for_c23c15cm35c10cm34c12cm31cm3cm8c7c15cm3c20c2cm1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c23c15cm35c10cm34c12cm31cm3cm8c7c15cm3c20c2cm1cm2_weight(0), c23c15cm35c10cm34c12cm31cm3cm8c7c15cm3c20c2cm1cm2_weight(1));
    PL_STEP_0_for_cm4cm10c0c1c8cm9cm31cm1c23c24c20c2cm84c7cm20c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm10c0c1c8cm9cm31cm1c23c24c20c2cm84c7cm20c0_weight(0), cm4cm10c0c1c8cm9cm31cm1c23c24c20c2cm84c7cm20c0_weight(1));
    PL_STEP_0_for_c30c1cm12cm3c0cm4c53c8cm22cm5cm13c10cm24c5c0c27_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c30c1cm12cm3c0cm4c53c8cm22cm5cm13c10cm24c5c0c27_weight(0), c30c1cm12cm3c0cm4c53c8cm22cm5cm13c10cm24c5c0c27_weight(1));
    PL_STEP_0_for_c7cm4c6cm7c4c8c36c14c10c15c7cm2cm12cm9c10c13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm4c6cm7c4c8c36c14c10c15c7cm2cm12cm9c10c13_weight(0), c7cm4c6cm7c4c8c36c14c10c15c7cm2cm12cm9c10c13_weight(1));
    PL_STEP_0_for_cm10c0cm1c15cm21c5cm13cm7cm9c2c0cm4c6c0c2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c0cm1c15cm21c5cm13cm7cm9c2c0cm4c6c0c2c0_weight(0), cm10c0cm1c15cm21c5cm13cm7cm9c2c0cm4c6c0c2c0_weight(1));
    PL_STEP_0_for_c24cm1c1c8cm5cm69c75c5cm3c27c0cm40c12c4cm26cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c24cm1c1c8cm5cm69c75c5cm3c27c0cm40c12c4cm26cm2_weight(0), c24cm1c1c8cm5cm69c75c5cm3c27c0cm40c12c4cm26cm2_weight(1));
    PL_STEP_0_for_cm3c2c14c0cm34cm6c0c8cm6cm15c1cm21c6cm1c38c25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c2c14c0cm34cm6c0c8cm6cm15c1cm21c6cm1c38c25_weight(0), cm3c2c14c0cm34cm6c0c8cm6cm15c1cm21c6cm1c38c25_weight(1));
    PL_STEP_0_for_cm4cm7c36cm4cm11c8c3cm6c40c11c7c4cm3cm16cm8cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm7c36cm4cm11c8c3cm6c40c11c7c4cm3cm16cm8cm13_weight(0), cm4cm7c36cm4cm11c8c3cm6c40c11c7c4cm3cm16cm8cm13_weight(1));
    PL_STEP_0_for_c20cm4c0cm3c21c2c11c18c16cm3cm1cm24c4c4c10c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c20cm4c0cm3c21c2c11c18c16cm3cm1cm24c4c4c10c2_weight(0), c20cm4c0cm3c21c2c11c18c16cm3cm1cm24c4c4c10c2_weight(1));
    PL_STEP_0_for_c40c5cm15c11cm26cm45cm13c80c30cm93cm7cm17cm6c4cm2cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c40c5cm15c11cm26cm45cm13c80c30cm93cm7cm17cm6c4cm2cm11_weight(0), c40c5cm15c11cm26cm45cm13c80c30cm93cm7cm17cm6c4cm2cm11_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm15cm26c3cm12c27c14c15c13c9c19cm65cm5c8c23c1cm2_c20cm4c0cm3c21c2c11c18c16cm3cm1cm24c4c4c10c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm15cm26c3cm12c27c14c15c13c9c19cm65cm5c8c23c1cm2_weight(1)(8-1 downto 0),
			B	=> c20cm4c0cm3c21c2c11c18c16cm3cm1cm24c4c4c10c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm15cm26c3cm12c27c14c15c13c9c19cm65cm5c8c23c1cm2,
			CxB => R_c20cm4c0cm3c21c2c11c18c16cm3cm1cm24c4c4c10c2
		);

    c21cm3c1cm28c7c58c80c1c15cm8cm8c2cm2cm6cm12c18_cm10c0cm1c15cm21c5cm13cm7cm9c2c0cm4c6c0c2c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c21cm3c1cm28c7c58c80c1c15cm8cm8c2cm2cm6cm12c18_weight(1)(8-1 downto 0),
			B	=> cm10c0cm1c15cm21c5cm13cm7cm9c2c0cm4c6c0c2c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c21cm3c1cm28c7c58c80c1c15cm8cm8c2cm2cm6cm12c18,
			CxB => R_cm10c0cm1c15cm21c5cm13cm7cm9c2c0cm4c6c0c2c0
		);

    cm6c41c11c15c3cm29cm5cm21cm4c31c33cm23c73cm2c2cm4_c4cm13cm2cm14c0c2c8cm12c1cm4c4cm5cm1c21c1cm15_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6c41c11c15c3cm29cm5cm21cm4c31c33cm23c73cm2c2cm4_weight(1)(8-1 downto 0),
			B	=> c4cm13cm2cm14c0c2c8cm12c1cm4c4cm5cm1c21c1cm15_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c41c11c15c3cm29cm5cm21cm4c31c33cm23c73cm2c2cm4,
			CxB => R_c4cm13cm2cm14c0c2c8cm12c1cm4c4cm5cm1c21c1cm15
		);

    c4c1c1c16c1cm11cm4c118cm11cm3cm4c15c8c3cm20c5_c25cm2c5cm6c1c10cm30cm3c3cm7c2cm16c2cm11cm8cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c1c1c16c1cm11cm4c118cm11cm3cm4c15c8c3cm20c5_weight(1)(8-1 downto 0),
			B	=> c25cm2c5cm6c1c10cm30cm3c3cm7c2cm16c2cm11cm8cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c1c1c16c1cm11cm4c118cm11cm3cm4c15c8c3cm20c5,
			CxB => R_c25cm2c5cm6c1c10cm30cm3c3cm7c2cm16c2cm11cm8cm6
		);

    c1c1cm25c6cm1cm84c47c11c5cm3c20cm9cm84cm9cm14cm1_cm3c0cm7cm4cm25cm4c12cm1cm26c1c5c20c1c12cm4c28_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c1cm25c6cm1cm84c47c11c5cm3c20cm9cm84cm9cm14cm1_weight(1)(8-1 downto 0),
			B	=> cm3c0cm7cm4cm25cm4c12cm1cm26c1c5c20c1c12cm4c28_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c1cm25c6cm1cm84c47c11c5cm3c20cm9cm84cm9cm14cm1,
			CxB => R_cm3c0cm7cm4cm25cm4c12cm1cm26c1c5c20c1c12cm4c28
		);

    c27c22cm54c11c12cm28c14cm77cm8cm47cm6cm16cm9c1c1c3_c29cm2cm8c8cm13cm2cm1c8cm1c7c5cm7cm3cm5cm9c13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c27c22cm54c11c12cm28c14cm77cm8cm47cm6cm16cm9c1c1c3_weight(1)(8-1 downto 0),
			B	=> c29cm2cm8c8cm13cm2cm1c8cm1c7c5cm7cm3cm5cm9c13_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c27c22cm54c11c12cm28c14cm77cm8cm47cm6cm16cm9c1c1c3,
			CxB => R_c29cm2cm8c8cm13cm2cm1c8cm1c7c5cm7cm3cm5cm9c13
		);

    cm4cm10c0c1c8cm9cm31cm1c23c24c20c2cm84c7cm20c0_c17c7cm4c5c0c0c6c10c3c1cm3cm2cm13c18cm5c10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm10c0c1c8cm9cm31cm1c23c24c20c2cm84c7cm20c0_weight(1)(8-1 downto 0),
			B	=> c17c7cm4c5c0c0c6c10c3c1cm3cm2cm13c18cm5c10_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm10c0c1c8cm9cm31cm1c23c24c20c2cm84c7cm20c0,
			CxB => R_c17c7cm4c5c0c0c6c10c3c1cm3cm2cm13c18cm5c10
		);

    c24cm1c1c8cm5cm69c75c5cm3c27c0cm40c12c4cm26cm2_cm12c1c6c4c4c1c19cm12cm1c0c1cm7c1cm2c0c19_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c24cm1c1c8cm5cm69c75c5cm3c27c0cm40c12c4cm26cm2_weight(1)(8-1 downto 0),
			B	=> cm12c1c6c4c4c1c19cm12cm1c0c1cm7c1cm2c0c19_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c24cm1c1c8cm5cm69c75c5cm3c27c0cm40c12c4cm26cm2,
			CxB => R_cm12c1c6c4c4c1c19cm12cm1c0c1cm7c1cm2c0c19
		);

    c40c5cm15c11cm26cm45cm13c80c30cm93cm7cm17cm6c4cm2cm11_c3c17c22cm3c13cm2cm1cm18cm5c3c12cm14c1cm14c8cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c40c5cm15c11cm26cm45cm13c80c30cm93cm7cm17cm6c4cm2cm11_weight(1)(8-1 downto 0),
			B	=> c3c17c22cm3c13cm2cm1cm18cm5c3c12cm14c1cm14c8cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c40c5cm15c11cm26cm45cm13c80c30cm93cm7cm17cm6c4cm2cm11,
			CxB => R_c3c17c22cm3c13cm2cm1cm18cm5c3c12cm14c1cm14c8cm6
		);

    c4cm37cm27c1c1cm1c8c11c4cm10cm38cm9cm5c8c1cm11_cm1cm3cm21cm10cm1c8c17cm1c8c1c10c8cm5c1c2c29_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4cm37cm27c1c1cm1c8c11c4cm10cm38cm9cm5c8c1cm11_weight(1)(7-1 downto 0),
			B	=> cm1cm3cm21cm10cm1c8c17cm1c8c1c10c8cm5c1c2c29_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4cm37cm27c1c1cm1c8c11c4cm10cm38cm9cm5c8c1cm11,
			CxB => R_cm1cm3cm21cm10cm1c8c17cm1c8c1c10c8cm5c1c2c29
		);

    cm10cm5cm15cm12c46c13cm3cm4cm15cm3cm35c7c4cm5cm1c3_cm4c3c2c1cm9cm21c9c6cm8cm1c4c2cm3c15c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm10cm5cm15cm12c46c13cm3cm4cm15cm3cm35c7c4cm5cm1c3_weight(1)(7-1 downto 0),
			B	=> cm4c3c2c1cm9cm21c9c6cm8cm1c4c2cm3c15c0c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10cm5cm15cm12c46c13cm3cm4cm15cm3cm35c7c4cm5cm1c3,
			CxB => R_cm4c3c2c1cm9cm21c9c6cm8cm1c4c2cm3c15c0c0
		);

    cm13c0c6cm12c48c20c2cm57cm4cm20cm2cm12c5c13c15c3_c16cm2cm8c3c5c11c7cm8cm8c10c10c1cm2cm6cm5c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm13c0c6cm12c48c20c2cm57cm4cm20cm2cm12c5c13c15c3_weight(1)(7-1 downto 0),
			B	=> c16cm2cm8c3c5c11c7cm8cm8c10c10c1cm2cm6cm5c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm13c0c6cm12c48c20c2cm57cm4cm20cm2cm12c5c13c15c3,
			CxB => R_c16cm2cm8c3c5c11c7cm8cm8c10c10c1cm2cm6cm5c0
		);

    c4cm30cm1cm2cm7c38c4c12c13c10cm8cm5cm8cm4cm2cm4_cm4cm7c36cm4cm11c8c3cm6c40c11c7c4cm3cm16cm8cm13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4cm30cm1cm2cm7c38c4c12c13c10cm8cm5cm8cm4cm2cm4_weight(1)(7-1 downto 0),
			B	=> cm4cm7c36cm4cm11c8c3cm6c40c11c7c4cm3cm16cm8cm13_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4cm30cm1cm2cm7c38c4c12c13c10cm8cm5cm8cm4cm2cm4,
			CxB => R_cm4cm7c36cm4cm11c8c3cm6c40c11c7c4cm3cm16cm8cm13
		);

    cm16c12c8c15c18c23c9cm42cm1c7c4cm19cm3c0cm2c4_cm3c2c14c0cm34cm6c0c8cm6cm15c1cm21c6cm1c38c25_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm16c12c8c15c18c23c9cm42cm1c7c4cm19cm3c0cm2c4_weight(1)(7-1 downto 0),
			B	=> cm3c2c14c0cm34cm6c0c8cm6cm15c1cm21c6cm1c38c25_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm16c12c8c15c18c23c9cm42cm1c7c4cm19cm3c0cm2c4,
			CxB => R_cm3c2c14c0cm34cm6c0c8cm6cm15c1cm21c6cm1c38c25
		);

    cm6cm24cm10cm4cm58c31cm8c3c23cm3c8cm14c5c4cm4c1_c7cm4c6cm7c4c8c36c14c10c15c7cm2cm12cm9c10c13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6cm24cm10cm4cm58c31cm8c3c23cm3c8cm14c5c4cm4c1_weight(1)(7-1 downto 0),
			B	=> c7cm4c6cm7c4c8c36c14c10c15c7cm2cm12cm9c10c13_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6cm24cm10cm4cm58c31cm8c3c23cm3c8cm14c5c4cm4c1,
			CxB => R_c7cm4c6cm7c4c8c36c14c10c15c7cm2cm12cm9c10c13
		);

    c23c15cm35c10cm34c12cm31cm3cm8c7c15cm3c20c2cm1cm2_c30c1cm12cm3c0cm4c53c8cm22cm5cm13c10cm24c5c0c27_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c23c15cm35c10cm34c12cm31cm3cm8c7c15cm3c20c2cm1cm2_weight(1)(7-1 downto 0),
			B	=> c30c1cm12cm3c0cm4c53c8cm22cm5cm13c10cm24c5c0c27_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c23c15cm35c10cm34c12cm31cm3cm8c7c15cm3c20c2cm1cm2,
			CxB => R_c30c1cm12cm3c0cm4c53c8cm22cm5cm13c10cm24c5c0c27
		);




end architecture;
