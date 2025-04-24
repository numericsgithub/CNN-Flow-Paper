library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core2_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c17c4cm7c6cm13c1cm21c1c12cm5c8cm2cm2cm3cm2c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm16c3c1c26c17c10c8cm6c11c7c4c0c32c0cm38c6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6c0c25c5c5c1cm3c1c12c5cm7c1c80c3cm9cm2 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c22c7cm33cm7c6c6cm43c19cm5c27cm24cm3cm3c2c11c11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2c4c6c7cm61c2c9c50c1c5cm21cm1c0c7cm10cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm9cm4c15c2c7c0cm41cm6c0cm1c3cm7cm19cm4cm3cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c9cm22c1cm7c0cm9c0c21cm17cm4cm3c3c10c1c1cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c7c16cm6c3c30c2c9c39c5cm3cm5c0cm3c5c7c5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c29c22cm16cm3cm5c31c1c4c3cm36c12c8c2c1c6c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2cm6cm1c46cm3c1c2c1c3c2c4cm6cm4c3cm2c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c21c0c2c4c28cm11cm2cm1c6cm13c9c1cm2c5cm2c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c5c0c9c0cm6cm1cm11cm2cm14cm1cm6c7c0c8c4c0 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm18c1c2c9cm24c34cm4c3c12cm10c13c6c1cm7c29c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c7c0c0c0cm29c7c6cm1c10c13c1cm2cm7cm2c0cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm33cm1c4c4c7c12cm7c2c4cm2cm9c0c6c6cm7c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2c12c3cm4c3c0c0c49cm12c6c7cm9c7c5cm5cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c8c17cm6c10cm40cm10c2c3c2cm2c2c19c10c2c1cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3cm1c0cm4c10c1c3c1c30c4cm18c0cm2cm1c6c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm5cm29cm3c8cm1c13c6c16c12cm18c11cm22c3c1cm8cm52 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c8c17c14c7cm7cm21c2cm9cm9c14c0c10c11cm1c3cm17 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm3c15c0c24c2cm25c2cm1c0cm4c5c4c10cm2c1c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2c28c1c5c20c0c13cm6c3c4cm5c22cm9cm5c13cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c28cm10cm2cm1cm29cm10cm5cm6c5c6c4cm3c0cm40cm4c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c18cm18c12cm2cm1c2cm4c0cm4c13c12c4cm2c2cm4c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c22c2c15c25c22cm3cm2cm9cm7c7c7cm3cm2cm8c0c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c20cm6cm4c0c5cm23c8c2c7cm16c6cm2c3cm3c8c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6c1c7cm10cm9cm3c2cm13c15cm2c2cm1c9cm43cm23c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c5c2c11c14cm4cm20c14c5cm16c10c0c0cm6cm4c1c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6cm1cm4c1cm59c35c1cm1c23cm3cm10c1c1cm2c7c3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm9c16c11cm7c14c10cm6c0c11c9c8cm2c0cm1c1cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm7c16c7c24c9c1c5c10cm3cm2c7cm5c58cm3c2c19 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c12cm19c0cm31c6c4c27cm18c8c17cm36c11cm4c0c7c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core2_rmcm;

