library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core23_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm19cm12c1c7c35cm3cm6c4c11cm5cm15c2cm2c0c9cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3c7c34cm4c8cm2c19c19c16c0c9c2cm4cm117cm2c0 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c16c4cm5cm14cm2c12cm36cm3cm58c1cm13c2c8c8c4c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm5c6cm31c1cm25c30c7cm10c2c5cm8c24cm2cm4c7c5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6c4c2cm16c3cm4cm4cm3cm3cm2c2cm2c12cm58cm9c18 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c4c0c12c1c4cm8cm5c18c6cm2cm1cm14c0c7c2c9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c5cm13c4cm14c10c20c2c10cm22cm3c6c4cm2c2c1c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c11c0cm3c6cm4c8c1cm3cm2c0c5cm10c8c0c8c2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm2c1cm1c9cm7c5c13c2cm4c7c0cm1cm1cm2cm5c0 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c33c1cm6c12c6c2c1c3c4c2c2c0c0cm1c3cm12 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c10c8c3cm7cm2c2cm10cm17cm2c51c8cm1c1cm5cm17c3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm13c8cm3c6cm7c0c1c5c0c0c8c5c1cm1c4c1 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c7c9c11c3cm23cm13cm7cm3c18c3cm24c3cm6cm2cm2cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c10cm3c5cm1cm13c0c2cm2c12cm6c1c3c20cm1cm1c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm2c3c21cm6c24cm12c6c7c1cm1cm5c10cm3c6c5c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c28c7c3cm8cm6cm9c2c1cm37c5c2c1c1cm29c0c16 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c16cm10c9cm21c4cm3cm7c1c4c7c6cm3c18cm6c5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm26cm2c22c4c9c5c17cm1c3c3cm5cm1c1cm2cm1cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c14c1cm9cm4c1cm6cm7c6cm1cm1cm9c22cm1cm8cm3cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm7c1cm3cm9c2c5c1c10cm40cm6cm1cm79cm3cm7c0cm2 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm13cm10c2c3c9c10cm7cm3cm12cm8c9c17c1c47cm1cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c11c0cm5c6cm12cm3cm18c17c10c4cm11c3cm2c0cm8c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c12cm15c2c6cm2cm2cm5cm6c14c30c2c2cm7cm12c11c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c5c15c5c5c14cm9c3cm3c6cm4c5c2cm33cm2c4c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c21cm24c10c1c2c2c5c0c7c3c6cm3c23cm1cm8c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c2c3c2cm2cm2c17c2c0c18cm1c0cm6c5cm2c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2c7cm1cm26c0c1cm8c4cm5cm4c47c22c2c1cm3cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c6c18cm6c1c1cm7cm9c1c3c3cm5cm4c4c9c8c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c5c5c3c5cm12c2cm6c5c2c5c9c2cm24cm1cm2cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm26c15cm20c2c15c1c4cm10cm4c5c8cm1cm1cm10cm2c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1c14cm2c19cm13c7cm3c1c1cm2c1cm24cm8cm5cm3c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm2cm7c4c28cm7cm6cm14cm11c3c1cm48c2c10cm5c11cm12 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core23_rmcm;

