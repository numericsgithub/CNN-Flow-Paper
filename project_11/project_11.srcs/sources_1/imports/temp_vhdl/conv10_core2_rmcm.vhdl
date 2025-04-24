library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv10_core2_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(64-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        R_c12c8c2cm1c1c2c10cm4c22cm8c4c10cm9cm1c0cm2cm2c0cm8cm5cm2c15c3c5cm2c0cm5c28c0cm3c1cm5cm2cm1c0c3cm2cm1c1cm9cm4cm11cm3c0cm9cm12c6c6c3c3cm8cm7cm3cm7c9c6c1cm2c3cm7cm20c0cm3c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm4cm14c17cm3c4cm7c32cm11cm36cm8cm11cm16c16cm6cm3cm6cm5c1cm13cm7cm1cm6cm18cm2c17c2cm6cm29cm5c5c15cm1cm7cm19cm4cm23cm9cm8cm5cm14cm16cm6cm21c4c10cm5cm3c23cm1cm9cm7cm4cm10cm4c41cm7cm19cm18c6c2c19c2cm12c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c11c5c0cm1cm1c1c9cm4c12c3c4c2cm8cm3c0c0cm2cm1cm1cm3cm4cm4c6cm7cm12cm1cm4cm9c0c0c2cm2c2c9cm2c4c0cm4c0cm4cm7cm10cm8c0c9c3cm5cm9c10cm1c12cm10cm1cm8cm6cm10c2c2c2cm6c5cm1cm1c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c17c8cm3cm6cm9cm11cm9cm20c10c51c30c2cm7cm3cm8cm5c5c0cm21cm3c23cm20c23c4c3cm5cm23cm5c4c19cm3cm8c31c12cm4cm6cm6cm4c6c4cm7c3c6cm10cm3c24c28cm5cm27cm14cm9cm7cm6cm38c12cm21cm17c8cm18c13c5cm10c2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm12c17cm5cm4c18cm35cm17c39c24cm7cm30cm43c39cm8cm6cm22cm9c33cm22c50c44cm25cm51cm1c83c12cm1c10cm6c11cm61cm2cm10cm40c5cm46cm23cm4c19c21c15cm3c21c18cm9cm6cm5cm19cm22cm5cm6c1cm19c38cm10c17cm8cm42c11cm32c10c27cm45c20 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm2cm31cm7cm2cm1cm3cm6cm6cm2cm9cm12c7cm1c1cm1c2cm2cm3cm13cm7cm5c2cm4cm11cm3c2cm4c11cm3cm4c19cm3cm3cm18cm11c6c1c3c2c3c0cm6cm2c0c16cm6cm8cm13c0c28c21cm6cm2cm14c0cm5c28cm2c5cm10cm16c3cm1cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c10cm12cm4c0c1c2cm1cm2cm9c3c0cm2cm1cm3c0c2cm1cm2c11cm1cm2c3c5c2cm6c0cm4cm14c1c1c0cm2c2c27c0c2cm1cm1cm1cm1c2cm9c1cm2c0c3c3cm2c10cm2cm5cm4c0cm8c8cm4cm5c4c2c22c9c0cm3c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1c12cm8cm3cm4c3cm13cm2c11c18cm2c1cm5cm1c1c2cm2cm3c35cm9cm1cm7cm5c2cm3cm1cm4c15cm3cm1c15cm2cm2c14c0c2c2cm5c2c0c4cm7c5cm1cm10cm7cm4cm15c4c7cm3cm8cm3cm11cm8c7c10cm4c2c33cm19cm2c0cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c9c5cm1cm1cm1c1cm3cm1cm2c0c1c0cm4cm1c0c2cm2cm2c6c0cm2c2c5cm2cm10cm1cm1c0c2c0cm3cm1c2cm2cm1c1cm1c0c0cm1c2cm6c3cm3c2cm1cm2c5c1c4c7cm1cm2cm2c3c4c3c2c0c12cm1c0cm3c1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv10_core2_rmcm;

architecture arch of conv10_core2_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C12C8C2CM1C1C2C10CM4C22CM8C4C10CM9CM1C0CM2CM2C0CM8CM5CM2C15C3C5CM2C0CM5C28C0CM3C1CM5CM2CM1C0C3CM2CM1C1CM9CM4CM11CM3C0CM9CM12C6C6C3C3CM8CM7CM3CM7C9C6C1CM2C3CM7CM20C0CM3C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM14C17CM3C4CM7C32CM11CM36CM8CM11CM16C16CM6CM3CM6CM5C1CM13CM7CM1CM6CM18CM2C17C2CM6CM29CM5C5C15CM1CM7CM19CM4CM23CM9CM8CM5CM14CM16CM6CM21C4C10CM5CM3C23CM1CM9CM7CM4CM10CM4C41CM7CM19CM18C6C2C19C2CM12C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C5C0CM1CM1C1C9CM4C12C3C4C2CM8CM3C0C0CM2CM1CM1CM3CM4CM4C6CM7CM12CM1CM4CM9C0C0C2CM2C2C9CM2C4C0CM4C0CM4CM7CM10CM8C0C9C3CM5CM9C10CM1C12CM10CM1CM8CM6CM10C2C2C2CM6C5CM1CM1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C17C8CM3CM6CM9CM11CM9CM20C10C51C30C2CM7CM3CM8CM5C5C0CM21CM3C23CM20C23C4C3CM5CM23CM5C4C19CM3CM8C31C12CM4CM6CM6CM4C6C4CM7C3C6CM10CM3C24C28CM5CM27CM14CM9CM7CM6CM38C12CM21CM17C8CM18C13C5CM10C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12C17CM5CM4C18CM35CM17C39C24CM7CM30CM43C39CM8CM6CM22CM9C33CM22C50C44CM25CM51CM1C83C12CM1C10CM6C11CM61CM2CM10CM40C5CM46CM23CM4C19C21C15CM3C21C18CM9CM6CM5CM19CM22CM5CM6C1CM19C38CM10C17CM8CM42C11CM32C10C27CM45C20_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM31CM7CM2CM1CM3CM6CM6CM2CM9CM12C7CM1C1CM1C2CM2CM3CM13CM7CM5C2CM4CM11CM3C2CM4C11CM3CM4C19CM3CM3CM18CM11C6C1C3C2C3C0CM6CM2C0C16CM6CM8CM13C0C28C21CM6CM2CM14C0CM5C28CM2C5CM10CM16C3CM1CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10CM12CM4C0C1C2CM1CM2CM9C3C0CM2CM1CM3C0C2CM1CM2C11CM1CM2C3C5C2CM6C0CM4CM14C1C1C0CM2C2C27C0C2CM1CM1CM1CM1C2CM9C1CM2C0C3C3CM2C10CM2CM5CM4C0CM8C8CM4CM5C4C2C22C9C0CM3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C12CM8CM3CM4C3CM13CM2C11C18CM2C1CM5CM1C1C2CM2CM3C35CM9CM1CM7CM5C2CM3CM1CM4C15CM3CM1C15CM2CM2C14C0C2C2CM5C2C0C4CM7C5CM1CM10CM7CM4CM15C4C7CM3CM8CM3CM11CM8C7C10CM4C2C33CM19CM2C0CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9C5CM1CM1CM1C1CM3CM1CM2C0C1C0CM4CM1C0C2CM2CM2C6C0CM2C2C5CM2CM10CM1CM1C0C2C0CM3CM1C2CM2CM1C1CM1C0C0CM1C2CM6C3CM3C2CM1CM2C5C1C4C7CM1CM2CM2C3C4C3C2C0C12CM1C0CM3C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(3, -4)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(4, -4)
    signal c12c8c2cm1c1c2c10cm4c22cm8c4c10cm9cm1c0cm2cm2c0cm8cm5cm2c15c3c5cm2c0cm5c28c0cm3c1cm5cm2cm1c0c3cm2cm1c1cm9cm4cm11cm3c0cm9cm12c6c6c3c3cm8cm7cm3cm7c9c6c1cm2c3cm7cm20c0cm3c1_weight : PIPELINE_TYPE_FOR_C12C8C2CM1C1C2C10CM4C22CM8C4C10CM9CM1C0CM2CM2C0CM8CM5CM2C15C3C5CM2C0CM5C28C0CM3C1CM5CM2CM1C0C3CM2CM1C1CM9CM4CM11CM3C0CM9CM12C6C6C3C3CM8CM7CM3CM7C9C6C1CM2C3CM7CM20C0CM3C1_WEIGHT;
    -- sfix(4, -4)
    signal cm4cm14c17cm3c4cm7c32cm11cm36cm8cm11cm16c16cm6cm3cm6cm5c1cm13cm7cm1cm6cm18cm2c17c2cm6cm29cm5c5c15cm1cm7cm19cm4cm23cm9cm8cm5cm14cm16cm6cm21c4c10cm5cm3c23cm1cm9cm7cm4cm10cm4c41cm7cm19cm18c6c2c19c2cm12c1_weight : PIPELINE_TYPE_FOR_CM4CM14C17CM3C4CM7C32CM11CM36CM8CM11CM16C16CM6CM3CM6CM5C1CM13CM7CM1CM6CM18CM2C17C2CM6CM29CM5C5C15CM1CM7CM19CM4CM23CM9CM8CM5CM14CM16CM6CM21C4C10CM5CM3C23CM1CM9CM7CM4CM10CM4C41CM7CM19CM18C6C2C19C2CM12C1_WEIGHT;
    -- sfix(4, -4)
    signal c11c5c0cm1cm1c1c9cm4c12c3c4c2cm8cm3c0c0cm2cm1cm1cm3cm4cm4c6cm7cm12cm1cm4cm9c0c0c2cm2c2c9cm2c4c0cm4c0cm4cm7cm10cm8c0c9c3cm5cm9c10cm1c12cm10cm1cm8cm6cm10c2c2c2cm6c5cm1cm1c0_weight : PIPELINE_TYPE_FOR_C11C5C0CM1CM1C1C9CM4C12C3C4C2CM8CM3C0C0CM2CM1CM1CM3CM4CM4C6CM7CM12CM1CM4CM9C0C0C2CM2C2C9CM2C4C0CM4C0CM4CM7CM10CM8C0C9C3CM5CM9C10CM1C12CM10CM1CM8CM6CM10C2C2C2CM6C5CM1CM1C0_WEIGHT;
    -- sfix(4, -4)
    signal c0c17c8cm3cm6cm9cm11cm9cm20c10c51c30c2cm7cm3cm8cm5c5c0cm21cm3c23cm20c23c4c3cm5cm23cm5c4c19cm3cm8c31c12cm4cm6cm6cm4c6c4cm7c3c6cm10cm3c24c28cm5cm27cm14cm9cm7cm6cm38c12cm21cm17c8cm18c13c5cm10c2_weight : PIPELINE_TYPE_FOR_C0C17C8CM3CM6CM9CM11CM9CM20C10C51C30C2CM7CM3CM8CM5C5C0CM21CM3C23CM20C23C4C3CM5CM23CM5C4C19CM3CM8C31C12CM4CM6CM6CM4C6C4CM7C3C6CM10CM3C24C28CM5CM27CM14CM9CM7CM6CM38C12CM21CM17C8CM18C13C5CM10C2_WEIGHT;
    -- sfix(4, -4)
    signal cm12c17cm5cm4c18cm35cm17c39c24cm7cm30cm43c39cm8cm6cm22cm9c33cm22c50c44cm25cm51cm1c83c12cm1c10cm6c11cm61cm2cm10cm40c5cm46cm23cm4c19c21c15cm3c21c18cm9cm6cm5cm19cm22cm5cm6c1cm19c38cm10c17cm8cm42c11cm32c10c27cm45c20_weight : PIPELINE_TYPE_FOR_CM12C17CM5CM4C18CM35CM17C39C24CM7CM30CM43C39CM8CM6CM22CM9C33CM22C50C44CM25CM51CM1C83C12CM1C10CM6C11CM61CM2CM10CM40C5CM46CM23CM4C19C21C15CM3C21C18CM9CM6CM5CM19CM22CM5CM6C1CM19C38CM10C17CM8CM42C11CM32C10C27CM45C20_WEIGHT;
    -- sfix(4, -4)
    signal cm2cm31cm7cm2cm1cm3cm6cm6cm2cm9cm12c7cm1c1cm1c2cm2cm3cm13cm7cm5c2cm4cm11cm3c2cm4c11cm3cm4c19cm3cm3cm18cm11c6c1c3c2c3c0cm6cm2c0c16cm6cm8cm13c0c28c21cm6cm2cm14c0cm5c28cm2c5cm10cm16c3cm1cm3_weight : PIPELINE_TYPE_FOR_CM2CM31CM7CM2CM1CM3CM6CM6CM2CM9CM12C7CM1C1CM1C2CM2CM3CM13CM7CM5C2CM4CM11CM3C2CM4C11CM3CM4C19CM3CM3CM18CM11C6C1C3C2C3C0CM6CM2C0C16CM6CM8CM13C0C28C21CM6CM2CM14C0CM5C28CM2C5CM10CM16C3CM1CM3_WEIGHT;
    -- sfix(4, -4)
    signal c10cm12cm4c0c1c2cm1cm2cm9c3c0cm2cm1cm3c0c2cm1cm2c11cm1cm2c3c5c2cm6c0cm4cm14c1c1c0cm2c2c27c0c2cm1cm1cm1cm1c2cm9c1cm2c0c3c3cm2c10cm2cm5cm4c0cm8c8cm4cm5c4c2c22c9c0cm3c0_weight : PIPELINE_TYPE_FOR_C10CM12CM4C0C1C2CM1CM2CM9C3C0CM2CM1CM3C0C2CM1CM2C11CM1CM2C3C5C2CM6C0CM4CM14C1C1C0CM2C2C27C0C2CM1CM1CM1CM1C2CM9C1CM2C0C3C3CM2C10CM2CM5CM4C0CM8C8CM4CM5C4C2C22C9C0CM3C0_WEIGHT;
    -- sfix(4, -4)
    signal c1c12cm8cm3cm4c3cm13cm2c11c18cm2c1cm5cm1c1c2cm2cm3c35cm9cm1cm7cm5c2cm3cm1cm4c15cm3cm1c15cm2cm2c14c0c2c2cm5c2c0c4cm7c5cm1cm10cm7cm4cm15c4c7cm3cm8cm3cm11cm8c7c10cm4c2c33cm19cm2c0cm5_weight : PIPELINE_TYPE_FOR_C1C12CM8CM3CM4C3CM13CM2C11C18CM2C1CM5CM1C1C2CM2CM3C35CM9CM1CM7CM5C2CM3CM1CM4C15CM3CM1C15CM2CM2C14C0C2C2CM5C2C0C4CM7C5CM1CM10CM7CM4CM15C4C7CM3CM8CM3CM11CM8C7C10CM4C2C33CM19CM2C0CM5_WEIGHT;
    -- sfix(4, -4)
    signal c9c5cm1cm1cm1c1cm3cm1cm2c0c1c0cm4cm1c0c2cm2cm2c6c0cm2c2c5cm2cm10cm1cm1c0c2c0cm3cm1c2cm2cm1c1cm1c0c0cm1c2cm6c3cm3c2cm1cm2c5c1c4c7cm1cm2cm2c3c4c3c2c0c12cm1c0cm3c1_weight : PIPELINE_TYPE_FOR_C9C5CM1CM1CM1C1CM3CM1CM2C0C1C0CM4CM1C0C2CM2CM2C6C0CM2C2C5CM2CM10CM1CM1C0C2C0CM3CM1C2CM2CM1C1CM1C0C0CM1C2CM6C3CM3C2CM1CM2C5C1C4C7CM1CM2CM2C3C4C3C2C0C12CM1C0CM3C1_WEIGHT;
    -- sfix(4, -4)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c12c8c2cm1c1c2c10cm4c22cm8c4c10cm9cm1c0cm2cm2c0cm8cm5cm2c15c3c5cm2c0cm5c28c0cm3c1cm5cm2cm1c0c3cm2cm1c1cm9cm4cm11cm3c0cm9cm12c6c6c3c3cm8cm7cm3cm7c9c6c1cm2c3cm7cm20c0cm3c1_undelayed : std_logic_vector(13-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv10_core2_rmcm_weightsconstant_memory
        generic map
        (
            XI_WIDTH        	          => 8, 
            ARRAY_SIZE                    => 64,
            WORDS_PER_ADDR                => 9
        )
        port map
        (
            clk => clk,
            data_index => unsigned(SEL),
        
            dout1   => c12c8c2cm1c1c2c10cm4c22cm8c4c10cm9cm1c0cm2cm2c0cm8cm5cm2c15c3c5cm2c0cm5c28c0cm3c1cm5cm2cm1c0c3cm2cm1c1cm9cm4cm11cm3c0cm9cm12c6c6c3c3cm8cm7cm3cm7c9c6c1cm2c3cm7cm20c0cm3c1_weight(0), 
            dout2   => cm4cm14c17cm3c4cm7c32cm11cm36cm8cm11cm16c16cm6cm3cm6cm5c1cm13cm7cm1cm6cm18cm2c17c2cm6cm29cm5c5c15cm1cm7cm19cm4cm23cm9cm8cm5cm14cm16cm6cm21c4c10cm5cm3c23cm1cm9cm7cm4cm10cm4c41cm7cm19cm18c6c2c19c2cm12c1_weight(0), 
            dout3   => c11c5c0cm1cm1c1c9cm4c12c3c4c2cm8cm3c0c0cm2cm1cm1cm3cm4cm4c6cm7cm12cm1cm4cm9c0c0c2cm2c2c9cm2c4c0cm4c0cm4cm7cm10cm8c0c9c3cm5cm9c10cm1c12cm10cm1cm8cm6cm10c2c2c2cm6c5cm1cm1c0_weight(0), 
            dout4   => c0c17c8cm3cm6cm9cm11cm9cm20c10c51c30c2cm7cm3cm8cm5c5c0cm21cm3c23cm20c23c4c3cm5cm23cm5c4c19cm3cm8c31c12cm4cm6cm6cm4c6c4cm7c3c6cm10cm3c24c28cm5cm27cm14cm9cm7cm6cm38c12cm21cm17c8cm18c13c5cm10c2_weight(0), 
            dout5   => cm12c17cm5cm4c18cm35cm17c39c24cm7cm30cm43c39cm8cm6cm22cm9c33cm22c50c44cm25cm51cm1c83c12cm1c10cm6c11cm61cm2cm10cm40c5cm46cm23cm4c19c21c15cm3c21c18cm9cm6cm5cm19cm22cm5cm6c1cm19c38cm10c17cm8cm42c11cm32c10c27cm45c20_weight(0), 
            dout6   => cm2cm31cm7cm2cm1cm3cm6cm6cm2cm9cm12c7cm1c1cm1c2cm2cm3cm13cm7cm5c2cm4cm11cm3c2cm4c11cm3cm4c19cm3cm3cm18cm11c6c1c3c2c3c0cm6cm2c0c16cm6cm8cm13c0c28c21cm6cm2cm14c0cm5c28cm2c5cm10cm16c3cm1cm3_weight(0), 
            dout7   => c10cm12cm4c0c1c2cm1cm2cm9c3c0cm2cm1cm3c0c2cm1cm2c11cm1cm2c3c5c2cm6c0cm4cm14c1c1c0cm2c2c27c0c2cm1cm1cm1cm1c2cm9c1cm2c0c3c3cm2c10cm2cm5cm4c0cm8c8cm4cm5c4c2c22c9c0cm3c0_weight(0), 
            dout8   => c1c12cm8cm3cm4c3cm13cm2c11c18cm2c1cm5cm1c1c2cm2cm3c35cm9cm1cm7cm5c2cm3cm1cm4c15cm3cm1c15cm2cm2c14c0c2c2cm5c2c0c4cm7c5cm1cm10cm7cm4cm15c4c7cm3cm8cm3cm11cm8c7c10cm4c2c33cm19cm2c0cm5_weight(0), 
            dout9   => c9c5cm1cm1cm1c1cm3cm1cm2c0c1c0cm4cm1c0c2cm2cm2c6c0cm2c2c5cm2cm10cm1cm1c0c2c0cm3cm1c2cm2cm1c1cm1c0c0cm1c2cm6c3cm3c2cm1cm2c5c1c4c7cm1cm2cm2c3c4c3c2c0c12cm1c0cm3c1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c12c8c2cm1c1c2c10cm4c22cm8c4c10cm9cm1c0cm2cm2c0cm8cm5cm2c15c3c5cm2c0cm5c28c0cm3c1cm5cm2cm1c0c3cm2cm1c1cm9cm4cm11cm3c0cm9cm12c6c6c3c3cm8cm7cm3cm7c9c6c1cm2c3cm7cm20c0cm3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12c8c2cm1c1c2c10cm4c22cm8c4c10cm9cm1c0cm2cm2c0cm8cm5cm2c15c3c5cm2c0cm5c28c0cm3c1cm5cm2cm1c0c3cm2cm1c1cm9cm4cm11cm3c0cm9cm12c6c6c3c3cm8cm7cm3cm7c9c6c1cm2c3cm7cm20c0cm3c1_weight(0), c12c8c2cm1c1c2c10cm4c22cm8c4c10cm9cm1c0cm2cm2c0cm8cm5cm2c15c3c5cm2c0cm5c28c0cm3c1cm5cm2cm1c0c3cm2cm1c1cm9cm4cm11cm3c0cm9cm12c6c6c3c3cm8cm7cm3cm7c9c6c1cm2c3cm7cm20c0cm3c1_weight(1));
    PL_STEP_0_for_cm4cm14c17cm3c4cm7c32cm11cm36cm8cm11cm16c16cm6cm3cm6cm5c1cm13cm7cm1cm6cm18cm2c17c2cm6cm29cm5c5c15cm1cm7cm19cm4cm23cm9cm8cm5cm14cm16cm6cm21c4c10cm5cm3c23cm1cm9cm7cm4cm10cm4c41cm7cm19cm18c6c2c19c2cm12c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm14c17cm3c4cm7c32cm11cm36cm8cm11cm16c16cm6cm3cm6cm5c1cm13cm7cm1cm6cm18cm2c17c2cm6cm29cm5c5c15cm1cm7cm19cm4cm23cm9cm8cm5cm14cm16cm6cm21c4c10cm5cm3c23cm1cm9cm7cm4cm10cm4c41cm7cm19cm18c6c2c19c2cm12c1_weight(0), cm4cm14c17cm3c4cm7c32cm11cm36cm8cm11cm16c16cm6cm3cm6cm5c1cm13cm7cm1cm6cm18cm2c17c2cm6cm29cm5c5c15cm1cm7cm19cm4cm23cm9cm8cm5cm14cm16cm6cm21c4c10cm5cm3c23cm1cm9cm7cm4cm10cm4c41cm7cm19cm18c6c2c19c2cm12c1_weight(1));
    PL_STEP_0_for_c11c5c0cm1cm1c1c9cm4c12c3c4c2cm8cm3c0c0cm2cm1cm1cm3cm4cm4c6cm7cm12cm1cm4cm9c0c0c2cm2c2c9cm2c4c0cm4c0cm4cm7cm10cm8c0c9c3cm5cm9c10cm1c12cm10cm1cm8cm6cm10c2c2c2cm6c5cm1cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c5c0cm1cm1c1c9cm4c12c3c4c2cm8cm3c0c0cm2cm1cm1cm3cm4cm4c6cm7cm12cm1cm4cm9c0c0c2cm2c2c9cm2c4c0cm4c0cm4cm7cm10cm8c0c9c3cm5cm9c10cm1c12cm10cm1cm8cm6cm10c2c2c2cm6c5cm1cm1c0_weight(0), c11c5c0cm1cm1c1c9cm4c12c3c4c2cm8cm3c0c0cm2cm1cm1cm3cm4cm4c6cm7cm12cm1cm4cm9c0c0c2cm2c2c9cm2c4c0cm4c0cm4cm7cm10cm8c0c9c3cm5cm9c10cm1c12cm10cm1cm8cm6cm10c2c2c2cm6c5cm1cm1c0_weight(1));
    PL_STEP_0_for_c0c17c8cm3cm6cm9cm11cm9cm20c10c51c30c2cm7cm3cm8cm5c5c0cm21cm3c23cm20c23c4c3cm5cm23cm5c4c19cm3cm8c31c12cm4cm6cm6cm4c6c4cm7c3c6cm10cm3c24c28cm5cm27cm14cm9cm7cm6cm38c12cm21cm17c8cm18c13c5cm10c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c17c8cm3cm6cm9cm11cm9cm20c10c51c30c2cm7cm3cm8cm5c5c0cm21cm3c23cm20c23c4c3cm5cm23cm5c4c19cm3cm8c31c12cm4cm6cm6cm4c6c4cm7c3c6cm10cm3c24c28cm5cm27cm14cm9cm7cm6cm38c12cm21cm17c8cm18c13c5cm10c2_weight(0), c0c17c8cm3cm6cm9cm11cm9cm20c10c51c30c2cm7cm3cm8cm5c5c0cm21cm3c23cm20c23c4c3cm5cm23cm5c4c19cm3cm8c31c12cm4cm6cm6cm4c6c4cm7c3c6cm10cm3c24c28cm5cm27cm14cm9cm7cm6cm38c12cm21cm17c8cm18c13c5cm10c2_weight(1));
    PL_STEP_0_for_cm12c17cm5cm4c18cm35cm17c39c24cm7cm30cm43c39cm8cm6cm22cm9c33cm22c50c44cm25cm51cm1c83c12cm1c10cm6c11cm61cm2cm10cm40c5cm46cm23cm4c19c21c15cm3c21c18cm9cm6cm5cm19cm22cm5cm6c1cm19c38cm10c17cm8cm42c11cm32c10c27cm45c20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12c17cm5cm4c18cm35cm17c39c24cm7cm30cm43c39cm8cm6cm22cm9c33cm22c50c44cm25cm51cm1c83c12cm1c10cm6c11cm61cm2cm10cm40c5cm46cm23cm4c19c21c15cm3c21c18cm9cm6cm5cm19cm22cm5cm6c1cm19c38cm10c17cm8cm42c11cm32c10c27cm45c20_weight(0), cm12c17cm5cm4c18cm35cm17c39c24cm7cm30cm43c39cm8cm6cm22cm9c33cm22c50c44cm25cm51cm1c83c12cm1c10cm6c11cm61cm2cm10cm40c5cm46cm23cm4c19c21c15cm3c21c18cm9cm6cm5cm19cm22cm5cm6c1cm19c38cm10c17cm8cm42c11cm32c10c27cm45c20_weight(1));
    PL_STEP_0_for_cm2cm31cm7cm2cm1cm3cm6cm6cm2cm9cm12c7cm1c1cm1c2cm2cm3cm13cm7cm5c2cm4cm11cm3c2cm4c11cm3cm4c19cm3cm3cm18cm11c6c1c3c2c3c0cm6cm2c0c16cm6cm8cm13c0c28c21cm6cm2cm14c0cm5c28cm2c5cm10cm16c3cm1cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm31cm7cm2cm1cm3cm6cm6cm2cm9cm12c7cm1c1cm1c2cm2cm3cm13cm7cm5c2cm4cm11cm3c2cm4c11cm3cm4c19cm3cm3cm18cm11c6c1c3c2c3c0cm6cm2c0c16cm6cm8cm13c0c28c21cm6cm2cm14c0cm5c28cm2c5cm10cm16c3cm1cm3_weight(0), cm2cm31cm7cm2cm1cm3cm6cm6cm2cm9cm12c7cm1c1cm1c2cm2cm3cm13cm7cm5c2cm4cm11cm3c2cm4c11cm3cm4c19cm3cm3cm18cm11c6c1c3c2c3c0cm6cm2c0c16cm6cm8cm13c0c28c21cm6cm2cm14c0cm5c28cm2c5cm10cm16c3cm1cm3_weight(1));
    PL_STEP_0_for_c10cm12cm4c0c1c2cm1cm2cm9c3c0cm2cm1cm3c0c2cm1cm2c11cm1cm2c3c5c2cm6c0cm4cm14c1c1c0cm2c2c27c0c2cm1cm1cm1cm1c2cm9c1cm2c0c3c3cm2c10cm2cm5cm4c0cm8c8cm4cm5c4c2c22c9c0cm3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10cm12cm4c0c1c2cm1cm2cm9c3c0cm2cm1cm3c0c2cm1cm2c11cm1cm2c3c5c2cm6c0cm4cm14c1c1c0cm2c2c27c0c2cm1cm1cm1cm1c2cm9c1cm2c0c3c3cm2c10cm2cm5cm4c0cm8c8cm4cm5c4c2c22c9c0cm3c0_weight(0), c10cm12cm4c0c1c2cm1cm2cm9c3c0cm2cm1cm3c0c2cm1cm2c11cm1cm2c3c5c2cm6c0cm4cm14c1c1c0cm2c2c27c0c2cm1cm1cm1cm1c2cm9c1cm2c0c3c3cm2c10cm2cm5cm4c0cm8c8cm4cm5c4c2c22c9c0cm3c0_weight(1));
    PL_STEP_0_for_c1c12cm8cm3cm4c3cm13cm2c11c18cm2c1cm5cm1c1c2cm2cm3c35cm9cm1cm7cm5c2cm3cm1cm4c15cm3cm1c15cm2cm2c14c0c2c2cm5c2c0c4cm7c5cm1cm10cm7cm4cm15c4c7cm3cm8cm3cm11cm8c7c10cm4c2c33cm19cm2c0cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c12cm8cm3cm4c3cm13cm2c11c18cm2c1cm5cm1c1c2cm2cm3c35cm9cm1cm7cm5c2cm3cm1cm4c15cm3cm1c15cm2cm2c14c0c2c2cm5c2c0c4cm7c5cm1cm10cm7cm4cm15c4c7cm3cm8cm3cm11cm8c7c10cm4c2c33cm19cm2c0cm5_weight(0), c1c12cm8cm3cm4c3cm13cm2c11c18cm2c1cm5cm1c1c2cm2cm3c35cm9cm1cm7cm5c2cm3cm1cm4c15cm3cm1c15cm2cm2c14c0c2c2cm5c2c0c4cm7c5cm1cm10cm7cm4cm15c4c7cm3cm8cm3cm11cm8c7c10cm4c2c33cm19cm2c0cm5_weight(1));
    PL_STEP_0_for_c9c5cm1cm1cm1c1cm3cm1cm2c0c1c0cm4cm1c0c2cm2cm2c6c0cm2c2c5cm2cm10cm1cm1c0c2c0cm3cm1c2cm2cm1c1cm1c0c0cm1c2cm6c3cm3c2cm1cm2c5c1c4c7cm1cm2cm2c3c4c3c2c0c12cm1c0cm3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9c5cm1cm1cm1c1cm3cm1cm2c0c1c0cm4cm1c0c2cm2cm2c6c0cm2c2c5cm2cm10cm1cm1c0c2c0cm3cm1c2cm2cm1c1cm1c0c0cm1c2cm6c3cm3c2cm1cm2c5c1c4c7cm1cm2cm2c3c4c3c2c0c12cm1c0cm3c1_weight(0), c9c5cm1cm1cm1c1cm3cm1cm2c0c1c0cm4cm1c0c2cm2cm2c6c0cm2c2c5cm2cm10cm1cm1c0c2c0cm3cm1c2cm2cm1c1cm1c0c0cm1c2cm6c3cm3c2cm1cm2c5c1c4c7cm1cm2cm2c3c4c3c2c0c12cm1c0cm3c1_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm12c17cm5cm4c18cm35cm17c39c24cm7cm30cm43c39cm8cm6cm22cm9c33cm22c50c44cm25cm51cm1c83c12cm1c10cm6c11cm61cm2cm10cm40c5cm46cm23cm4c19c21c15cm3c21c18cm9cm6cm5cm19cm22cm5cm6c1cm19c38cm10c17cm8cm42c11cm32c10c27cm45c20_c9c5cm1cm1cm1c1cm3cm1cm2c0c1c0cm4cm1c0c2cm2cm2c6c0cm2c2c5cm2cm10cm1cm1c0c2c0cm3cm1c2cm2cm1c1cm1c0c0cm1c2cm6c3cm3c2cm1cm2c5c1c4c7cm1cm2cm2c3c4c3c2c0c12cm1c0cm3c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(3, -4)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm12c17cm5cm4c18cm35cm17c39c24cm7cm30cm43c39cm8cm6cm22cm9c33cm22c50c44cm25cm51cm1c83c12cm1c10cm6c11cm61cm2cm10cm40c5cm46cm23cm4c19c21c15cm3c21c18cm9cm6cm5cm19cm22cm5cm6c1cm19c38cm10c17cm8cm42c11cm32c10c27cm45c20_weight(1)(8-1 downto 0),
			B	=> c9c5cm1cm1cm1c1cm3cm1cm2c0c1c0cm4cm1c0c2cm2cm2c6c0cm2c2c5cm2cm10cm1cm1c0c2c0cm3cm1c2cm2cm1c1cm1c0c0cm1c2cm6c3cm3c2cm1cm2c5c1c4c7cm1cm2cm2c3c4c3c2c0c12cm1c0cm3c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm12c17cm5cm4c18cm35cm17c39c24cm7cm30cm43c39cm8cm6cm22cm9c33cm22c50c44cm25cm51cm1c83c12cm1c10cm6c11cm61cm2cm10cm40c5cm46cm23cm4c19c21c15cm3c21c18cm9cm6cm5cm19cm22cm5cm6c1cm19c38cm10c17cm8cm42c11cm32c10c27cm45c20,
			CxB => R_c9c5cm1cm1cm1c1cm3cm1cm2c0c1c0cm4cm1c0c2cm2cm2c6c0cm2c2c5cm2cm10cm1cm1c0c2c0cm3cm1c2cm2cm1c1cm1c0c0cm1c2cm6c3cm3c2cm1cm2c5c1c4c7cm1cm2cm2c3c4c3c2c0c12cm1c0cm3c1
		);

    cm4cm14c17cm3c4cm7c32cm11cm36cm8cm11cm16c16cm6cm3cm6cm5c1cm13cm7cm1cm6cm18cm2c17c2cm6cm29cm5c5c15cm1cm7cm19cm4cm23cm9cm8cm5cm14cm16cm6cm21c4c10cm5cm3c23cm1cm9cm7cm4cm10cm4c41cm7cm19cm18c6c2c19c2cm12c1_c11c5c0cm1cm1c1c9cm4c12c3c4c2cm8cm3c0c0cm2cm1cm1cm3cm4cm4c6cm7cm12cm1cm4cm9c0c0c2cm2c2c9cm2c4c0cm4c0cm4cm7cm10cm8c0c9c3cm5cm9c10cm1c12cm10cm1cm8cm6cm10c2c2c2cm6c5cm1cm1c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(3, -4)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm4cm14c17cm3c4cm7c32cm11cm36cm8cm11cm16c16cm6cm3cm6cm5c1cm13cm7cm1cm6cm18cm2c17c2cm6cm29cm5c5c15cm1cm7cm19cm4cm23cm9cm8cm5cm14cm16cm6cm21c4c10cm5cm3c23cm1cm9cm7cm4cm10cm4c41cm7cm19cm18c6c2c19c2cm12c1_weight(1)(7-1 downto 0),
			B	=> c11c5c0cm1cm1c1c9cm4c12c3c4c2cm8cm3c0c0cm2cm1cm1cm3cm4cm4c6cm7cm12cm1cm4cm9c0c0c2cm2c2c9cm2c4c0cm4c0cm4cm7cm10cm8c0c9c3cm5cm9c10cm1c12cm10cm1cm8cm6cm10c2c2c2cm6c5cm1cm1c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm14c17cm3c4cm7c32cm11cm36cm8cm11cm16c16cm6cm3cm6cm5c1cm13cm7cm1cm6cm18cm2c17c2cm6cm29cm5c5c15cm1cm7cm19cm4cm23cm9cm8cm5cm14cm16cm6cm21c4c10cm5cm3c23cm1cm9cm7cm4cm10cm4c41cm7cm19cm18c6c2c19c2cm12c1,
			CxB => R_c11c5c0cm1cm1c1c9cm4c12c3c4c2cm8cm3c0c0cm2cm1cm1cm3cm4cm4c6cm7cm12cm1cm4cm9c0c0c2cm2c2c9cm2c4c0cm4c0cm4cm7cm10cm8c0c9c3cm5cm9c10cm1c12cm10cm1cm8cm6cm10c2c2c2cm6c5cm1cm1c0
		);

    c0c17c8cm3cm6cm9cm11cm9cm20c10c51c30c2cm7cm3cm8cm5c5c0cm21cm3c23cm20c23c4c3cm5cm23cm5c4c19cm3cm8c31c12cm4cm6cm6cm4c6c4cm7c3c6cm10cm3c24c28cm5cm27cm14cm9cm7cm6cm38c12cm21cm17c8cm18c13c5cm10c2_c10cm12cm4c0c1c2cm1cm2cm9c3c0cm2cm1cm3c0c2cm1cm2c11cm1cm2c3c5c2cm6c0cm4cm14c1c1c0cm2c2c27c0c2cm1cm1cm1cm1c2cm9c1cm2c0c3c3cm2c10cm2cm5cm4c0cm8c8cm4cm5c4c2c22c9c0cm3c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(3, -4)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c17c8cm3cm6cm9cm11cm9cm20c10c51c30c2cm7cm3cm8cm5c5c0cm21cm3c23cm20c23c4c3cm5cm23cm5c4c19cm3cm8c31c12cm4cm6cm6cm4c6c4cm7c3c6cm10cm3c24c28cm5cm27cm14cm9cm7cm6cm38c12cm21cm17c8cm18c13c5cm10c2_weight(1)(7-1 downto 0),
			B	=> c10cm12cm4c0c1c2cm1cm2cm9c3c0cm2cm1cm3c0c2cm1cm2c11cm1cm2c3c5c2cm6c0cm4cm14c1c1c0cm2c2c27c0c2cm1cm1cm1cm1c2cm9c1cm2c0c3c3cm2c10cm2cm5cm4c0cm8c8cm4cm5c4c2c22c9c0cm3c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c17c8cm3cm6cm9cm11cm9cm20c10c51c30c2cm7cm3cm8cm5c5c0cm21cm3c23cm20c23c4c3cm5cm23cm5c4c19cm3cm8c31c12cm4cm6cm6cm4c6c4cm7c3c6cm10cm3c24c28cm5cm27cm14cm9cm7cm6cm38c12cm21cm17c8cm18c13c5cm10c2,
			CxB => R_c10cm12cm4c0c1c2cm1cm2cm9c3c0cm2cm1cm3c0c2cm1cm2c11cm1cm2c3c5c2cm6c0cm4cm14c1c1c0cm2c2c27c0c2cm1cm1cm1cm1c2cm9c1cm2c0c3c3cm2c10cm2cm5cm4c0cm8c8cm4cm5c4c2c22c9c0cm3c0
		);

    c1c12cm8cm3cm4c3cm13cm2c11c18cm2c1cm5cm1c1c2cm2cm3c35cm9cm1cm7cm5c2cm3cm1cm4c15cm3cm1c15cm2cm2c14c0c2c2cm5c2c0c4cm7c5cm1cm10cm7cm4cm15c4c7cm3cm8cm3cm11cm8c7c10cm4c2c33cm19cm2c0cm5_cm2cm31cm7cm2cm1cm3cm6cm6cm2cm9cm12c7cm1c1cm1c2cm2cm3cm13cm7cm5c2cm4cm11cm3c2cm4c11cm3cm4c19cm3cm3cm18cm11c6c1c3c2c3c0cm6cm2c0c16cm6cm8cm13c0c28c21cm6cm2cm14c0cm5c28cm2c5cm10cm16c3cm1cm3_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(3, -4)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c12cm8cm3cm4c3cm13cm2c11c18cm2c1cm5cm1c1c2cm2cm3c35cm9cm1cm7cm5c2cm3cm1cm4c15cm3cm1c15cm2cm2c14c0c2c2cm5c2c0c4cm7c5cm1cm10cm7cm4cm15c4c7cm3cm8cm3cm11cm8c7c10cm4c2c33cm19cm2c0cm5_weight(1)(7-1 downto 0),
			B	=> cm2cm31cm7cm2cm1cm3cm6cm6cm2cm9cm12c7cm1c1cm1c2cm2cm3cm13cm7cm5c2cm4cm11cm3c2cm4c11cm3cm4c19cm3cm3cm18cm11c6c1c3c2c3c0cm6cm2c0c16cm6cm8cm13c0c28c21cm6cm2cm14c0cm5c28cm2c5cm10cm16c3cm1cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c12cm8cm3cm4c3cm13cm2c11c18cm2c1cm5cm1c1c2cm2cm3c35cm9cm1cm7cm5c2cm3cm1cm4c15cm3cm1c15cm2cm2c14c0c2c2cm5c2c0c4cm7c5cm1cm10cm7cm4cm15c4c7cm3cm8cm3cm11cm8c7c10cm4c2c33cm19cm2c0cm5,
			CxB => R_cm2cm31cm7cm2cm1cm3cm6cm6cm2cm9cm12c7cm1c1cm1c2cm2cm3cm13cm7cm5c2cm4cm11cm3c2cm4c11cm3cm4c19cm3cm3cm18cm11c6c1c3c2c3c0cm6cm2c0c16cm6cm8cm13c0c28c21cm6cm2cm14c0cm5c28cm2c5cm10cm16c3cm1cm3
		);




    c12c8c2cm1c1c2c10cm4c22cm8c4c10cm9cm1c0cm2cm2c0cm8cm5cm2c15c3c5cm2c0cm5c28c0cm3c1cm5cm2cm1c0c3cm2cm1c1cm9cm4cm11cm3c0cm9cm12c6c6c3c3cm8cm7cm3cm7c9c6c1cm2c3cm7cm20c0cm3c1_MULT: entity work.TruncatedSingleMult
	generic map
		(
            A_WIDTH           => 8, --	sfix(4, -4)
            A_TRUNCATED_WIDTH => 6, -- This would be the MSB position of the weight
            B_WIDTH           => 7, --	ufix(3, -4)
            AxB_WIDTH         => 13, --	sfix(5, -8)
            AxB_FRAC_TRUNCATION => 0,
            B_IS_SIGNED       => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c12c8c2cm1c1c2c10cm4c22cm8c4c10cm9cm1c0cm2cm2c0cm8cm5cm2c15c3c5cm2c0cm5c28c0cm3c1cm5cm2cm1c0c3cm2cm1c1cm9cm4cm11cm3c0cm9cm12c6c6c3c3cm8cm7cm3cm7c9c6c1cm2c3cm7cm20c0cm3c1_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c12c8c2cm1c1c2c10cm4c22cm8c4c10cm9cm1c0cm2cm2c0cm8cm5cm2c15c3c5cm2c0cm5c28c0cm3c1cm5cm2cm1c0c3cm2cm1c1cm9cm4cm11cm3c0cm9cm12c6c6c3c3cm8cm7cm3cm7c9c6c1cm2c3cm7cm20c0cm3c1
		);

end architecture;
