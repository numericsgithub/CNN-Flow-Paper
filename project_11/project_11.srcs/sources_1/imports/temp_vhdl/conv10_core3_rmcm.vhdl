library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv10_core3_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(64-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        R_cm3cm2c1cm7cm10cm6c4cm8c7cm4cm7c5c6cm10cm4c1cm1cm4cm7cm11cm2c0cm7cm2cm3cm1cm3c1cm3c13cm9c1cm7cm1cm3c0cm12c1c21cm5cm4c4cm2c5c10cm1c16cm2cm8c6c6cm7c1cm17cm22c2cm14cm3c2cm3cm8cm1cm4c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm7c3c3cm5cm12cm10cm14cm5cm23cm4cm2cm2c18cm3cm3cm8c3c6cm2c9c7c7c1cm24cm3c3cm1c2cm6cm16c12c4cm3cm4c2c2cm11c15c1cm10cm5cm19c2c9c41c1c11c0c0c11cm7c5c6cm14c1cm3cm5cm5cm3c0cm6cm6c5cm22 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm1cm1c1cm4c16c2cm1c4c10cm3cm3cm8c5c26c3cm5cm2cm2cm6c3cm1cm1cm6cm10cm2c0cm2cm1c0c3c3cm1cm6c0c0c0c5cm11cm9cm1c8cm5c0c5c4cm1cm12cm2c9c0cm7c4cm1c10c16cm2cm2cm1cm3cm1cm5c1cm7c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm8c6c3c1cm11cm10c24cm1cm20cm5c3cm10c5c0cm19cm15c5cm12cm5cm13c6cm1cm2c2cm3c1cm2c1cm5cm17c11c5cm4cm11c6c2cm7cm7cm31cm10cm20c36c1cm26cm16c1cm12c1cm19c1c26c37c3c18c4cm3cm10cm3cm4c2cm5cm8c2c3 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm10c16c27c31cm10cm13cm12cm14cm40c1c26cm1cm3cm46c18cm28c15c14c38c19c23c17c44c19c1c17cm3c14cm8cm36c17c10c45cm13c18c21c52c18c24c1cm8cm20cm43cm16cm37c20cm33c23c1c21cm2cm79c15c16cm26c36cm6cm1c44c35cm4cm15c35c36 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm6cm1cm2cm6c29cm5cm7cm4cm9cm5cm3cm2cm9cm10c4cm4cm2c8cm8cm2cm2c2cm9c1cm1c0cm1cm1cm4cm8cm2c3cm11cm3cm2cm2cm14cm5c18c7c30cm19c0cm20cm3cm4c4c3c18c0cm20c30c0c11cm10cm3cm11cm3cm4cm4cm4cm2cm3cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1cm3cm1cm4cm6c0c5c2c8cm4cm5cm5cm2c32cm5c14cm3cm4cm4cm6cm3c0cm3c0cm2c0cm1c0cm2c2c2cm1cm5cm2c0c0c10cm7c4c2cm4c14c3c11c2cm1cm8cm4cm7cm2c9c11c1c10c13c1cm1cm2cm3cm3cm6c0cm6cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm5cm2cm1cm10cm7cm6c4c0cm10cm4cm6cm2cm14cm1c3c34cm1cm1cm8c6c2cm5cm11c8cm3c0cm1cm2cm2cm4cm1c1cm12c0cm3cm2cm12c6cm24c15cm6c13cm2c4cm4cm4c23c1cm1cm11c2cm3c0cm22c11cm5cm10cm3cm9cm5cm3c0c1cm14 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0cm2c1cm4c4cm3cm3c0c8cm3cm3c4cm6cm4c1c13cm2cm2cm3c1cm3cm2cm3c4cm2cm1cm1c0cm1c9cm4cm1c0c1cm1c0cm1c3c4c4c8c3c2c8c1c0c6cm1c7cm4cm7cm2c0cm11cm10cm2cm6cm1cm3cm1cm4c0cm4c3 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv10_core3_rmcm;

architecture arch of conv10_core3_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM2C1CM7CM10CM6C4CM8C7CM4CM7C5C6CM10CM4C1CM1CM4CM7CM11CM2C0CM7CM2CM3CM1CM3C1CM3C13CM9C1CM7CM1CM3C0CM12C1C21CM5CM4C4CM2C5C10CM1C16CM2CM8C6C6CM7C1CM17CM22C2CM14CM3C2CM3CM8CM1CM4C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C3C3CM5CM12CM10CM14CM5CM23CM4CM2CM2C18CM3CM3CM8C3C6CM2C9C7C7C1CM24CM3C3CM1C2CM6CM16C12C4CM3CM4C2C2CM11C15C1CM10CM5CM19C2C9C41C1C11C0C0C11CM7C5C6CM14C1CM3CM5CM5CM3C0CM6CM6C5CM22_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C1CM4C16C2CM1C4C10CM3CM3CM8C5C26C3CM5CM2CM2CM6C3CM1CM1CM6CM10CM2C0CM2CM1C0C3C3CM1CM6C0C0C0C5CM11CM9CM1C8CM5C0C5C4CM1CM12CM2C9C0CM7C4CM1C10C16CM2CM2CM1CM3CM1CM5C1CM7C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8C6C3C1CM11CM10C24CM1CM20CM5C3CM10C5C0CM19CM15C5CM12CM5CM13C6CM1CM2C2CM3C1CM2C1CM5CM17C11C5CM4CM11C6C2CM7CM7CM31CM10CM20C36C1CM26CM16C1CM12C1CM19C1C26C37C3C18C4CM3CM10CM3CM4C2CM5CM8C2C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C16C27C31CM10CM13CM12CM14CM40C1C26CM1CM3CM46C18CM28C15C14C38C19C23C17C44C19C1C17CM3C14CM8CM36C17C10C45CM13C18C21C52C18C24C1CM8CM20CM43CM16CM37C20CM33C23C1C21CM2CM79C15C16CM26C36CM6CM1C44C35CM4CM15C35C36_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM1CM2CM6C29CM5CM7CM4CM9CM5CM3CM2CM9CM10C4CM4CM2C8CM8CM2CM2C2CM9C1CM1C0CM1CM1CM4CM8CM2C3CM11CM3CM2CM2CM14CM5C18C7C30CM19C0CM20CM3CM4C4C3C18C0CM20C30C0C11CM10CM3CM11CM3CM4CM4CM4CM2CM3CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM3CM1CM4CM6C0C5C2C8CM4CM5CM5CM2C32CM5C14CM3CM4CM4CM6CM3C0CM3C0CM2C0CM1C0CM2C2C2CM1CM5CM2C0C0C10CM7C4C2CM4C14C3C11C2CM1CM8CM4CM7CM2C9C11C1C10C13C1CM1CM2CM3CM3CM6C0CM6CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM2CM1CM10CM7CM6C4C0CM10CM4CM6CM2CM14CM1C3C34CM1CM1CM8C6C2CM5CM11C8CM3C0CM1CM2CM2CM4CM1C1CM12C0CM3CM2CM12C6CM24C15CM6C13CM2C4CM4CM4C23C1CM1CM11C2CM3C0CM22C11CM5CM10CM3CM9CM5CM3C0C1CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2C1CM4C4CM3CM3C0C8CM3CM3C4CM6CM4C1C13CM2CM2CM3C1CM3CM2CM3C4CM2CM1CM1C0CM1C9CM4CM1C0C1CM1C0CM1C3C4C4C8C3C2C8C1C0C6CM1C7CM4CM7CM2C0CM11CM10CM2CM6CM1CM3CM1CM4C0CM4C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(3, -4)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(4, -4)
    signal cm3cm2c1cm7cm10cm6c4cm8c7cm4cm7c5c6cm10cm4c1cm1cm4cm7cm11cm2c0cm7cm2cm3cm1cm3c1cm3c13cm9c1cm7cm1cm3c0cm12c1c21cm5cm4c4cm2c5c10cm1c16cm2cm8c6c6cm7c1cm17cm22c2cm14cm3c2cm3cm8cm1cm4c2_weight : PIPELINE_TYPE_FOR_CM3CM2C1CM7CM10CM6C4CM8C7CM4CM7C5C6CM10CM4C1CM1CM4CM7CM11CM2C0CM7CM2CM3CM1CM3C1CM3C13CM9C1CM7CM1CM3C0CM12C1C21CM5CM4C4CM2C5C10CM1C16CM2CM8C6C6CM7C1CM17CM22C2CM14CM3C2CM3CM8CM1CM4C2_WEIGHT;
    -- sfix(4, -4)
    signal cm7c3c3cm5cm12cm10cm14cm5cm23cm4cm2cm2c18cm3cm3cm8c3c6cm2c9c7c7c1cm24cm3c3cm1c2cm6cm16c12c4cm3cm4c2c2cm11c15c1cm10cm5cm19c2c9c41c1c11c0c0c11cm7c5c6cm14c1cm3cm5cm5cm3c0cm6cm6c5cm22_weight : PIPELINE_TYPE_FOR_CM7C3C3CM5CM12CM10CM14CM5CM23CM4CM2CM2C18CM3CM3CM8C3C6CM2C9C7C7C1CM24CM3C3CM1C2CM6CM16C12C4CM3CM4C2C2CM11C15C1CM10CM5CM19C2C9C41C1C11C0C0C11CM7C5C6CM14C1CM3CM5CM5CM3C0CM6CM6C5CM22_WEIGHT;
    -- sfix(4, -4)
    signal cm1cm1c1cm4c16c2cm1c4c10cm3cm3cm8c5c26c3cm5cm2cm2cm6c3cm1cm1cm6cm10cm2c0cm2cm1c0c3c3cm1cm6c0c0c0c5cm11cm9cm1c8cm5c0c5c4cm1cm12cm2c9c0cm7c4cm1c10c16cm2cm2cm1cm3cm1cm5c1cm7c0_weight : PIPELINE_TYPE_FOR_CM1CM1C1CM4C16C2CM1C4C10CM3CM3CM8C5C26C3CM5CM2CM2CM6C3CM1CM1CM6CM10CM2C0CM2CM1C0C3C3CM1CM6C0C0C0C5CM11CM9CM1C8CM5C0C5C4CM1CM12CM2C9C0CM7C4CM1C10C16CM2CM2CM1CM3CM1CM5C1CM7C0_WEIGHT;
    -- sfix(4, -4)
    signal cm8c6c3c1cm11cm10c24cm1cm20cm5c3cm10c5c0cm19cm15c5cm12cm5cm13c6cm1cm2c2cm3c1cm2c1cm5cm17c11c5cm4cm11c6c2cm7cm7cm31cm10cm20c36c1cm26cm16c1cm12c1cm19c1c26c37c3c18c4cm3cm10cm3cm4c2cm5cm8c2c3_weight : PIPELINE_TYPE_FOR_CM8C6C3C1CM11CM10C24CM1CM20CM5C3CM10C5C0CM19CM15C5CM12CM5CM13C6CM1CM2C2CM3C1CM2C1CM5CM17C11C5CM4CM11C6C2CM7CM7CM31CM10CM20C36C1CM26CM16C1CM12C1CM19C1C26C37C3C18C4CM3CM10CM3CM4C2CM5CM8C2C3_WEIGHT;
    -- sfix(4, -4)
    signal cm10c16c27c31cm10cm13cm12cm14cm40c1c26cm1cm3cm46c18cm28c15c14c38c19c23c17c44c19c1c17cm3c14cm8cm36c17c10c45cm13c18c21c52c18c24c1cm8cm20cm43cm16cm37c20cm33c23c1c21cm2cm79c15c16cm26c36cm6cm1c44c35cm4cm15c35c36_weight : PIPELINE_TYPE_FOR_CM10C16C27C31CM10CM13CM12CM14CM40C1C26CM1CM3CM46C18CM28C15C14C38C19C23C17C44C19C1C17CM3C14CM8CM36C17C10C45CM13C18C21C52C18C24C1CM8CM20CM43CM16CM37C20CM33C23C1C21CM2CM79C15C16CM26C36CM6CM1C44C35CM4CM15C35C36_WEIGHT;
    -- sfix(4, -4)
    signal cm6cm1cm2cm6c29cm5cm7cm4cm9cm5cm3cm2cm9cm10c4cm4cm2c8cm8cm2cm2c2cm9c1cm1c0cm1cm1cm4cm8cm2c3cm11cm3cm2cm2cm14cm5c18c7c30cm19c0cm20cm3cm4c4c3c18c0cm20c30c0c11cm10cm3cm11cm3cm4cm4cm4cm2cm3cm2_weight : PIPELINE_TYPE_FOR_CM6CM1CM2CM6C29CM5CM7CM4CM9CM5CM3CM2CM9CM10C4CM4CM2C8CM8CM2CM2C2CM9C1CM1C0CM1CM1CM4CM8CM2C3CM11CM3CM2CM2CM14CM5C18C7C30CM19C0CM20CM3CM4C4C3C18C0CM20C30C0C11CM10CM3CM11CM3CM4CM4CM4CM2CM3CM2_WEIGHT;
    -- sfix(4, -4)
    signal cm1cm3cm1cm4cm6c0c5c2c8cm4cm5cm5cm2c32cm5c14cm3cm4cm4cm6cm3c0cm3c0cm2c0cm1c0cm2c2c2cm1cm5cm2c0c0c10cm7c4c2cm4c14c3c11c2cm1cm8cm4cm7cm2c9c11c1c10c13c1cm1cm2cm3cm3cm6c0cm6cm5_weight : PIPELINE_TYPE_FOR_CM1CM3CM1CM4CM6C0C5C2C8CM4CM5CM5CM2C32CM5C14CM3CM4CM4CM6CM3C0CM3C0CM2C0CM1C0CM2C2C2CM1CM5CM2C0C0C10CM7C4C2CM4C14C3C11C2CM1CM8CM4CM7CM2C9C11C1C10C13C1CM1CM2CM3CM3CM6C0CM6CM5_WEIGHT;
    -- sfix(4, -4)
    signal cm5cm2cm1cm10cm7cm6c4c0cm10cm4cm6cm2cm14cm1c3c34cm1cm1cm8c6c2cm5cm11c8cm3c0cm1cm2cm2cm4cm1c1cm12c0cm3cm2cm12c6cm24c15cm6c13cm2c4cm4cm4c23c1cm1cm11c2cm3c0cm22c11cm5cm10cm3cm9cm5cm3c0c1cm14_weight : PIPELINE_TYPE_FOR_CM5CM2CM1CM10CM7CM6C4C0CM10CM4CM6CM2CM14CM1C3C34CM1CM1CM8C6C2CM5CM11C8CM3C0CM1CM2CM2CM4CM1C1CM12C0CM3CM2CM12C6CM24C15CM6C13CM2C4CM4CM4C23C1CM1CM11C2CM3C0CM22C11CM5CM10CM3CM9CM5CM3C0C1CM14_WEIGHT;
    -- sfix(4, -4)
    signal c0cm2c1cm4c4cm3cm3c0c8cm3cm3c4cm6cm4c1c13cm2cm2cm3c1cm3cm2cm3c4cm2cm1cm1c0cm1c9cm4cm1c0c1cm1c0cm1c3c4c4c8c3c2c8c1c0c6cm1c7cm4cm7cm2c0cm11cm10cm2cm6cm1cm3cm1cm4c0cm4c3_weight : PIPELINE_TYPE_FOR_C0CM2C1CM4C4CM3CM3C0C8CM3CM3C4CM6CM4C1C13CM2CM2CM3C1CM3CM2CM3C4CM2CM1CM1C0CM1C9CM4CM1C0C1CM1C0CM1C3C4C4C8C3C2C8C1C0C6CM1C7CM4CM7CM2C0CM11CM10CM2CM6CM1CM3CM1CM4C0CM4C3_WEIGHT;
    -- sfix(4, -4)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_cm5cm2cm1cm10cm7cm6c4c0cm10cm4cm6cm2cm14cm1c3c34cm1cm1cm8c6c2cm5cm11c8cm3c0cm1cm2cm2cm4cm1c1cm12c0cm3cm2cm12c6cm24c15cm6c13cm2c4cm4cm4c23c1cm1cm11c2cm3c0cm22c11cm5cm10cm3cm9cm5cm3c0c1cm14_undelayed : std_logic_vector(14-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv10_core3_rmcm_weightsconstant_memory
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
        
            dout1   => cm3cm2c1cm7cm10cm6c4cm8c7cm4cm7c5c6cm10cm4c1cm1cm4cm7cm11cm2c0cm7cm2cm3cm1cm3c1cm3c13cm9c1cm7cm1cm3c0cm12c1c21cm5cm4c4cm2c5c10cm1c16cm2cm8c6c6cm7c1cm17cm22c2cm14cm3c2cm3cm8cm1cm4c2_weight(0), 
            dout2   => cm7c3c3cm5cm12cm10cm14cm5cm23cm4cm2cm2c18cm3cm3cm8c3c6cm2c9c7c7c1cm24cm3c3cm1c2cm6cm16c12c4cm3cm4c2c2cm11c15c1cm10cm5cm19c2c9c41c1c11c0c0c11cm7c5c6cm14c1cm3cm5cm5cm3c0cm6cm6c5cm22_weight(0), 
            dout3   => cm1cm1c1cm4c16c2cm1c4c10cm3cm3cm8c5c26c3cm5cm2cm2cm6c3cm1cm1cm6cm10cm2c0cm2cm1c0c3c3cm1cm6c0c0c0c5cm11cm9cm1c8cm5c0c5c4cm1cm12cm2c9c0cm7c4cm1c10c16cm2cm2cm1cm3cm1cm5c1cm7c0_weight(0), 
            dout4   => cm8c6c3c1cm11cm10c24cm1cm20cm5c3cm10c5c0cm19cm15c5cm12cm5cm13c6cm1cm2c2cm3c1cm2c1cm5cm17c11c5cm4cm11c6c2cm7cm7cm31cm10cm20c36c1cm26cm16c1cm12c1cm19c1c26c37c3c18c4cm3cm10cm3cm4c2cm5cm8c2c3_weight(0), 
            dout5   => cm10c16c27c31cm10cm13cm12cm14cm40c1c26cm1cm3cm46c18cm28c15c14c38c19c23c17c44c19c1c17cm3c14cm8cm36c17c10c45cm13c18c21c52c18c24c1cm8cm20cm43cm16cm37c20cm33c23c1c21cm2cm79c15c16cm26c36cm6cm1c44c35cm4cm15c35c36_weight(0), 
            dout6   => cm6cm1cm2cm6c29cm5cm7cm4cm9cm5cm3cm2cm9cm10c4cm4cm2c8cm8cm2cm2c2cm9c1cm1c0cm1cm1cm4cm8cm2c3cm11cm3cm2cm2cm14cm5c18c7c30cm19c0cm20cm3cm4c4c3c18c0cm20c30c0c11cm10cm3cm11cm3cm4cm4cm4cm2cm3cm2_weight(0), 
            dout7   => cm1cm3cm1cm4cm6c0c5c2c8cm4cm5cm5cm2c32cm5c14cm3cm4cm4cm6cm3c0cm3c0cm2c0cm1c0cm2c2c2cm1cm5cm2c0c0c10cm7c4c2cm4c14c3c11c2cm1cm8cm4cm7cm2c9c11c1c10c13c1cm1cm2cm3cm3cm6c0cm6cm5_weight(0), 
            dout8   => cm5cm2cm1cm10cm7cm6c4c0cm10cm4cm6cm2cm14cm1c3c34cm1cm1cm8c6c2cm5cm11c8cm3c0cm1cm2cm2cm4cm1c1cm12c0cm3cm2cm12c6cm24c15cm6c13cm2c4cm4cm4c23c1cm1cm11c2cm3c0cm22c11cm5cm10cm3cm9cm5cm3c0c1cm14_weight(0), 
            dout9   => c0cm2c1cm4c4cm3cm3c0c8cm3cm3c4cm6cm4c1c13cm2cm2cm3c1cm3cm2cm3c4cm2cm1cm1c0cm1c9cm4cm1c0c1cm1c0cm1c3c4c4c8c3c2c8c1c0c6cm1c7cm4cm7cm2c0cm11cm10cm2cm6cm1cm3cm1cm4c0cm4c3_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm3cm2c1cm7cm10cm6c4cm8c7cm4cm7c5c6cm10cm4c1cm1cm4cm7cm11cm2c0cm7cm2cm3cm1cm3c1cm3c13cm9c1cm7cm1cm3c0cm12c1c21cm5cm4c4cm2c5c10cm1c16cm2cm8c6c6cm7c1cm17cm22c2cm14cm3c2cm3cm8cm1cm4c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm2c1cm7cm10cm6c4cm8c7cm4cm7c5c6cm10cm4c1cm1cm4cm7cm11cm2c0cm7cm2cm3cm1cm3c1cm3c13cm9c1cm7cm1cm3c0cm12c1c21cm5cm4c4cm2c5c10cm1c16cm2cm8c6c6cm7c1cm17cm22c2cm14cm3c2cm3cm8cm1cm4c2_weight(0), cm3cm2c1cm7cm10cm6c4cm8c7cm4cm7c5c6cm10cm4c1cm1cm4cm7cm11cm2c0cm7cm2cm3cm1cm3c1cm3c13cm9c1cm7cm1cm3c0cm12c1c21cm5cm4c4cm2c5c10cm1c16cm2cm8c6c6cm7c1cm17cm22c2cm14cm3c2cm3cm8cm1cm4c2_weight(1));
    PL_STEP_0_for_cm7c3c3cm5cm12cm10cm14cm5cm23cm4cm2cm2c18cm3cm3cm8c3c6cm2c9c7c7c1cm24cm3c3cm1c2cm6cm16c12c4cm3cm4c2c2cm11c15c1cm10cm5cm19c2c9c41c1c11c0c0c11cm7c5c6cm14c1cm3cm5cm5cm3c0cm6cm6c5cm22_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c3c3cm5cm12cm10cm14cm5cm23cm4cm2cm2c18cm3cm3cm8c3c6cm2c9c7c7c1cm24cm3c3cm1c2cm6cm16c12c4cm3cm4c2c2cm11c15c1cm10cm5cm19c2c9c41c1c11c0c0c11cm7c5c6cm14c1cm3cm5cm5cm3c0cm6cm6c5cm22_weight(0), cm7c3c3cm5cm12cm10cm14cm5cm23cm4cm2cm2c18cm3cm3cm8c3c6cm2c9c7c7c1cm24cm3c3cm1c2cm6cm16c12c4cm3cm4c2c2cm11c15c1cm10cm5cm19c2c9c41c1c11c0c0c11cm7c5c6cm14c1cm3cm5cm5cm3c0cm6cm6c5cm22_weight(1));
    PL_STEP_0_for_cm1cm1c1cm4c16c2cm1c4c10cm3cm3cm8c5c26c3cm5cm2cm2cm6c3cm1cm1cm6cm10cm2c0cm2cm1c0c3c3cm1cm6c0c0c0c5cm11cm9cm1c8cm5c0c5c4cm1cm12cm2c9c0cm7c4cm1c10c16cm2cm2cm1cm3cm1cm5c1cm7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c1cm4c16c2cm1c4c10cm3cm3cm8c5c26c3cm5cm2cm2cm6c3cm1cm1cm6cm10cm2c0cm2cm1c0c3c3cm1cm6c0c0c0c5cm11cm9cm1c8cm5c0c5c4cm1cm12cm2c9c0cm7c4cm1c10c16cm2cm2cm1cm3cm1cm5c1cm7c0_weight(0), cm1cm1c1cm4c16c2cm1c4c10cm3cm3cm8c5c26c3cm5cm2cm2cm6c3cm1cm1cm6cm10cm2c0cm2cm1c0c3c3cm1cm6c0c0c0c5cm11cm9cm1c8cm5c0c5c4cm1cm12cm2c9c0cm7c4cm1c10c16cm2cm2cm1cm3cm1cm5c1cm7c0_weight(1));
    PL_STEP_0_for_cm8c6c3c1cm11cm10c24cm1cm20cm5c3cm10c5c0cm19cm15c5cm12cm5cm13c6cm1cm2c2cm3c1cm2c1cm5cm17c11c5cm4cm11c6c2cm7cm7cm31cm10cm20c36c1cm26cm16c1cm12c1cm19c1c26c37c3c18c4cm3cm10cm3cm4c2cm5cm8c2c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8c6c3c1cm11cm10c24cm1cm20cm5c3cm10c5c0cm19cm15c5cm12cm5cm13c6cm1cm2c2cm3c1cm2c1cm5cm17c11c5cm4cm11c6c2cm7cm7cm31cm10cm20c36c1cm26cm16c1cm12c1cm19c1c26c37c3c18c4cm3cm10cm3cm4c2cm5cm8c2c3_weight(0), cm8c6c3c1cm11cm10c24cm1cm20cm5c3cm10c5c0cm19cm15c5cm12cm5cm13c6cm1cm2c2cm3c1cm2c1cm5cm17c11c5cm4cm11c6c2cm7cm7cm31cm10cm20c36c1cm26cm16c1cm12c1cm19c1c26c37c3c18c4cm3cm10cm3cm4c2cm5cm8c2c3_weight(1));
    PL_STEP_0_for_cm10c16c27c31cm10cm13cm12cm14cm40c1c26cm1cm3cm46c18cm28c15c14c38c19c23c17c44c19c1c17cm3c14cm8cm36c17c10c45cm13c18c21c52c18c24c1cm8cm20cm43cm16cm37c20cm33c23c1c21cm2cm79c15c16cm26c36cm6cm1c44c35cm4cm15c35c36_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c16c27c31cm10cm13cm12cm14cm40c1c26cm1cm3cm46c18cm28c15c14c38c19c23c17c44c19c1c17cm3c14cm8cm36c17c10c45cm13c18c21c52c18c24c1cm8cm20cm43cm16cm37c20cm33c23c1c21cm2cm79c15c16cm26c36cm6cm1c44c35cm4cm15c35c36_weight(0), cm10c16c27c31cm10cm13cm12cm14cm40c1c26cm1cm3cm46c18cm28c15c14c38c19c23c17c44c19c1c17cm3c14cm8cm36c17c10c45cm13c18c21c52c18c24c1cm8cm20cm43cm16cm37c20cm33c23c1c21cm2cm79c15c16cm26c36cm6cm1c44c35cm4cm15c35c36_weight(1));
    PL_STEP_0_for_cm6cm1cm2cm6c29cm5cm7cm4cm9cm5cm3cm2cm9cm10c4cm4cm2c8cm8cm2cm2c2cm9c1cm1c0cm1cm1cm4cm8cm2c3cm11cm3cm2cm2cm14cm5c18c7c30cm19c0cm20cm3cm4c4c3c18c0cm20c30c0c11cm10cm3cm11cm3cm4cm4cm4cm2cm3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm1cm2cm6c29cm5cm7cm4cm9cm5cm3cm2cm9cm10c4cm4cm2c8cm8cm2cm2c2cm9c1cm1c0cm1cm1cm4cm8cm2c3cm11cm3cm2cm2cm14cm5c18c7c30cm19c0cm20cm3cm4c4c3c18c0cm20c30c0c11cm10cm3cm11cm3cm4cm4cm4cm2cm3cm2_weight(0), cm6cm1cm2cm6c29cm5cm7cm4cm9cm5cm3cm2cm9cm10c4cm4cm2c8cm8cm2cm2c2cm9c1cm1c0cm1cm1cm4cm8cm2c3cm11cm3cm2cm2cm14cm5c18c7c30cm19c0cm20cm3cm4c4c3c18c0cm20c30c0c11cm10cm3cm11cm3cm4cm4cm4cm2cm3cm2_weight(1));
    PL_STEP_0_for_cm1cm3cm1cm4cm6c0c5c2c8cm4cm5cm5cm2c32cm5c14cm3cm4cm4cm6cm3c0cm3c0cm2c0cm1c0cm2c2c2cm1cm5cm2c0c0c10cm7c4c2cm4c14c3c11c2cm1cm8cm4cm7cm2c9c11c1c10c13c1cm1cm2cm3cm3cm6c0cm6cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm3cm1cm4cm6c0c5c2c8cm4cm5cm5cm2c32cm5c14cm3cm4cm4cm6cm3c0cm3c0cm2c0cm1c0cm2c2c2cm1cm5cm2c0c0c10cm7c4c2cm4c14c3c11c2cm1cm8cm4cm7cm2c9c11c1c10c13c1cm1cm2cm3cm3cm6c0cm6cm5_weight(0), cm1cm3cm1cm4cm6c0c5c2c8cm4cm5cm5cm2c32cm5c14cm3cm4cm4cm6cm3c0cm3c0cm2c0cm1c0cm2c2c2cm1cm5cm2c0c0c10cm7c4c2cm4c14c3c11c2cm1cm8cm4cm7cm2c9c11c1c10c13c1cm1cm2cm3cm3cm6c0cm6cm5_weight(1));
    PL_STEP_0_for_cm5cm2cm1cm10cm7cm6c4c0cm10cm4cm6cm2cm14cm1c3c34cm1cm1cm8c6c2cm5cm11c8cm3c0cm1cm2cm2cm4cm1c1cm12c0cm3cm2cm12c6cm24c15cm6c13cm2c4cm4cm4c23c1cm1cm11c2cm3c0cm22c11cm5cm10cm3cm9cm5cm3c0c1cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm2cm1cm10cm7cm6c4c0cm10cm4cm6cm2cm14cm1c3c34cm1cm1cm8c6c2cm5cm11c8cm3c0cm1cm2cm2cm4cm1c1cm12c0cm3cm2cm12c6cm24c15cm6c13cm2c4cm4cm4c23c1cm1cm11c2cm3c0cm22c11cm5cm10cm3cm9cm5cm3c0c1cm14_weight(0), cm5cm2cm1cm10cm7cm6c4c0cm10cm4cm6cm2cm14cm1c3c34cm1cm1cm8c6c2cm5cm11c8cm3c0cm1cm2cm2cm4cm1c1cm12c0cm3cm2cm12c6cm24c15cm6c13cm2c4cm4cm4c23c1cm1cm11c2cm3c0cm22c11cm5cm10cm3cm9cm5cm3c0c1cm14_weight(1));
    PL_STEP_0_for_c0cm2c1cm4c4cm3cm3c0c8cm3cm3c4cm6cm4c1c13cm2cm2cm3c1cm3cm2cm3c4cm2cm1cm1c0cm1c9cm4cm1c0c1cm1c0cm1c3c4c4c8c3c2c8c1c0c6cm1c7cm4cm7cm2c0cm11cm10cm2cm6cm1cm3cm1cm4c0cm4c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2c1cm4c4cm3cm3c0c8cm3cm3c4cm6cm4c1c13cm2cm2cm3c1cm3cm2cm3c4cm2cm1cm1c0cm1c9cm4cm1c0c1cm1c0cm1c3c4c4c8c3c2c8c1c0c6cm1c7cm4cm7cm2c0cm11cm10cm2cm6cm1cm3cm1cm4c0cm4c3_weight(0), c0cm2c1cm4c4cm3cm3c0c8cm3cm3c4cm6cm4c1c13cm2cm2cm3c1cm3cm2cm3c4cm2cm1cm1c0cm1c9cm4cm1c0c1cm1c0cm1c3c4c4c8c3c2c8c1c0c6cm1c7cm4cm7cm2c0cm11cm10cm2cm6cm1cm3cm1cm4c0cm4c3_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm10c16c27c31cm10cm13cm12cm14cm40c1c26cm1cm3cm46c18cm28c15c14c38c19c23c17c44c19c1c17cm3c14cm8cm36c17c10c45cm13c18c21c52c18c24c1cm8cm20cm43cm16cm37c20cm33c23c1c21cm2cm79c15c16cm26c36cm6cm1c44c35cm4cm15c35c36_c0cm2c1cm4c4cm3cm3c0c8cm3cm3c4cm6cm4c1c13cm2cm2cm3c1cm3cm2cm3c4cm2cm1cm1c0cm1c9cm4cm1c0c1cm1c0cm1c3c4c4c8c3c2c8c1c0c6cm1c7cm4cm7cm2c0cm11cm10cm2cm6cm1cm3cm1cm4c0cm4c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm10c16c27c31cm10cm13cm12cm14cm40c1c26cm1cm3cm46c18cm28c15c14c38c19c23c17c44c19c1c17cm3c14cm8cm36c17c10c45cm13c18c21c52c18c24c1cm8cm20cm43cm16cm37c20cm33c23c1c21cm2cm79c15c16cm26c36cm6cm1c44c35cm4cm15c35c36_weight(1)(8-1 downto 0),
			B	=> c0cm2c1cm4c4cm3cm3c0c8cm3cm3c4cm6cm4c1c13cm2cm2cm3c1cm3cm2cm3c4cm2cm1cm1c0cm1c9cm4cm1c0c1cm1c0cm1c3c4c4c8c3c2c8c1c0c6cm1c7cm4cm7cm2c0cm11cm10cm2cm6cm1cm3cm1cm4c0cm4c3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10c16c27c31cm10cm13cm12cm14cm40c1c26cm1cm3cm46c18cm28c15c14c38c19c23c17c44c19c1c17cm3c14cm8cm36c17c10c45cm13c18c21c52c18c24c1cm8cm20cm43cm16cm37c20cm33c23c1c21cm2cm79c15c16cm26c36cm6cm1c44c35cm4cm15c35c36,
			CxB => R_c0cm2c1cm4c4cm3cm3c0c8cm3cm3c4cm6cm4c1c13cm2cm2cm3c1cm3cm2cm3c4cm2cm1cm1c0cm1c9cm4cm1c0c1cm1c0cm1c3c4c4c8c3c2c8c1c0c6cm1c7cm4cm7cm2c0cm11cm10cm2cm6cm1cm3cm1cm4c0cm4c3
		);

    cm7c3c3cm5cm12cm10cm14cm5cm23cm4cm2cm2c18cm3cm3cm8c3c6cm2c9c7c7c1cm24cm3c3cm1c2cm6cm16c12c4cm3cm4c2c2cm11c15c1cm10cm5cm19c2c9c41c1c11c0c0c11cm7c5c6cm14c1cm3cm5cm5cm3c0cm6cm6c5cm22_cm6cm1cm2cm6c29cm5cm7cm4cm9cm5cm3cm2cm9cm10c4cm4cm2c8cm8cm2cm2c2cm9c1cm1c0cm1cm1cm4cm8cm2c3cm11cm3cm2cm2cm14cm5c18c7c30cm19c0cm20cm3cm4c4c3c18c0cm20c30c0c11cm10cm3cm11cm3cm4cm4cm4cm2cm3cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm7c3c3cm5cm12cm10cm14cm5cm23cm4cm2cm2c18cm3cm3cm8c3c6cm2c9c7c7c1cm24cm3c3cm1c2cm6cm16c12c4cm3cm4c2c2cm11c15c1cm10cm5cm19c2c9c41c1c11c0c0c11cm7c5c6cm14c1cm3cm5cm5cm3c0cm6cm6c5cm22_weight(1)(7-1 downto 0),
			B	=> cm6cm1cm2cm6c29cm5cm7cm4cm9cm5cm3cm2cm9cm10c4cm4cm2c8cm8cm2cm2c2cm9c1cm1c0cm1cm1cm4cm8cm2c3cm11cm3cm2cm2cm14cm5c18c7c30cm19c0cm20cm3cm4c4c3c18c0cm20c30c0c11cm10cm3cm11cm3cm4cm4cm4cm2cm3cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7c3c3cm5cm12cm10cm14cm5cm23cm4cm2cm2c18cm3cm3cm8c3c6cm2c9c7c7c1cm24cm3c3cm1c2cm6cm16c12c4cm3cm4c2c2cm11c15c1cm10cm5cm19c2c9c41c1c11c0c0c11cm7c5c6cm14c1cm3cm5cm5cm3c0cm6cm6c5cm22,
			CxB => R_cm6cm1cm2cm6c29cm5cm7cm4cm9cm5cm3cm2cm9cm10c4cm4cm2c8cm8cm2cm2c2cm9c1cm1c0cm1cm1cm4cm8cm2c3cm11cm3cm2cm2cm14cm5c18c7c30cm19c0cm20cm3cm4c4c3c18c0cm20c30c0c11cm10cm3cm11cm3cm4cm4cm4cm2cm3cm2
		);

    cm8c6c3c1cm11cm10c24cm1cm20cm5c3cm10c5c0cm19cm15c5cm12cm5cm13c6cm1cm2c2cm3c1cm2c1cm5cm17c11c5cm4cm11c6c2cm7cm7cm31cm10cm20c36c1cm26cm16c1cm12c1cm19c1c26c37c3c18c4cm3cm10cm3cm4c2cm5cm8c2c3_cm1cm1c1cm4c16c2cm1c4c10cm3cm3cm8c5c26c3cm5cm2cm2cm6c3cm1cm1cm6cm10cm2c0cm2cm1c0c3c3cm1cm6c0c0c0c5cm11cm9cm1c8cm5c0c5c4cm1cm12cm2c9c0cm7c4cm1c10c16cm2cm2cm1cm3cm1cm5c1cm7c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm8c6c3c1cm11cm10c24cm1cm20cm5c3cm10c5c0cm19cm15c5cm12cm5cm13c6cm1cm2c2cm3c1cm2c1cm5cm17c11c5cm4cm11c6c2cm7cm7cm31cm10cm20c36c1cm26cm16c1cm12c1cm19c1c26c37c3c18c4cm3cm10cm3cm4c2cm5cm8c2c3_weight(1)(7-1 downto 0),
			B	=> cm1cm1c1cm4c16c2cm1c4c10cm3cm3cm8c5c26c3cm5cm2cm2cm6c3cm1cm1cm6cm10cm2c0cm2cm1c0c3c3cm1cm6c0c0c0c5cm11cm9cm1c8cm5c0c5c4cm1cm12cm2c9c0cm7c4cm1c10c16cm2cm2cm1cm3cm1cm5c1cm7c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm8c6c3c1cm11cm10c24cm1cm20cm5c3cm10c5c0cm19cm15c5cm12cm5cm13c6cm1cm2c2cm3c1cm2c1cm5cm17c11c5cm4cm11c6c2cm7cm7cm31cm10cm20c36c1cm26cm16c1cm12c1cm19c1c26c37c3c18c4cm3cm10cm3cm4c2cm5cm8c2c3,
			CxB => R_cm1cm1c1cm4c16c2cm1c4c10cm3cm3cm8c5c26c3cm5cm2cm2cm6c3cm1cm1cm6cm10cm2c0cm2cm1c0c3c3cm1cm6c0c0c0c5cm11cm9cm1c8cm5c0c5c4cm1cm12cm2c9c0cm7c4cm1c10c16cm2cm2cm1cm3cm1cm5c1cm7c0
		);

    cm1cm3cm1cm4cm6c0c5c2c8cm4cm5cm5cm2c32cm5c14cm3cm4cm4cm6cm3c0cm3c0cm2c0cm1c0cm2c2c2cm1cm5cm2c0c0c10cm7c4c2cm4c14c3c11c2cm1cm8cm4cm7cm2c9c11c1c10c13c1cm1cm2cm3cm3cm6c0cm6cm5_cm3cm2c1cm7cm10cm6c4cm8c7cm4cm7c5c6cm10cm4c1cm1cm4cm7cm11cm2c0cm7cm2cm3cm1cm3c1cm3c13cm9c1cm7cm1cm3c0cm12c1c21cm5cm4c4cm2c5c10cm1c16cm2cm8c6c6cm7c1cm17cm22c2cm14cm3c2cm3cm8cm1cm4c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm3cm1cm4cm6c0c5c2c8cm4cm5cm5cm2c32cm5c14cm3cm4cm4cm6cm3c0cm3c0cm2c0cm1c0cm2c2c2cm1cm5cm2c0c0c10cm7c4c2cm4c14c3c11c2cm1cm8cm4cm7cm2c9c11c1c10c13c1cm1cm2cm3cm3cm6c0cm6cm5_weight(1)(7-1 downto 0),
			B	=> cm3cm2c1cm7cm10cm6c4cm8c7cm4cm7c5c6cm10cm4c1cm1cm4cm7cm11cm2c0cm7cm2cm3cm1cm3c1cm3c13cm9c1cm7cm1cm3c0cm12c1c21cm5cm4c4cm2c5c10cm1c16cm2cm8c6c6cm7c1cm17cm22c2cm14cm3c2cm3cm8cm1cm4c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm3cm1cm4cm6c0c5c2c8cm4cm5cm5cm2c32cm5c14cm3cm4cm4cm6cm3c0cm3c0cm2c0cm1c0cm2c2c2cm1cm5cm2c0c0c10cm7c4c2cm4c14c3c11c2cm1cm8cm4cm7cm2c9c11c1c10c13c1cm1cm2cm3cm3cm6c0cm6cm5,
			CxB => R_cm3cm2c1cm7cm10cm6c4cm8c7cm4cm7c5c6cm10cm4c1cm1cm4cm7cm11cm2c0cm7cm2cm3cm1cm3c1cm3c13cm9c1cm7cm1cm3c0cm12c1c21cm5cm4c4cm2c5c10cm1c16cm2cm8c6c6cm7c1cm17cm22c2cm14cm3c2cm3cm8cm1cm4c2
		);




    cm5cm2cm1cm10cm7cm6c4c0cm10cm4cm6cm2cm14cm1c3c34cm1cm1cm8c6c2cm5cm11c8cm3c0cm1cm2cm2cm4cm1c1cm12c0cm3cm2cm12c6cm24c15cm6c13cm2c4cm4cm4c23c1cm1cm11c2cm3c0cm22c11cm5cm10cm3cm9cm5cm3c0c1cm14_MULT: entity work.TruncatedSingleMult
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
			A	=> cm5cm2cm1cm10cm7cm6c4c0cm10cm4cm6cm2cm14cm1c3c34cm1cm1cm8c6c2cm5cm11c8cm3c0cm1cm2cm2cm4cm1c1cm12c0cm3cm2cm12c6cm24c15cm6c13cm2c4cm4cm4c23c1cm1cm11c2cm3c0cm22c11cm5cm10cm3cm9cm5cm3c0c1cm14_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_cm5cm2cm1cm10cm7cm6c4c0cm10cm4cm6cm2cm14cm1c3c34cm1cm1cm8c6c2cm5cm11c8cm3c0cm1cm2cm2cm4cm1c1cm12c0cm3cm2cm12c6cm24c15cm6c13cm2c4cm4cm4c23c1cm1cm11c2cm3c0cm22c11cm5cm10cm3cm9cm5cm3c0c1cm14
		);

end architecture;
