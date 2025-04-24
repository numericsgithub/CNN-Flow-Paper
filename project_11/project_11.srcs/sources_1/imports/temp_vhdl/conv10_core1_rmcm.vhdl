library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv10_core1_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(64-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        R_cm1c6cm6cm3cm2cm7c3cm5c2cm1c4c2c4cm5cm8c5c0cm3c5cm4c14cm2c3c7c5cm4cm2c11cm4cm5cm5c24c14cm3c10c9c2c9c9c14cm2c2cm14cm6c3cm1c2c2cm15cm3c0cm2cm7cm3c13cm6cm6c10c1cm26cm1cm2c1cm9 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2c28cm10cm6cm15cm10c6cm4c12cm11c24cm26cm19cm8cm4cm34cm8c0c12cm3cm14cm16cm10c8cm19cm4cm6c16c3c13c2c3cm21cm11cm7c44cm6c17cm7c58cm2c8c19c0c1cm1c4c11cm12cm3cm5cm4cm14c6cm16cm10cm5cm15c0c17c14cm3c7cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0cm2cm6cm1cm2cm4cm7cm2cm2c4c7cm3cm3cm2cm6c31c7c2cm1cm1cm6c1c6cm4c6cm1c10c0c0c0cm4c0cm3c0c0c6c1cm12cm5c5cm1cm2c4cm8c2cm2c1cm3c1cm3cm4c0c16cm2cm1cm1cm3c0c0c11c7cm6cm1cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1c7cm9cm9cm12c4c3cm6c8cm11cm11cm12cm22cm9cm7cm5c12cm18c8cm7c25c1cm9c11cm19cm4cm4c13c1cm25c1c2cm11cm3cm5cm12cm5c18cm6cm12cm3c2c15c0c2c0c2c4cm12cm2cm2cm2c27c6c45cm12cm3cm1c1c6cm15cm7c4cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c17cm34cm18cm21c3c10c21c3c39cm36cm13c0cm32c20c1cm61cm25c19c52cm2cm13cm14cm34cm1cm42cm1cm19cm9c24c19c44cm10c49c17c2cm33c39cm32c4cm46cm6c13c5c40c1c14c11c5c37c0cm2cm8cm20c18cm31cm25c4c20c16cm27c9c42c19c50 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0cm5cm10c0c9c3c0cm4c3cm2c0c6c23c5cm8c53c16c2cm1cm6c4c11cm2cm7cm6cm3c30cm13c6c9cm6cm6cm18c0cm1cm5cm6cm3c9cm6cm2cm2cm11cm9c1c4cm2c3c2cm1cm2cm2cm10c1cm13c4cm4cm14cm2c4c3cm1cm1cm13 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm1cm11c15cm2c3c2cm5cm2c0c6cm5c7c5cm4cm3c5c4cm4c3cm1c1cm2c7c0c5cm2c1cm1cm2cm1cm4cm2cm8c2cm5cm2c0cm13cm1cm3cm1c0c7cm8c2cm1c0c0c4cm3cm4cm1cm3cm2c9c0cm4cm4cm1c22cm12cm2c0cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c10c34cm1c13c6cm2cm6cm3c0cm3c25c19cm1cm9cm21cm9cm1cm3cm4cm19c2cm1cm8cm5cm4cm6cm15cm2cm11cm9cm6cm15c4c9cm9cm5cm2cm2cm9cm1c0cm15cm10c2c1cm1cm3c5cm3cm3cm2c15c0cm7c2cm4c10cm3c1cm16cm7cm3cm13 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1c2c10cm1c4c1c0c0cm3c4cm1c1c27c4cm1c12c3c1c2c0c3cm2c5cm5c5c0cm1cm2cm4c6cm2cm1c10c2c0cm1c0c12c0cm2cm1cm1cm2cm3c1c2c1c0cm3cm1cm1c0cm10cm4cm2cm5cm4cm9c0cm15cm4cm2cm1cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv10_core1_rmcm;

architecture arch of conv10_core1_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C6CM6CM3CM2CM7C3CM5C2CM1C4C2C4CM5CM8C5C0CM3C5CM4C14CM2C3C7C5CM4CM2C11CM4CM5CM5C24C14CM3C10C9C2C9C9C14CM2C2CM14CM6C3CM1C2C2CM15CM3C0CM2CM7CM3C13CM6CM6C10C1CM26CM1CM2C1CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C28CM10CM6CM15CM10C6CM4C12CM11C24CM26CM19CM8CM4CM34CM8C0C12CM3CM14CM16CM10C8CM19CM4CM6C16C3C13C2C3CM21CM11CM7C44CM6C17CM7C58CM2C8C19C0C1CM1C4C11CM12CM3CM5CM4CM14C6CM16CM10CM5CM15C0C17C14CM3C7CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2CM6CM1CM2CM4CM7CM2CM2C4C7CM3CM3CM2CM6C31C7C2CM1CM1CM6C1C6CM4C6CM1C10C0C0C0CM4C0CM3C0C0C6C1CM12CM5C5CM1CM2C4CM8C2CM2C1CM3C1CM3CM4C0C16CM2CM1CM1CM3C0C0C11C7CM6CM1CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C7CM9CM9CM12C4C3CM6C8CM11CM11CM12CM22CM9CM7CM5C12CM18C8CM7C25C1CM9C11CM19CM4CM4C13C1CM25C1C2CM11CM3CM5CM12CM5C18CM6CM12CM3C2C15C0C2C0C2C4CM12CM2CM2CM2C27C6C45CM12CM3CM1C1C6CM15CM7C4CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C17CM34CM18CM21C3C10C21C3C39CM36CM13C0CM32C20C1CM61CM25C19C52CM2CM13CM14CM34CM1CM42CM1CM19CM9C24C19C44CM10C49C17C2CM33C39CM32C4CM46CM6C13C5C40C1C14C11C5C37C0CM2CM8CM20C18CM31CM25C4C20C16CM27C9C42C19C50_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM5CM10C0C9C3C0CM4C3CM2C0C6C23C5CM8C53C16C2CM1CM6C4C11CM2CM7CM6CM3C30CM13C6C9CM6CM6CM18C0CM1CM5CM6CM3C9CM6CM2CM2CM11CM9C1C4CM2C3C2CM1CM2CM2CM10C1CM13C4CM4CM14CM2C4C3CM1CM1CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM11C15CM2C3C2CM5CM2C0C6CM5C7C5CM4CM3C5C4CM4C3CM1C1CM2C7C0C5CM2C1CM1CM2CM1CM4CM2CM8C2CM5CM2C0CM13CM1CM3CM1C0C7CM8C2CM1C0C0C4CM3CM4CM1CM3CM2C9C0CM4CM4CM1C22CM12CM2C0CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C10C34CM1C13C6CM2CM6CM3C0CM3C25C19CM1CM9CM21CM9CM1CM3CM4CM19C2CM1CM8CM5CM4CM6CM15CM2CM11CM9CM6CM15C4C9CM9CM5CM2CM2CM9CM1C0CM15CM10C2C1CM1CM3C5CM3CM3CM2C15C0CM7C2CM4C10CM3C1CM16CM7CM3CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C2C10CM1C4C1C0C0CM3C4CM1C1C27C4CM1C12C3C1C2C0C3CM2C5CM5C5C0CM1CM2CM4C6CM2CM1C10C2C0CM1C0C12C0CM2CM1CM1CM2CM3C1C2C1C0CM3CM1CM1C0CM10CM4CM2CM5CM4CM9C0CM15CM4CM2CM1CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(3, -4)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(4, -4)
    signal cm1c6cm6cm3cm2cm7c3cm5c2cm1c4c2c4cm5cm8c5c0cm3c5cm4c14cm2c3c7c5cm4cm2c11cm4cm5cm5c24c14cm3c10c9c2c9c9c14cm2c2cm14cm6c3cm1c2c2cm15cm3c0cm2cm7cm3c13cm6cm6c10c1cm26cm1cm2c1cm9_weight : PIPELINE_TYPE_FOR_CM1C6CM6CM3CM2CM7C3CM5C2CM1C4C2C4CM5CM8C5C0CM3C5CM4C14CM2C3C7C5CM4CM2C11CM4CM5CM5C24C14CM3C10C9C2C9C9C14CM2C2CM14CM6C3CM1C2C2CM15CM3C0CM2CM7CM3C13CM6CM6C10C1CM26CM1CM2C1CM9_WEIGHT;
    -- sfix(4, -4)
    signal cm2c28cm10cm6cm15cm10c6cm4c12cm11c24cm26cm19cm8cm4cm34cm8c0c12cm3cm14cm16cm10c8cm19cm4cm6c16c3c13c2c3cm21cm11cm7c44cm6c17cm7c58cm2c8c19c0c1cm1c4c11cm12cm3cm5cm4cm14c6cm16cm10cm5cm15c0c17c14cm3c7cm2_weight : PIPELINE_TYPE_FOR_CM2C28CM10CM6CM15CM10C6CM4C12CM11C24CM26CM19CM8CM4CM34CM8C0C12CM3CM14CM16CM10C8CM19CM4CM6C16C3C13C2C3CM21CM11CM7C44CM6C17CM7C58CM2C8C19C0C1CM1C4C11CM12CM3CM5CM4CM14C6CM16CM10CM5CM15C0C17C14CM3C7CM2_WEIGHT;
    -- sfix(4, -4)
    signal c0cm2cm6cm1cm2cm4cm7cm2cm2c4c7cm3cm3cm2cm6c31c7c2cm1cm1cm6c1c6cm4c6cm1c10c0c0c0cm4c0cm3c0c0c6c1cm12cm5c5cm1cm2c4cm8c2cm2c1cm3c1cm3cm4c0c16cm2cm1cm1cm3c0c0c11c7cm6cm1cm8_weight : PIPELINE_TYPE_FOR_C0CM2CM6CM1CM2CM4CM7CM2CM2C4C7CM3CM3CM2CM6C31C7C2CM1CM1CM6C1C6CM4C6CM1C10C0C0C0CM4C0CM3C0C0C6C1CM12CM5C5CM1CM2C4CM8C2CM2C1CM3C1CM3CM4C0C16CM2CM1CM1CM3C0C0C11C7CM6CM1CM8_WEIGHT;
    -- sfix(4, -4)
    signal cm1c7cm9cm9cm12c4c3cm6c8cm11cm11cm12cm22cm9cm7cm5c12cm18c8cm7c25c1cm9c11cm19cm4cm4c13c1cm25c1c2cm11cm3cm5cm12cm5c18cm6cm12cm3c2c15c0c2c0c2c4cm12cm2cm2cm2c27c6c45cm12cm3cm1c1c6cm15cm7c4cm1_weight : PIPELINE_TYPE_FOR_CM1C7CM9CM9CM12C4C3CM6C8CM11CM11CM12CM22CM9CM7CM5C12CM18C8CM7C25C1CM9C11CM19CM4CM4C13C1CM25C1C2CM11CM3CM5CM12CM5C18CM6CM12CM3C2C15C0C2C0C2C4CM12CM2CM2CM2C27C6C45CM12CM3CM1C1C6CM15CM7C4CM1_WEIGHT;
    -- sfix(4, -4)
    signal c17cm34cm18cm21c3c10c21c3c39cm36cm13c0cm32c20c1cm61cm25c19c52cm2cm13cm14cm34cm1cm42cm1cm19cm9c24c19c44cm10c49c17c2cm33c39cm32c4cm46cm6c13c5c40c1c14c11c5c37c0cm2cm8cm20c18cm31cm25c4c20c16cm27c9c42c19c50_weight : PIPELINE_TYPE_FOR_C17CM34CM18CM21C3C10C21C3C39CM36CM13C0CM32C20C1CM61CM25C19C52CM2CM13CM14CM34CM1CM42CM1CM19CM9C24C19C44CM10C49C17C2CM33C39CM32C4CM46CM6C13C5C40C1C14C11C5C37C0CM2CM8CM20C18CM31CM25C4C20C16CM27C9C42C19C50_WEIGHT;
    -- sfix(4, -4)
    signal c0cm5cm10c0c9c3c0cm4c3cm2c0c6c23c5cm8c53c16c2cm1cm6c4c11cm2cm7cm6cm3c30cm13c6c9cm6cm6cm18c0cm1cm5cm6cm3c9cm6cm2cm2cm11cm9c1c4cm2c3c2cm1cm2cm2cm10c1cm13c4cm4cm14cm2c4c3cm1cm1cm13_weight : PIPELINE_TYPE_FOR_C0CM5CM10C0C9C3C0CM4C3CM2C0C6C23C5CM8C53C16C2CM1CM6C4C11CM2CM7CM6CM3C30CM13C6C9CM6CM6CM18C0CM1CM5CM6CM3C9CM6CM2CM2CM11CM9C1C4CM2C3C2CM1CM2CM2CM10C1CM13C4CM4CM14CM2C4C3CM1CM1CM13_WEIGHT;
    -- sfix(4, -4)
    signal cm1cm11c15cm2c3c2cm5cm2c0c6cm5c7c5cm4cm3c5c4cm4c3cm1c1cm2c7c0c5cm2c1cm1cm2cm1cm4cm2cm8c2cm5cm2c0cm13cm1cm3cm1c0c7cm8c2cm1c0c0c4cm3cm4cm1cm3cm2c9c0cm4cm4cm1c22cm12cm2c0cm8_weight : PIPELINE_TYPE_FOR_CM1CM11C15CM2C3C2CM5CM2C0C6CM5C7C5CM4CM3C5C4CM4C3CM1C1CM2C7C0C5CM2C1CM1CM2CM1CM4CM2CM8C2CM5CM2C0CM13CM1CM3CM1C0C7CM8C2CM1C0C0C4CM3CM4CM1CM3CM2C9C0CM4CM4CM1C22CM12CM2C0CM8_WEIGHT;
    -- sfix(4, -4)
    signal c0c10c34cm1c13c6cm2cm6cm3c0cm3c25c19cm1cm9cm21cm9cm1cm3cm4cm19c2cm1cm8cm5cm4cm6cm15cm2cm11cm9cm6cm15c4c9cm9cm5cm2cm2cm9cm1c0cm15cm10c2c1cm1cm3c5cm3cm3cm2c15c0cm7c2cm4c10cm3c1cm16cm7cm3cm13_weight : PIPELINE_TYPE_FOR_C0C10C34CM1C13C6CM2CM6CM3C0CM3C25C19CM1CM9CM21CM9CM1CM3CM4CM19C2CM1CM8CM5CM4CM6CM15CM2CM11CM9CM6CM15C4C9CM9CM5CM2CM2CM9CM1C0CM15CM10C2C1CM1CM3C5CM3CM3CM2C15C0CM7C2CM4C10CM3C1CM16CM7CM3CM13_WEIGHT;
    -- sfix(4, -4)
    signal c1c2c10cm1c4c1c0c0cm3c4cm1c1c27c4cm1c12c3c1c2c0c3cm2c5cm5c5c0cm1cm2cm4c6cm2cm1c10c2c0cm1c0c12c0cm2cm1cm1cm2cm3c1c2c1c0cm3cm1cm1c0cm10cm4cm2cm5cm4cm9c0cm15cm4cm2cm1cm3_weight : PIPELINE_TYPE_FOR_C1C2C10CM1C4C1C0C0CM3C4CM1C1C27C4CM1C12C3C1C2C0C3CM2C5CM5C5C0CM1CM2CM4C6CM2CM1C10C2C0CM1C0C12C0CM2CM1CM1CM2CM3C1C2C1C0CM3CM1CM1C0CM10CM4CM2CM5CM4CM9C0CM15CM4CM2CM1CM3_WEIGHT;
    -- sfix(4, -4)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c0c10c34cm1c13c6cm2cm6cm3c0cm3c25c19cm1cm9cm21cm9cm1cm3cm4cm19c2cm1cm8cm5cm4cm6cm15cm2cm11cm9cm6cm15c4c9cm9cm5cm2cm2cm9cm1c0cm15cm10c2c1cm1cm3c5cm3cm3cm2c15c0cm7c2cm4c10cm3c1cm16cm7cm3cm13_undelayed : std_logic_vector(14-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv10_core1_rmcm_weightsconstant_memory
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
        
            dout1   => cm1c6cm6cm3cm2cm7c3cm5c2cm1c4c2c4cm5cm8c5c0cm3c5cm4c14cm2c3c7c5cm4cm2c11cm4cm5cm5c24c14cm3c10c9c2c9c9c14cm2c2cm14cm6c3cm1c2c2cm15cm3c0cm2cm7cm3c13cm6cm6c10c1cm26cm1cm2c1cm9_weight(0), 
            dout2   => cm2c28cm10cm6cm15cm10c6cm4c12cm11c24cm26cm19cm8cm4cm34cm8c0c12cm3cm14cm16cm10c8cm19cm4cm6c16c3c13c2c3cm21cm11cm7c44cm6c17cm7c58cm2c8c19c0c1cm1c4c11cm12cm3cm5cm4cm14c6cm16cm10cm5cm15c0c17c14cm3c7cm2_weight(0), 
            dout3   => c0cm2cm6cm1cm2cm4cm7cm2cm2c4c7cm3cm3cm2cm6c31c7c2cm1cm1cm6c1c6cm4c6cm1c10c0c0c0cm4c0cm3c0c0c6c1cm12cm5c5cm1cm2c4cm8c2cm2c1cm3c1cm3cm4c0c16cm2cm1cm1cm3c0c0c11c7cm6cm1cm8_weight(0), 
            dout4   => cm1c7cm9cm9cm12c4c3cm6c8cm11cm11cm12cm22cm9cm7cm5c12cm18c8cm7c25c1cm9c11cm19cm4cm4c13c1cm25c1c2cm11cm3cm5cm12cm5c18cm6cm12cm3c2c15c0c2c0c2c4cm12cm2cm2cm2c27c6c45cm12cm3cm1c1c6cm15cm7c4cm1_weight(0), 
            dout5   => c17cm34cm18cm21c3c10c21c3c39cm36cm13c0cm32c20c1cm61cm25c19c52cm2cm13cm14cm34cm1cm42cm1cm19cm9c24c19c44cm10c49c17c2cm33c39cm32c4cm46cm6c13c5c40c1c14c11c5c37c0cm2cm8cm20c18cm31cm25c4c20c16cm27c9c42c19c50_weight(0), 
            dout6   => c0cm5cm10c0c9c3c0cm4c3cm2c0c6c23c5cm8c53c16c2cm1cm6c4c11cm2cm7cm6cm3c30cm13c6c9cm6cm6cm18c0cm1cm5cm6cm3c9cm6cm2cm2cm11cm9c1c4cm2c3c2cm1cm2cm2cm10c1cm13c4cm4cm14cm2c4c3cm1cm1cm13_weight(0), 
            dout7   => cm1cm11c15cm2c3c2cm5cm2c0c6cm5c7c5cm4cm3c5c4cm4c3cm1c1cm2c7c0c5cm2c1cm1cm2cm1cm4cm2cm8c2cm5cm2c0cm13cm1cm3cm1c0c7cm8c2cm1c0c0c4cm3cm4cm1cm3cm2c9c0cm4cm4cm1c22cm12cm2c0cm8_weight(0), 
            dout8   => c0c10c34cm1c13c6cm2cm6cm3c0cm3c25c19cm1cm9cm21cm9cm1cm3cm4cm19c2cm1cm8cm5cm4cm6cm15cm2cm11cm9cm6cm15c4c9cm9cm5cm2cm2cm9cm1c0cm15cm10c2c1cm1cm3c5cm3cm3cm2c15c0cm7c2cm4c10cm3c1cm16cm7cm3cm13_weight(0), 
            dout9   => c1c2c10cm1c4c1c0c0cm3c4cm1c1c27c4cm1c12c3c1c2c0c3cm2c5cm5c5c0cm1cm2cm4c6cm2cm1c10c2c0cm1c0c12c0cm2cm1cm1cm2cm3c1c2c1c0cm3cm1cm1c0cm10cm4cm2cm5cm4cm9c0cm15cm4cm2cm1cm3_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm1c6cm6cm3cm2cm7c3cm5c2cm1c4c2c4cm5cm8c5c0cm3c5cm4c14cm2c3c7c5cm4cm2c11cm4cm5cm5c24c14cm3c10c9c2c9c9c14cm2c2cm14cm6c3cm1c2c2cm15cm3c0cm2cm7cm3c13cm6cm6c10c1cm26cm1cm2c1cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c6cm6cm3cm2cm7c3cm5c2cm1c4c2c4cm5cm8c5c0cm3c5cm4c14cm2c3c7c5cm4cm2c11cm4cm5cm5c24c14cm3c10c9c2c9c9c14cm2c2cm14cm6c3cm1c2c2cm15cm3c0cm2cm7cm3c13cm6cm6c10c1cm26cm1cm2c1cm9_weight(0), cm1c6cm6cm3cm2cm7c3cm5c2cm1c4c2c4cm5cm8c5c0cm3c5cm4c14cm2c3c7c5cm4cm2c11cm4cm5cm5c24c14cm3c10c9c2c9c9c14cm2c2cm14cm6c3cm1c2c2cm15cm3c0cm2cm7cm3c13cm6cm6c10c1cm26cm1cm2c1cm9_weight(1));
    PL_STEP_0_for_cm2c28cm10cm6cm15cm10c6cm4c12cm11c24cm26cm19cm8cm4cm34cm8c0c12cm3cm14cm16cm10c8cm19cm4cm6c16c3c13c2c3cm21cm11cm7c44cm6c17cm7c58cm2c8c19c0c1cm1c4c11cm12cm3cm5cm4cm14c6cm16cm10cm5cm15c0c17c14cm3c7cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c28cm10cm6cm15cm10c6cm4c12cm11c24cm26cm19cm8cm4cm34cm8c0c12cm3cm14cm16cm10c8cm19cm4cm6c16c3c13c2c3cm21cm11cm7c44cm6c17cm7c58cm2c8c19c0c1cm1c4c11cm12cm3cm5cm4cm14c6cm16cm10cm5cm15c0c17c14cm3c7cm2_weight(0), cm2c28cm10cm6cm15cm10c6cm4c12cm11c24cm26cm19cm8cm4cm34cm8c0c12cm3cm14cm16cm10c8cm19cm4cm6c16c3c13c2c3cm21cm11cm7c44cm6c17cm7c58cm2c8c19c0c1cm1c4c11cm12cm3cm5cm4cm14c6cm16cm10cm5cm15c0c17c14cm3c7cm2_weight(1));
    PL_STEP_0_for_c0cm2cm6cm1cm2cm4cm7cm2cm2c4c7cm3cm3cm2cm6c31c7c2cm1cm1cm6c1c6cm4c6cm1c10c0c0c0cm4c0cm3c0c0c6c1cm12cm5c5cm1cm2c4cm8c2cm2c1cm3c1cm3cm4c0c16cm2cm1cm1cm3c0c0c11c7cm6cm1cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2cm6cm1cm2cm4cm7cm2cm2c4c7cm3cm3cm2cm6c31c7c2cm1cm1cm6c1c6cm4c6cm1c10c0c0c0cm4c0cm3c0c0c6c1cm12cm5c5cm1cm2c4cm8c2cm2c1cm3c1cm3cm4c0c16cm2cm1cm1cm3c0c0c11c7cm6cm1cm8_weight(0), c0cm2cm6cm1cm2cm4cm7cm2cm2c4c7cm3cm3cm2cm6c31c7c2cm1cm1cm6c1c6cm4c6cm1c10c0c0c0cm4c0cm3c0c0c6c1cm12cm5c5cm1cm2c4cm8c2cm2c1cm3c1cm3cm4c0c16cm2cm1cm1cm3c0c0c11c7cm6cm1cm8_weight(1));
    PL_STEP_0_for_cm1c7cm9cm9cm12c4c3cm6c8cm11cm11cm12cm22cm9cm7cm5c12cm18c8cm7c25c1cm9c11cm19cm4cm4c13c1cm25c1c2cm11cm3cm5cm12cm5c18cm6cm12cm3c2c15c0c2c0c2c4cm12cm2cm2cm2c27c6c45cm12cm3cm1c1c6cm15cm7c4cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c7cm9cm9cm12c4c3cm6c8cm11cm11cm12cm22cm9cm7cm5c12cm18c8cm7c25c1cm9c11cm19cm4cm4c13c1cm25c1c2cm11cm3cm5cm12cm5c18cm6cm12cm3c2c15c0c2c0c2c4cm12cm2cm2cm2c27c6c45cm12cm3cm1c1c6cm15cm7c4cm1_weight(0), cm1c7cm9cm9cm12c4c3cm6c8cm11cm11cm12cm22cm9cm7cm5c12cm18c8cm7c25c1cm9c11cm19cm4cm4c13c1cm25c1c2cm11cm3cm5cm12cm5c18cm6cm12cm3c2c15c0c2c0c2c4cm12cm2cm2cm2c27c6c45cm12cm3cm1c1c6cm15cm7c4cm1_weight(1));
    PL_STEP_0_for_c17cm34cm18cm21c3c10c21c3c39cm36cm13c0cm32c20c1cm61cm25c19c52cm2cm13cm14cm34cm1cm42cm1cm19cm9c24c19c44cm10c49c17c2cm33c39cm32c4cm46cm6c13c5c40c1c14c11c5c37c0cm2cm8cm20c18cm31cm25c4c20c16cm27c9c42c19c50_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c17cm34cm18cm21c3c10c21c3c39cm36cm13c0cm32c20c1cm61cm25c19c52cm2cm13cm14cm34cm1cm42cm1cm19cm9c24c19c44cm10c49c17c2cm33c39cm32c4cm46cm6c13c5c40c1c14c11c5c37c0cm2cm8cm20c18cm31cm25c4c20c16cm27c9c42c19c50_weight(0), c17cm34cm18cm21c3c10c21c3c39cm36cm13c0cm32c20c1cm61cm25c19c52cm2cm13cm14cm34cm1cm42cm1cm19cm9c24c19c44cm10c49c17c2cm33c39cm32c4cm46cm6c13c5c40c1c14c11c5c37c0cm2cm8cm20c18cm31cm25c4c20c16cm27c9c42c19c50_weight(1));
    PL_STEP_0_for_c0cm5cm10c0c9c3c0cm4c3cm2c0c6c23c5cm8c53c16c2cm1cm6c4c11cm2cm7cm6cm3c30cm13c6c9cm6cm6cm18c0cm1cm5cm6cm3c9cm6cm2cm2cm11cm9c1c4cm2c3c2cm1cm2cm2cm10c1cm13c4cm4cm14cm2c4c3cm1cm1cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm5cm10c0c9c3c0cm4c3cm2c0c6c23c5cm8c53c16c2cm1cm6c4c11cm2cm7cm6cm3c30cm13c6c9cm6cm6cm18c0cm1cm5cm6cm3c9cm6cm2cm2cm11cm9c1c4cm2c3c2cm1cm2cm2cm10c1cm13c4cm4cm14cm2c4c3cm1cm1cm13_weight(0), c0cm5cm10c0c9c3c0cm4c3cm2c0c6c23c5cm8c53c16c2cm1cm6c4c11cm2cm7cm6cm3c30cm13c6c9cm6cm6cm18c0cm1cm5cm6cm3c9cm6cm2cm2cm11cm9c1c4cm2c3c2cm1cm2cm2cm10c1cm13c4cm4cm14cm2c4c3cm1cm1cm13_weight(1));
    PL_STEP_0_for_cm1cm11c15cm2c3c2cm5cm2c0c6cm5c7c5cm4cm3c5c4cm4c3cm1c1cm2c7c0c5cm2c1cm1cm2cm1cm4cm2cm8c2cm5cm2c0cm13cm1cm3cm1c0c7cm8c2cm1c0c0c4cm3cm4cm1cm3cm2c9c0cm4cm4cm1c22cm12cm2c0cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm11c15cm2c3c2cm5cm2c0c6cm5c7c5cm4cm3c5c4cm4c3cm1c1cm2c7c0c5cm2c1cm1cm2cm1cm4cm2cm8c2cm5cm2c0cm13cm1cm3cm1c0c7cm8c2cm1c0c0c4cm3cm4cm1cm3cm2c9c0cm4cm4cm1c22cm12cm2c0cm8_weight(0), cm1cm11c15cm2c3c2cm5cm2c0c6cm5c7c5cm4cm3c5c4cm4c3cm1c1cm2c7c0c5cm2c1cm1cm2cm1cm4cm2cm8c2cm5cm2c0cm13cm1cm3cm1c0c7cm8c2cm1c0c0c4cm3cm4cm1cm3cm2c9c0cm4cm4cm1c22cm12cm2c0cm8_weight(1));
    PL_STEP_0_for_c0c10c34cm1c13c6cm2cm6cm3c0cm3c25c19cm1cm9cm21cm9cm1cm3cm4cm19c2cm1cm8cm5cm4cm6cm15cm2cm11cm9cm6cm15c4c9cm9cm5cm2cm2cm9cm1c0cm15cm10c2c1cm1cm3c5cm3cm3cm2c15c0cm7c2cm4c10cm3c1cm16cm7cm3cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c10c34cm1c13c6cm2cm6cm3c0cm3c25c19cm1cm9cm21cm9cm1cm3cm4cm19c2cm1cm8cm5cm4cm6cm15cm2cm11cm9cm6cm15c4c9cm9cm5cm2cm2cm9cm1c0cm15cm10c2c1cm1cm3c5cm3cm3cm2c15c0cm7c2cm4c10cm3c1cm16cm7cm3cm13_weight(0), c0c10c34cm1c13c6cm2cm6cm3c0cm3c25c19cm1cm9cm21cm9cm1cm3cm4cm19c2cm1cm8cm5cm4cm6cm15cm2cm11cm9cm6cm15c4c9cm9cm5cm2cm2cm9cm1c0cm15cm10c2c1cm1cm3c5cm3cm3cm2c15c0cm7c2cm4c10cm3c1cm16cm7cm3cm13_weight(1));
    PL_STEP_0_for_c1c2c10cm1c4c1c0c0cm3c4cm1c1c27c4cm1c12c3c1c2c0c3cm2c5cm5c5c0cm1cm2cm4c6cm2cm1c10c2c0cm1c0c12c0cm2cm1cm1cm2cm3c1c2c1c0cm3cm1cm1c0cm10cm4cm2cm5cm4cm9c0cm15cm4cm2cm1cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c2c10cm1c4c1c0c0cm3c4cm1c1c27c4cm1c12c3c1c2c0c3cm2c5cm5c5c0cm1cm2cm4c6cm2cm1c10c2c0cm1c0c12c0cm2cm1cm1cm2cm3c1c2c1c0cm3cm1cm1c0cm10cm4cm2cm5cm4cm9c0cm15cm4cm2cm1cm3_weight(0), c1c2c10cm1c4c1c0c0cm3c4cm1c1c27c4cm1c12c3c1c2c0c3cm2c5cm5c5c0cm1cm2cm4c6cm2cm1c10c2c0cm1c0c12c0cm2cm1cm1cm2cm3c1c2c1c0cm3cm1cm1c0cm10cm4cm2cm5cm4cm9c0cm15cm4cm2cm1cm3_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm2c28cm10cm6cm15cm10c6cm4c12cm11c24cm26cm19cm8cm4cm34cm8c0c12cm3cm14cm16cm10c8cm19cm4cm6c16c3c13c2c3cm21cm11cm7c44cm6c17cm7c58cm2c8c19c0c1cm1c4c11cm12cm3cm5cm4cm14c6cm16cm10cm5cm15c0c17c14cm3c7cm2_c1c2c10cm1c4c1c0c0cm3c4cm1c1c27c4cm1c12c3c1c2c0c3cm2c5cm5c5c0cm1cm2cm4c6cm2cm1c10c2c0cm1c0c12c0cm2cm1cm1cm2cm3c1c2c1c0cm3cm1cm1c0cm10cm4cm2cm5cm4cm9c0cm15cm4cm2cm1cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c28cm10cm6cm15cm10c6cm4c12cm11c24cm26cm19cm8cm4cm34cm8c0c12cm3cm14cm16cm10c8cm19cm4cm6c16c3c13c2c3cm21cm11cm7c44cm6c17cm7c58cm2c8c19c0c1cm1c4c11cm12cm3cm5cm4cm14c6cm16cm10cm5cm15c0c17c14cm3c7cm2_weight(1)(7-1 downto 0),
			B	=> c1c2c10cm1c4c1c0c0cm3c4cm1c1c27c4cm1c12c3c1c2c0c3cm2c5cm5c5c0cm1cm2cm4c6cm2cm1c10c2c0cm1c0c12c0cm2cm1cm1cm2cm3c1c2c1c0cm3cm1cm1c0cm10cm4cm2cm5cm4cm9c0cm15cm4cm2cm1cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c28cm10cm6cm15cm10c6cm4c12cm11c24cm26cm19cm8cm4cm34cm8c0c12cm3cm14cm16cm10c8cm19cm4cm6c16c3c13c2c3cm21cm11cm7c44cm6c17cm7c58cm2c8c19c0c1cm1c4c11cm12cm3cm5cm4cm14c6cm16cm10cm5cm15c0c17c14cm3c7cm2,
			CxB => R_c1c2c10cm1c4c1c0c0cm3c4cm1c1c27c4cm1c12c3c1c2c0c3cm2c5cm5c5c0cm1cm2cm4c6cm2cm1c10c2c0cm1c0c12c0cm2cm1cm1cm2cm3c1c2c1c0cm3cm1cm1c0cm10cm4cm2cm5cm4cm9c0cm15cm4cm2cm1cm3
		);

    cm1c7cm9cm9cm12c4c3cm6c8cm11cm11cm12cm22cm9cm7cm5c12cm18c8cm7c25c1cm9c11cm19cm4cm4c13c1cm25c1c2cm11cm3cm5cm12cm5c18cm6cm12cm3c2c15c0c2c0c2c4cm12cm2cm2cm2c27c6c45cm12cm3cm1c1c6cm15cm7c4cm1_cm1cm11c15cm2c3c2cm5cm2c0c6cm5c7c5cm4cm3c5c4cm4c3cm1c1cm2c7c0c5cm2c1cm1cm2cm1cm4cm2cm8c2cm5cm2c0cm13cm1cm3cm1c0c7cm8c2cm1c0c0c4cm3cm4cm1cm3cm2c9c0cm4cm4cm1c22cm12cm2c0cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c7cm9cm9cm12c4c3cm6c8cm11cm11cm12cm22cm9cm7cm5c12cm18c8cm7c25c1cm9c11cm19cm4cm4c13c1cm25c1c2cm11cm3cm5cm12cm5c18cm6cm12cm3c2c15c0c2c0c2c4cm12cm2cm2cm2c27c6c45cm12cm3cm1c1c6cm15cm7c4cm1_weight(1)(7-1 downto 0),
			B	=> cm1cm11c15cm2c3c2cm5cm2c0c6cm5c7c5cm4cm3c5c4cm4c3cm1c1cm2c7c0c5cm2c1cm1cm2cm1cm4cm2cm8c2cm5cm2c0cm13cm1cm3cm1c0c7cm8c2cm1c0c0c4cm3cm4cm1cm3cm2c9c0cm4cm4cm1c22cm12cm2c0cm8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c7cm9cm9cm12c4c3cm6c8cm11cm11cm12cm22cm9cm7cm5c12cm18c8cm7c25c1cm9c11cm19cm4cm4c13c1cm25c1c2cm11cm3cm5cm12cm5c18cm6cm12cm3c2c15c0c2c0c2c4cm12cm2cm2cm2c27c6c45cm12cm3cm1c1c6cm15cm7c4cm1,
			CxB => R_cm1cm11c15cm2c3c2cm5cm2c0c6cm5c7c5cm4cm3c5c4cm4c3cm1c1cm2c7c0c5cm2c1cm1cm2cm1cm4cm2cm8c2cm5cm2c0cm13cm1cm3cm1c0c7cm8c2cm1c0c0c4cm3cm4cm1cm3cm2c9c0cm4cm4cm1c22cm12cm2c0cm8
		);

    c17cm34cm18cm21c3c10c21c3c39cm36cm13c0cm32c20c1cm61cm25c19c52cm2cm13cm14cm34cm1cm42cm1cm19cm9c24c19c44cm10c49c17c2cm33c39cm32c4cm46cm6c13c5c40c1c14c11c5c37c0cm2cm8cm20c18cm31cm25c4c20c16cm27c9c42c19c50_c0cm2cm6cm1cm2cm4cm7cm2cm2c4c7cm3cm3cm2cm6c31c7c2cm1cm1cm6c1c6cm4c6cm1c10c0c0c0cm4c0cm3c0c0c6c1cm12cm5c5cm1cm2c4cm8c2cm2c1cm3c1cm3cm4c0c16cm2cm1cm1cm3c0c0c11c7cm6cm1cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c17cm34cm18cm21c3c10c21c3c39cm36cm13c0cm32c20c1cm61cm25c19c52cm2cm13cm14cm34cm1cm42cm1cm19cm9c24c19c44cm10c49c17c2cm33c39cm32c4cm46cm6c13c5c40c1c14c11c5c37c0cm2cm8cm20c18cm31cm25c4c20c16cm27c9c42c19c50_weight(1)(7-1 downto 0),
			B	=> c0cm2cm6cm1cm2cm4cm7cm2cm2c4c7cm3cm3cm2cm6c31c7c2cm1cm1cm6c1c6cm4c6cm1c10c0c0c0cm4c0cm3c0c0c6c1cm12cm5c5cm1cm2c4cm8c2cm2c1cm3c1cm3cm4c0c16cm2cm1cm1cm3c0c0c11c7cm6cm1cm8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c17cm34cm18cm21c3c10c21c3c39cm36cm13c0cm32c20c1cm61cm25c19c52cm2cm13cm14cm34cm1cm42cm1cm19cm9c24c19c44cm10c49c17c2cm33c39cm32c4cm46cm6c13c5c40c1c14c11c5c37c0cm2cm8cm20c18cm31cm25c4c20c16cm27c9c42c19c50,
			CxB => R_c0cm2cm6cm1cm2cm4cm7cm2cm2c4c7cm3cm3cm2cm6c31c7c2cm1cm1cm6c1c6cm4c6cm1c10c0c0c0cm4c0cm3c0c0c6c1cm12cm5c5cm1cm2c4cm8c2cm2c1cm3c1cm3cm4c0c16cm2cm1cm1cm3c0c0c11c7cm6cm1cm8
		);

    c0cm5cm10c0c9c3c0cm4c3cm2c0c6c23c5cm8c53c16c2cm1cm6c4c11cm2cm7cm6cm3c30cm13c6c9cm6cm6cm18c0cm1cm5cm6cm3c9cm6cm2cm2cm11cm9c1c4cm2c3c2cm1cm2cm2cm10c1cm13c4cm4cm14cm2c4c3cm1cm1cm13_cm1c6cm6cm3cm2cm7c3cm5c2cm1c4c2c4cm5cm8c5c0cm3c5cm4c14cm2c3c7c5cm4cm2c11cm4cm5cm5c24c14cm3c10c9c2c9c9c14cm2c2cm14cm6c3cm1c2c2cm15cm3c0cm2cm7cm3c13cm6cm6c10c1cm26cm1cm2c1cm9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm5cm10c0c9c3c0cm4c3cm2c0c6c23c5cm8c53c16c2cm1cm6c4c11cm2cm7cm6cm3c30cm13c6c9cm6cm6cm18c0cm1cm5cm6cm3c9cm6cm2cm2cm11cm9c1c4cm2c3c2cm1cm2cm2cm10c1cm13c4cm4cm14cm2c4c3cm1cm1cm13_weight(1)(7-1 downto 0),
			B	=> cm1c6cm6cm3cm2cm7c3cm5c2cm1c4c2c4cm5cm8c5c0cm3c5cm4c14cm2c3c7c5cm4cm2c11cm4cm5cm5c24c14cm3c10c9c2c9c9c14cm2c2cm14cm6c3cm1c2c2cm15cm3c0cm2cm7cm3c13cm6cm6c10c1cm26cm1cm2c1cm9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm5cm10c0c9c3c0cm4c3cm2c0c6c23c5cm8c53c16c2cm1cm6c4c11cm2cm7cm6cm3c30cm13c6c9cm6cm6cm18c0cm1cm5cm6cm3c9cm6cm2cm2cm11cm9c1c4cm2c3c2cm1cm2cm2cm10c1cm13c4cm4cm14cm2c4c3cm1cm1cm13,
			CxB => R_cm1c6cm6cm3cm2cm7c3cm5c2cm1c4c2c4cm5cm8c5c0cm3c5cm4c14cm2c3c7c5cm4cm2c11cm4cm5cm5c24c14cm3c10c9c2c9c9c14cm2c2cm14cm6c3cm1c2c2cm15cm3c0cm2cm7cm3c13cm6cm6c10c1cm26cm1cm2c1cm9
		);




    c0c10c34cm1c13c6cm2cm6cm3c0cm3c25c19cm1cm9cm21cm9cm1cm3cm4cm19c2cm1cm8cm5cm4cm6cm15cm2cm11cm9cm6cm15c4c9cm9cm5cm2cm2cm9cm1c0cm15cm10c2c1cm1cm3c5cm3cm3cm2c15c0cm7c2cm4c10cm3c1cm16cm7cm3cm13_MULT: entity work.TruncatedSingleMult
	generic map
		(
            A_WIDTH           => 8, --	sfix(4, -4)
            A_TRUNCATED_WIDTH => 7, -- This would be the MSB position of the weight
            B_WIDTH           => 7, --	ufix(3, -4)
            AxB_WIDTH         => 14, --	sfix(6, -8)
            AxB_FRAC_TRUNCATION => 0,
            B_IS_SIGNED       => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c10c34cm1c13c6cm2cm6cm3c0cm3c25c19cm1cm9cm21cm9cm1cm3cm4cm19c2cm1cm8cm5cm4cm6cm15cm2cm11cm9cm6cm15c4c9cm9cm5cm2cm2cm9cm1c0cm15cm10c2c1cm1cm3c5cm3cm3cm2c15c0cm7c2cm4c10cm3c1cm16cm7cm3cm13_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c0c10c34cm1c13c6cm2cm6cm3c0cm3c25c19cm1cm9cm21cm9cm1cm3cm4cm19c2cm1cm8cm5cm4cm6cm15cm2cm11cm9cm6cm15c4c9cm9cm5cm2cm2cm9cm1c0cm15cm10c2c1cm1cm3c5cm3cm3cm2c15c0cm7c2cm4c10cm3c1cm16cm7cm3cm13
		);

end architecture;
