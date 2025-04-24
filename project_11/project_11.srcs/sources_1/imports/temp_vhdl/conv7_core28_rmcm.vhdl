library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core28_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm1c10c3c9cm10c4c4c1c10c2c7c1c34c6c4c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm20c0c23c4cm3c1cm25c7c15c7c25cm34c4c3c61cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6cm4c8cm4cm10c1cm1c5c4cm10cm6cm5cm10cm1cm1cm4 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c2c15c8c13cm5cm2c32c4c1c11cm14c8cm1c83c10cm6 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c4c0c0c7c25c4cm26cm23cm4c10cm28cm26c0cm8c6cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c12cm5cm3cm1c1c0c16c2c16c17c25c31cm14cm3cm7cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c12cm7c4cm23c4cm1c5cm5cm1c9cm3cm10c3cm9c2cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c3c6c23cm1cm15cm5cm35cm14c34cm17cm8c37c1cm6c4cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3c4cm8cm2cm9c25c13cm9c12cm38cm2cm45c2cm2c10cm6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm4cm5c4c3cm1c1c4c10c7cm5c6cm20c4cm3c6c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1cm7cm4c3c0c4c3c2c10c10c45c1c2cm17c5c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c6cm1c9cm5c9cm2cm15cm8c7c5cm4cm11c17c1cm9c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm3cm7c9c4c3c9cm7cm1c4c6c8c2cm3c3c18cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c10c2cm5c2c3c14c2cm5cm11c0c4cm4cm19c3c1c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm10cm5cm5c0c3cm9c7cm5c8c10c7cm4c1cm4c0c2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm30c3cm2c0c2cm13cm4cm2c9c5cm3cm7cm10cm4c20cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2c2cm2c2c6c15cm2c5c5c8cm6cm2cm2cm2cm3c1 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm1c0c15cm3cm20c1c12c6cm3cm1c4cm2c5c5cm1c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm22c8cm2cm5c10c0c6c0cm7cm3c8c16cm12c18c12cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm6c4c2c1cm3c25cm3cm7c9cm20c2c4c16c9c5cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm3c4c4cm3c0cm4c5c5c10c5cm4cm3cm47cm7c11cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c6cm5c8cm15cm13c11c10c0c2c9c1cm8cm1c4c0cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm8cm7c8cm3cm19c6cm10cm3c25c10c2c8cm9c0c4c4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm6c16cm8c1c11c50c7c3c8cm20c52cm15c2c10c1cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3c0c5c1cm36cm2cm15c5cm35cm6cm4cm7cm14c11c5c6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0cm5c0c0cm5c1cm5cm1c19cm7cm6c1c4c12c2c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1cm19cm13cm2c21cm2c2c0cm8c6c10c17c4cm12cm3c11 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm9cm53c5cm1cm11c22cm9cm21c4c9cm9cm8c9cm4cm3c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c2c2c9c18cm21c5cm2cm1c1cm10c1c3c2cm7c7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm5c5cm1cm1c39c8c7c1cm6c36c34c24c8c0c14c3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6c6c2cm1c4c12cm2cm18c3cm5c1c11cm7cm6c1cm26 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1cm1c9c8c7cm38c5cm9c11cm11c1c0c6c1cm5cm8 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core28_rmcm;