architecture arch of conv7_core23_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM19CM12C1C7C35CM3CM6C4C11CM5CM15C2CM2C0C9CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C7C34CM4C8CM2C19C19C16C0C9C2CM4CM117CM2C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C16C4CM5CM14CM2C12CM36CM3CM58C1CM13C2C8C8C4C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C6CM31C1CM25C30C7CM10C2C5CM8C24CM2CM4C7C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C4C2CM16C3CM4CM4CM3CM3CM2C2CM2C12CM58CM9C18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C0C12C1C4CM8CM5C18C6CM2CM1CM14C0C7C2C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM13C4CM14C10C20C2C10CM22CM3C6C4CM2C2C1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C0CM3C6CM4C8C1CM3CM2C0C5CM10C8C0C8C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1CM1C9CM7C5C13C2CM4C7C0CM1CM1CM2CM5C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C33C1CM6C12C6C2C1C3C4C2C2C0C0CM1C3CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10C8C3CM7CM2C2CM10CM17CM2C51C8CM1C1CM5CM17C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C8CM3C6CM7C0C1C5C0C0C8C5C1CM1C4C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C9C11C3CM23CM13CM7CM3C18C3CM24C3CM6CM2CM2CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10CM3C5CM1CM13C0C2CM2C12CM6C1C3C20CM1CM1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C3C21CM6C24CM12C6C7C1CM1CM5C10CM3C6C5C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C28C7C3CM8CM6CM9C2C1CM37C5C2C1C1CM29C0C16_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C16CM10C9CM21C4CM3CM7C1C4C7C6CM3C18CM6C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM26CM2C22C4C9C5C17CM1C3C3CM5CM1C1CM2CM1CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14C1CM9CM4C1CM6CM7C6CM1CM1CM9C22CM1CM8CM3CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C1CM3CM9C2C5C1C10CM40CM6CM1CM79CM3CM7C0CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13CM10C2C3C9C10CM7CM3CM12CM8C9C17C1C47CM1CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C0CM5C6CM12CM3CM18C17C10C4CM11C3CM2C0CM8C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12CM15C2C6CM2CM2CM5CM6C14C30C2C2CM7CM12C11C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C15C5C5C14CM9C3CM3C6CM4C5C2CM33CM2C4C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C21CM24C10C1C2C2C5C0C7C3C6CM3C23CM1CM8C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C2C3C2CM2CM2C17C2C0C18CM1C0CM6C5CM2C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C7CM1CM26C0C1CM8C4CM5CM4C47C22C2C1CM3CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C18CM6C1C1CM7CM9C1C3C3CM5CM4C4C9C8C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C5C3C5CM12C2CM6C5C2C5C9C2CM24CM1CM2CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM26C15CM20C2C15C1C4CM10CM4C5C8CM1CM1CM10CM2C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C14CM2C19CM13C7CM3C1C1CM2C1CM24CM8CM5CM3C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM7C4C28CM7CM6CM14CM11C3C1CM48C2C10CM5C11CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm19cm12c1c7c35cm3cm6c4c11cm5cm15c2cm2c0c9cm3_weight : PIPELINE_TYPE_FOR_CM19CM12C1C7C35CM3CM6C4C11CM5CM15C2CM2C0C9CM3_WEIGHT;
    -- sfix(1, -7)
    signal c3c7c34cm4c8cm2c19c19c16c0c9c2cm4cm117cm2c0_weight : PIPELINE_TYPE_FOR_C3C7C34CM4C8CM2C19C19C16C0C9C2CM4CM117CM2C0_WEIGHT;
    -- sfix(1, -7)
    signal c16c4cm5cm14cm2c12cm36cm3cm58c1cm13c2c8c8c4c0_weight : PIPELINE_TYPE_FOR_C16C4CM5CM14CM2C12CM36CM3CM58C1CM13C2C8C8C4C0_WEIGHT;
    -- sfix(1, -7)
    signal cm5c6cm31c1cm25c30c7cm10c2c5cm8c24cm2cm4c7c5_weight : PIPELINE_TYPE_FOR_CM5C6CM31C1CM25C30C7CM10C2C5CM8C24CM2CM4C7C5_WEIGHT;
    -- sfix(1, -7)
    signal c6c4c2cm16c3cm4cm4cm3cm3cm2c2cm2c12cm58cm9c18_weight : PIPELINE_TYPE_FOR_C6C4C2CM16C3CM4CM4CM3CM3CM2C2CM2C12CM58CM9C18_WEIGHT;
    -- sfix(1, -7)
    signal c4c0c12c1c4cm8cm5c18c6cm2cm1cm14c0c7c2c9_weight : PIPELINE_TYPE_FOR_C4C0C12C1C4CM8CM5C18C6CM2CM1CM14C0C7C2C9_WEIGHT;
    -- sfix(1, -7)
    signal c5cm13c4cm14c10c20c2c10cm22cm3c6c4cm2c2c1c3_weight : PIPELINE_TYPE_FOR_C5CM13C4CM14C10C20C2C10CM22CM3C6C4CM2C2C1C3_WEIGHT;
    -- sfix(1, -7)
    signal c11c0cm3c6cm4c8c1cm3cm2c0c5cm10c8c0c8c2_weight : PIPELINE_TYPE_FOR_C11C0CM3C6CM4C8C1CM3CM2C0C5CM10C8C0C8C2_WEIGHT;
    -- sfix(1, -7)
    signal cm2c1cm1c9cm7c5c13c2cm4c7c0cm1cm1cm2cm5c0_weight : PIPELINE_TYPE_FOR_CM2C1CM1C9CM7C5C13C2CM4C7C0CM1CM1CM2CM5C0_WEIGHT;
    -- sfix(1, -7)
    signal c33c1cm6c12c6c2c1c3c4c2c2c0c0cm1c3cm12_weight : PIPELINE_TYPE_FOR_C33C1CM6C12C6C2C1C3C4C2C2C0C0CM1C3CM12_WEIGHT;
    -- sfix(1, -7)
    signal c10c8c3cm7cm2c2cm10cm17cm2c51c8cm1c1cm5cm17c3_weight : PIPELINE_TYPE_FOR_C10C8C3CM7CM2C2CM10CM17CM2C51C8CM1C1CM5CM17C3_WEIGHT;
    -- sfix(1, -7)
    signal cm13c8cm3c6cm7c0c1c5c0c0c8c5c1cm1c4c1_weight : PIPELINE_TYPE_FOR_CM13C8CM3C6CM7C0C1C5C0C0C8C5C1CM1C4C1_WEIGHT;
    -- sfix(1, -7)
    signal c7c9c11c3cm23cm13cm7cm3c18c3cm24c3cm6cm2cm2cm5_weight : PIPELINE_TYPE_FOR_C7C9C11C3CM23CM13CM7CM3C18C3CM24C3CM6CM2CM2CM5_WEIGHT;
    -- sfix(1, -7)
    signal c10cm3c5cm1cm13c0c2cm2c12cm6c1c3c20cm1cm1c1_weight : PIPELINE_TYPE_FOR_C10CM3C5CM1CM13C0C2CM2C12CM6C1C3C20CM1CM1C1_WEIGHT;
    -- sfix(1, -7)
    signal cm2c3c21cm6c24cm12c6c7c1cm1cm5c10cm3c6c5c0_weight : PIPELINE_TYPE_FOR_CM2C3C21CM6C24CM12C6C7C1CM1CM5C10CM3C6C5C0_WEIGHT;
    -- sfix(1, -7)
    signal c28c7c3cm8cm6cm9c2c1cm37c5c2c1c1cm29c0c16_weight : PIPELINE_TYPE_FOR_C28C7C3CM8CM6CM9C2C1CM37C5C2C1C1CM29C0C16_WEIGHT;
    -- sfix(1, -7)
    signal c0c16cm10c9cm21c4cm3cm7c1c4c7c6cm3c18cm6c5_weight : PIPELINE_TYPE_FOR_C0C16CM10C9CM21C4CM3CM7C1C4C7C6CM3C18CM6C5_WEIGHT;
    -- sfix(1, -7)
    signal cm26cm2c22c4c9c5c17cm1c3c3cm5cm1c1cm2cm1cm5_weight : PIPELINE_TYPE_FOR_CM26CM2C22C4C9C5C17CM1C3C3CM5CM1C1CM2CM1CM5_WEIGHT;
    -- sfix(1, -7)
    signal c14c1cm9cm4c1cm6cm7c6cm1cm1cm9c22cm1cm8cm3cm3_weight : PIPELINE_TYPE_FOR_C14C1CM9CM4C1CM6CM7C6CM1CM1CM9C22CM1CM8CM3CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm7c1cm3cm9c2c5c1c10cm40cm6cm1cm79cm3cm7c0cm2_weight : PIPELINE_TYPE_FOR_CM7C1CM3CM9C2C5C1C10CM40CM6CM1CM79CM3CM7C0CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm13cm10c2c3c9c10cm7cm3cm12cm8c9c17c1c47cm1cm2_weight : PIPELINE_TYPE_FOR_CM13CM10C2C3C9C10CM7CM3CM12CM8C9C17C1C47CM1CM2_WEIGHT;
    -- sfix(1, -7)
    signal c11c0cm5c6cm12cm3cm18c17c10c4cm11c3cm2c0cm8c2_weight : PIPELINE_TYPE_FOR_C11C0CM5C6CM12CM3CM18C17C10C4CM11C3CM2C0CM8C2_WEIGHT;
    -- sfix(1, -7)
    signal c12cm15c2c6cm2cm2cm5cm6c14c30c2c2cm7cm12c11c3_weight : PIPELINE_TYPE_FOR_C12CM15C2C6CM2CM2CM5CM6C14C30C2C2CM7CM12C11C3_WEIGHT;
    -- sfix(1, -7)
    signal c5c15c5c5c14cm9c3cm3c6cm4c5c2cm33cm2c4c2_weight : PIPELINE_TYPE_FOR_C5C15C5C5C14CM9C3CM3C6CM4C5C2CM33CM2C4C2_WEIGHT;
    -- sfix(1, -7)
    signal c21cm24c10c1c2c2c5c0c7c3c6cm3c23cm1cm8c1_weight : PIPELINE_TYPE_FOR_C21CM24C10C1C2C2C5C0C7C3C6CM3C23CM1CM8C1_WEIGHT;
    -- sfix(1, -7)
    signal c0c2c3c2cm2cm2c17c2c0c18cm1c0cm6c5cm2c1_weight : PIPELINE_TYPE_FOR_C0C2C3C2CM2CM2C17C2C0C18CM1C0CM6C5CM2C1_WEIGHT;
    -- sfix(1, -7)
    signal c2c7cm1cm26c0c1cm8c4cm5cm4c47c22c2c1cm3cm4_weight : PIPELINE_TYPE_FOR_C2C7CM1CM26C0C1CM8C4CM5CM4C47C22C2C1CM3CM4_WEIGHT;
    -- sfix(1, -7)
    signal c6c18cm6c1c1cm7cm9c1c3c3cm5cm4c4c9c8c1_weight : PIPELINE_TYPE_FOR_C6C18CM6C1C1CM7CM9C1C3C3CM5CM4C4C9C8C1_WEIGHT;
    -- sfix(1, -7)
    signal c5c5c3c5cm12c2cm6c5c2c5c9c2cm24cm1cm2cm1_weight : PIPELINE_TYPE_FOR_C5C5C3C5CM12C2CM6C5C2C5C9C2CM24CM1CM2CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm26c15cm20c2c15c1c4cm10cm4c5c8cm1cm1cm10cm2c3_weight : PIPELINE_TYPE_FOR_CM26C15CM20C2C15C1C4CM10CM4C5C8CM1CM1CM10CM2C3_WEIGHT;
    -- sfix(1, -7)
    signal c1c14cm2c19cm13c7cm3c1c1cm2c1cm24cm8cm5cm3c2_weight : PIPELINE_TYPE_FOR_C1C14CM2C19CM13C7CM3C1C1CM2C1CM24CM8CM5CM3C2_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm7c4c28cm7cm6cm14cm11c3c1cm48c2c10cm5c11cm12_weight : PIPELINE_TYPE_FOR_CM2CM7C4C28CM7CM6CM14CM11C3C1CM48C2C10CM5C11CM12_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core23_rmcm_weightsconstant_memory
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
        
            dout1   => cm19cm12c1c7c35cm3cm6c4c11cm5cm15c2cm2c0c9cm3_weight(0), 
            dout2   => c3c7c34cm4c8cm2c19c19c16c0c9c2cm4cm117cm2c0_weight(0), 
            dout3   => c16c4cm5cm14cm2c12cm36cm3cm58c1cm13c2c8c8c4c0_weight(0), 
            dout4   => cm5c6cm31c1cm25c30c7cm10c2c5cm8c24cm2cm4c7c5_weight(0), 
            dout5   => c6c4c2cm16c3cm4cm4cm3cm3cm2c2cm2c12cm58cm9c18_weight(0), 
            dout6   => c4c0c12c1c4cm8cm5c18c6cm2cm1cm14c0c7c2c9_weight(0), 
            dout7   => c5cm13c4cm14c10c20c2c10cm22cm3c6c4cm2c2c1c3_weight(0), 
            dout8   => c11c0cm3c6cm4c8c1cm3cm2c0c5cm10c8c0c8c2_weight(0), 
            dout9   => cm2c1cm1c9cm7c5c13c2cm4c7c0cm1cm1cm2cm5c0_weight(0), 
            dout10   => c33c1cm6c12c6c2c1c3c4c2c2c0c0cm1c3cm12_weight(0), 
            dout11   => c10c8c3cm7cm2c2cm10cm17cm2c51c8cm1c1cm5cm17c3_weight(0), 
            dout12   => cm13c8cm3c6cm7c0c1c5c0c0c8c5c1cm1c4c1_weight(0), 
            dout13   => c7c9c11c3cm23cm13cm7cm3c18c3cm24c3cm6cm2cm2cm5_weight(0), 
            dout14   => c10cm3c5cm1cm13c0c2cm2c12cm6c1c3c20cm1cm1c1_weight(0), 
            dout15   => cm2c3c21cm6c24cm12c6c7c1cm1cm5c10cm3c6c5c0_weight(0), 
            dout16   => c28c7c3cm8cm6cm9c2c1cm37c5c2c1c1cm29c0c16_weight(0), 
            dout17   => c0c16cm10c9cm21c4cm3cm7c1c4c7c6cm3c18cm6c5_weight(0), 
            dout18   => cm26cm2c22c4c9c5c17cm1c3c3cm5cm1c1cm2cm1cm5_weight(0), 
            dout19   => c14c1cm9cm4c1cm6cm7c6cm1cm1cm9c22cm1cm8cm3cm3_weight(0), 
            dout20   => cm7c1cm3cm9c2c5c1c10cm40cm6cm1cm79cm3cm7c0cm2_weight(0), 
            dout21   => cm13cm10c2c3c9c10cm7cm3cm12cm8c9c17c1c47cm1cm2_weight(0), 
            dout22   => c11c0cm5c6cm12cm3cm18c17c10c4cm11c3cm2c0cm8c2_weight(0), 
            dout23   => c12cm15c2c6cm2cm2cm5cm6c14c30c2c2cm7cm12c11c3_weight(0), 
            dout24   => c5c15c5c5c14cm9c3cm3c6cm4c5c2cm33cm2c4c2_weight(0), 
            dout25   => c21cm24c10c1c2c2c5c0c7c3c6cm3c23cm1cm8c1_weight(0), 
            dout26   => c0c2c3c2cm2cm2c17c2c0c18cm1c0cm6c5cm2c1_weight(0), 
            dout27   => c2c7cm1cm26c0c1cm8c4cm5cm4c47c22c2c1cm3cm4_weight(0), 
            dout28   => c6c18cm6c1c1cm7cm9c1c3c3cm5cm4c4c9c8c1_weight(0), 
            dout29   => c5c5c3c5cm12c2cm6c5c2c5c9c2cm24cm1cm2cm1_weight(0), 
            dout30   => cm26c15cm20c2c15c1c4cm10cm4c5c8cm1cm1cm10cm2c3_weight(0), 
            dout31   => c1c14cm2c19cm13c7cm3c1c1cm2c1cm24cm8cm5cm3c2_weight(0), 
            dout32   => cm2cm7c4c28cm7cm6cm14cm11c3c1cm48c2c10cm5c11cm12_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm19cm12c1c7c35cm3cm6c4c11cm5cm15c2cm2c0c9cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm19cm12c1c7c35cm3cm6c4c11cm5cm15c2cm2c0c9cm3_weight(0), cm19cm12c1c7c35cm3cm6c4c11cm5cm15c2cm2c0c9cm3_weight(1));
    PL_STEP_0_for_c3c7c34cm4c8cm2c19c19c16c0c9c2cm4cm117cm2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c7c34cm4c8cm2c19c19c16c0c9c2cm4cm117cm2c0_weight(0), c3c7c34cm4c8cm2c19c19c16c0c9c2cm4cm117cm2c0_weight(1));
    PL_STEP_0_for_c16c4cm5cm14cm2c12cm36cm3cm58c1cm13c2c8c8c4c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c16c4cm5cm14cm2c12cm36cm3cm58c1cm13c2c8c8c4c0_weight(0), c16c4cm5cm14cm2c12cm36cm3cm58c1cm13c2c8c8c4c0_weight(1));
    PL_STEP_0_for_cm5c6cm31c1cm25c30c7cm10c2c5cm8c24cm2cm4c7c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c6cm31c1cm25c30c7cm10c2c5cm8c24cm2cm4c7c5_weight(0), cm5c6cm31c1cm25c30c7cm10c2c5cm8c24cm2cm4c7c5_weight(1));
    PL_STEP_0_for_c6c4c2cm16c3cm4cm4cm3cm3cm2c2cm2c12cm58cm9c18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c4c2cm16c3cm4cm4cm3cm3cm2c2cm2c12cm58cm9c18_weight(0), c6c4c2cm16c3cm4cm4cm3cm3cm2c2cm2c12cm58cm9c18_weight(1));
    PL_STEP_0_for_c4c0c12c1c4cm8cm5c18c6cm2cm1cm14c0c7c2c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c0c12c1c4cm8cm5c18c6cm2cm1cm14c0c7c2c9_weight(0), c4c0c12c1c4cm8cm5c18c6cm2cm1cm14c0c7c2c9_weight(1));
    PL_STEP_0_for_c5cm13c4cm14c10c20c2c10cm22cm3c6c4cm2c2c1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm13c4cm14c10c20c2c10cm22cm3c6c4cm2c2c1c3_weight(0), c5cm13c4cm14c10c20c2c10cm22cm3c6c4cm2c2c1c3_weight(1));
    PL_STEP_0_for_c11c0cm3c6cm4c8c1cm3cm2c0c5cm10c8c0c8c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c0cm3c6cm4c8c1cm3cm2c0c5cm10c8c0c8c2_weight(0), c11c0cm3c6cm4c8c1cm3cm2c0c5cm10c8c0c8c2_weight(1));
    PL_STEP_0_for_cm2c1cm1c9cm7c5c13c2cm4c7c0cm1cm1cm2cm5c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1cm1c9cm7c5c13c2cm4c7c0cm1cm1cm2cm5c0_weight(0), cm2c1cm1c9cm7c5c13c2cm4c7c0cm1cm1cm2cm5c0_weight(1));
    PL_STEP_0_for_c33c1cm6c12c6c2c1c3c4c2c2c0c0cm1c3cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c33c1cm6c12c6c2c1c3c4c2c2c0c0cm1c3cm12_weight(0), c33c1cm6c12c6c2c1c3c4c2c2c0c0cm1c3cm12_weight(1));
    PL_STEP_0_for_c10c8c3cm7cm2c2cm10cm17cm2c51c8cm1c1cm5cm17c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10c8c3cm7cm2c2cm10cm17cm2c51c8cm1c1cm5cm17c3_weight(0), c10c8c3cm7cm2c2cm10cm17cm2c51c8cm1c1cm5cm17c3_weight(1));
    PL_STEP_0_for_cm13c8cm3c6cm7c0c1c5c0c0c8c5c1cm1c4c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c8cm3c6cm7c0c1c5c0c0c8c5c1cm1c4c1_weight(0), cm13c8cm3c6cm7c0c1c5c0c0c8c5c1cm1c4c1_weight(1));
    PL_STEP_0_for_c7c9c11c3cm23cm13cm7cm3c18c3cm24c3cm6cm2cm2cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c9c11c3cm23cm13cm7cm3c18c3cm24c3cm6cm2cm2cm5_weight(0), c7c9c11c3cm23cm13cm7cm3c18c3cm24c3cm6cm2cm2cm5_weight(1));
    PL_STEP_0_for_c10cm3c5cm1cm13c0c2cm2c12cm6c1c3c20cm1cm1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10cm3c5cm1cm13c0c2cm2c12cm6c1c3c20cm1cm1c1_weight(0), c10cm3c5cm1cm13c0c2cm2c12cm6c1c3c20cm1cm1c1_weight(1));
    PL_STEP_0_for_cm2c3c21cm6c24cm12c6c7c1cm1cm5c10cm3c6c5c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c3c21cm6c24cm12c6c7c1cm1cm5c10cm3c6c5c0_weight(0), cm2c3c21cm6c24cm12c6c7c1cm1cm5c10cm3c6c5c0_weight(1));
    PL_STEP_0_for_c28c7c3cm8cm6cm9c2c1cm37c5c2c1c1cm29c0c16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c28c7c3cm8cm6cm9c2c1cm37c5c2c1c1cm29c0c16_weight(0), c28c7c3cm8cm6cm9c2c1cm37c5c2c1c1cm29c0c16_weight(1));
    PL_STEP_0_for_c0c16cm10c9cm21c4cm3cm7c1c4c7c6cm3c18cm6c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c16cm10c9cm21c4cm3cm7c1c4c7c6cm3c18cm6c5_weight(0), c0c16cm10c9cm21c4cm3cm7c1c4c7c6cm3c18cm6c5_weight(1));
    PL_STEP_0_for_cm26cm2c22c4c9c5c17cm1c3c3cm5cm1c1cm2cm1cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm26cm2c22c4c9c5c17cm1c3c3cm5cm1c1cm2cm1cm5_weight(0), cm26cm2c22c4c9c5c17cm1c3c3cm5cm1c1cm2cm1cm5_weight(1));
    PL_STEP_0_for_c14c1cm9cm4c1cm6cm7c6cm1cm1cm9c22cm1cm8cm3cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14c1cm9cm4c1cm6cm7c6cm1cm1cm9c22cm1cm8cm3cm3_weight(0), c14c1cm9cm4c1cm6cm7c6cm1cm1cm9c22cm1cm8cm3cm3_weight(1));
    PL_STEP_0_for_cm7c1cm3cm9c2c5c1c10cm40cm6cm1cm79cm3cm7c0cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c1cm3cm9c2c5c1c10cm40cm6cm1cm79cm3cm7c0cm2_weight(0), cm7c1cm3cm9c2c5c1c10cm40cm6cm1cm79cm3cm7c0cm2_weight(1));
    PL_STEP_0_for_cm13cm10c2c3c9c10cm7cm3cm12cm8c9c17c1c47cm1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13cm10c2c3c9c10cm7cm3cm12cm8c9c17c1c47cm1cm2_weight(0), cm13cm10c2c3c9c10cm7cm3cm12cm8c9c17c1c47cm1cm2_weight(1));
    PL_STEP_0_for_c11c0cm5c6cm12cm3cm18c17c10c4cm11c3cm2c0cm8c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c0cm5c6cm12cm3cm18c17c10c4cm11c3cm2c0cm8c2_weight(0), c11c0cm5c6cm12cm3cm18c17c10c4cm11c3cm2c0cm8c2_weight(1));
    PL_STEP_0_for_c12cm15c2c6cm2cm2cm5cm6c14c30c2c2cm7cm12c11c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12cm15c2c6cm2cm2cm5cm6c14c30c2c2cm7cm12c11c3_weight(0), c12cm15c2c6cm2cm2cm5cm6c14c30c2c2cm7cm12c11c3_weight(1));
    PL_STEP_0_for_c5c15c5c5c14cm9c3cm3c6cm4c5c2cm33cm2c4c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c15c5c5c14cm9c3cm3c6cm4c5c2cm33cm2c4c2_weight(0), c5c15c5c5c14cm9c3cm3c6cm4c5c2cm33cm2c4c2_weight(1));
    PL_STEP_0_for_c21cm24c10c1c2c2c5c0c7c3c6cm3c23cm1cm8c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c21cm24c10c1c2c2c5c0c7c3c6cm3c23cm1cm8c1_weight(0), c21cm24c10c1c2c2c5c0c7c3c6cm3c23cm1cm8c1_weight(1));
    PL_STEP_0_for_c0c2c3c2cm2cm2c17c2c0c18cm1c0cm6c5cm2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c2c3c2cm2cm2c17c2c0c18cm1c0cm6c5cm2c1_weight(0), c0c2c3c2cm2cm2c17c2c0c18cm1c0cm6c5cm2c1_weight(1));
    PL_STEP_0_for_c2c7cm1cm26c0c1cm8c4cm5cm4c47c22c2c1cm3cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c7cm1cm26c0c1cm8c4cm5cm4c47c22c2c1cm3cm4_weight(0), c2c7cm1cm26c0c1cm8c4cm5cm4c47c22c2c1cm3cm4_weight(1));
    PL_STEP_0_for_c6c18cm6c1c1cm7cm9c1c3c3cm5cm4c4c9c8c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c18cm6c1c1cm7cm9c1c3c3cm5cm4c4c9c8c1_weight(0), c6c18cm6c1c1cm7cm9c1c3c3cm5cm4c4c9c8c1_weight(1));
    PL_STEP_0_for_c5c5c3c5cm12c2cm6c5c2c5c9c2cm24cm1cm2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c5c3c5cm12c2cm6c5c2c5c9c2cm24cm1cm2cm1_weight(0), c5c5c3c5cm12c2cm6c5c2c5c9c2cm24cm1cm2cm1_weight(1));
    PL_STEP_0_for_cm26c15cm20c2c15c1c4cm10cm4c5c8cm1cm1cm10cm2c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm26c15cm20c2c15c1c4cm10cm4c5c8cm1cm1cm10cm2c3_weight(0), cm26c15cm20c2c15c1c4cm10cm4c5c8cm1cm1cm10cm2c3_weight(1));
    PL_STEP_0_for_c1c14cm2c19cm13c7cm3c1c1cm2c1cm24cm8cm5cm3c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c14cm2c19cm13c7cm3c1c1cm2c1cm24cm8cm5cm3c2_weight(0), c1c14cm2c19cm13c7cm3c1c1cm2c1cm24cm8cm5cm3c2_weight(1));
    PL_STEP_0_for_cm2cm7c4c28cm7cm6cm14cm11c3c1cm48c2c10cm5c11cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm7c4c28cm7cm6cm14cm11c3c1cm48c2c10cm5c11cm12_weight(0), cm2cm7c4c28cm7cm6cm14cm11c3c1cm48c2c10cm5c11cm12_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c3c7c34cm4c8cm2c19c19c16c0c9c2cm4cm117cm2c0_cm13c8cm3c6cm7c0c1c5c0c0c8c5c1cm1c4c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c7c34cm4c8cm2c19c19c16c0c9c2cm4cm117cm2c0_weight(1)(8-1 downto 0),
			B	=> cm13c8cm3c6cm7c0c1c5c0c0c8c5c1cm1c4c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c7c34cm4c8cm2c19c19c16c0c9c2cm4cm117cm2c0,
			CxB => R_cm13c8cm3c6cm7c0c1c5c0c0c8c5c1cm1c4c1
		);

    cm7c1cm3cm9c2c5c1c10cm40cm6cm1cm79cm3cm7c0cm2_cm2c1cm1c9cm7c5c13c2cm4c7c0cm1cm1cm2cm5c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm7c1cm3cm9c2c5c1c10cm40cm6cm1cm79cm3cm7c0cm2_weight(1)(8-1 downto 0),
			B	=> cm2c1cm1c9cm7c5c13c2cm4c7c0cm1cm1cm2cm5c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7c1cm3cm9c2c5c1c10cm40cm6cm1cm79cm3cm7c0cm2,
			CxB => R_cm2c1cm1c9cm7c5c13c2cm4c7c0cm1cm1cm2cm5c0
		);

    cm19cm12c1c7c35cm3cm6c4c11cm5cm15c2cm2c0c9cm3_c11c0cm3c6cm4c8c1cm3cm2c0c5cm10c8c0c8c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm19cm12c1c7c35cm3cm6c4c11cm5cm15c2cm2c0c9cm3_weight(1)(7-1 downto 0),
			B	=> c11c0cm3c6cm4c8c1cm3cm2c0c5cm10c8c0c8c2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm19cm12c1c7c35cm3cm6c4c11cm5cm15c2cm2c0c9cm3,
			CxB => R_c11c0cm3c6cm4c8c1cm3cm2c0c5cm10c8c0c8c2
		);

    c16c4cm5cm14cm2c12cm36cm3cm58c1cm13c2c8c8c4c0_c1c14cm2c19cm13c7cm3c1c1cm2c1cm24cm8cm5cm3c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c16c4cm5cm14cm2c12cm36cm3cm58c1cm13c2c8c8c4c0_weight(1)(7-1 downto 0),
			B	=> c1c14cm2c19cm13c7cm3c1c1cm2c1cm24cm8cm5cm3c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c16c4cm5cm14cm2c12cm36cm3cm58c1cm13c2c8c8c4c0,
			CxB => R_c1c14cm2c19cm13c7cm3c1c1cm2c1cm24cm8cm5cm3c2
		);

    c6c4c2cm16c3cm4cm4cm3cm3cm2c2cm2c12cm58cm9c18_cm26c15cm20c2c15c1c4cm10cm4c5c8cm1cm1cm10cm2c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6c4c2cm16c3cm4cm4cm3cm3cm2c2cm2c12cm58cm9c18_weight(1)(7-1 downto 0),
			B	=> cm26c15cm20c2c15c1c4cm10cm4c5c8cm1cm1cm10cm2c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6c4c2cm16c3cm4cm4cm3cm3cm2c2cm2c12cm58cm9c18,
			CxB => R_cm26c15cm20c2c15c1c4cm10cm4c5c8cm1cm1cm10cm2c3
		);

    c33c1cm6c12c6c2c1c3c4c2c2c0c0cm1c3cm12_c5c5c3c5cm12c2cm6c5c2c5c9c2cm24cm1cm2cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c33c1cm6c12c6c2c1c3c4c2c2c0c0cm1c3cm12_weight(1)(7-1 downto 0),
			B	=> c5c5c3c5cm12c2cm6c5c2c5c9c2cm24cm1cm2cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c33c1cm6c12c6c2c1c3c4c2c2c0c0cm1c3cm12,
			CxB => R_c5c5c3c5cm12c2cm6c5c2c5c9c2cm24cm1cm2cm1
		);

    c10c8c3cm7cm2c2cm10cm17cm2c51c8cm1c1cm5cm17c3_c6c18cm6c1c1cm7cm9c1c3c3cm5cm4c4c9c8c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c10c8c3cm7cm2c2cm10cm17cm2c51c8cm1c1cm5cm17c3_weight(1)(7-1 downto 0),
			B	=> c6c18cm6c1c1cm7cm9c1c3c3cm5cm4c4c9c8c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c10c8c3cm7cm2c2cm10cm17cm2c51c8cm1c1cm5cm17c3,
			CxB => R_c6c18cm6c1c1cm7cm9c1c3c3cm5cm4c4c9c8c1
		);

    c28c7c3cm8cm6cm9c2c1cm37c5c2c1c1cm29c0c16_c0c2c3c2cm2cm2c17c2c0c18cm1c0cm6c5cm2c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c28c7c3cm8cm6cm9c2c1cm37c5c2c1c1cm29c0c16_weight(1)(7-1 downto 0),
			B	=> c0c2c3c2cm2cm2c17c2c0c18cm1c0cm6c5cm2c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c28c7c3cm8cm6cm9c2c1cm37c5c2c1c1cm29c0c16,
			CxB => R_c0c2c3c2cm2cm2c17c2c0c18cm1c0cm6c5cm2c1
		);

    cm13cm10c2c3c9c10cm7cm3cm12cm8c9c17c1c47cm1cm2_c21cm24c10c1c2c2c5c0c7c3c6cm3c23cm1cm8c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm13cm10c2c3c9c10cm7cm3cm12cm8c9c17c1c47cm1cm2_weight(1)(7-1 downto 0),
			B	=> c21cm24c10c1c2c2c5c0c7c3c6cm3c23cm1cm8c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm13cm10c2c3c9c10cm7cm3cm12cm8c9c17c1c47cm1cm2,
			CxB => R_c21cm24c10c1c2c2c5c0c7c3c6cm3c23cm1cm8c1
		);

    c5c15c5c5c14cm9c3cm3c6cm4c5c2cm33cm2c4c2_c12cm15c2c6cm2cm2cm5cm6c14c30c2c2cm7cm12c11c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5c15c5c5c14cm9c3cm3c6cm4c5c2cm33cm2c4c2_weight(1)(7-1 downto 0),
			B	=> c12cm15c2c6cm2cm2cm5cm6c14c30c2c2cm7cm12c11c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c15c5c5c14cm9c3cm3c6cm4c5c2cm33cm2c4c2,
			CxB => R_c12cm15c2c6cm2cm2cm5cm6c14c30c2c2cm7cm12c11c3
		);

    c2c7cm1cm26c0c1cm8c4cm5cm4c47c22c2c1cm3cm4_c11c0cm5c6cm12cm3cm18c17c10c4cm11c3cm2c0cm8c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c7cm1cm26c0c1cm8c4cm5cm4c47c22c2c1cm3cm4_weight(1)(7-1 downto 0),
			B	=> c11c0cm5c6cm12cm3cm18c17c10c4cm11c3cm2c0cm8c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c7cm1cm26c0c1cm8c4cm5cm4c47c22c2c1cm3cm4,
			CxB => R_c11c0cm5c6cm12cm3cm18c17c10c4cm11c3cm2c0cm8c2
		);

    cm2cm7c4c28cm7cm6cm14cm11c3c1cm48c2c10cm5c11cm12_c14c1cm9cm4c1cm6cm7c6cm1cm1cm9c22cm1cm8cm3cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm7c4c28cm7cm6cm14cm11c3c1cm48c2c10cm5c11cm12_weight(1)(7-1 downto 0),
			B	=> c14c1cm9cm4c1cm6cm7c6cm1cm1cm9c22cm1cm8cm3cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm7c4c28cm7cm6cm14cm11c3c1cm48c2c10cm5c11cm12,
			CxB => R_c14c1cm9cm4c1cm6cm7c6cm1cm1cm9c22cm1cm8cm3cm3
		);

    cm5c6cm31c1cm25c30c7cm10c2c5cm8c24cm2cm4c7c5_cm26cm2c22c4c9c5c17cm1c3c3cm5cm1c1cm2cm1cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5c6cm31c1cm25c30c7cm10c2c5cm8c24cm2cm4c7c5_weight(1)(6-1 downto 0),
			B	=> cm26cm2c22c4c9c5c17cm1c3c3cm5cm1c1cm2cm1cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5c6cm31c1cm25c30c7cm10c2c5cm8c24cm2cm4c7c5,
			CxB => R_cm26cm2c22c4c9c5c17cm1c3c3cm5cm1c1cm2cm1cm5
		);

    c4c0c12c1c4cm8cm5c18c6cm2cm1cm14c0c7c2c9_c0c16cm10c9cm21c4cm3cm7c1c4c7c6cm3c18cm6c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c0c12c1c4cm8cm5c18c6cm2cm1cm14c0c7c2c9_weight(1)(6-1 downto 0),
			B	=> c0c16cm10c9cm21c4cm3cm7c1c4c7c6cm3c18cm6c5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c0c12c1c4cm8cm5c18c6cm2cm1cm14c0c7c2c9,
			CxB => R_c0c16cm10c9cm21c4cm3cm7c1c4c7c6cm3c18cm6c5
		);

    c5cm13c4cm14c10c20c2c10cm22cm3c6c4cm2c2c1c3_cm2c3c21cm6c24cm12c6c7c1cm1cm5c10cm3c6c5c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5cm13c4cm14c10c20c2c10cm22cm3c6c4cm2c2c1c3_weight(1)(6-1 downto 0),
			B	=> cm2c3c21cm6c24cm12c6c7c1cm1cm5c10cm3c6c5c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5cm13c4cm14c10c20c2c10cm22cm3c6c4cm2c2c1c3,
			CxB => R_cm2c3c21cm6c24cm12c6c7c1cm1cm5c10cm3c6c5c0
		);

    c7c9c11c3cm23cm13cm7cm3c18c3cm24c3cm6cm2cm2cm5_c10cm3c5cm1cm13c0c2cm2c12cm6c1c3c20cm1cm1c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7c9c11c3cm23cm13cm7cm3c18c3cm24c3cm6cm2cm2cm5_weight(1)(6-1 downto 0),
			B	=> c10cm3c5cm1cm13c0c2cm2c12cm6c1c3c20cm1cm1c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7c9c11c3cm23cm13cm7cm3c18c3cm24c3cm6cm2cm2cm5,
			CxB => R_c10cm3c5cm1cm13c0c2cm2c12cm6c1c3c20cm1cm1c1
		);




end architecture;
