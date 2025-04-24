library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core27_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c10cm2c8c2cm1cm3cm11c1c6cm1cm28c3c0cm9c12cm11 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm7cm2c10cm3cm9c9cm18cm6c1c15c7cm27c13c12cm9cm15 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm37c0cm54c4cm1c4c5cm1cm3c3c0c1c7c6c17c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2c3cm18cm4cm4c0cm31cm30c10c8cm20c28c4c13c4c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1cm9cm2c0cm5c5cm7cm28cm42cm3c10c33c8c6cm65c10 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c4cm3cm3cm7c2cm1cm12cm13c0cm2c5cm8c3cm6cm3cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm1cm1c3c8c14cm11c4cm33cm15cm5c8c15c9cm12c0c15 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm4cm3c4cm8cm1cm2c7cm71c15c2c4c16c6cm11c3c4 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c7c1c5c9cm25c1cm3c6cm9c21c4cm4c9cm24cm6c20 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1c2c8cm14cm1c2c9cm2cm3cm1c10c11cm10c0c2cm5 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm1cm45c10cm4cm1c45cm21cm1c22cm22cm6c2c4cm3c6c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm7cm4cm1c6cm6cm1c16c6cm5cm2c28c2cm12cm10c6c19 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1cm7cm25c7c72cm30cm7c8cm3cm3cm6c5cm7cm8cm4c3 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c13cm5cm1c0c11c0cm2c1cm3c5c4cm8c27cm2c9c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1c6c0c12cm6c10c22c13cm6cm12cm23c5c6c0c6c9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c21cm3c3cm5cm22cm6cm1cm28cm11cm34c1c47c2cm7c1cm6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c4cm7c1c12cm15cm5c10cm25cm24cm18c1cm30cm7cm8c6c14 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6c5c1cm1c0cm2c0cm5c5cm4c18c0c12c2c9c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c7cm17cm7c44cm14c13c3cm34cm18cm1c9c7c12cm4c12c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c22cm6c0c44c25c13c1cm12cm8c34c4cm12c16c36c4cm37 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1c0c5c10c3cm45c0cm2cm1c43c4cm2cm5cm11cm17cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c1c7cm11c12c3cm17cm38cm4cm6cm19c19cm35cm1c9cm3cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c17c38c4cm2c8c1c47c5c16cm16c24c1c3c15c9c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2c0c4c1c5cm1cm26cm2cm46cm38cm9c0cm6cm2cm2cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1cm1c6cm2c13cm4cm2cm16cm23c0c6c25cm15cm3cm8cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1cm3c7cm3c0cm6cm3c1c10cm24cm7c6c4cm38c5c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3c28cm9cm18c6cm3cm4c4c7cm2c2cm5c20cm11cm5cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1cm1cm20c2c9c13cm4cm7cm6cm10c13c3cm8c15c14c7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6cm6c0c5c13c4c7c16c12c10c19c11c14cm5cm4c17 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1c10c10cm2c7c6cm23cm6cm1c0cm7cm6c24c1c1cm13 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm21c0c5c4c9c9c7cm9cm16c5c6c0c15cm12c7cm91 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c5c7cm4c14cm21cm1cm22c12cm54c7c19c13c0c9cm13cm15 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core27_rmcm;