architecture arch of conv7_core28_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C10C3C9CM10C4C4C1C10C2C7C1C34C6C4C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM20C0C23C4CM3C1CM25C7C15C7C25CM34C4C3C61CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM4C8CM4CM10C1CM1C5C4CM10CM6CM5CM10CM1CM1CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C15C8C13CM5CM2C32C4C1C11CM14C8CM1C83C10CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C0C0C7C25C4CM26CM23CM4C10CM28CM26C0CM8C6CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12CM5CM3CM1C1C0C16C2C16C17C25C31CM14CM3CM7CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12CM7C4CM23C4CM1C5CM5CM1C9CM3CM10C3CM9C2CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C6C23CM1CM15CM5CM35CM14C34CM17CM8C37C1CM6C4CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C4CM8CM2CM9C25C13CM9C12CM38CM2CM45C2CM2C10CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM5C4C3CM1C1C4C10C7CM5C6CM20C4CM3C6C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM7CM4C3C0C4C3C2C10C10C45C1C2CM17C5C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM1C9CM5C9CM2CM15CM8C7C5CM4CM11C17C1CM9C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM7C9C4C3C9CM7CM1C4C6C8C2CM3C3C18CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10C2CM5C2C3C14C2CM5CM11C0C4CM4CM19C3C1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10CM5CM5C0C3CM9C7CM5C8C10C7CM4C1CM4C0C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM30C3CM2C0C2CM13CM4CM2C9C5CM3CM7CM10CM4C20CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C2CM2C2C6C15CM2C5C5C8CM6CM2CM2CM2CM3C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0C15CM3CM20C1C12C6CM3CM1C4CM2C5C5CM1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM22C8CM2CM5C10C0C6C0CM7CM3C8C16CM12C18C12CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C4C2C1CM3C25CM3CM7C9CM20C2C4C16C9C5CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C4C4CM3C0CM4C5C5C10C5CM4CM3CM47CM7C11CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM5C8CM15CM13C11C10C0C2C9C1CM8CM1C4C0CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8CM7C8CM3CM19C6CM10CM3C25C10C2C8CM9C0C4C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C16CM8C1C11C50C7C3C8CM20C52CM15C2C10C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C0C5C1CM36CM2CM15C5CM35CM6CM4CM7CM14C11C5C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM5C0C0CM5C1CM5CM1C19CM7CM6C1C4C12C2C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM19CM13CM2C21CM2C2C0CM8C6C10C17C4CM12CM3C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9CM53C5CM1CM11C22CM9CM21C4C9CM9CM8C9CM4CM3C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C2C2C9C18CM21C5CM2CM1C1CM10C1C3C2CM7C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C5CM1CM1C39C8C7C1CM6C36C34C24C8C0C14C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C6C2CM1C4C12CM2CM18C3CM5C1C11CM7CM6C1CM26_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C9C8C7CM38C5CM9C11CM11C1C0C6C1CM5CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm1c10c3c9cm10c4c4c1c10c2c7c1c34c6c4c2_weight : PIPELINE_TYPE_FOR_CM1C10C3C9CM10C4C4C1C10C2C7C1C34C6C4C2_WEIGHT;
    -- sfix(1, -7)
    signal cm20c0c23c4cm3c1cm25c7c15c7c25cm34c4c3c61cm4_weight : PIPELINE_TYPE_FOR_CM20C0C23C4CM3C1CM25C7C15C7C25CM34C4C3C61CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm6cm4c8cm4cm10c1cm1c5c4cm10cm6cm5cm10cm1cm1cm4_weight : PIPELINE_TYPE_FOR_CM6CM4C8CM4CM10C1CM1C5C4CM10CM6CM5CM10CM1CM1CM4_WEIGHT;
    -- sfix(1, -7)
    signal c2c15c8c13cm5cm2c32c4c1c11cm14c8cm1c83c10cm6_weight : PIPELINE_TYPE_FOR_C2C15C8C13CM5CM2C32C4C1C11CM14C8CM1C83C10CM6_WEIGHT;
    -- sfix(1, -7)
    signal c4c0c0c7c25c4cm26cm23cm4c10cm28cm26c0cm8c6cm3_weight : PIPELINE_TYPE_FOR_C4C0C0C7C25C4CM26CM23CM4C10CM28CM26C0CM8C6CM3_WEIGHT;
    -- sfix(1, -7)
    signal c12cm5cm3cm1c1c0c16c2c16c17c25c31cm14cm3cm7cm2_weight : PIPELINE_TYPE_FOR_C12CM5CM3CM1C1C0C16C2C16C17C25C31CM14CM3CM7CM2_WEIGHT;
    -- sfix(1, -7)
    signal c12cm7c4cm23c4cm1c5cm5cm1c9cm3cm10c3cm9c2cm1_weight : PIPELINE_TYPE_FOR_C12CM7C4CM23C4CM1C5CM5CM1C9CM3CM10C3CM9C2CM1_WEIGHT;
    -- sfix(1, -7)
    signal c3c6c23cm1cm15cm5cm35cm14c34cm17cm8c37c1cm6c4cm4_weight : PIPELINE_TYPE_FOR_C3C6C23CM1CM15CM5CM35CM14C34CM17CM8C37C1CM6C4CM4_WEIGHT;
    -- sfix(1, -7)
    signal c3c4cm8cm2cm9c25c13cm9c12cm38cm2cm45c2cm2c10cm6_weight : PIPELINE_TYPE_FOR_C3C4CM8CM2CM9C25C13CM9C12CM38CM2CM45C2CM2C10CM6_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm5c4c3cm1c1c4c10c7cm5c6cm20c4cm3c6c3_weight : PIPELINE_TYPE_FOR_CM4CM5C4C3CM1C1C4C10C7CM5C6CM20C4CM3C6C3_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm7cm4c3c0c4c3c2c10c10c45c1c2cm17c5c0_weight : PIPELINE_TYPE_FOR_CM1CM7CM4C3C0C4C3C2C10C10C45C1C2CM17C5C0_WEIGHT;
    -- sfix(1, -7)
    signal c6cm1c9cm5c9cm2cm15cm8c7c5cm4cm11c17c1cm9c0_weight : PIPELINE_TYPE_FOR_C6CM1C9CM5C9CM2CM15CM8C7C5CM4CM11C17C1CM9C0_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm7c9c4c3c9cm7cm1c4c6c8c2cm3c3c18cm1_weight : PIPELINE_TYPE_FOR_CM3CM7C9C4C3C9CM7CM1C4C6C8C2CM3C3C18CM1_WEIGHT;
    -- sfix(1, -7)
    signal c10c2cm5c2c3c14c2cm5cm11c0c4cm4cm19c3c1c3_weight : PIPELINE_TYPE_FOR_C10C2CM5C2C3C14C2CM5CM11C0C4CM4CM19C3C1C3_WEIGHT;
    -- sfix(1, -7)
    signal cm10cm5cm5c0c3cm9c7cm5c8c10c7cm4c1cm4c0c2_weight : PIPELINE_TYPE_FOR_CM10CM5CM5C0C3CM9C7CM5C8C10C7CM4C1CM4C0C2_WEIGHT;
    -- sfix(1, -7)
    signal cm30c3cm2c0c2cm13cm4cm2c9c5cm3cm7cm10cm4c20cm2_weight : PIPELINE_TYPE_FOR_CM30C3CM2C0C2CM13CM4CM2C9C5CM3CM7CM10CM4C20CM2_WEIGHT;
    -- sfix(1, -7)
    signal c2c2cm2c2c6c15cm2c5c5c8cm6cm2cm2cm2cm3c1_weight : PIPELINE_TYPE_FOR_C2C2CM2C2C6C15CM2C5C5C8CM6CM2CM2CM2CM3C1_WEIGHT;
    -- sfix(1, -7)
    signal cm1c0c15cm3cm20c1c12c6cm3cm1c4cm2c5c5cm1c0_weight : PIPELINE_TYPE_FOR_CM1C0C15CM3CM20C1C12C6CM3CM1C4CM2C5C5CM1C0_WEIGHT;
    -- sfix(1, -7)
    signal cm22c8cm2cm5c10c0c6c0cm7cm3c8c16cm12c18c12cm4_weight : PIPELINE_TYPE_FOR_CM22C8CM2CM5C10C0C6C0CM7CM3C8C16CM12C18C12CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm6c4c2c1cm3c25cm3cm7c9cm20c2c4c16c9c5cm1_weight : PIPELINE_TYPE_FOR_CM6C4C2C1CM3C25CM3CM7C9CM20C2C4C16C9C5CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm3c4c4cm3c0cm4c5c5c10c5cm4cm3cm47cm7c11cm5_weight : PIPELINE_TYPE_FOR_CM3C4C4CM3C0CM4C5C5C10C5CM4CM3CM47CM7C11CM5_WEIGHT;
    -- sfix(1, -7)
    signal c6cm5c8cm15cm13c11c10c0c2c9c1cm8cm1c4c0cm1_weight : PIPELINE_TYPE_FOR_C6CM5C8CM15CM13C11C10C0C2C9C1CM8CM1C4C0CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm8cm7c8cm3cm19c6cm10cm3c25c10c2c8cm9c0c4c4_weight : PIPELINE_TYPE_FOR_CM8CM7C8CM3CM19C6CM10CM3C25C10C2C8CM9C0C4C4_WEIGHT;
    -- sfix(1, -7)
    signal cm6c16cm8c1c11c50c7c3c8cm20c52cm15c2c10c1cm1_weight : PIPELINE_TYPE_FOR_CM6C16CM8C1C11C50C7C3C8CM20C52CM15C2C10C1CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm3c0c5c1cm36cm2cm15c5cm35cm6cm4cm7cm14c11c5c6_weight : PIPELINE_TYPE_FOR_CM3C0C5C1CM36CM2CM15C5CM35CM6CM4CM7CM14C11C5C6_WEIGHT;
    -- sfix(1, -7)
    signal c0cm5c0c0cm5c1cm5cm1c19cm7cm6c1c4c12c2c0_weight : PIPELINE_TYPE_FOR_C0CM5C0C0CM5C1CM5CM1C19CM7CM6C1C4C12C2C0_WEIGHT;
    -- sfix(1, -7)
    signal c1cm19cm13cm2c21cm2c2c0cm8c6c10c17c4cm12cm3c11_weight : PIPELINE_TYPE_FOR_C1CM19CM13CM2C21CM2C2C0CM8C6C10C17C4CM12CM3C11_WEIGHT;
    -- sfix(1, -7)
    signal cm9cm53c5cm1cm11c22cm9cm21c4c9cm9cm8c9cm4cm3c4_weight : PIPELINE_TYPE_FOR_CM9CM53C5CM1CM11C22CM9CM21C4C9CM9CM8C9CM4CM3C4_WEIGHT;
    -- sfix(1, -7)
    signal c0c2c2c9c18cm21c5cm2cm1c1cm10c1c3c2cm7c7_weight : PIPELINE_TYPE_FOR_C0C2C2C9C18CM21C5CM2CM1C1CM10C1C3C2CM7C7_WEIGHT;
    -- sfix(1, -7)
    signal cm5c5cm1cm1c39c8c7c1cm6c36c34c24c8c0c14c3_weight : PIPELINE_TYPE_FOR_CM5C5CM1CM1C39C8C7C1CM6C36C34C24C8C0C14C3_WEIGHT;
    -- sfix(1, -7)
    signal cm6c6c2cm1c4c12cm2cm18c3cm5c1c11cm7cm6c1cm26_weight : PIPELINE_TYPE_FOR_CM6C6C2CM1C4C12CM2CM18C3CM5C1C11CM7CM6C1CM26_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm1c9c8c7cm38c5cm9c11cm11c1c0c6c1cm5cm8_weight : PIPELINE_TYPE_FOR_CM1CM1C9C8C7CM38C5CM9C11CM11C1C0C6C1CM5CM8_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core28_rmcm_weightsconstant_memory
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
        
            dout1   => cm1c10c3c9cm10c4c4c1c10c2c7c1c34c6c4c2_weight(0), 
            dout2   => cm20c0c23c4cm3c1cm25c7c15c7c25cm34c4c3c61cm4_weight(0), 
            dout3   => cm6cm4c8cm4cm10c1cm1c5c4cm10cm6cm5cm10cm1cm1cm4_weight(0), 
            dout4   => c2c15c8c13cm5cm2c32c4c1c11cm14c8cm1c83c10cm6_weight(0), 
            dout5   => c4c0c0c7c25c4cm26cm23cm4c10cm28cm26c0cm8c6cm3_weight(0), 
            dout6   => c12cm5cm3cm1c1c0c16c2c16c17c25c31cm14cm3cm7cm2_weight(0), 
            dout7   => c12cm7c4cm23c4cm1c5cm5cm1c9cm3cm10c3cm9c2cm1_weight(0), 
            dout8   => c3c6c23cm1cm15cm5cm35cm14c34cm17cm8c37c1cm6c4cm4_weight(0), 
            dout9   => c3c4cm8cm2cm9c25c13cm9c12cm38cm2cm45c2cm2c10cm6_weight(0), 
            dout10   => cm4cm5c4c3cm1c1c4c10c7cm5c6cm20c4cm3c6c3_weight(0), 
            dout11   => cm1cm7cm4c3c0c4c3c2c10c10c45c1c2cm17c5c0_weight(0), 
            dout12   => c6cm1c9cm5c9cm2cm15cm8c7c5cm4cm11c17c1cm9c0_weight(0), 
            dout13   => cm3cm7c9c4c3c9cm7cm1c4c6c8c2cm3c3c18cm1_weight(0), 
            dout14   => c10c2cm5c2c3c14c2cm5cm11c0c4cm4cm19c3c1c3_weight(0), 
            dout15   => cm10cm5cm5c0c3cm9c7cm5c8c10c7cm4c1cm4c0c2_weight(0), 
            dout16   => cm30c3cm2c0c2cm13cm4cm2c9c5cm3cm7cm10cm4c20cm2_weight(0), 
            dout17   => c2c2cm2c2c6c15cm2c5c5c8cm6cm2cm2cm2cm3c1_weight(0), 
            dout18   => cm1c0c15cm3cm20c1c12c6cm3cm1c4cm2c5c5cm1c0_weight(0), 
            dout19   => cm22c8cm2cm5c10c0c6c0cm7cm3c8c16cm12c18c12cm4_weight(0), 
            dout20   => cm6c4c2c1cm3c25cm3cm7c9cm20c2c4c16c9c5cm1_weight(0), 
            dout21   => cm3c4c4cm3c0cm4c5c5c10c5cm4cm3cm47cm7c11cm5_weight(0), 
            dout22   => c6cm5c8cm15cm13c11c10c0c2c9c1cm8cm1c4c0cm1_weight(0), 
            dout23   => cm8cm7c8cm3cm19c6cm10cm3c25c10c2c8cm9c0c4c4_weight(0), 
            dout24   => cm6c16cm8c1c11c50c7c3c8cm20c52cm15c2c10c1cm1_weight(0), 
            dout25   => cm3c0c5c1cm36cm2cm15c5cm35cm6cm4cm7cm14c11c5c6_weight(0), 
            dout26   => c0cm5c0c0cm5c1cm5cm1c19cm7cm6c1c4c12c2c0_weight(0), 
            dout27   => c1cm19cm13cm2c21cm2c2c0cm8c6c10c17c4cm12cm3c11_weight(0), 
            dout28   => cm9cm53c5cm1cm11c22cm9cm21c4c9cm9cm8c9cm4cm3c4_weight(0), 
            dout29   => c0c2c2c9c18cm21c5cm2cm1c1cm10c1c3c2cm7c7_weight(0), 
            dout30   => cm5c5cm1cm1c39c8c7c1cm6c36c34c24c8c0c14c3_weight(0), 
            dout31   => cm6c6c2cm1c4c12cm2cm18c3cm5c1c11cm7cm6c1cm26_weight(0), 
            dout32   => cm1cm1c9c8c7cm38c5cm9c11cm11c1c0c6c1cm5cm8_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm1c10c3c9cm10c4c4c1c10c2c7c1c34c6c4c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c10c3c9cm10c4c4c1c10c2c7c1c34c6c4c2_weight(0), cm1c10c3c9cm10c4c4c1c10c2c7c1c34c6c4c2_weight(1));
    PL_STEP_0_for_cm20c0c23c4cm3c1cm25c7c15c7c25cm34c4c3c61cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm20c0c23c4cm3c1cm25c7c15c7c25cm34c4c3c61cm4_weight(0), cm20c0c23c4cm3c1cm25c7c15c7c25cm34c4c3c61cm4_weight(1));
    PL_STEP_0_for_cm6cm4c8cm4cm10c1cm1c5c4cm10cm6cm5cm10cm1cm1cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm4c8cm4cm10c1cm1c5c4cm10cm6cm5cm10cm1cm1cm4_weight(0), cm6cm4c8cm4cm10c1cm1c5c4cm10cm6cm5cm10cm1cm1cm4_weight(1));
    PL_STEP_0_for_c2c15c8c13cm5cm2c32c4c1c11cm14c8cm1c83c10cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c15c8c13cm5cm2c32c4c1c11cm14c8cm1c83c10cm6_weight(0), c2c15c8c13cm5cm2c32c4c1c11cm14c8cm1c83c10cm6_weight(1));
    PL_STEP_0_for_c4c0c0c7c25c4cm26cm23cm4c10cm28cm26c0cm8c6cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c0c0c7c25c4cm26cm23cm4c10cm28cm26c0cm8c6cm3_weight(0), c4c0c0c7c25c4cm26cm23cm4c10cm28cm26c0cm8c6cm3_weight(1));
    PL_STEP_0_for_c12cm5cm3cm1c1c0c16c2c16c17c25c31cm14cm3cm7cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12cm5cm3cm1c1c0c16c2c16c17c25c31cm14cm3cm7cm2_weight(0), c12cm5cm3cm1c1c0c16c2c16c17c25c31cm14cm3cm7cm2_weight(1));
    PL_STEP_0_for_c12cm7c4cm23c4cm1c5cm5cm1c9cm3cm10c3cm9c2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12cm7c4cm23c4cm1c5cm5cm1c9cm3cm10c3cm9c2cm1_weight(0), c12cm7c4cm23c4cm1c5cm5cm1c9cm3cm10c3cm9c2cm1_weight(1));
    PL_STEP_0_for_c3c6c23cm1cm15cm5cm35cm14c34cm17cm8c37c1cm6c4cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c6c23cm1cm15cm5cm35cm14c34cm17cm8c37c1cm6c4cm4_weight(0), c3c6c23cm1cm15cm5cm35cm14c34cm17cm8c37c1cm6c4cm4_weight(1));
    PL_STEP_0_for_c3c4cm8cm2cm9c25c13cm9c12cm38cm2cm45c2cm2c10cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c4cm8cm2cm9c25c13cm9c12cm38cm2cm45c2cm2c10cm6_weight(0), c3c4cm8cm2cm9c25c13cm9c12cm38cm2cm45c2cm2c10cm6_weight(1));
    PL_STEP_0_for_cm4cm5c4c3cm1c1c4c10c7cm5c6cm20c4cm3c6c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm5c4c3cm1c1c4c10c7cm5c6cm20c4cm3c6c3_weight(0), cm4cm5c4c3cm1c1c4c10c7cm5c6cm20c4cm3c6c3_weight(1));
    PL_STEP_0_for_cm1cm7cm4c3c0c4c3c2c10c10c45c1c2cm17c5c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm7cm4c3c0c4c3c2c10c10c45c1c2cm17c5c0_weight(0), cm1cm7cm4c3c0c4c3c2c10c10c45c1c2cm17c5c0_weight(1));
    PL_STEP_0_for_c6cm1c9cm5c9cm2cm15cm8c7c5cm4cm11c17c1cm9c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm1c9cm5c9cm2cm15cm8c7c5cm4cm11c17c1cm9c0_weight(0), c6cm1c9cm5c9cm2cm15cm8c7c5cm4cm11c17c1cm9c0_weight(1));
    PL_STEP_0_for_cm3cm7c9c4c3c9cm7cm1c4c6c8c2cm3c3c18cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm7c9c4c3c9cm7cm1c4c6c8c2cm3c3c18cm1_weight(0), cm3cm7c9c4c3c9cm7cm1c4c6c8c2cm3c3c18cm1_weight(1));
    PL_STEP_0_for_c10c2cm5c2c3c14c2cm5cm11c0c4cm4cm19c3c1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10c2cm5c2c3c14c2cm5cm11c0c4cm4cm19c3c1c3_weight(0), c10c2cm5c2c3c14c2cm5cm11c0c4cm4cm19c3c1c3_weight(1));
    PL_STEP_0_for_cm10cm5cm5c0c3cm9c7cm5c8c10c7cm4c1cm4c0c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10cm5cm5c0c3cm9c7cm5c8c10c7cm4c1cm4c0c2_weight(0), cm10cm5cm5c0c3cm9c7cm5c8c10c7cm4c1cm4c0c2_weight(1));
    PL_STEP_0_for_cm30c3cm2c0c2cm13cm4cm2c9c5cm3cm7cm10cm4c20cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm30c3cm2c0c2cm13cm4cm2c9c5cm3cm7cm10cm4c20cm2_weight(0), cm30c3cm2c0c2cm13cm4cm2c9c5cm3cm7cm10cm4c20cm2_weight(1));
    PL_STEP_0_for_c2c2cm2c2c6c15cm2c5c5c8cm6cm2cm2cm2cm3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c2cm2c2c6c15cm2c5c5c8cm6cm2cm2cm2cm3c1_weight(0), c2c2cm2c2c6c15cm2c5c5c8cm6cm2cm2cm2cm3c1_weight(1));
    PL_STEP_0_for_cm1c0c15cm3cm20c1c12c6cm3cm1c4cm2c5c5cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0c15cm3cm20c1c12c6cm3cm1c4cm2c5c5cm1c0_weight(0), cm1c0c15cm3cm20c1c12c6cm3cm1c4cm2c5c5cm1c0_weight(1));
    PL_STEP_0_for_cm22c8cm2cm5c10c0c6c0cm7cm3c8c16cm12c18c12cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm22c8cm2cm5c10c0c6c0cm7cm3c8c16cm12c18c12cm4_weight(0), cm22c8cm2cm5c10c0c6c0cm7cm3c8c16cm12c18c12cm4_weight(1));
    PL_STEP_0_for_cm6c4c2c1cm3c25cm3cm7c9cm20c2c4c16c9c5cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c4c2c1cm3c25cm3cm7c9cm20c2c4c16c9c5cm1_weight(0), cm6c4c2c1cm3c25cm3cm7c9cm20c2c4c16c9c5cm1_weight(1));
    PL_STEP_0_for_cm3c4c4cm3c0cm4c5c5c10c5cm4cm3cm47cm7c11cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c4c4cm3c0cm4c5c5c10c5cm4cm3cm47cm7c11cm5_weight(0), cm3c4c4cm3c0cm4c5c5c10c5cm4cm3cm47cm7c11cm5_weight(1));
    PL_STEP_0_for_c6cm5c8cm15cm13c11c10c0c2c9c1cm8cm1c4c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm5c8cm15cm13c11c10c0c2c9c1cm8cm1c4c0cm1_weight(0), c6cm5c8cm15cm13c11c10c0c2c9c1cm8cm1c4c0cm1_weight(1));
    PL_STEP_0_for_cm8cm7c8cm3cm19c6cm10cm3c25c10c2c8cm9c0c4c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8cm7c8cm3cm19c6cm10cm3c25c10c2c8cm9c0c4c4_weight(0), cm8cm7c8cm3cm19c6cm10cm3c25c10c2c8cm9c0c4c4_weight(1));
    PL_STEP_0_for_cm6c16cm8c1c11c50c7c3c8cm20c52cm15c2c10c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c16cm8c1c11c50c7c3c8cm20c52cm15c2c10c1cm1_weight(0), cm6c16cm8c1c11c50c7c3c8cm20c52cm15c2c10c1cm1_weight(1));
    PL_STEP_0_for_cm3c0c5c1cm36cm2cm15c5cm35cm6cm4cm7cm14c11c5c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c0c5c1cm36cm2cm15c5cm35cm6cm4cm7cm14c11c5c6_weight(0), cm3c0c5c1cm36cm2cm15c5cm35cm6cm4cm7cm14c11c5c6_weight(1));
    PL_STEP_0_for_c0cm5c0c0cm5c1cm5cm1c19cm7cm6c1c4c12c2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm5c0c0cm5c1cm5cm1c19cm7cm6c1c4c12c2c0_weight(0), c0cm5c0c0cm5c1cm5cm1c19cm7cm6c1c4c12c2c0_weight(1));
    PL_STEP_0_for_c1cm19cm13cm2c21cm2c2c0cm8c6c10c17c4cm12cm3c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm19cm13cm2c21cm2c2c0cm8c6c10c17c4cm12cm3c11_weight(0), c1cm19cm13cm2c21cm2c2c0cm8c6c10c17c4cm12cm3c11_weight(1));
    PL_STEP_0_for_cm9cm53c5cm1cm11c22cm9cm21c4c9cm9cm8c9cm4cm3c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9cm53c5cm1cm11c22cm9cm21c4c9cm9cm8c9cm4cm3c4_weight(0), cm9cm53c5cm1cm11c22cm9cm21c4c9cm9cm8c9cm4cm3c4_weight(1));
    PL_STEP_0_for_c0c2c2c9c18cm21c5cm2cm1c1cm10c1c3c2cm7c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c2c2c9c18cm21c5cm2cm1c1cm10c1c3c2cm7c7_weight(0), c0c2c2c9c18cm21c5cm2cm1c1cm10c1c3c2cm7c7_weight(1));
    PL_STEP_0_for_cm5c5cm1cm1c39c8c7c1cm6c36c34c24c8c0c14c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c5cm1cm1c39c8c7c1cm6c36c34c24c8c0c14c3_weight(0), cm5c5cm1cm1c39c8c7c1cm6c36c34c24c8c0c14c3_weight(1));
    PL_STEP_0_for_cm6c6c2cm1c4c12cm2cm18c3cm5c1c11cm7cm6c1cm26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c6c2cm1c4c12cm2cm18c3cm5c1c11cm7cm6c1cm26_weight(0), cm6c6c2cm1c4c12cm2cm18c3cm5c1c11cm7cm6c1cm26_weight(1));
    PL_STEP_0_for_cm1cm1c9c8c7cm38c5cm9c11cm11c1c0c6c1cm5cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c9c8c7cm38c5cm9c11cm11c1c0c6c1cm5cm8_weight(0), cm1cm1c9c8c7cm38c5cm9c11cm11c1c0c6c1cm5cm8_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c2c15c8c13cm5cm2c32c4c1c11cm14c8cm1c83c10cm6_c6cm5c8cm15cm13c11c10c0c2c9c1cm8cm1c4c0cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c15c8c13cm5cm2c32c4c1c11cm14c8cm1c83c10cm6_weight(1)(8-1 downto 0),
			B	=> c6cm5c8cm15cm13c11c10c0c2c9c1cm8cm1c4c0cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c15c8c13cm5cm2c32c4c1c11cm14c8cm1c83c10cm6,
			CxB => R_c6cm5c8cm15cm13c11c10c0c2c9c1cm8cm1c4c0cm1
		);

    cm1c10c3c9cm10c4c4c1c10c2c7c1c34c6c4c2_c2c2cm2c2c6c15cm2c5c5c8cm6cm2cm2cm2cm3c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c10c3c9cm10c4c4c1c10c2c7c1c34c6c4c2_weight(1)(7-1 downto 0),
			B	=> c2c2cm2c2c6c15cm2c5c5c8cm6cm2cm2cm2cm3c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c10c3c9cm10c4c4c1c10c2c7c1c34c6c4c2,
			CxB => R_c2c2cm2c2c6c15cm2c5c5c8cm6cm2cm2cm2cm3c1
		);

    cm20c0c23c4cm3c1cm25c7c15c7c25cm34c4c3c61cm4_cm10cm5cm5c0c3cm9c7cm5c8c10c7cm4c1cm4c0c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm20c0c23c4cm3c1cm25c7c15c7c25cm34c4c3c61cm4_weight(1)(7-1 downto 0),
			B	=> cm10cm5cm5c0c3cm9c7cm5c8c10c7cm4c1cm4c0c2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm20c0c23c4cm3c1cm25c7c15c7c25cm34c4c3c61cm4,
			CxB => R_cm10cm5cm5c0c3cm9c7cm5c8c10c7cm4c1cm4c0c2
		);

    c3c6c23cm1cm15cm5cm35cm14c34cm17cm8c37c1cm6c4cm4_cm6cm4c8cm4cm10c1cm1c5c4cm10cm6cm5cm10cm1cm1cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c6c23cm1cm15cm5cm35cm14c34cm17cm8c37c1cm6c4cm4_weight(1)(7-1 downto 0),
			B	=> cm6cm4c8cm4cm10c1cm1c5c4cm10cm6cm5cm10cm1cm1cm4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c6c23cm1cm15cm5cm35cm14c34cm17cm8c37c1cm6c4cm4,
			CxB => R_cm6cm4c8cm4cm10c1cm1c5c4cm10cm6cm5cm10cm1cm1cm4
		);

    c3c4cm8cm2cm9c25c13cm9c12cm38cm2cm45c2cm2c10cm6_cm6c6c2cm1c4c12cm2cm18c3cm5c1c11cm7cm6c1cm26_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c4cm8cm2cm9c25c13cm9c12cm38cm2cm45c2cm2c10cm6_weight(1)(7-1 downto 0),
			B	=> cm6c6c2cm1c4c12cm2cm18c3cm5c1c11cm7cm6c1cm26_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c4cm8cm2cm9c25c13cm9c12cm38cm2cm45c2cm2c10cm6,
			CxB => R_cm6c6c2cm1c4c12cm2cm18c3cm5c1c11cm7cm6c1cm26
		);

    cm1cm7cm4c3c0c4c3c2c10c10c45c1c2cm17c5c0_c0c2c2c9c18cm21c5cm2cm1c1cm10c1c3c2cm7c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm7cm4c3c0c4c3c2c10c10c45c1c2cm17c5c0_weight(1)(7-1 downto 0),
			B	=> c0c2c2c9c18cm21c5cm2cm1c1cm10c1c3c2cm7c7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm7cm4c3c0c4c3c2c10c10c45c1c2cm17c5c0,
			CxB => R_c0c2c2c9c18cm21c5cm2cm1c1cm10c1c3c2cm7c7
		);

    cm3c4c4cm3c0cm4c5c5c10c5cm4cm3cm47cm7c11cm5_c1cm19cm13cm2c21cm2c2c0cm8c6c10c17c4cm12cm3c11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c4c4cm3c0cm4c5c5c10c5cm4cm3cm47cm7c11cm5_weight(1)(7-1 downto 0),
			B	=> c1cm19cm13cm2c21cm2c2c0cm8c6c10c17c4cm12cm3c11_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c4c4cm3c0cm4c5c5c10c5cm4cm3cm47cm7c11cm5,
			CxB => R_c1cm19cm13cm2c21cm2c2c0cm8c6c10c17c4cm12cm3c11
		);

    cm6c16cm8c1c11c50c7c3c8cm20c52cm15c2c10c1cm1_c0cm5c0c0cm5c1cm5cm1c19cm7cm6c1c4c12c2c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6c16cm8c1c11c50c7c3c8cm20c52cm15c2c10c1cm1_weight(1)(7-1 downto 0),
			B	=> c0cm5c0c0cm5c1cm5cm1c19cm7cm6c1c4c12c2c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c16cm8c1c11c50c7c3c8cm20c52cm15c2c10c1cm1,
			CxB => R_c0cm5c0c0cm5c1cm5cm1c19cm7cm6c1c4c12c2c0
		);

    cm3c0c5c1cm36cm2cm15c5cm35cm6cm4cm7cm14c11c5c6_cm8cm7c8cm3cm19c6cm10cm3c25c10c2c8cm9c0c4c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c0c5c1cm36cm2cm15c5cm35cm6cm4cm7cm14c11c5c6_weight(1)(7-1 downto 0),
			B	=> cm8cm7c8cm3cm19c6cm10cm3c25c10c2c8cm9c0c4c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c0c5c1cm36cm2cm15c5cm35cm6cm4cm7cm14c11c5c6,
			CxB => R_cm8cm7c8cm3cm19c6cm10cm3c25c10c2c8cm9c0c4c4
		);

    cm9cm53c5cm1cm11c22cm9cm21c4c9cm9cm8c9cm4cm3c4_cm6c4c2c1cm3c25cm3cm7c9cm20c2c4c16c9c5cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9cm53c5cm1cm11c22cm9cm21c4c9cm9cm8c9cm4cm3c4_weight(1)(7-1 downto 0),
			B	=> cm6c4c2c1cm3c25cm3cm7c9cm20c2c4c16c9c5cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9cm53c5cm1cm11c22cm9cm21c4c9cm9cm8c9cm4cm3c4,
			CxB => R_cm6c4c2c1cm3c25cm3cm7c9cm20c2c4c16c9c5cm1
		);

    cm5c5cm1cm1c39c8c7c1cm6c36c34c24c8c0c14c3_cm22c8cm2cm5c10c0c6c0cm7cm3c8c16cm12c18c12cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5c5cm1cm1c39c8c7c1cm6c36c34c24c8c0c14c3_weight(1)(7-1 downto 0),
			B	=> cm22c8cm2cm5c10c0c6c0cm7cm3c8c16cm12c18c12cm4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5c5cm1cm1c39c8c7c1cm6c36c34c24c8c0c14c3,
			CxB => R_cm22c8cm2cm5c10c0c6c0cm7cm3c8c16cm12c18c12cm4
		);

    cm1cm1c9c8c7cm38c5cm9c11cm11c1c0c6c1cm5cm8_cm1c0c15cm3cm20c1c12c6cm3cm1c4cm2c5c5cm1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm1c9c8c7cm38c5cm9c11cm11c1c0c6c1cm5cm8_weight(1)(7-1 downto 0),
			B	=> cm1c0c15cm3cm20c1c12c6cm3cm1c4cm2c5c5cm1c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm1c9c8c7cm38c5cm9c11cm11c1c0c6c1cm5cm8,
			CxB => R_cm1c0c15cm3cm20c1c12c6cm3cm1c4cm2c5c5cm1c0
		);

    c4c0c0c7c25c4cm26cm23cm4c10cm28cm26c0cm8c6cm3_cm30c3cm2c0c2cm13cm4cm2c9c5cm3cm7cm10cm4c20cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c0c0c7c25c4cm26cm23cm4c10cm28cm26c0cm8c6cm3_weight(1)(6-1 downto 0),
			B	=> cm30c3cm2c0c2cm13cm4cm2c9c5cm3cm7cm10cm4c20cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c0c0c7c25c4cm26cm23cm4c10cm28cm26c0cm8c6cm3,
			CxB => R_cm30c3cm2c0c2cm13cm4cm2c9c5cm3cm7cm10cm4c20cm2
		);

    c12cm5cm3cm1c1c0c16c2c16c17c25c31cm14cm3cm7cm2_c10c2cm5c2c3c14c2cm5cm11c0c4cm4cm19c3c1c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c12cm5cm3cm1c1c0c16c2c16c17c25c31cm14cm3cm7cm2_weight(1)(6-1 downto 0),
			B	=> c10c2cm5c2c3c14c2cm5cm11c0c4cm4cm19c3c1c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c12cm5cm3cm1c1c0c16c2c16c17c25c31cm14cm3cm7cm2,
			CxB => R_c10c2cm5c2c3c14c2cm5cm11c0c4cm4cm19c3c1c3
		);

    c12cm7c4cm23c4cm1c5cm5cm1c9cm3cm10c3cm9c2cm1_cm3cm7c9c4c3c9cm7cm1c4c6c8c2cm3c3c18cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c12cm7c4cm23c4cm1c5cm5cm1c9cm3cm10c3cm9c2cm1_weight(1)(6-1 downto 0),
			B	=> cm3cm7c9c4c3c9cm7cm1c4c6c8c2cm3c3c18cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c12cm7c4cm23c4cm1c5cm5cm1c9cm3cm10c3cm9c2cm1,
			CxB => R_cm3cm7c9c4c3c9cm7cm1c4c6c8c2cm3c3c18cm1
		);

    cm4cm5c4c3cm1c1c4c10c7cm5c6cm20c4cm3c6c3_c6cm1c9cm5c9cm2cm15cm8c7c5cm4cm11c17c1cm9c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm5c4c3cm1c1c4c10c7cm5c6cm20c4cm3c6c3_weight(1)(6-1 downto 0),
			B	=> c6cm1c9cm5c9cm2cm15cm8c7c5cm4cm11c17c1cm9c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm5c4c3cm1c1c4c10c7cm5c6cm20c4cm3c6c3,
			CxB => R_c6cm1c9cm5c9cm2cm15cm8c7c5cm4cm11c17c1cm9c0
		);




end architecture;