architecture arch of conv7_core2_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C17C4CM7C6CM13C1CM21C1C12CM5C8CM2CM2CM3CM2C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM16C3C1C26C17C10C8CM6C11C7C4C0C32C0CM38C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C0C25C5C5C1CM3C1C12C5CM7C1C80C3CM9CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C22C7CM33CM7C6C6CM43C19CM5C27CM24CM3CM3C2C11C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C4C6C7CM61C2C9C50C1C5CM21CM1C0C7CM10CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9CM4C15C2C7C0CM41CM6C0CM1C3CM7CM19CM4CM3CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9CM22C1CM7C0CM9C0C21CM17CM4CM3C3C10C1C1CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C16CM6C3C30C2C9C39C5CM3CM5C0CM3C5C7C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C29C22CM16CM3CM5C31C1C4C3CM36C12C8C2C1C6C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM6CM1C46CM3C1C2C1C3C2C4CM6CM4C3CM2C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C21C0C2C4C28CM11CM2CM1C6CM13C9C1CM2C5CM2C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C0C9C0CM6CM1CM11CM2CM14CM1CM6C7C0C8C4C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM18C1C2C9CM24C34CM4C3C12CM10C13C6C1CM7C29C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C0C0C0CM29C7C6CM1C10C13C1CM2CM7CM2C0CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM33CM1C4C4C7C12CM7C2C4CM2CM9C0C6C6CM7C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C12C3CM4C3C0C0C49CM12C6C7CM9C7C5CM5CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C17CM6C10CM40CM10C2C3C2CM2C2C19C10C2C1CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM1C0CM4C10C1C3C1C30C4CM18C0CM2CM1C6C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM29CM3C8CM1C13C6C16C12CM18C11CM22C3C1CM8CM52_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C17C14C7CM7CM21C2CM9CM9C14C0C10C11CM1C3CM17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C15C0C24C2CM25C2CM1C0CM4C5C4C10CM2C1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C28C1C5C20C0C13CM6C3C4CM5C22CM9CM5C13CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C28CM10CM2CM1CM29CM10CM5CM6C5C6C4CM3C0CM40CM4C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C18CM18C12CM2CM1C2CM4C0CM4C13C12C4CM2C2CM4C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C22C2C15C25C22CM3CM2CM9CM7C7C7CM3CM2CM8C0C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C20CM6CM4C0C5CM23C8C2C7CM16C6CM2C3CM3C8C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C1C7CM10CM9CM3C2CM13C15CM2C2CM1C9CM43CM23C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C2C11C14CM4CM20C14C5CM16C10C0C0CM6CM4C1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM1CM4C1CM59C35C1CM1C23CM3CM10C1C1CM2C7C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C16C11CM7C14C10CM6C0C11C9C8CM2C0CM1C1CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C16C7C24C9C1C5C10CM3CM2C7CM5C58CM3C2C19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12CM19C0CM31C6C4C27CM18C8C17CM36C11CM4C0C7C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c17c4cm7c6cm13c1cm21c1c12cm5c8cm2cm2cm3cm2c3_weight : PIPELINE_TYPE_FOR_C17C4CM7C6CM13C1CM21C1C12CM5C8CM2CM2CM3CM2C3_WEIGHT;
    -- sfix(1, -7)
    signal cm16c3c1c26c17c10c8cm6c11c7c4c0c32c0cm38c6_weight : PIPELINE_TYPE_FOR_CM16C3C1C26C17C10C8CM6C11C7C4C0C32C0CM38C6_WEIGHT;
    -- sfix(1, -7)
    signal cm6c0c25c5c5c1cm3c1c12c5cm7c1c80c3cm9cm2_weight : PIPELINE_TYPE_FOR_CM6C0C25C5C5C1CM3C1C12C5CM7C1C80C3CM9CM2_WEIGHT;
    -- sfix(1, -7)
    signal c22c7cm33cm7c6c6cm43c19cm5c27cm24cm3cm3c2c11c11_weight : PIPELINE_TYPE_FOR_C22C7CM33CM7C6C6CM43C19CM5C27CM24CM3CM3C2C11C11_WEIGHT;
    -- sfix(1, -7)
    signal c2c4c6c7cm61c2c9c50c1c5cm21cm1c0c7cm10cm1_weight : PIPELINE_TYPE_FOR_C2C4C6C7CM61C2C9C50C1C5CM21CM1C0C7CM10CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm9cm4c15c2c7c0cm41cm6c0cm1c3cm7cm19cm4cm3cm2_weight : PIPELINE_TYPE_FOR_CM9CM4C15C2C7C0CM41CM6C0CM1C3CM7CM19CM4CM3CM2_WEIGHT;
    -- sfix(1, -7)
    signal c9cm22c1cm7c0cm9c0c21cm17cm4cm3c3c10c1c1cm3_weight : PIPELINE_TYPE_FOR_C9CM22C1CM7C0CM9C0C21CM17CM4CM3C3C10C1C1CM3_WEIGHT;
    -- sfix(1, -7)
    signal c7c16cm6c3c30c2c9c39c5cm3cm5c0cm3c5c7c5_weight : PIPELINE_TYPE_FOR_C7C16CM6C3C30C2C9C39C5CM3CM5C0CM3C5C7C5_WEIGHT;
    -- sfix(1, -7)
    signal c29c22cm16cm3cm5c31c1c4c3cm36c12c8c2c1c6c1_weight : PIPELINE_TYPE_FOR_C29C22CM16CM3CM5C31C1C4C3CM36C12C8C2C1C6C1_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm6cm1c46cm3c1c2c1c3c2c4cm6cm4c3cm2c0_weight : PIPELINE_TYPE_FOR_CM2CM6CM1C46CM3C1C2C1C3C2C4CM6CM4C3CM2C0_WEIGHT;
    -- sfix(1, -7)
    signal c21c0c2c4c28cm11cm2cm1c6cm13c9c1cm2c5cm2c1_weight : PIPELINE_TYPE_FOR_C21C0C2C4C28CM11CM2CM1C6CM13C9C1CM2C5CM2C1_WEIGHT;
    -- sfix(1, -7)
    signal c5c0c9c0cm6cm1cm11cm2cm14cm1cm6c7c0c8c4c0_weight : PIPELINE_TYPE_FOR_C5C0C9C0CM6CM1CM11CM2CM14CM1CM6C7C0C8C4C0_WEIGHT;
    -- sfix(1, -7)
    signal cm18c1c2c9cm24c34cm4c3c12cm10c13c6c1cm7c29c2_weight : PIPELINE_TYPE_FOR_CM18C1C2C9CM24C34CM4C3C12CM10C13C6C1CM7C29C2_WEIGHT;
    -- sfix(1, -7)
    signal c7c0c0c0cm29c7c6cm1c10c13c1cm2cm7cm2c0cm1_weight : PIPELINE_TYPE_FOR_C7C0C0C0CM29C7C6CM1C10C13C1CM2CM7CM2C0CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm33cm1c4c4c7c12cm7c2c4cm2cm9c0c6c6cm7c1_weight : PIPELINE_TYPE_FOR_CM33CM1C4C4C7C12CM7C2C4CM2CM9C0C6C6CM7C1_WEIGHT;
    -- sfix(1, -7)
    signal cm2c12c3cm4c3c0c0c49cm12c6c7cm9c7c5cm5cm2_weight : PIPELINE_TYPE_FOR_CM2C12C3CM4C3C0C0C49CM12C6C7CM9C7C5CM5CM2_WEIGHT;
    -- sfix(1, -7)
    signal c8c17cm6c10cm40cm10c2c3c2cm2c2c19c10c2c1cm2_weight : PIPELINE_TYPE_FOR_C8C17CM6C10CM40CM10C2C3C2CM2C2C19C10C2C1CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm1c0cm4c10c1c3c1c30c4cm18c0cm2cm1c6c3_weight : PIPELINE_TYPE_FOR_CM3CM1C0CM4C10C1C3C1C30C4CM18C0CM2CM1C6C3_WEIGHT;
    -- sfix(1, -7)
    signal cm5cm29cm3c8cm1c13c6c16c12cm18c11cm22c3c1cm8cm52_weight : PIPELINE_TYPE_FOR_CM5CM29CM3C8CM1C13C6C16C12CM18C11CM22C3C1CM8CM52_WEIGHT;
    -- sfix(1, -7)
    signal c8c17c14c7cm7cm21c2cm9cm9c14c0c10c11cm1c3cm17_weight : PIPELINE_TYPE_FOR_C8C17C14C7CM7CM21C2CM9CM9C14C0C10C11CM1C3CM17_WEIGHT;
    -- sfix(1, -7)
    signal cm3c15c0c24c2cm25c2cm1c0cm4c5c4c10cm2c1c2_weight : PIPELINE_TYPE_FOR_CM3C15C0C24C2CM25C2CM1C0CM4C5C4C10CM2C1C2_WEIGHT;
    -- sfix(1, -7)
    signal c2c28c1c5c20c0c13cm6c3c4cm5c22cm9cm5c13cm2_weight : PIPELINE_TYPE_FOR_C2C28C1C5C20C0C13CM6C3C4CM5C22CM9CM5C13CM2_WEIGHT;
    -- sfix(1, -7)
    signal c28cm10cm2cm1cm29cm10cm5cm6c5c6c4cm3c0cm40cm4c0_weight : PIPELINE_TYPE_FOR_C28CM10CM2CM1CM29CM10CM5CM6C5C6C4CM3C0CM40CM4C0_WEIGHT;
    -- sfix(1, -7)
    signal c18cm18c12cm2cm1c2cm4c0cm4c13c12c4cm2c2cm4c2_weight : PIPELINE_TYPE_FOR_C18CM18C12CM2CM1C2CM4C0CM4C13C12C4CM2C2CM4C2_WEIGHT;
    -- sfix(1, -7)
    signal c22c2c15c25c22cm3cm2cm9cm7c7c7cm3cm2cm8c0c1_weight : PIPELINE_TYPE_FOR_C22C2C15C25C22CM3CM2CM9CM7C7C7CM3CM2CM8C0C1_WEIGHT;
    -- sfix(1, -7)
    signal c20cm6cm4c0c5cm23c8c2c7cm16c6cm2c3cm3c8c0_weight : PIPELINE_TYPE_FOR_C20CM6CM4C0C5CM23C8C2C7CM16C6CM2C3CM3C8C0_WEIGHT;
    -- sfix(1, -7)
    signal c6c1c7cm10cm9cm3c2cm13c15cm2c2cm1c9cm43cm23c1_weight : PIPELINE_TYPE_FOR_C6C1C7CM10CM9CM3C2CM13C15CM2C2CM1C9CM43CM23C1_WEIGHT;
    -- sfix(1, -7)
    signal c5c2c11c14cm4cm20c14c5cm16c10c0c0cm6cm4c1c0_weight : PIPELINE_TYPE_FOR_C5C2C11C14CM4CM20C14C5CM16C10C0C0CM6CM4C1C0_WEIGHT;
    -- sfix(1, -7)
    signal c6cm1cm4c1cm59c35c1cm1c23cm3cm10c1c1cm2c7c3_weight : PIPELINE_TYPE_FOR_C6CM1CM4C1CM59C35C1CM1C23CM3CM10C1C1CM2C7C3_WEIGHT;
    -- sfix(1, -7)
    signal cm9c16c11cm7c14c10cm6c0c11c9c8cm2c0cm1c1cm3_weight : PIPELINE_TYPE_FOR_CM9C16C11CM7C14C10CM6C0C11C9C8CM2C0CM1C1CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm7c16c7c24c9c1c5c10cm3cm2c7cm5c58cm3c2c19_weight : PIPELINE_TYPE_FOR_CM7C16C7C24C9C1C5C10CM3CM2C7CM5C58CM3C2C19_WEIGHT;
    -- sfix(1, -7)
    signal c12cm19c0cm31c6c4c27cm18c8c17cm36c11cm4c0c7c1_weight : PIPELINE_TYPE_FOR_C12CM19C0CM31C6C4C27CM18C8C17CM36C11CM4C0C7C1_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core2_rmcm_weightsconstant_memory
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
        
            dout1   => c17c4cm7c6cm13c1cm21c1c12cm5c8cm2cm2cm3cm2c3_weight(0), 
            dout2   => cm16c3c1c26c17c10c8cm6c11c7c4c0c32c0cm38c6_weight(0), 
            dout3   => cm6c0c25c5c5c1cm3c1c12c5cm7c1c80c3cm9cm2_weight(0), 
            dout4   => c22c7cm33cm7c6c6cm43c19cm5c27cm24cm3cm3c2c11c11_weight(0), 
            dout5   => c2c4c6c7cm61c2c9c50c1c5cm21cm1c0c7cm10cm1_weight(0), 
            dout6   => cm9cm4c15c2c7c0cm41cm6c0cm1c3cm7cm19cm4cm3cm2_weight(0), 
            dout7   => c9cm22c1cm7c0cm9c0c21cm17cm4cm3c3c10c1c1cm3_weight(0), 
            dout8   => c7c16cm6c3c30c2c9c39c5cm3cm5c0cm3c5c7c5_weight(0), 
            dout9   => c29c22cm16cm3cm5c31c1c4c3cm36c12c8c2c1c6c1_weight(0), 
            dout10   => cm2cm6cm1c46cm3c1c2c1c3c2c4cm6cm4c3cm2c0_weight(0), 
            dout11   => c21c0c2c4c28cm11cm2cm1c6cm13c9c1cm2c5cm2c1_weight(0), 
            dout12   => c5c0c9c0cm6cm1cm11cm2cm14cm1cm6c7c0c8c4c0_weight(0), 
            dout13   => cm18c1c2c9cm24c34cm4c3c12cm10c13c6c1cm7c29c2_weight(0), 
            dout14   => c7c0c0c0cm29c7c6cm1c10c13c1cm2cm7cm2c0cm1_weight(0), 
            dout15   => cm33cm1c4c4c7c12cm7c2c4cm2cm9c0c6c6cm7c1_weight(0), 
            dout16   => cm2c12c3cm4c3c0c0c49cm12c6c7cm9c7c5cm5cm2_weight(0), 
            dout17   => c8c17cm6c10cm40cm10c2c3c2cm2c2c19c10c2c1cm2_weight(0), 
            dout18   => cm3cm1c0cm4c10c1c3c1c30c4cm18c0cm2cm1c6c3_weight(0), 
            dout19   => cm5cm29cm3c8cm1c13c6c16c12cm18c11cm22c3c1cm8cm52_weight(0), 
            dout20   => c8c17c14c7cm7cm21c2cm9cm9c14c0c10c11cm1c3cm17_weight(0), 
            dout21   => cm3c15c0c24c2cm25c2cm1c0cm4c5c4c10cm2c1c2_weight(0), 
            dout22   => c2c28c1c5c20c0c13cm6c3c4cm5c22cm9cm5c13cm2_weight(0), 
            dout23   => c28cm10cm2cm1cm29cm10cm5cm6c5c6c4cm3c0cm40cm4c0_weight(0), 
            dout24   => c18cm18c12cm2cm1c2cm4c0cm4c13c12c4cm2c2cm4c2_weight(0), 
            dout25   => c22c2c15c25c22cm3cm2cm9cm7c7c7cm3cm2cm8c0c1_weight(0), 
            dout26   => c20cm6cm4c0c5cm23c8c2c7cm16c6cm2c3cm3c8c0_weight(0), 
            dout27   => c6c1c7cm10cm9cm3c2cm13c15cm2c2cm1c9cm43cm23c1_weight(0), 
            dout28   => c5c2c11c14cm4cm20c14c5cm16c10c0c0cm6cm4c1c0_weight(0), 
            dout29   => c6cm1cm4c1cm59c35c1cm1c23cm3cm10c1c1cm2c7c3_weight(0), 
            dout30   => cm9c16c11cm7c14c10cm6c0c11c9c8cm2c0cm1c1cm3_weight(0), 
            dout31   => cm7c16c7c24c9c1c5c10cm3cm2c7cm5c58cm3c2c19_weight(0), 
            dout32   => c12cm19c0cm31c6c4c27cm18c8c17cm36c11cm4c0c7c1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c17c4cm7c6cm13c1cm21c1c12cm5c8cm2cm2cm3cm2c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c17c4cm7c6cm13c1cm21c1c12cm5c8cm2cm2cm3cm2c3_weight(0), c17c4cm7c6cm13c1cm21c1c12cm5c8cm2cm2cm3cm2c3_weight(1));
    PL_STEP_0_for_cm16c3c1c26c17c10c8cm6c11c7c4c0c32c0cm38c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm16c3c1c26c17c10c8cm6c11c7c4c0c32c0cm38c6_weight(0), cm16c3c1c26c17c10c8cm6c11c7c4c0c32c0cm38c6_weight(1));
    PL_STEP_0_for_cm6c0c25c5c5c1cm3c1c12c5cm7c1c80c3cm9cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c0c25c5c5c1cm3c1c12c5cm7c1c80c3cm9cm2_weight(0), cm6c0c25c5c5c1cm3c1c12c5cm7c1c80c3cm9cm2_weight(1));
    PL_STEP_0_for_c22c7cm33cm7c6c6cm43c19cm5c27cm24cm3cm3c2c11c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c22c7cm33cm7c6c6cm43c19cm5c27cm24cm3cm3c2c11c11_weight(0), c22c7cm33cm7c6c6cm43c19cm5c27cm24cm3cm3c2c11c11_weight(1));
    PL_STEP_0_for_c2c4c6c7cm61c2c9c50c1c5cm21cm1c0c7cm10cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c4c6c7cm61c2c9c50c1c5cm21cm1c0c7cm10cm1_weight(0), c2c4c6c7cm61c2c9c50c1c5cm21cm1c0c7cm10cm1_weight(1));
    PL_STEP_0_for_cm9cm4c15c2c7c0cm41cm6c0cm1c3cm7cm19cm4cm3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9cm4c15c2c7c0cm41cm6c0cm1c3cm7cm19cm4cm3cm2_weight(0), cm9cm4c15c2c7c0cm41cm6c0cm1c3cm7cm19cm4cm3cm2_weight(1));
    PL_STEP_0_for_c9cm22c1cm7c0cm9c0c21cm17cm4cm3c3c10c1c1cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9cm22c1cm7c0cm9c0c21cm17cm4cm3c3c10c1c1cm3_weight(0), c9cm22c1cm7c0cm9c0c21cm17cm4cm3c3c10c1c1cm3_weight(1));
    PL_STEP_0_for_c7c16cm6c3c30c2c9c39c5cm3cm5c0cm3c5c7c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c16cm6c3c30c2c9c39c5cm3cm5c0cm3c5c7c5_weight(0), c7c16cm6c3c30c2c9c39c5cm3cm5c0cm3c5c7c5_weight(1));
    PL_STEP_0_for_c29c22cm16cm3cm5c31c1c4c3cm36c12c8c2c1c6c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c29c22cm16cm3cm5c31c1c4c3cm36c12c8c2c1c6c1_weight(0), c29c22cm16cm3cm5c31c1c4c3cm36c12c8c2c1c6c1_weight(1));
    PL_STEP_0_for_cm2cm6cm1c46cm3c1c2c1c3c2c4cm6cm4c3cm2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm6cm1c46cm3c1c2c1c3c2c4cm6cm4c3cm2c0_weight(0), cm2cm6cm1c46cm3c1c2c1c3c2c4cm6cm4c3cm2c0_weight(1));
    PL_STEP_0_for_c21c0c2c4c28cm11cm2cm1c6cm13c9c1cm2c5cm2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c21c0c2c4c28cm11cm2cm1c6cm13c9c1cm2c5cm2c1_weight(0), c21c0c2c4c28cm11cm2cm1c6cm13c9c1cm2c5cm2c1_weight(1));
    PL_STEP_0_for_c5c0c9c0cm6cm1cm11cm2cm14cm1cm6c7c0c8c4c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c0c9c0cm6cm1cm11cm2cm14cm1cm6c7c0c8c4c0_weight(0), c5c0c9c0cm6cm1cm11cm2cm14cm1cm6c7c0c8c4c0_weight(1));
    PL_STEP_0_for_cm18c1c2c9cm24c34cm4c3c12cm10c13c6c1cm7c29c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm18c1c2c9cm24c34cm4c3c12cm10c13c6c1cm7c29c2_weight(0), cm18c1c2c9cm24c34cm4c3c12cm10c13c6c1cm7c29c2_weight(1));
    PL_STEP_0_for_c7c0c0c0cm29c7c6cm1c10c13c1cm2cm7cm2c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c0c0c0cm29c7c6cm1c10c13c1cm2cm7cm2c0cm1_weight(0), c7c0c0c0cm29c7c6cm1c10c13c1cm2cm7cm2c0cm1_weight(1));
    PL_STEP_0_for_cm33cm1c4c4c7c12cm7c2c4cm2cm9c0c6c6cm7c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm33cm1c4c4c7c12cm7c2c4cm2cm9c0c6c6cm7c1_weight(0), cm33cm1c4c4c7c12cm7c2c4cm2cm9c0c6c6cm7c1_weight(1));
    PL_STEP_0_for_cm2c12c3cm4c3c0c0c49cm12c6c7cm9c7c5cm5cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c12c3cm4c3c0c0c49cm12c6c7cm9c7c5cm5cm2_weight(0), cm2c12c3cm4c3c0c0c49cm12c6c7cm9c7c5cm5cm2_weight(1));
    PL_STEP_0_for_c8c17cm6c10cm40cm10c2c3c2cm2c2c19c10c2c1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c17cm6c10cm40cm10c2c3c2cm2c2c19c10c2c1cm2_weight(0), c8c17cm6c10cm40cm10c2c3c2cm2c2c19c10c2c1cm2_weight(1));
    PL_STEP_0_for_cm3cm1c0cm4c10c1c3c1c30c4cm18c0cm2cm1c6c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm1c0cm4c10c1c3c1c30c4cm18c0cm2cm1c6c3_weight(0), cm3cm1c0cm4c10c1c3c1c30c4cm18c0cm2cm1c6c3_weight(1));
    PL_STEP_0_for_cm5cm29cm3c8cm1c13c6c16c12cm18c11cm22c3c1cm8cm52_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm29cm3c8cm1c13c6c16c12cm18c11cm22c3c1cm8cm52_weight(0), cm5cm29cm3c8cm1c13c6c16c12cm18c11cm22c3c1cm8cm52_weight(1));
    PL_STEP_0_for_c8c17c14c7cm7cm21c2cm9cm9c14c0c10c11cm1c3cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c17c14c7cm7cm21c2cm9cm9c14c0c10c11cm1c3cm17_weight(0), c8c17c14c7cm7cm21c2cm9cm9c14c0c10c11cm1c3cm17_weight(1));
    PL_STEP_0_for_cm3c15c0c24c2cm25c2cm1c0cm4c5c4c10cm2c1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c15c0c24c2cm25c2cm1c0cm4c5c4c10cm2c1c2_weight(0), cm3c15c0c24c2cm25c2cm1c0cm4c5c4c10cm2c1c2_weight(1));
    PL_STEP_0_for_c2c28c1c5c20c0c13cm6c3c4cm5c22cm9cm5c13cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c28c1c5c20c0c13cm6c3c4cm5c22cm9cm5c13cm2_weight(0), c2c28c1c5c20c0c13cm6c3c4cm5c22cm9cm5c13cm2_weight(1));
    PL_STEP_0_for_c28cm10cm2cm1cm29cm10cm5cm6c5c6c4cm3c0cm40cm4c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c28cm10cm2cm1cm29cm10cm5cm6c5c6c4cm3c0cm40cm4c0_weight(0), c28cm10cm2cm1cm29cm10cm5cm6c5c6c4cm3c0cm40cm4c0_weight(1));
    PL_STEP_0_for_c18cm18c12cm2cm1c2cm4c0cm4c13c12c4cm2c2cm4c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c18cm18c12cm2cm1c2cm4c0cm4c13c12c4cm2c2cm4c2_weight(0), c18cm18c12cm2cm1c2cm4c0cm4c13c12c4cm2c2cm4c2_weight(1));
    PL_STEP_0_for_c22c2c15c25c22cm3cm2cm9cm7c7c7cm3cm2cm8c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c22c2c15c25c22cm3cm2cm9cm7c7c7cm3cm2cm8c0c1_weight(0), c22c2c15c25c22cm3cm2cm9cm7c7c7cm3cm2cm8c0c1_weight(1));
    PL_STEP_0_for_c20cm6cm4c0c5cm23c8c2c7cm16c6cm2c3cm3c8c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c20cm6cm4c0c5cm23c8c2c7cm16c6cm2c3cm3c8c0_weight(0), c20cm6cm4c0c5cm23c8c2c7cm16c6cm2c3cm3c8c0_weight(1));
    PL_STEP_0_for_c6c1c7cm10cm9cm3c2cm13c15cm2c2cm1c9cm43cm23c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c1c7cm10cm9cm3c2cm13c15cm2c2cm1c9cm43cm23c1_weight(0), c6c1c7cm10cm9cm3c2cm13c15cm2c2cm1c9cm43cm23c1_weight(1));
    PL_STEP_0_for_c5c2c11c14cm4cm20c14c5cm16c10c0c0cm6cm4c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c2c11c14cm4cm20c14c5cm16c10c0c0cm6cm4c1c0_weight(0), c5c2c11c14cm4cm20c14c5cm16c10c0c0cm6cm4c1c0_weight(1));
    PL_STEP_0_for_c6cm1cm4c1cm59c35c1cm1c23cm3cm10c1c1cm2c7c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm1cm4c1cm59c35c1cm1c23cm3cm10c1c1cm2c7c3_weight(0), c6cm1cm4c1cm59c35c1cm1c23cm3cm10c1c1cm2c7c3_weight(1));
    PL_STEP_0_for_cm9c16c11cm7c14c10cm6c0c11c9c8cm2c0cm1c1cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c16c11cm7c14c10cm6c0c11c9c8cm2c0cm1c1cm3_weight(0), cm9c16c11cm7c14c10cm6c0c11c9c8cm2c0cm1c1cm3_weight(1));
    PL_STEP_0_for_cm7c16c7c24c9c1c5c10cm3cm2c7cm5c58cm3c2c19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c16c7c24c9c1c5c10cm3cm2c7cm5c58cm3c2c19_weight(0), cm7c16c7c24c9c1c5c10cm3cm2c7cm5c58cm3c2c19_weight(1));
    PL_STEP_0_for_c12cm19c0cm31c6c4c27cm18c8c17cm36c11cm4c0c7c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12cm19c0cm31c6c4c27cm18c8c17cm36c11cm4c0c7c1_weight(0), c12cm19c0cm31c6c4c27cm18c8c17cm36c11cm4c0c7c1_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm6c0c25c5c5c1cm3c1c12c5cm7c1c80c3cm9cm2_c5c0c9c0cm6cm1cm11cm2cm14cm1cm6c7c0c8c4c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6c0c25c5c5c1cm3c1c12c5cm7c1c80c3cm9cm2_weight(1)(8-1 downto 0),
			B	=> c5c0c9c0cm6cm1cm11cm2cm14cm1cm6c7c0c8c4c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c0c25c5c5c1cm3c1c12c5cm7c1c80c3cm9cm2,
			CxB => R_c5c0c9c0cm6cm1cm11cm2cm14cm1cm6c7c0c8c4c0
		);

    cm16c3c1c26c17c10c8cm6c11c7c4c0c32c0cm38c6_cm9c16c11cm7c14c10cm6c0c11c9c8cm2c0cm1c1cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm16c3c1c26c17c10c8cm6c11c7c4c0c32c0cm38c6_weight(1)(7-1 downto 0),
			B	=> cm9c16c11cm7c14c10cm6c0c11c9c8cm2c0cm1c1cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm16c3c1c26c17c10c8cm6c11c7c4c0c32c0cm38c6,
			CxB => R_cm9c16c11cm7c14c10cm6c0c11c9c8cm2c0cm1c1cm3
		);

    c22c7cm33cm7c6c6cm43c19cm5c27cm24cm3cm3c2c11c11_c5c2c11c14cm4cm20c14c5cm16c10c0c0cm6cm4c1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c22c7cm33cm7c6c6cm43c19cm5c27cm24cm3cm3c2c11c11_weight(1)(7-1 downto 0),
			B	=> c5c2c11c14cm4cm20c14c5cm16c10c0c0cm6cm4c1c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c22c7cm33cm7c6c6cm43c19cm5c27cm24cm3cm3c2c11c11,
			CxB => R_c5c2c11c14cm4cm20c14c5cm16c10c0c0cm6cm4c1c0
		);

    c2c4c6c7cm61c2c9c50c1c5cm21cm1c0c7cm10cm1_c20cm6cm4c0c5cm23c8c2c7cm16c6cm2c3cm3c8c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c4c6c7cm61c2c9c50c1c5cm21cm1c0c7cm10cm1_weight(1)(7-1 downto 0),
			B	=> c20cm6cm4c0c5cm23c8c2c7cm16c6cm2c3cm3c8c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c4c6c7cm61c2c9c50c1c5cm21cm1c0c7cm10cm1,
			CxB => R_c20cm6cm4c0c5cm23c8c2c7cm16c6cm2c3cm3c8c0
		);

    cm9cm4c15c2c7c0cm41cm6c0cm1c3cm7cm19cm4cm3cm2_c22c2c15c25c22cm3cm2cm9cm7c7c7cm3cm2cm8c0c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9cm4c15c2c7c0cm41cm6c0cm1c3cm7cm19cm4cm3cm2_weight(1)(7-1 downto 0),
			B	=> c22c2c15c25c22cm3cm2cm9cm7c7c7cm3cm2cm8c0c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9cm4c15c2c7c0cm41cm6c0cm1c3cm7cm19cm4cm3cm2,
			CxB => R_c22c2c15c25c22cm3cm2cm9cm7c7c7cm3cm2cm8c0c1
		);

    c7c16cm6c3c30c2c9c39c5cm3cm5c0cm3c5c7c5_c18cm18c12cm2cm1c2cm4c0cm4c13c12c4cm2c2cm4c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7c16cm6c3c30c2c9c39c5cm3cm5c0cm3c5c7c5_weight(1)(7-1 downto 0),
			B	=> c18cm18c12cm2cm1c2cm4c0cm4c13c12c4cm2c2cm4c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7c16cm6c3c30c2c9c39c5cm3cm5c0cm3c5c7c5,
			CxB => R_c18cm18c12cm2cm1c2cm4c0cm4c13c12c4cm2c2cm4c2
		);

    c29c22cm16cm3cm5c31c1c4c3cm36c12c8c2c1c6c1_c2c28c1c5c20c0c13cm6c3c4cm5c22cm9cm5c13cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c29c22cm16cm3cm5c31c1c4c3cm36c12c8c2c1c6c1_weight(1)(7-1 downto 0),
			B	=> c2c28c1c5c20c0c13cm6c3c4cm5c22cm9cm5c13cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c29c22cm16cm3cm5c31c1c4c3cm36c12c8c2c1c6c1,
			CxB => R_c2c28c1c5c20c0c13cm6c3c4cm5c22cm9cm5c13cm2
		);

    cm2cm6cm1c46cm3c1c2c1c3c2c4cm6cm4c3cm2c0_cm3c15c0c24c2cm25c2cm1c0cm4c5c4c10cm2c1c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm6cm1c46cm3c1c2c1c3c2c4cm6cm4c3cm2c0_weight(1)(7-1 downto 0),
			B	=> cm3c15c0c24c2cm25c2cm1c0cm4c5c4c10cm2c1c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm6cm1c46cm3c1c2c1c3c2c4cm6cm4c3cm2c0,
			CxB => R_cm3c15c0c24c2cm25c2cm1c0cm4c5c4c10cm2c1c2
		);

    cm18c1c2c9cm24c34cm4c3c12cm10c13c6c1cm7c29c2_c8c17c14c7cm7cm21c2cm9cm9c14c0c10c11cm1c3cm17_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm18c1c2c9cm24c34cm4c3c12cm10c13c6c1cm7c29c2_weight(1)(7-1 downto 0),
			B	=> c8c17c14c7cm7cm21c2cm9cm9c14c0c10c11cm1c3cm17_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm18c1c2c9cm24c34cm4c3c12cm10c13c6c1cm7c29c2,
			CxB => R_c8c17c14c7cm7cm21c2cm9cm9c14c0c10c11cm1c3cm17
		);

    cm33cm1c4c4c7c12cm7c2c4cm2cm9c0c6c6cm7c1_cm3cm1c0cm4c10c1c3c1c30c4cm18c0cm2cm1c6c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm33cm1c4c4c7c12cm7c2c4cm2cm9c0c6c6cm7c1_weight(1)(7-1 downto 0),
			B	=> cm3cm1c0cm4c10c1c3c1c30c4cm18c0cm2cm1c6c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm33cm1c4c4c7c12cm7c2c4cm2cm9c0c6c6cm7c1,
			CxB => R_cm3cm1c0cm4c10c1c3c1c30c4cm18c0cm2cm1c6c3
		);

    cm2c12c3cm4c3c0c0c49cm12c6c7cm9c7c5cm5cm2_c7c0c0c0cm29c7c6cm1c10c13c1cm2cm7cm2c0cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c12c3cm4c3c0c0c49cm12c6c7cm9c7c5cm5cm2_weight(1)(7-1 downto 0),
			B	=> c7c0c0c0cm29c7c6cm1c10c13c1cm2cm7cm2c0cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c12c3cm4c3c0c0c49cm12c6c7cm9c7c5cm5cm2,
			CxB => R_c7c0c0c0cm29c7c6cm1c10c13c1cm2cm7cm2c0cm1
		);

    c8c17cm6c10cm40cm10c2c3c2cm2c2c19c10c2c1cm2_c21c0c2c4c28cm11cm2cm1c6cm13c9c1cm2c5cm2c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c8c17cm6c10cm40cm10c2c3c2cm2c2c19c10c2c1cm2_weight(1)(7-1 downto 0),
			B	=> c21c0c2c4c28cm11cm2cm1c6cm13c9c1cm2c5cm2c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c8c17cm6c10cm40cm10c2c3c2cm2c2c19c10c2c1cm2,
			CxB => R_c21c0c2c4c28cm11cm2cm1c6cm13c9c1cm2c5cm2c1
		);

    cm5cm29cm3c8cm1c13c6c16c12cm18c11cm22c3c1cm8cm52_c9cm22c1cm7c0cm9c0c21cm17cm4cm3c3c10c1c1cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5cm29cm3c8cm1c13c6c16c12cm18c11cm22c3c1cm8cm52_weight(1)(7-1 downto 0),
			B	=> c9cm22c1cm7c0cm9c0c21cm17cm4cm3c3c10c1c1cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5cm29cm3c8cm1c13c6c16c12cm18c11cm22c3c1cm8cm52,
			CxB => R_c9cm22c1cm7c0cm9c0c21cm17cm4cm3c3c10c1c1cm3
		);

    c28cm10cm2cm1cm29cm10cm5cm6c5c6c4cm3c0cm40cm4c0_c17c4cm7c6cm13c1cm21c1c12cm5c8cm2cm2cm3cm2c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c28cm10cm2cm1cm29cm10cm5cm6c5c6c4cm3c0cm40cm4c0_weight(1)(7-1 downto 0),
			B	=> c17c4cm7c6cm13c1cm21c1c12cm5c8cm2cm2cm3cm2c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c28cm10cm2cm1cm29cm10cm5cm6c5c6c4cm3c0cm40cm4c0,
			CxB => R_c17c4cm7c6cm13c1cm21c1c12cm5c8cm2cm2cm3cm2c3
		);

    c6c1c7cm10cm9cm3c2cm13c15cm2c2cm1c9cm43cm23c1_c12cm19c0cm31c6c4c27cm18c8c17cm36c11cm4c0c7c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6c1c7cm10cm9cm3c2cm13c15cm2c2cm1c9cm43cm23c1_weight(1)(7-1 downto 0),
			B	=> c12cm19c0cm31c6c4c27cm18c8c17cm36c11cm4c0c7c1_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6c1c7cm10cm9cm3c2cm13c15cm2c2cm1c9cm43cm23c1,
			CxB => R_c12cm19c0cm31c6c4c27cm18c8c17cm36c11cm4c0c7c1
		);

    c6cm1cm4c1cm59c35c1cm1c23cm3cm10c1c1cm2c7c3_cm7c16c7c24c9c1c5c10cm3cm2c7cm5c58cm3c2c19_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6cm1cm4c1cm59c35c1cm1c23cm3cm10c1c1cm2c7c3_weight(1)(7-1 downto 0),
			B	=> cm7c16c7c24c9c1c5c10cm3cm2c7cm5c58cm3c2c19_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm1cm4c1cm59c35c1cm1c23cm3cm10c1c1cm2c7c3,
			CxB => R_cm7c16c7c24c9c1c5c10cm3cm2c7cm5c58cm3c2c19
		);




end architecture;