architecture arch of conv7_core27_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C10CM2C8C2CM1CM3CM11C1C6CM1CM28C3C0CM9C12CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7CM2C10CM3CM9C9CM18CM6C1C15C7CM27C13C12CM9CM15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM37C0CM54C4CM1C4C5CM1CM3C3C0C1C7C6C17C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C3CM18CM4CM4C0CM31CM30C10C8CM20C28C4C13C4C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM9CM2C0CM5C5CM7CM28CM42CM3C10C33C8C6CM65C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM3CM3CM7C2CM1CM12CM13C0CM2C5CM8C3CM6CM3CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C3C8C14CM11C4CM33CM15CM5C8C15C9CM12C0C15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM3C4CM8CM1CM2C7CM71C15C2C4C16C6CM11C3C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C1C5C9CM25C1CM3C6CM9C21C4CM4C9CM24CM6C20_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C2C8CM14CM1C2C9CM2CM3CM1C10C11CM10C0C2CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM45C10CM4CM1C45CM21CM1C22CM22CM6C2C4CM3C6C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7CM4CM1C6CM6CM1C16C6CM5CM2C28C2CM12CM10C6C19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM7CM25C7C72CM30CM7C8CM3CM3CM6C5CM7CM8CM4C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13CM5CM1C0C11C0CM2C1CM3C5C4CM8C27CM2C9C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C6C0C12CM6C10C22C13CM6CM12CM23C5C6C0C6C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C21CM3C3CM5CM22CM6CM1CM28CM11CM34C1C47C2CM7C1CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM7C1C12CM15CM5C10CM25CM24CM18C1CM30CM7CM8C6C14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C5C1CM1C0CM2C0CM5C5CM4C18C0C12C2C9C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM17CM7C44CM14C13C3CM34CM18CM1C9C7C12CM4C12C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C22CM6C0C44C25C13C1CM12CM8C34C4CM12C16C36C4CM37_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0C5C10C3CM45C0CM2CM1C43C4CM2CM5CM11CM17CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C7CM11C12C3CM17CM38CM4CM6CM19C19CM35CM1C9CM3CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C17C38C4CM2C8C1C47C5C16CM16C24C1C3C15C9C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C0C4C1C5CM1CM26CM2CM46CM38CM9C0CM6CM2CM2CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C6CM2C13CM4CM2CM16CM23C0C6C25CM15CM3CM8CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM3C7CM3C0CM6CM3C1C10CM24CM7C6C4CM38C5C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C28CM9CM18C6CM3CM4C4C7CM2C2CM5C20CM11CM5CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1CM20C2C9C13CM4CM7CM6CM10C13C3CM8C15C14C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM6C0C5C13C4C7C16C12C10C19C11C14CM5CM4C17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C10C10CM2C7C6CM23CM6CM1C0CM7CM6C24C1C1CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM21C0C5C4C9C9C7CM9CM16C5C6C0C15CM12C7CM91_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C7CM4C14CM21CM1CM22C12CM54C7C19C13C0C9CM13CM15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c10cm2c8c2cm1cm3cm11c1c6cm1cm28c3c0cm9c12cm11_weight : PIPELINE_TYPE_FOR_C10CM2C8C2CM1CM3CM11C1C6CM1CM28C3C0CM9C12CM11_WEIGHT;
    -- sfix(1, -7)
    signal cm7cm2c10cm3cm9c9cm18cm6c1c15c7cm27c13c12cm9cm15_weight : PIPELINE_TYPE_FOR_CM7CM2C10CM3CM9C9CM18CM6C1C15C7CM27C13C12CM9CM15_WEIGHT;
    -- sfix(1, -7)
    signal cm37c0cm54c4cm1c4c5cm1cm3c3c0c1c7c6c17c1_weight : PIPELINE_TYPE_FOR_CM37C0CM54C4CM1C4C5CM1CM3C3C0C1C7C6C17C1_WEIGHT;
    -- sfix(1, -7)
    signal cm2c3cm18cm4cm4c0cm31cm30c10c8cm20c28c4c13c4c1_weight : PIPELINE_TYPE_FOR_CM2C3CM18CM4CM4C0CM31CM30C10C8CM20C28C4C13C4C1_WEIGHT;
    -- sfix(1, -7)
    signal c1cm9cm2c0cm5c5cm7cm28cm42cm3c10c33c8c6cm65c10_weight : PIPELINE_TYPE_FOR_C1CM9CM2C0CM5C5CM7CM28CM42CM3C10C33C8C6CM65C10_WEIGHT;
    -- sfix(1, -7)
    signal c4cm3cm3cm7c2cm1cm12cm13c0cm2c5cm8c3cm6cm3cm2_weight : PIPELINE_TYPE_FOR_C4CM3CM3CM7C2CM1CM12CM13C0CM2C5CM8C3CM6CM3CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm1c3c8c14cm11c4cm33cm15cm5c8c15c9cm12c0c15_weight : PIPELINE_TYPE_FOR_CM1CM1C3C8C14CM11C4CM33CM15CM5C8C15C9CM12C0C15_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm3c4cm8cm1cm2c7cm71c15c2c4c16c6cm11c3c4_weight : PIPELINE_TYPE_FOR_CM4CM3C4CM8CM1CM2C7CM71C15C2C4C16C6CM11C3C4_WEIGHT;
    -- sfix(1, -7)
    signal c7c1c5c9cm25c1cm3c6cm9c21c4cm4c9cm24cm6c20_weight : PIPELINE_TYPE_FOR_C7C1C5C9CM25C1CM3C6CM9C21C4CM4C9CM24CM6C20_WEIGHT;
    -- sfix(1, -7)
    signal cm1c2c8cm14cm1c2c9cm2cm3cm1c10c11cm10c0c2cm5_weight : PIPELINE_TYPE_FOR_CM1C2C8CM14CM1C2C9CM2CM3CM1C10C11CM10C0C2CM5_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm45c10cm4cm1c45cm21cm1c22cm22cm6c2c4cm3c6c2_weight : PIPELINE_TYPE_FOR_CM1CM45C10CM4CM1C45CM21CM1C22CM22CM6C2C4CM3C6C2_WEIGHT;
    -- sfix(1, -7)
    signal cm7cm4cm1c6cm6cm1c16c6cm5cm2c28c2cm12cm10c6c19_weight : PIPELINE_TYPE_FOR_CM7CM4CM1C6CM6CM1C16C6CM5CM2C28C2CM12CM10C6C19_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm7cm25c7c72cm30cm7c8cm3cm3cm6c5cm7cm8cm4c3_weight : PIPELINE_TYPE_FOR_CM1CM7CM25C7C72CM30CM7C8CM3CM3CM6C5CM7CM8CM4C3_WEIGHT;
    -- sfix(1, -7)
    signal c13cm5cm1c0c11c0cm2c1cm3c5c4cm8c27cm2c9c2_weight : PIPELINE_TYPE_FOR_C13CM5CM1C0C11C0CM2C1CM3C5C4CM8C27CM2C9C2_WEIGHT;
    -- sfix(1, -7)
    signal c1c6c0c12cm6c10c22c13cm6cm12cm23c5c6c0c6c9_weight : PIPELINE_TYPE_FOR_C1C6C0C12CM6C10C22C13CM6CM12CM23C5C6C0C6C9_WEIGHT;
    -- sfix(1, -7)
    signal c21cm3c3cm5cm22cm6cm1cm28cm11cm34c1c47c2cm7c1cm6_weight : PIPELINE_TYPE_FOR_C21CM3C3CM5CM22CM6CM1CM28CM11CM34C1C47C2CM7C1CM6_WEIGHT;
    -- sfix(1, -7)
    signal c4cm7c1c12cm15cm5c10cm25cm24cm18c1cm30cm7cm8c6c14_weight : PIPELINE_TYPE_FOR_C4CM7C1C12CM15CM5C10CM25CM24CM18C1CM30CM7CM8C6C14_WEIGHT;
    -- sfix(1, -7)
    signal c6c5c1cm1c0cm2c0cm5c5cm4c18c0c12c2c9c0_weight : PIPELINE_TYPE_FOR_C6C5C1CM1C0CM2C0CM5C5CM4C18C0C12C2C9C0_WEIGHT;
    -- sfix(1, -7)
    signal c7cm17cm7c44cm14c13c3cm34cm18cm1c9c7c12cm4c12c4_weight : PIPELINE_TYPE_FOR_C7CM17CM7C44CM14C13C3CM34CM18CM1C9C7C12CM4C12C4_WEIGHT;
    -- sfix(1, -7)
    signal c22cm6c0c44c25c13c1cm12cm8c34c4cm12c16c36c4cm37_weight : PIPELINE_TYPE_FOR_C22CM6C0C44C25C13C1CM12CM8C34C4CM12C16C36C4CM37_WEIGHT;
    -- sfix(1, -7)
    signal cm1c0c5c10c3cm45c0cm2cm1c43c4cm2cm5cm11cm17cm4_weight : PIPELINE_TYPE_FOR_CM1C0C5C10C3CM45C0CM2CM1C43C4CM2CM5CM11CM17CM4_WEIGHT;
    -- sfix(1, -7)
    signal c1c7cm11c12c3cm17cm38cm4cm6cm19c19cm35cm1c9cm3cm5_weight : PIPELINE_TYPE_FOR_C1C7CM11C12C3CM17CM38CM4CM6CM19C19CM35CM1C9CM3CM5_WEIGHT;
    -- sfix(1, -7)
    signal c17c38c4cm2c8c1c47c5c16cm16c24c1c3c15c9c2_weight : PIPELINE_TYPE_FOR_C17C38C4CM2C8C1C47C5C16CM16C24C1C3C15C9C2_WEIGHT;
    -- sfix(1, -7)
    signal cm2c0c4c1c5cm1cm26cm2cm46cm38cm9c0cm6cm2cm2cm3_weight : PIPELINE_TYPE_FOR_CM2C0C4C1C5CM1CM26CM2CM46CM38CM9C0CM6CM2CM2CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm1c6cm2c13cm4cm2cm16cm23c0c6c25cm15cm3cm8cm1_weight : PIPELINE_TYPE_FOR_CM1CM1C6CM2C13CM4CM2CM16CM23C0C6C25CM15CM3CM8CM1_WEIGHT;
    -- sfix(1, -7)
    signal c1cm3c7cm3c0cm6cm3c1c10cm24cm7c6c4cm38c5c2_weight : PIPELINE_TYPE_FOR_C1CM3C7CM3C0CM6CM3C1C10CM24CM7C6C4CM38C5C2_WEIGHT;
    -- sfix(1, -7)
    signal cm3c28cm9cm18c6cm3cm4c4c7cm2c2cm5c20cm11cm5cm2_weight : PIPELINE_TYPE_FOR_CM3C28CM9CM18C6CM3CM4C4C7CM2C2CM5C20CM11CM5CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm1cm20c2c9c13cm4cm7cm6cm10c13c3cm8c15c14c7_weight : PIPELINE_TYPE_FOR_CM1CM1CM20C2C9C13CM4CM7CM6CM10C13C3CM8C15C14C7_WEIGHT;
    -- sfix(1, -7)
    signal c6cm6c0c5c13c4c7c16c12c10c19c11c14cm5cm4c17_weight : PIPELINE_TYPE_FOR_C6CM6C0C5C13C4C7C16C12C10C19C11C14CM5CM4C17_WEIGHT;
    -- sfix(1, -7)
    signal c1c10c10cm2c7c6cm23cm6cm1c0cm7cm6c24c1c1cm13_weight : PIPELINE_TYPE_FOR_C1C10C10CM2C7C6CM23CM6CM1C0CM7CM6C24C1C1CM13_WEIGHT;
    -- sfix(1, -7)
    signal cm21c0c5c4c9c9c7cm9cm16c5c6c0c15cm12c7cm91_weight : PIPELINE_TYPE_FOR_CM21C0C5C4C9C9C7CM9CM16C5C6C0C15CM12C7CM91_WEIGHT;
    -- sfix(1, -7)
    signal c5c7cm4c14cm21cm1cm22c12cm54c7c19c13c0c9cm13cm15_weight : PIPELINE_TYPE_FOR_C5C7CM4C14CM21CM1CM22C12CM54C7C19C13C0C9CM13CM15_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core27_rmcm_weightsconstant_memory
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
        
            dout1   => c10cm2c8c2cm1cm3cm11c1c6cm1cm28c3c0cm9c12cm11_weight(0), 
            dout2   => cm7cm2c10cm3cm9c9cm18cm6c1c15c7cm27c13c12cm9cm15_weight(0), 
            dout3   => cm37c0cm54c4cm1c4c5cm1cm3c3c0c1c7c6c17c1_weight(0), 
            dout4   => cm2c3cm18cm4cm4c0cm31cm30c10c8cm20c28c4c13c4c1_weight(0), 
            dout5   => c1cm9cm2c0cm5c5cm7cm28cm42cm3c10c33c8c6cm65c10_weight(0), 
            dout6   => c4cm3cm3cm7c2cm1cm12cm13c0cm2c5cm8c3cm6cm3cm2_weight(0), 
            dout7   => cm1cm1c3c8c14cm11c4cm33cm15cm5c8c15c9cm12c0c15_weight(0), 
            dout8   => cm4cm3c4cm8cm1cm2c7cm71c15c2c4c16c6cm11c3c4_weight(0), 
            dout9   => c7c1c5c9cm25c1cm3c6cm9c21c4cm4c9cm24cm6c20_weight(0), 
            dout10   => cm1c2c8cm14cm1c2c9cm2cm3cm1c10c11cm10c0c2cm5_weight(0), 
            dout11   => cm1cm45c10cm4cm1c45cm21cm1c22cm22cm6c2c4cm3c6c2_weight(0), 
            dout12   => cm7cm4cm1c6cm6cm1c16c6cm5cm2c28c2cm12cm10c6c19_weight(0), 
            dout13   => cm1cm7cm25c7c72cm30cm7c8cm3cm3cm6c5cm7cm8cm4c3_weight(0), 
            dout14   => c13cm5cm1c0c11c0cm2c1cm3c5c4cm8c27cm2c9c2_weight(0), 
            dout15   => c1c6c0c12cm6c10c22c13cm6cm12cm23c5c6c0c6c9_weight(0), 
            dout16   => c21cm3c3cm5cm22cm6cm1cm28cm11cm34c1c47c2cm7c1cm6_weight(0), 
            dout17   => c4cm7c1c12cm15cm5c10cm25cm24cm18c1cm30cm7cm8c6c14_weight(0), 
            dout18   => c6c5c1cm1c0cm2c0cm5c5cm4c18c0c12c2c9c0_weight(0), 
            dout19   => c7cm17cm7c44cm14c13c3cm34cm18cm1c9c7c12cm4c12c4_weight(0), 
            dout20   => c22cm6c0c44c25c13c1cm12cm8c34c4cm12c16c36c4cm37_weight(0), 
            dout21   => cm1c0c5c10c3cm45c0cm2cm1c43c4cm2cm5cm11cm17cm4_weight(0), 
            dout22   => c1c7cm11c12c3cm17cm38cm4cm6cm19c19cm35cm1c9cm3cm5_weight(0), 
            dout23   => c17c38c4cm2c8c1c47c5c16cm16c24c1c3c15c9c2_weight(0), 
            dout24   => cm2c0c4c1c5cm1cm26cm2cm46cm38cm9c0cm6cm2cm2cm3_weight(0), 
            dout25   => cm1cm1c6cm2c13cm4cm2cm16cm23c0c6c25cm15cm3cm8cm1_weight(0), 
            dout26   => c1cm3c7cm3c0cm6cm3c1c10cm24cm7c6c4cm38c5c2_weight(0), 
            dout27   => cm3c28cm9cm18c6cm3cm4c4c7cm2c2cm5c20cm11cm5cm2_weight(0), 
            dout28   => cm1cm1cm20c2c9c13cm4cm7cm6cm10c13c3cm8c15c14c7_weight(0), 
            dout29   => c6cm6c0c5c13c4c7c16c12c10c19c11c14cm5cm4c17_weight(0), 
            dout30   => c1c10c10cm2c7c6cm23cm6cm1c0cm7cm6c24c1c1cm13_weight(0), 
            dout31   => cm21c0c5c4c9c9c7cm9cm16c5c6c0c15cm12c7cm91_weight(0), 
            dout32   => c5c7cm4c14cm21cm1cm22c12cm54c7c19c13c0c9cm13cm15_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c10cm2c8c2cm1cm3cm11c1c6cm1cm28c3c0cm9c12cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10cm2c8c2cm1cm3cm11c1c6cm1cm28c3c0cm9c12cm11_weight(0), c10cm2c8c2cm1cm3cm11c1c6cm1cm28c3c0cm9c12cm11_weight(1));
    PL_STEP_0_for_cm7cm2c10cm3cm9c9cm18cm6c1c15c7cm27c13c12cm9cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7cm2c10cm3cm9c9cm18cm6c1c15c7cm27c13c12cm9cm15_weight(0), cm7cm2c10cm3cm9c9cm18cm6c1c15c7cm27c13c12cm9cm15_weight(1));
    PL_STEP_0_for_cm37c0cm54c4cm1c4c5cm1cm3c3c0c1c7c6c17c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm37c0cm54c4cm1c4c5cm1cm3c3c0c1c7c6c17c1_weight(0), cm37c0cm54c4cm1c4c5cm1cm3c3c0c1c7c6c17c1_weight(1));
    PL_STEP_0_for_cm2c3cm18cm4cm4c0cm31cm30c10c8cm20c28c4c13c4c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c3cm18cm4cm4c0cm31cm30c10c8cm20c28c4c13c4c1_weight(0), cm2c3cm18cm4cm4c0cm31cm30c10c8cm20c28c4c13c4c1_weight(1));
    PL_STEP_0_for_c1cm9cm2c0cm5c5cm7cm28cm42cm3c10c33c8c6cm65c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm9cm2c0cm5c5cm7cm28cm42cm3c10c33c8c6cm65c10_weight(0), c1cm9cm2c0cm5c5cm7cm28cm42cm3c10c33c8c6cm65c10_weight(1));
    PL_STEP_0_for_c4cm3cm3cm7c2cm1cm12cm13c0cm2c5cm8c3cm6cm3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm3cm3cm7c2cm1cm12cm13c0cm2c5cm8c3cm6cm3cm2_weight(0), c4cm3cm3cm7c2cm1cm12cm13c0cm2c5cm8c3cm6cm3cm2_weight(1));
    PL_STEP_0_for_cm1cm1c3c8c14cm11c4cm33cm15cm5c8c15c9cm12c0c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c3c8c14cm11c4cm33cm15cm5c8c15c9cm12c0c15_weight(0), cm1cm1c3c8c14cm11c4cm33cm15cm5c8c15c9cm12c0c15_weight(1));
    PL_STEP_0_for_cm4cm3c4cm8cm1cm2c7cm71c15c2c4c16c6cm11c3c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm3c4cm8cm1cm2c7cm71c15c2c4c16c6cm11c3c4_weight(0), cm4cm3c4cm8cm1cm2c7cm71c15c2c4c16c6cm11c3c4_weight(1));
    PL_STEP_0_for_c7c1c5c9cm25c1cm3c6cm9c21c4cm4c9cm24cm6c20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c1c5c9cm25c1cm3c6cm9c21c4cm4c9cm24cm6c20_weight(0), c7c1c5c9cm25c1cm3c6cm9c21c4cm4c9cm24cm6c20_weight(1));
    PL_STEP_0_for_cm1c2c8cm14cm1c2c9cm2cm3cm1c10c11cm10c0c2cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c2c8cm14cm1c2c9cm2cm3cm1c10c11cm10c0c2cm5_weight(0), cm1c2c8cm14cm1c2c9cm2cm3cm1c10c11cm10c0c2cm5_weight(1));
    PL_STEP_0_for_cm1cm45c10cm4cm1c45cm21cm1c22cm22cm6c2c4cm3c6c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm45c10cm4cm1c45cm21cm1c22cm22cm6c2c4cm3c6c2_weight(0), cm1cm45c10cm4cm1c45cm21cm1c22cm22cm6c2c4cm3c6c2_weight(1));
    PL_STEP_0_for_cm7cm4cm1c6cm6cm1c16c6cm5cm2c28c2cm12cm10c6c19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7cm4cm1c6cm6cm1c16c6cm5cm2c28c2cm12cm10c6c19_weight(0), cm7cm4cm1c6cm6cm1c16c6cm5cm2c28c2cm12cm10c6c19_weight(1));
    PL_STEP_0_for_cm1cm7cm25c7c72cm30cm7c8cm3cm3cm6c5cm7cm8cm4c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm7cm25c7c72cm30cm7c8cm3cm3cm6c5cm7cm8cm4c3_weight(0), cm1cm7cm25c7c72cm30cm7c8cm3cm3cm6c5cm7cm8cm4c3_weight(1));
    PL_STEP_0_for_c13cm5cm1c0c11c0cm2c1cm3c5c4cm8c27cm2c9c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13cm5cm1c0c11c0cm2c1cm3c5c4cm8c27cm2c9c2_weight(0), c13cm5cm1c0c11c0cm2c1cm3c5c4cm8c27cm2c9c2_weight(1));
    PL_STEP_0_for_c1c6c0c12cm6c10c22c13cm6cm12cm23c5c6c0c6c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c6c0c12cm6c10c22c13cm6cm12cm23c5c6c0c6c9_weight(0), c1c6c0c12cm6c10c22c13cm6cm12cm23c5c6c0c6c9_weight(1));
    PL_STEP_0_for_c21cm3c3cm5cm22cm6cm1cm28cm11cm34c1c47c2cm7c1cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c21cm3c3cm5cm22cm6cm1cm28cm11cm34c1c47c2cm7c1cm6_weight(0), c21cm3c3cm5cm22cm6cm1cm28cm11cm34c1c47c2cm7c1cm6_weight(1));
    PL_STEP_0_for_c4cm7c1c12cm15cm5c10cm25cm24cm18c1cm30cm7cm8c6c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm7c1c12cm15cm5c10cm25cm24cm18c1cm30cm7cm8c6c14_weight(0), c4cm7c1c12cm15cm5c10cm25cm24cm18c1cm30cm7cm8c6c14_weight(1));
    PL_STEP_0_for_c6c5c1cm1c0cm2c0cm5c5cm4c18c0c12c2c9c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c5c1cm1c0cm2c0cm5c5cm4c18c0c12c2c9c0_weight(0), c6c5c1cm1c0cm2c0cm5c5cm4c18c0c12c2c9c0_weight(1));
    PL_STEP_0_for_c7cm17cm7c44cm14c13c3cm34cm18cm1c9c7c12cm4c12c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm17cm7c44cm14c13c3cm34cm18cm1c9c7c12cm4c12c4_weight(0), c7cm17cm7c44cm14c13c3cm34cm18cm1c9c7c12cm4c12c4_weight(1));
    PL_STEP_0_for_c22cm6c0c44c25c13c1cm12cm8c34c4cm12c16c36c4cm37_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c22cm6c0c44c25c13c1cm12cm8c34c4cm12c16c36c4cm37_weight(0), c22cm6c0c44c25c13c1cm12cm8c34c4cm12c16c36c4cm37_weight(1));
    PL_STEP_0_for_cm1c0c5c10c3cm45c0cm2cm1c43c4cm2cm5cm11cm17cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0c5c10c3cm45c0cm2cm1c43c4cm2cm5cm11cm17cm4_weight(0), cm1c0c5c10c3cm45c0cm2cm1c43c4cm2cm5cm11cm17cm4_weight(1));
    PL_STEP_0_for_c1c7cm11c12c3cm17cm38cm4cm6cm19c19cm35cm1c9cm3cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c7cm11c12c3cm17cm38cm4cm6cm19c19cm35cm1c9cm3cm5_weight(0), c1c7cm11c12c3cm17cm38cm4cm6cm19c19cm35cm1c9cm3cm5_weight(1));
    PL_STEP_0_for_c17c38c4cm2c8c1c47c5c16cm16c24c1c3c15c9c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c17c38c4cm2c8c1c47c5c16cm16c24c1c3c15c9c2_weight(0), c17c38c4cm2c8c1c47c5c16cm16c24c1c3c15c9c2_weight(1));
    PL_STEP_0_for_cm2c0c4c1c5cm1cm26cm2cm46cm38cm9c0cm6cm2cm2cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c0c4c1c5cm1cm26cm2cm46cm38cm9c0cm6cm2cm2cm3_weight(0), cm2c0c4c1c5cm1cm26cm2cm46cm38cm9c0cm6cm2cm2cm3_weight(1));
    PL_STEP_0_for_cm1cm1c6cm2c13cm4cm2cm16cm23c0c6c25cm15cm3cm8cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c6cm2c13cm4cm2cm16cm23c0c6c25cm15cm3cm8cm1_weight(0), cm1cm1c6cm2c13cm4cm2cm16cm23c0c6c25cm15cm3cm8cm1_weight(1));
    PL_STEP_0_for_c1cm3c7cm3c0cm6cm3c1c10cm24cm7c6c4cm38c5c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm3c7cm3c0cm6cm3c1c10cm24cm7c6c4cm38c5c2_weight(0), c1cm3c7cm3c0cm6cm3c1c10cm24cm7c6c4cm38c5c2_weight(1));
    PL_STEP_0_for_cm3c28cm9cm18c6cm3cm4c4c7cm2c2cm5c20cm11cm5cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c28cm9cm18c6cm3cm4c4c7cm2c2cm5c20cm11cm5cm2_weight(0), cm3c28cm9cm18c6cm3cm4c4c7cm2c2cm5c20cm11cm5cm2_weight(1));
    PL_STEP_0_for_cm1cm1cm20c2c9c13cm4cm7cm6cm10c13c3cm8c15c14c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1cm20c2c9c13cm4cm7cm6cm10c13c3cm8c15c14c7_weight(0), cm1cm1cm20c2c9c13cm4cm7cm6cm10c13c3cm8c15c14c7_weight(1));
    PL_STEP_0_for_c6cm6c0c5c13c4c7c16c12c10c19c11c14cm5cm4c17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm6c0c5c13c4c7c16c12c10c19c11c14cm5cm4c17_weight(0), c6cm6c0c5c13c4c7c16c12c10c19c11c14cm5cm4c17_weight(1));
    PL_STEP_0_for_c1c10c10cm2c7c6cm23cm6cm1c0cm7cm6c24c1c1cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c10c10cm2c7c6cm23cm6cm1c0cm7cm6c24c1c1cm13_weight(0), c1c10c10cm2c7c6cm23cm6cm1c0cm7cm6c24c1c1cm13_weight(1));
    PL_STEP_0_for_cm21c0c5c4c9c9c7cm9cm16c5c6c0c15cm12c7cm91_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm21c0c5c4c9c9c7cm9cm16c5c6c0c15cm12c7cm91_weight(0), cm21c0c5c4c9c9c7cm9cm16c5c6c0c15cm12c7cm91_weight(1));
    PL_STEP_0_for_c5c7cm4c14cm21cm1cm22c12cm54c7c19c13c0c9cm13cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c7cm4c14cm21cm1cm22c12cm54c7c19c13c0c9cm13cm15_weight(0), c5c7cm4c14cm21cm1cm22c12cm54c7c19c13c0c9cm13cm15_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c1cm9cm2c0cm5c5cm7cm28cm42cm3c10c33c8c6cm65c10_cm1c2c8cm14cm1c2c9cm2cm3cm1c10c11cm10c0c2cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm9cm2c0cm5c5cm7cm28cm42cm3c10c33c8c6cm65c10_weight(1)(8-1 downto 0),
			B	=> cm1c2c8cm14cm1c2c9cm2cm3cm1c10c11cm10c0c2cm5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm9cm2c0cm5c5cm7cm28cm42cm3c10c33c8c6cm65c10,
			CxB => R_cm1c2c8cm14cm1c2c9cm2cm3cm1c10c11cm10c0c2cm5
		);

    cm4cm3c4cm8cm1cm2c7cm71c15c2c4c16c6cm11c3c4_c4cm3cm3cm7c2cm1cm12cm13c0cm2c5cm8c3cm6cm3cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm3c4cm8cm1cm2c7cm71c15c2c4c16c6cm11c3c4_weight(1)(8-1 downto 0),
			B	=> c4cm3cm3cm7c2cm1cm12cm13c0cm2c5cm8c3cm6cm3cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm3c4cm8cm1cm2c7cm71c15c2c4c16c6cm11c3c4,
			CxB => R_c4cm3cm3cm7c2cm1cm12cm13c0cm2c5cm8c3cm6cm3cm2
		);

    cm1cm7cm25c7c72cm30cm7c8cm3cm3cm6c5cm7cm8cm4c3_c1c10c10cm2c7c6cm23cm6cm1c0cm7cm6c24c1c1cm13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm7cm25c7c72cm30cm7c8cm3cm3cm6c5cm7cm8cm4c3_weight(1)(8-1 downto 0),
			B	=> c1c10c10cm2c7c6cm23cm6cm1c0cm7cm6c24c1c1cm13_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm7cm25c7c72cm30cm7c8cm3cm3cm6c5cm7cm8cm4c3,
			CxB => R_c1c10c10cm2c7c6cm23cm6cm1c0cm7cm6c24c1c1cm13
		);

    cm21c0c5c4c9c9c7cm9cm16c5c6c0c15cm12c7cm91_c6cm6c0c5c13c4c7c16c12c10c19c11c14cm5cm4c17_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm21c0c5c4c9c9c7cm9cm16c5c6c0c15cm12c7cm91_weight(1)(8-1 downto 0),
			B	=> c6cm6c0c5c13c4c7c16c12c10c19c11c14cm5cm4c17_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm21c0c5c4c9c9c7cm9cm16c5c6c0c15cm12c7cm91,
			CxB => R_c6cm6c0c5c13c4c7c16c12c10c19c11c14cm5cm4c17
		);

    cm37c0cm54c4cm1c4c5cm1cm3c3c0c1c7c6c17c1_cm1cm1cm20c2c9c13cm4cm7cm6cm10c13c3cm8c15c14c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm37c0cm54c4cm1c4c5cm1cm3c3c0c1c7c6c17c1_weight(1)(7-1 downto 0),
			B	=> cm1cm1cm20c2c9c13cm4cm7cm6cm10c13c3cm8c15c14c7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm37c0cm54c4cm1c4c5cm1cm3c3c0c1c7c6c17c1,
			CxB => R_cm1cm1cm20c2c9c13cm4cm7cm6cm10c13c3cm8c15c14c7
		);

    cm1cm1c3c8c14cm11c4cm33cm15cm5c8c15c9cm12c0c15_cm3c28cm9cm18c6cm3cm4c4c7cm2c2cm5c20cm11cm5cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm1c3c8c14cm11c4cm33cm15cm5c8c15c9cm12c0c15_weight(1)(7-1 downto 0),
			B	=> cm3c28cm9cm18c6cm3cm4c4c7cm2c2cm5c20cm11cm5cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm1c3c8c14cm11c4cm33cm15cm5c8c15c9cm12c0c15,
			CxB => R_cm3c28cm9cm18c6cm3cm4c4c7cm2c2cm5c20cm11cm5cm2
		);

    cm1cm45c10cm4cm1c45cm21cm1c22cm22cm6c2c4cm3c6c2_cm1cm1c6cm2c13cm4cm2cm16cm23c0c6c25cm15cm3cm8cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm45c10cm4cm1c45cm21cm1c22cm22cm6c2c4cm3c6c2_weight(1)(7-1 downto 0),
			B	=> cm1cm1c6cm2c13cm4cm2cm16cm23c0c6c25cm15cm3cm8cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm45c10cm4cm1c45cm21cm1c22cm22cm6c2c4cm3c6c2,
			CxB => R_cm1cm1c6cm2c13cm4cm2cm16cm23c0c6c25cm15cm3cm8cm1
		);

    c21cm3c3cm5cm22cm6cm1cm28cm11cm34c1c47c2cm7c1cm6_c6c5c1cm1c0cm2c0cm5c5cm4c18c0c12c2c9c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c21cm3c3cm5cm22cm6cm1cm28cm11cm34c1c47c2cm7c1cm6_weight(1)(7-1 downto 0),
			B	=> c6c5c1cm1c0cm2c0cm5c5cm4c18c0c12c2c9c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c21cm3c3cm5cm22cm6cm1cm28cm11cm34c1c47c2cm7c1cm6,
			CxB => R_c6c5c1cm1c0cm2c0cm5c5cm4c18c0c12c2c9c0
		);

    c7cm17cm7c44cm14c13c3cm34cm18cm1c9c7c12cm4c12c4_c4cm7c1c12cm15cm5c10cm25cm24cm18c1cm30cm7cm8c6c14_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7cm17cm7c44cm14c13c3cm34cm18cm1c9c7c12cm4c12c4_weight(1)(7-1 downto 0),
			B	=> c4cm7c1c12cm15cm5c10cm25cm24cm18c1cm30cm7cm8c6c14_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7cm17cm7c44cm14c13c3cm34cm18cm1c9c7c12cm4c12c4,
			CxB => R_c4cm7c1c12cm15cm5c10cm25cm24cm18c1cm30cm7cm8c6c14
		);

    c22cm6c0c44c25c13c1cm12cm8c34c4cm12c16c36c4cm37_c1c6c0c12cm6c10c22c13cm6cm12cm23c5c6c0c6c9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c22cm6c0c44c25c13c1cm12cm8c34c4cm12c16c36c4cm37_weight(1)(7-1 downto 0),
			B	=> c1c6c0c12cm6c10c22c13cm6cm12cm23c5c6c0c6c9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c22cm6c0c44c25c13c1cm12cm8c34c4cm12c16c36c4cm37,
			CxB => R_c1c6c0c12cm6c10c22c13cm6cm12cm23c5c6c0c6c9
		);

    cm1c0c5c10c3cm45c0cm2cm1c43c4cm2cm5cm11cm17cm4_c13cm5cm1c0c11c0cm2c1cm3c5c4cm8c27cm2c9c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c0c5c10c3cm45c0cm2cm1c43c4cm2cm5cm11cm17cm4_weight(1)(7-1 downto 0),
			B	=> c13cm5cm1c0c11c0cm2c1cm3c5c4cm8c27cm2c9c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c0c5c10c3cm45c0cm2cm1c43c4cm2cm5cm11cm17cm4,
			CxB => R_c13cm5cm1c0c11c0cm2c1cm3c5c4cm8c27cm2c9c2
		);

    c1c7cm11c12c3cm17cm38cm4cm6cm19c19cm35cm1c9cm3cm5_cm7cm4cm1c6cm6cm1c16c6cm5cm2c28c2cm12cm10c6c19_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c7cm11c12c3cm17cm38cm4cm6cm19c19cm35cm1c9cm3cm5_weight(1)(7-1 downto 0),
			B	=> cm7cm4cm1c6cm6cm1c16c6cm5cm2c28c2cm12cm10c6c19_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c7cm11c12c3cm17cm38cm4cm6cm19c19cm35cm1c9cm3cm5,
			CxB => R_cm7cm4cm1c6cm6cm1c16c6cm5cm2c28c2cm12cm10c6c19
		);

    c17c38c4cm2c8c1c47c5c16cm16c24c1c3c15c9c2_c7c1c5c9cm25c1cm3c6cm9c21c4cm4c9cm24cm6c20_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c17c38c4cm2c8c1c47c5c16cm16c24c1c3c15c9c2_weight(1)(7-1 downto 0),
			B	=> c7c1c5c9cm25c1cm3c6cm9c21c4cm4c9cm24cm6c20_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c17c38c4cm2c8c1c47c5c16cm16c24c1c3c15c9c2,
			CxB => R_c7c1c5c9cm25c1cm3c6cm9c21c4cm4c9cm24cm6c20
		);

    cm2c0c4c1c5cm1cm26cm2cm46cm38cm9c0cm6cm2cm2cm3_cm2c3cm18cm4cm4c0cm31cm30c10c8cm20c28c4c13c4c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c0c4c1c5cm1cm26cm2cm46cm38cm9c0cm6cm2cm2cm3_weight(1)(7-1 downto 0),
			B	=> cm2c3cm18cm4cm4c0cm31cm30c10c8cm20c28c4c13c4c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c0c4c1c5cm1cm26cm2cm46cm38cm9c0cm6cm2cm2cm3,
			CxB => R_cm2c3cm18cm4cm4c0cm31cm30c10c8cm20c28c4c13c4c1
		);

    c1cm3c7cm3c0cm6cm3c1c10cm24cm7c6c4cm38c5c2_cm7cm2c10cm3cm9c9cm18cm6c1c15c7cm27c13c12cm9cm15_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm3c7cm3c0cm6cm3c1c10cm24cm7c6c4cm38c5c2_weight(1)(7-1 downto 0),
			B	=> cm7cm2c10cm3cm9c9cm18cm6c1c15c7cm27c13c12cm9cm15_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm3c7cm3c0cm6cm3c1c10cm24cm7c6c4cm38c5c2,
			CxB => R_cm7cm2c10cm3cm9c9cm18cm6c1c15c7cm27c13c12cm9cm15
		);

    c5c7cm4c14cm21cm1cm22c12cm54c7c19c13c0c9cm13cm15_c10cm2c8c2cm1cm3cm11c1c6cm1cm28c3c0cm9c12cm11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5c7cm4c14cm21cm1cm22c12cm54c7c19c13c0c9cm13cm15_weight(1)(7-1 downto 0),
			B	=> c10cm2c8c2cm1cm3cm11c1c6cm1cm28c3c0cm9c12cm11_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c7cm4c14cm21cm1cm22c12cm54c7c19c13c0c9cm13cm15,
			CxB => R_c10cm2c8c2cm1cm3cm11c1c6cm1cm28c3c0cm9c12cm11
		);




end architecture;
