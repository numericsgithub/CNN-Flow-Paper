library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core18_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c1c4c0c3cm2cm4cm3c1cm10c6c4c28cm21cm2cm9cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c5c2c3c35cm3cm12cm4cm5c23c2cm10cm5c31c4cm57cm9 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2cm14cm14cm4cm6cm13c2cm4c8cm83cm6cm7c5cm2cm1c3 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c127c1c10cm5c8cm4cm15c1c13c5c15cm3c2cm18cm1c0 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c1c35cm6cm23c7cm2c2cm13cm22cm3cm1c2cm8cm2cm28cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2cm12cm13cm24cm1cm1c7c7c13c7c24cm1cm1cm10c3cm15 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c16c11cm1cm13cm13cm1cm2c2cm22c12cm7cm9cm7c1cm5c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm24cm4c10cm4cm8cm10cm7c15c26c102cm3c8c6cm10cm4c8 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm2c1c0cm20c3c16c1cm10c36c7cm104c16cm2c8cm14cm6 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c3c0c4c15c2c2cm2c6c14cm4cm8cm8cm29c5cm11cm10 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm19cm19cm6cm17cm19cm11c52cm7cm29cm2c41c1cm17c11c0c6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm7c0c6cm4cm3cm1c8c1cm1c1cm5cm19cm16cm2c9c10 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c0c2c0cm2c32cm6c4cm5c41c6cm7cm1cm5c4c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm13cm5cm9c11cm19cm3c0c6cm6c3c6cm3c1cm10c5c6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c4cm10cm1cm1c10cm6cm28c5c32cm7cm3cm28c0c11cm9c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0cm12c5c16cm1c0c1cm2c10c2c0c9cm6cm2cm3c9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c43c17c25cm4c11c9c21c11c11c34c10c26c10c2c14cm11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2cm7c0cm1c28cm1cm10c3c15cm8c14c5cm13cm7cm36c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c5cm1cm11c4c9c4c10c3c24c7c18c11c0cm6c0c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm15cm12cm5cm2cm7cm22c1c8cm5cm4c70c0cm4c2cm4cm9 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm1c1cm5cm51c0cm22cm5c3c6cm9c1c29c2cm1c1cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm20cm24c8cm24cm22c4c55c0c4cm8cm5c22cm9c7cm6cm7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c9cm12cm18c13c7cm7c5c2c24c6cm13c7c16cm2cm3cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm13c6cm24c11c4cm6c2cm5cm1c17c8cm7cm11cm11c3c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm4c2c2c12cm51c3c18cm9cm13c10c19cm18cm2c2cm4cm8 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm48c0cm38cm6c15c0c4cm3cm3cm1cm3cm1c0cm18cm1c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c14cm4cm1cm3c16cm4c10c0c13c2c2c15c14c24c28c9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6cm16cm2c4c10c13c3c6c3c14c6cm7c2c16cm8cm21 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1c13c3cm20cm11cm6cm6c3c7c0cm14cm36cm2cm8cm4c12 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c1c5c9c2c9c21c3c3c9c21c16c33c10cm27c43cm13 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm12cm3c2c0cm12c12c6c6c6cm13cm5c13cm8c6cm1cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm1c2cm11cm1c6c12cm4cm25cm11c10cm1cm10c1c2cm14cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core18_rmcm;

architecture arch of conv7_core18_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C4C0C3CM2CM4CM3C1CM10C6C4C28CM21CM2CM9CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C2C3C35CM3CM12CM4CM5C23C2CM10CM5C31C4CM57CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM14CM14CM4CM6CM13C2CM4C8CM83CM6CM7C5CM2CM1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C127C1C10CM5C8CM4CM15C1C13C5C15CM3C2CM18CM1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C35CM6CM23C7CM2C2CM13CM22CM3CM1C2CM8CM2CM28CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM12CM13CM24CM1CM1C7C7C13C7C24CM1CM1CM10C3CM15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C16C11CM1CM13CM13CM1CM2C2CM22C12CM7CM9CM7C1CM5C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM24CM4C10CM4CM8CM10CM7C15C26C102CM3C8C6CM10CM4C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1C0CM20C3C16C1CM10C36C7CM104C16CM2C8CM14CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0C4C15C2C2CM2C6C14CM4CM8CM8CM29C5CM11CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM19CM19CM6CM17CM19CM11C52CM7CM29CM2C41C1CM17C11C0C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C0C6CM4CM3CM1C8C1CM1C1CM5CM19CM16CM2C9C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C2C0CM2C32CM6C4CM5C41C6CM7CM1CM5C4C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13CM5CM9C11CM19CM3C0C6CM6C3C6CM3C1CM10C5C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM10CM1CM1C10CM6CM28C5C32CM7CM3CM28C0C11CM9C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM12C5C16CM1C0C1CM2C10C2C0C9CM6CM2CM3C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C43C17C25CM4C11C9C21C11C11C34C10C26C10C2C14CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM7C0CM1C28CM1CM10C3C15CM8C14C5CM13CM7CM36C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM1CM11C4C9C4C10C3C24C7C18C11C0CM6C0C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15CM12CM5CM2CM7CM22C1C8CM5CM4C70C0CM4C2CM4CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C1CM5CM51C0CM22CM5C3C6CM9C1C29C2CM1C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM20CM24C8CM24CM22C4C55C0C4CM8CM5C22CM9C7CM6CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9CM12CM18C13C7CM7C5C2C24C6CM13C7C16CM2CM3CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C6CM24C11C4CM6C2CM5CM1C17C8CM7CM11CM11C3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C2C2C12CM51C3C18CM9CM13C10C19CM18CM2C2CM4CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM48C0CM38CM6C15C0C4CM3CM3CM1CM3CM1C0CM18CM1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14CM4CM1CM3C16CM4C10C0C13C2C2C15C14C24C28C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM16CM2C4C10C13C3C6C3C14C6CM7C2C16CM8CM21_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C13C3CM20CM11CM6CM6C3C7C0CM14CM36CM2CM8CM4C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C5C9C2C9C21C3C3C9C21C16C33C10CM27C43CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12CM3C2C0CM12C12C6C6C6CM13CM5C13CM8C6CM1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C2CM11CM1C6C12CM4CM25CM11C10CM1CM10C1C2CM14CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c1c4c0c3cm2cm4cm3c1cm10c6c4c28cm21cm2cm9cm8_weight : PIPELINE_TYPE_FOR_C1C4C0C3CM2CM4CM3C1CM10C6C4C28CM21CM2CM9CM8_WEIGHT;
    -- sfix(1, -7)
    signal c5c2c3c35cm3cm12cm4cm5c23c2cm10cm5c31c4cm57cm9_weight : PIPELINE_TYPE_FOR_C5C2C3C35CM3CM12CM4CM5C23C2CM10CM5C31C4CM57CM9_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm14cm14cm4cm6cm13c2cm4c8cm83cm6cm7c5cm2cm1c3_weight : PIPELINE_TYPE_FOR_CM2CM14CM14CM4CM6CM13C2CM4C8CM83CM6CM7C5CM2CM1C3_WEIGHT;
    -- sfix(1, -7)
    signal c127c1c10cm5c8cm4cm15c1c13c5c15cm3c2cm18cm1c0_weight : PIPELINE_TYPE_FOR_C127C1C10CM5C8CM4CM15C1C13C5C15CM3C2CM18CM1C0_WEIGHT;
    -- sfix(1, -7)
    signal c1c35cm6cm23c7cm2c2cm13cm22cm3cm1c2cm8cm2cm28cm4_weight : PIPELINE_TYPE_FOR_C1C35CM6CM23C7CM2C2CM13CM22CM3CM1C2CM8CM2CM28CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm12cm13cm24cm1cm1c7c7c13c7c24cm1cm1cm10c3cm15_weight : PIPELINE_TYPE_FOR_CM2CM12CM13CM24CM1CM1C7C7C13C7C24CM1CM1CM10C3CM15_WEIGHT;
    -- sfix(1, -7)
    signal c16c11cm1cm13cm13cm1cm2c2cm22c12cm7cm9cm7c1cm5c1_weight : PIPELINE_TYPE_FOR_C16C11CM1CM13CM13CM1CM2C2CM22C12CM7CM9CM7C1CM5C1_WEIGHT;
    -- sfix(1, -7)
    signal cm24cm4c10cm4cm8cm10cm7c15c26c102cm3c8c6cm10cm4c8_weight : PIPELINE_TYPE_FOR_CM24CM4C10CM4CM8CM10CM7C15C26C102CM3C8C6CM10CM4C8_WEIGHT;
    -- sfix(1, -7)
    signal cm2c1c0cm20c3c16c1cm10c36c7cm104c16cm2c8cm14cm6_weight : PIPELINE_TYPE_FOR_CM2C1C0CM20C3C16C1CM10C36C7CM104C16CM2C8CM14CM6_WEIGHT;
    -- sfix(1, -7)
    signal c3c0c4c15c2c2cm2c6c14cm4cm8cm8cm29c5cm11cm10_weight : PIPELINE_TYPE_FOR_C3C0C4C15C2C2CM2C6C14CM4CM8CM8CM29C5CM11CM10_WEIGHT;
    -- sfix(1, -7)
    signal cm19cm19cm6cm17cm19cm11c52cm7cm29cm2c41c1cm17c11c0c6_weight : PIPELINE_TYPE_FOR_CM19CM19CM6CM17CM19CM11C52CM7CM29CM2C41C1CM17C11C0C6_WEIGHT;
    -- sfix(1, -7)
    signal cm7c0c6cm4cm3cm1c8c1cm1c1cm5cm19cm16cm2c9c10_weight : PIPELINE_TYPE_FOR_CM7C0C6CM4CM3CM1C8C1CM1C1CM5CM19CM16CM2C9C10_WEIGHT;
    -- sfix(1, -7)
    signal c0c0c2c0cm2c32cm6c4cm5c41c6cm7cm1cm5c4c2_weight : PIPELINE_TYPE_FOR_C0C0C2C0CM2C32CM6C4CM5C41C6CM7CM1CM5C4C2_WEIGHT;
    -- sfix(1, -7)
    signal cm13cm5cm9c11cm19cm3c0c6cm6c3c6cm3c1cm10c5c6_weight : PIPELINE_TYPE_FOR_CM13CM5CM9C11CM19CM3C0C6CM6C3C6CM3C1CM10C5C6_WEIGHT;
    -- sfix(1, -7)
    signal c4cm10cm1cm1c10cm6cm28c5c32cm7cm3cm28c0c11cm9c1_weight : PIPELINE_TYPE_FOR_C4CM10CM1CM1C10CM6CM28C5C32CM7CM3CM28C0C11CM9C1_WEIGHT;
    -- sfix(1, -7)
    signal c0cm12c5c16cm1c0c1cm2c10c2c0c9cm6cm2cm3c9_weight : PIPELINE_TYPE_FOR_C0CM12C5C16CM1C0C1CM2C10C2C0C9CM6CM2CM3C9_WEIGHT;
    -- sfix(1, -7)
    signal c43c17c25cm4c11c9c21c11c11c34c10c26c10c2c14cm11_weight : PIPELINE_TYPE_FOR_C43C17C25CM4C11C9C21C11C11C34C10C26C10C2C14CM11_WEIGHT;
    -- sfix(1, -7)
    signal c2cm7c0cm1c28cm1cm10c3c15cm8c14c5cm13cm7cm36c2_weight : PIPELINE_TYPE_FOR_C2CM7C0CM1C28CM1CM10C3C15CM8C14C5CM13CM7CM36C2_WEIGHT;
    -- sfix(1, -7)
    signal c5cm1cm11c4c9c4c10c3c24c7c18c11c0cm6c0c1_weight : PIPELINE_TYPE_FOR_C5CM1CM11C4C9C4C10C3C24C7C18C11C0CM6C0C1_WEIGHT;
    -- sfix(1, -7)
    signal cm15cm12cm5cm2cm7cm22c1c8cm5cm4c70c0cm4c2cm4cm9_weight : PIPELINE_TYPE_FOR_CM15CM12CM5CM2CM7CM22C1C8CM5CM4C70C0CM4C2CM4CM9_WEIGHT;
    -- sfix(1, -7)
    signal cm1c1cm5cm51c0cm22cm5c3c6cm9c1c29c2cm1c1cm1_weight : PIPELINE_TYPE_FOR_CM1C1CM5CM51C0CM22CM5C3C6CM9C1C29C2CM1C1CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm20cm24c8cm24cm22c4c55c0c4cm8cm5c22cm9c7cm6cm7_weight : PIPELINE_TYPE_FOR_CM20CM24C8CM24CM22C4C55C0C4CM8CM5C22CM9C7CM6CM7_WEIGHT;
    -- sfix(1, -7)
    signal c9cm12cm18c13c7cm7c5c2c24c6cm13c7c16cm2cm3cm6_weight : PIPELINE_TYPE_FOR_C9CM12CM18C13C7CM7C5C2C24C6CM13C7C16CM2CM3CM6_WEIGHT;
    -- sfix(1, -7)
    signal cm13c6cm24c11c4cm6c2cm5cm1c17c8cm7cm11cm11c3c0_weight : PIPELINE_TYPE_FOR_CM13C6CM24C11C4CM6C2CM5CM1C17C8CM7CM11CM11C3C0_WEIGHT;
    -- sfix(1, -7)
    signal cm4c2c2c12cm51c3c18cm9cm13c10c19cm18cm2c2cm4cm8_weight : PIPELINE_TYPE_FOR_CM4C2C2C12CM51C3C18CM9CM13C10C19CM18CM2C2CM4CM8_WEIGHT;
    -- sfix(1, -7)
    signal cm48c0cm38cm6c15c0c4cm3cm3cm1cm3cm1c0cm18cm1c0_weight : PIPELINE_TYPE_FOR_CM48C0CM38CM6C15C0C4CM3CM3CM1CM3CM1C0CM18CM1C0_WEIGHT;
    -- sfix(1, -7)
    signal c14cm4cm1cm3c16cm4c10c0c13c2c2c15c14c24c28c9_weight : PIPELINE_TYPE_FOR_C14CM4CM1CM3C16CM4C10C0C13C2C2C15C14C24C28C9_WEIGHT;
    -- sfix(1, -7)
    signal c6cm16cm2c4c10c13c3c6c3c14c6cm7c2c16cm8cm21_weight : PIPELINE_TYPE_FOR_C6CM16CM2C4C10C13C3C6C3C14C6CM7C2C16CM8CM21_WEIGHT;
    -- sfix(1, -7)
    signal cm1c13c3cm20cm11cm6cm6c3c7c0cm14cm36cm2cm8cm4c12_weight : PIPELINE_TYPE_FOR_CM1C13C3CM20CM11CM6CM6C3C7C0CM14CM36CM2CM8CM4C12_WEIGHT;
    -- sfix(1, -7)
    signal c1c5c9c2c9c21c3c3c9c21c16c33c10cm27c43cm13_weight : PIPELINE_TYPE_FOR_C1C5C9C2C9C21C3C3C9C21C16C33C10CM27C43CM13_WEIGHT;
    -- sfix(1, -7)
    signal cm12cm3c2c0cm12c12c6c6c6cm13cm5c13cm8c6cm1cm1_weight : PIPELINE_TYPE_FOR_CM12CM3C2C0CM12C12C6C6C6CM13CM5C13CM8C6CM1CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm1c2cm11cm1c6c12cm4cm25cm11c10cm1cm10c1c2cm14cm8_weight : PIPELINE_TYPE_FOR_CM1C2CM11CM1C6C12CM4CM25CM11C10CM1CM10C1C2CM14CM8_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core18_rmcm_weightsconstant_memory
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
        
            dout1   => c1c4c0c3cm2cm4cm3c1cm10c6c4c28cm21cm2cm9cm8_weight(0), 
            dout2   => c5c2c3c35cm3cm12cm4cm5c23c2cm10cm5c31c4cm57cm9_weight(0), 
            dout3   => cm2cm14cm14cm4cm6cm13c2cm4c8cm83cm6cm7c5cm2cm1c3_weight(0), 
            dout4   => c127c1c10cm5c8cm4cm15c1c13c5c15cm3c2cm18cm1c0_weight(0), 
            dout5   => c1c35cm6cm23c7cm2c2cm13cm22cm3cm1c2cm8cm2cm28cm4_weight(0), 
            dout6   => cm2cm12cm13cm24cm1cm1c7c7c13c7c24cm1cm1cm10c3cm15_weight(0), 
            dout7   => c16c11cm1cm13cm13cm1cm2c2cm22c12cm7cm9cm7c1cm5c1_weight(0), 
            dout8   => cm24cm4c10cm4cm8cm10cm7c15c26c102cm3c8c6cm10cm4c8_weight(0), 
            dout9   => cm2c1c0cm20c3c16c1cm10c36c7cm104c16cm2c8cm14cm6_weight(0), 
            dout10   => c3c0c4c15c2c2cm2c6c14cm4cm8cm8cm29c5cm11cm10_weight(0), 
            dout11   => cm19cm19cm6cm17cm19cm11c52cm7cm29cm2c41c1cm17c11c0c6_weight(0), 
            dout12   => cm7c0c6cm4cm3cm1c8c1cm1c1cm5cm19cm16cm2c9c10_weight(0), 
            dout13   => c0c0c2c0cm2c32cm6c4cm5c41c6cm7cm1cm5c4c2_weight(0), 
            dout14   => cm13cm5cm9c11cm19cm3c0c6cm6c3c6cm3c1cm10c5c6_weight(0), 
            dout15   => c4cm10cm1cm1c10cm6cm28c5c32cm7cm3cm28c0c11cm9c1_weight(0), 
            dout16   => c0cm12c5c16cm1c0c1cm2c10c2c0c9cm6cm2cm3c9_weight(0), 
            dout17   => c43c17c25cm4c11c9c21c11c11c34c10c26c10c2c14cm11_weight(0), 
            dout18   => c2cm7c0cm1c28cm1cm10c3c15cm8c14c5cm13cm7cm36c2_weight(0), 
            dout19   => c5cm1cm11c4c9c4c10c3c24c7c18c11c0cm6c0c1_weight(0), 
            dout20   => cm15cm12cm5cm2cm7cm22c1c8cm5cm4c70c0cm4c2cm4cm9_weight(0), 
            dout21   => cm1c1cm5cm51c0cm22cm5c3c6cm9c1c29c2cm1c1cm1_weight(0), 
            dout22   => cm20cm24c8cm24cm22c4c55c0c4cm8cm5c22cm9c7cm6cm7_weight(0), 
            dout23   => c9cm12cm18c13c7cm7c5c2c24c6cm13c7c16cm2cm3cm6_weight(0), 
            dout24   => cm13c6cm24c11c4cm6c2cm5cm1c17c8cm7cm11cm11c3c0_weight(0), 
            dout25   => cm4c2c2c12cm51c3c18cm9cm13c10c19cm18cm2c2cm4cm8_weight(0), 
            dout26   => cm48c0cm38cm6c15c0c4cm3cm3cm1cm3cm1c0cm18cm1c0_weight(0), 
            dout27   => c14cm4cm1cm3c16cm4c10c0c13c2c2c15c14c24c28c9_weight(0), 
            dout28   => c6cm16cm2c4c10c13c3c6c3c14c6cm7c2c16cm8cm21_weight(0), 
            dout29   => cm1c13c3cm20cm11cm6cm6c3c7c0cm14cm36cm2cm8cm4c12_weight(0), 
            dout30   => c1c5c9c2c9c21c3c3c9c21c16c33c10cm27c43cm13_weight(0), 
            dout31   => cm12cm3c2c0cm12c12c6c6c6cm13cm5c13cm8c6cm1cm1_weight(0), 
            dout32   => cm1c2cm11cm1c6c12cm4cm25cm11c10cm1cm10c1c2cm14cm8_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c1c4c0c3cm2cm4cm3c1cm10c6c4c28cm21cm2cm9cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c4c0c3cm2cm4cm3c1cm10c6c4c28cm21cm2cm9cm8_weight(0), c1c4c0c3cm2cm4cm3c1cm10c6c4c28cm21cm2cm9cm8_weight(1));
    PL_STEP_0_for_c5c2c3c35cm3cm12cm4cm5c23c2cm10cm5c31c4cm57cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c2c3c35cm3cm12cm4cm5c23c2cm10cm5c31c4cm57cm9_weight(0), c5c2c3c35cm3cm12cm4cm5c23c2cm10cm5c31c4cm57cm9_weight(1));
    PL_STEP_0_for_cm2cm14cm14cm4cm6cm13c2cm4c8cm83cm6cm7c5cm2cm1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm14cm14cm4cm6cm13c2cm4c8cm83cm6cm7c5cm2cm1c3_weight(0), cm2cm14cm14cm4cm6cm13c2cm4c8cm83cm6cm7c5cm2cm1c3_weight(1));
    PL_STEP_0_for_c127c1c10cm5c8cm4cm15c1c13c5c15cm3c2cm18cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c127c1c10cm5c8cm4cm15c1c13c5c15cm3c2cm18cm1c0_weight(0), c127c1c10cm5c8cm4cm15c1c13c5c15cm3c2cm18cm1c0_weight(1));
    PL_STEP_0_for_c1c35cm6cm23c7cm2c2cm13cm22cm3cm1c2cm8cm2cm28cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c35cm6cm23c7cm2c2cm13cm22cm3cm1c2cm8cm2cm28cm4_weight(0), c1c35cm6cm23c7cm2c2cm13cm22cm3cm1c2cm8cm2cm28cm4_weight(1));
    PL_STEP_0_for_cm2cm12cm13cm24cm1cm1c7c7c13c7c24cm1cm1cm10c3cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm12cm13cm24cm1cm1c7c7c13c7c24cm1cm1cm10c3cm15_weight(0), cm2cm12cm13cm24cm1cm1c7c7c13c7c24cm1cm1cm10c3cm15_weight(1));
    PL_STEP_0_for_c16c11cm1cm13cm13cm1cm2c2cm22c12cm7cm9cm7c1cm5c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c16c11cm1cm13cm13cm1cm2c2cm22c12cm7cm9cm7c1cm5c1_weight(0), c16c11cm1cm13cm13cm1cm2c2cm22c12cm7cm9cm7c1cm5c1_weight(1));
    PL_STEP_0_for_cm24cm4c10cm4cm8cm10cm7c15c26c102cm3c8c6cm10cm4c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm24cm4c10cm4cm8cm10cm7c15c26c102cm3c8c6cm10cm4c8_weight(0), cm24cm4c10cm4cm8cm10cm7c15c26c102cm3c8c6cm10cm4c8_weight(1));
    PL_STEP_0_for_cm2c1c0cm20c3c16c1cm10c36c7cm104c16cm2c8cm14cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1c0cm20c3c16c1cm10c36c7cm104c16cm2c8cm14cm6_weight(0), cm2c1c0cm20c3c16c1cm10c36c7cm104c16cm2c8cm14cm6_weight(1));
    PL_STEP_0_for_c3c0c4c15c2c2cm2c6c14cm4cm8cm8cm29c5cm11cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0c4c15c2c2cm2c6c14cm4cm8cm8cm29c5cm11cm10_weight(0), c3c0c4c15c2c2cm2c6c14cm4cm8cm8cm29c5cm11cm10_weight(1));
    PL_STEP_0_for_cm19cm19cm6cm17cm19cm11c52cm7cm29cm2c41c1cm17c11c0c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm19cm19cm6cm17cm19cm11c52cm7cm29cm2c41c1cm17c11c0c6_weight(0), cm19cm19cm6cm17cm19cm11c52cm7cm29cm2c41c1cm17c11c0c6_weight(1));
    PL_STEP_0_for_cm7c0c6cm4cm3cm1c8c1cm1c1cm5cm19cm16cm2c9c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c0c6cm4cm3cm1c8c1cm1c1cm5cm19cm16cm2c9c10_weight(0), cm7c0c6cm4cm3cm1c8c1cm1c1cm5cm19cm16cm2c9c10_weight(1));
    PL_STEP_0_for_c0c0c2c0cm2c32cm6c4cm5c41c6cm7cm1cm5c4c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c2c0cm2c32cm6c4cm5c41c6cm7cm1cm5c4c2_weight(0), c0c0c2c0cm2c32cm6c4cm5c41c6cm7cm1cm5c4c2_weight(1));
    PL_STEP_0_for_cm13cm5cm9c11cm19cm3c0c6cm6c3c6cm3c1cm10c5c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13cm5cm9c11cm19cm3c0c6cm6c3c6cm3c1cm10c5c6_weight(0), cm13cm5cm9c11cm19cm3c0c6cm6c3c6cm3c1cm10c5c6_weight(1));
    PL_STEP_0_for_c4cm10cm1cm1c10cm6cm28c5c32cm7cm3cm28c0c11cm9c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm10cm1cm1c10cm6cm28c5c32cm7cm3cm28c0c11cm9c1_weight(0), c4cm10cm1cm1c10cm6cm28c5c32cm7cm3cm28c0c11cm9c1_weight(1));
    PL_STEP_0_for_c0cm12c5c16cm1c0c1cm2c10c2c0c9cm6cm2cm3c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm12c5c16cm1c0c1cm2c10c2c0c9cm6cm2cm3c9_weight(0), c0cm12c5c16cm1c0c1cm2c10c2c0c9cm6cm2cm3c9_weight(1));
    PL_STEP_0_for_c43c17c25cm4c11c9c21c11c11c34c10c26c10c2c14cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c43c17c25cm4c11c9c21c11c11c34c10c26c10c2c14cm11_weight(0), c43c17c25cm4c11c9c21c11c11c34c10c26c10c2c14cm11_weight(1));
    PL_STEP_0_for_c2cm7c0cm1c28cm1cm10c3c15cm8c14c5cm13cm7cm36c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm7c0cm1c28cm1cm10c3c15cm8c14c5cm13cm7cm36c2_weight(0), c2cm7c0cm1c28cm1cm10c3c15cm8c14c5cm13cm7cm36c2_weight(1));
    PL_STEP_0_for_c5cm1cm11c4c9c4c10c3c24c7c18c11c0cm6c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm1cm11c4c9c4c10c3c24c7c18c11c0cm6c0c1_weight(0), c5cm1cm11c4c9c4c10c3c24c7c18c11c0cm6c0c1_weight(1));
    PL_STEP_0_for_cm15cm12cm5cm2cm7cm22c1c8cm5cm4c70c0cm4c2cm4cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15cm12cm5cm2cm7cm22c1c8cm5cm4c70c0cm4c2cm4cm9_weight(0), cm15cm12cm5cm2cm7cm22c1c8cm5cm4c70c0cm4c2cm4cm9_weight(1));
    PL_STEP_0_for_cm1c1cm5cm51c0cm22cm5c3c6cm9c1c29c2cm1c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c1cm5cm51c0cm22cm5c3c6cm9c1c29c2cm1c1cm1_weight(0), cm1c1cm5cm51c0cm22cm5c3c6cm9c1c29c2cm1c1cm1_weight(1));
    PL_STEP_0_for_cm20cm24c8cm24cm22c4c55c0c4cm8cm5c22cm9c7cm6cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm20cm24c8cm24cm22c4c55c0c4cm8cm5c22cm9c7cm6cm7_weight(0), cm20cm24c8cm24cm22c4c55c0c4cm8cm5c22cm9c7cm6cm7_weight(1));
    PL_STEP_0_for_c9cm12cm18c13c7cm7c5c2c24c6cm13c7c16cm2cm3cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9cm12cm18c13c7cm7c5c2c24c6cm13c7c16cm2cm3cm6_weight(0), c9cm12cm18c13c7cm7c5c2c24c6cm13c7c16cm2cm3cm6_weight(1));
    PL_STEP_0_for_cm13c6cm24c11c4cm6c2cm5cm1c17c8cm7cm11cm11c3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c6cm24c11c4cm6c2cm5cm1c17c8cm7cm11cm11c3c0_weight(0), cm13c6cm24c11c4cm6c2cm5cm1c17c8cm7cm11cm11c3c0_weight(1));
    PL_STEP_0_for_cm4c2c2c12cm51c3c18cm9cm13c10c19cm18cm2c2cm4cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c2c2c12cm51c3c18cm9cm13c10c19cm18cm2c2cm4cm8_weight(0), cm4c2c2c12cm51c3c18cm9cm13c10c19cm18cm2c2cm4cm8_weight(1));
    PL_STEP_0_for_cm48c0cm38cm6c15c0c4cm3cm3cm1cm3cm1c0cm18cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm48c0cm38cm6c15c0c4cm3cm3cm1cm3cm1c0cm18cm1c0_weight(0), cm48c0cm38cm6c15c0c4cm3cm3cm1cm3cm1c0cm18cm1c0_weight(1));
    PL_STEP_0_for_c14cm4cm1cm3c16cm4c10c0c13c2c2c15c14c24c28c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14cm4cm1cm3c16cm4c10c0c13c2c2c15c14c24c28c9_weight(0), c14cm4cm1cm3c16cm4c10c0c13c2c2c15c14c24c28c9_weight(1));
    PL_STEP_0_for_c6cm16cm2c4c10c13c3c6c3c14c6cm7c2c16cm8cm21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm16cm2c4c10c13c3c6c3c14c6cm7c2c16cm8cm21_weight(0), c6cm16cm2c4c10c13c3c6c3c14c6cm7c2c16cm8cm21_weight(1));
    PL_STEP_0_for_cm1c13c3cm20cm11cm6cm6c3c7c0cm14cm36cm2cm8cm4c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c13c3cm20cm11cm6cm6c3c7c0cm14cm36cm2cm8cm4c12_weight(0), cm1c13c3cm20cm11cm6cm6c3c7c0cm14cm36cm2cm8cm4c12_weight(1));
    PL_STEP_0_for_c1c5c9c2c9c21c3c3c9c21c16c33c10cm27c43cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c5c9c2c9c21c3c3c9c21c16c33c10cm27c43cm13_weight(0), c1c5c9c2c9c21c3c3c9c21c16c33c10cm27c43cm13_weight(1));
    PL_STEP_0_for_cm12cm3c2c0cm12c12c6c6c6cm13cm5c13cm8c6cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12cm3c2c0cm12c12c6c6c6cm13cm5c13cm8c6cm1cm1_weight(0), cm12cm3c2c0cm12c12c6c6c6cm13cm5c13cm8c6cm1cm1_weight(1));
    PL_STEP_0_for_cm1c2cm11cm1c6c12cm4cm25cm11c10cm1cm10c1c2cm14cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c2cm11cm1c6c12cm4cm25cm11c10cm1cm10c1c2cm14cm8_weight(0), cm1c2cm11cm1c6c12cm4cm25cm11c10cm1cm10c1c2cm14cm8_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm2cm14cm14cm4cm6cm13c2cm4c8cm83cm6cm7c5cm2cm1c3_cm12cm3c2c0cm12c12c6c6c6cm13cm5c13cm8c6cm1cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm14cm14cm4cm6cm13c2cm4c8cm83cm6cm7c5cm2cm1c3_weight(1)(8-1 downto 0),
			B	=> cm12cm3c2c0cm12c12c6c6c6cm13cm5c13cm8c6cm1cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm14cm14cm4cm6cm13c2cm4c8cm83cm6cm7c5cm2cm1c3,
			CxB => R_cm12cm3c2c0cm12c12c6c6c6cm13cm5c13cm8c6cm1cm1
		);

    c127c1c10cm5c8cm4cm15c1c13c5c15cm3c2cm18cm1c0_cm1c2cm11cm1c6c12cm4cm25cm11c10cm1cm10c1c2cm14cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c127c1c10cm5c8cm4cm15c1c13c5c15cm3c2cm18cm1c0_weight(1)(8-1 downto 0),
			B	=> cm1c2cm11cm1c6c12cm4cm25cm11c10cm1cm10c1c2cm14cm8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c127c1c10cm5c8cm4cm15c1c13c5c15cm3c2cm18cm1c0,
			CxB => R_cm1c2cm11cm1c6c12cm4cm25cm11c10cm1cm10c1c2cm14cm8
		);

    cm24cm4c10cm4cm8cm10cm7c15c26c102cm3c8c6cm10cm4c8_c6cm16cm2c4c10c13c3c6c3c14c6cm7c2c16cm8cm21_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm24cm4c10cm4cm8cm10cm7c15c26c102cm3c8c6cm10cm4c8_weight(1)(8-1 downto 0),
			B	=> c6cm16cm2c4c10c13c3c6c3c14c6cm7c2c16cm8cm21_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm24cm4c10cm4cm8cm10cm7c15c26c102cm3c8c6cm10cm4c8,
			CxB => R_c6cm16cm2c4c10c13c3c6c3c14c6cm7c2c16cm8cm21
		);

    cm2c1c0cm20c3c16c1cm10c36c7cm104c16cm2c8cm14cm6_c14cm4cm1cm3c16cm4c10c0c13c2c2c15c14c24c28c9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c1c0cm20c3c16c1cm10c36c7cm104c16cm2c8cm14cm6_weight(1)(8-1 downto 0),
			B	=> c14cm4cm1cm3c16cm4c10c0c13c2c2c15c14c24c28c9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c1c0cm20c3c16c1cm10c36c7cm104c16cm2c8cm14cm6,
			CxB => R_c14cm4cm1cm3c16cm4c10c0c13c2c2c15c14c24c28c9
		);

    cm15cm12cm5cm2cm7cm22c1c8cm5cm4c70c0cm4c2cm4cm9_cm13c6cm24c11c4cm6c2cm5cm1c17c8cm7cm11cm11c3c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm15cm12cm5cm2cm7cm22c1c8cm5cm4c70c0cm4c2cm4cm9_weight(1)(8-1 downto 0),
			B	=> cm13c6cm24c11c4cm6c2cm5cm1c17c8cm7cm11cm11c3c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm15cm12cm5cm2cm7cm22c1c8cm5cm4c70c0cm4c2cm4cm9,
			CxB => R_cm13c6cm24c11c4cm6c2cm5cm1c17c8cm7cm11cm11c3c0
		);

    c5c2c3c35cm3cm12cm4cm5c23c2cm10cm5c31c4cm57cm9_c9cm12cm18c13c7cm7c5c2c24c6cm13c7c16cm2cm3cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5c2c3c35cm3cm12cm4cm5c23c2cm10cm5c31c4cm57cm9_weight(1)(7-1 downto 0),
			B	=> c9cm12cm18c13c7cm7c5c2c24c6cm13c7c16cm2cm3cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c2c3c35cm3cm12cm4cm5c23c2cm10cm5c31c4cm57cm9,
			CxB => R_c9cm12cm18c13c7cm7c5c2c24c6cm13c7c16cm2cm3cm6
		);

    c1c35cm6cm23c7cm2c2cm13cm22cm3cm1c2cm8cm2cm28cm4_c5cm1cm11c4c9c4c10c3c24c7c18c11c0cm6c0c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c35cm6cm23c7cm2c2cm13cm22cm3cm1c2cm8cm2cm28cm4_weight(1)(7-1 downto 0),
			B	=> c5cm1cm11c4c9c4c10c3c24c7c18c11c0cm6c0c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c35cm6cm23c7cm2c2cm13cm22cm3cm1c2cm8cm2cm28cm4,
			CxB => R_c5cm1cm11c4c9c4c10c3c24c7c18c11c0cm6c0c1
		);

    cm19cm19cm6cm17cm19cm11c52cm7cm29cm2c41c1cm17c11c0c6_c0cm12c5c16cm1c0c1cm2c10c2c0c9cm6cm2cm3c9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm19cm19cm6cm17cm19cm11c52cm7cm29cm2c41c1cm17c11c0c6_weight(1)(7-1 downto 0),
			B	=> c0cm12c5c16cm1c0c1cm2c10c2c0c9cm6cm2cm3c9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm19cm19cm6cm17cm19cm11c52cm7cm29cm2c41c1cm17c11c0c6,
			CxB => R_c0cm12c5c16cm1c0c1cm2c10c2c0c9cm6cm2cm3c9
		);

    c0c0c2c0cm2c32cm6c4cm5c41c6cm7cm1cm5c4c2_cm13cm5cm9c11cm19cm3c0c6cm6c3c6cm3c1cm10c5c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c0c2c0cm2c32cm6c4cm5c41c6cm7cm1cm5c4c2_weight(1)(7-1 downto 0),
			B	=> cm13cm5cm9c11cm19cm3c0c6cm6c3c6cm3c1cm10c5c6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0c2c0cm2c32cm6c4cm5c41c6cm7cm1cm5c4c2,
			CxB => R_cm13cm5cm9c11cm19cm3c0c6cm6c3c6cm3c1cm10c5c6
		);

    c4cm10cm1cm1c10cm6cm28c5c32cm7cm3cm28c0c11cm9c1_cm7c0c6cm4cm3cm1c8c1cm1c1cm5cm19cm16cm2c9c10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4cm10cm1cm1c10cm6cm28c5c32cm7cm3cm28c0c11cm9c1_weight(1)(7-1 downto 0),
			B	=> cm7c0c6cm4cm3cm1c8c1cm1c1cm5cm19cm16cm2c9c10_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4cm10cm1cm1c10cm6cm28c5c32cm7cm3cm28c0c11cm9c1,
			CxB => R_cm7c0c6cm4cm3cm1c8c1cm1c1cm5cm19cm16cm2c9c10
		);

    c43c17c25cm4c11c9c21c11c11c34c10c26c10c2c14cm11_c3c0c4c15c2c2cm2c6c14cm4cm8cm8cm29c5cm11cm10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c43c17c25cm4c11c9c21c11c11c34c10c26c10c2c14cm11_weight(1)(7-1 downto 0),
			B	=> c3c0c4c15c2c2cm2c6c14cm4cm8cm8cm29c5cm11cm10_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c43c17c25cm4c11c9c21c11c11c34c10c26c10c2c14cm11,
			CxB => R_c3c0c4c15c2c2cm2c6c14cm4cm8cm8cm29c5cm11cm10
		);

    c2cm7c0cm1c28cm1cm10c3c15cm8c14c5cm13cm7cm36c2_c16c11cm1cm13cm13cm1cm2c2cm22c12cm7cm9cm7c1cm5c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2cm7c0cm1c28cm1cm10c3c15cm8c14c5cm13cm7cm36c2_weight(1)(7-1 downto 0),
			B	=> c16c11cm1cm13cm13cm1cm2c2cm22c12cm7cm9cm7c1cm5c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm7c0cm1c28cm1cm10c3c15cm8c14c5cm13cm7cm36c2,
			CxB => R_c16c11cm1cm13cm13cm1cm2c2cm22c12cm7cm9cm7c1cm5c1
		);

    cm1c1cm5cm51c0cm22cm5c3c6cm9c1c29c2cm1c1cm1_cm2cm12cm13cm24cm1cm1c7c7c13c7c24cm1cm1cm10c3cm15_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c1cm5cm51c0cm22cm5c3c6cm9c1c29c2cm1c1cm1_weight(1)(7-1 downto 0),
			B	=> cm2cm12cm13cm24cm1cm1c7c7c13c7c24cm1cm1cm10c3cm15_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c1cm5cm51c0cm22cm5c3c6cm9c1c29c2cm1c1cm1,
			CxB => R_cm2cm12cm13cm24cm1cm1c7c7c13c7c24cm1cm1cm10c3cm15
		);

    cm20cm24c8cm24cm22c4c55c0c4cm8cm5c22cm9c7cm6cm7_c1c4c0c3cm2cm4cm3c1cm10c6c4c28cm21cm2cm9cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm20cm24c8cm24cm22c4c55c0c4cm8cm5c22cm9c7cm6cm7_weight(1)(7-1 downto 0),
			B	=> c1c4c0c3cm2cm4cm3c1cm10c6c4c28cm21cm2cm9cm8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm20cm24c8cm24cm22c4c55c0c4cm8cm5c22cm9c7cm6cm7,
			CxB => R_c1c4c0c3cm2cm4cm3c1cm10c6c4c28cm21cm2cm9cm8
		);

    cm4c2c2c12cm51c3c18cm9cm13c10c19cm18cm2c2cm4cm8_c1c5c9c2c9c21c3c3c9c21c16c33c10cm27c43cm13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4c2c2c12cm51c3c18cm9cm13c10c19cm18cm2c2cm4cm8_weight(1)(7-1 downto 0),
			B	=> c1c5c9c2c9c21c3c3c9c21c16c33c10cm27c43cm13_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4c2c2c12cm51c3c18cm9cm13c10c19cm18cm2c2cm4cm8,
			CxB => R_c1c5c9c2c9c21c3c3c9c21c16c33c10cm27c43cm13
		);

    cm48c0cm38cm6c15c0c4cm3cm3cm1cm3cm1c0cm18cm1c0_cm1c13c3cm20cm11cm6cm6c3c7c0cm14cm36cm2cm8cm4c12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm48c0cm38cm6c15c0c4cm3cm3cm1cm3cm1c0cm18cm1c0_weight(1)(7-1 downto 0),
			B	=> cm1c13c3cm20cm11cm6cm6c3c7c0cm14cm36cm2cm8cm4c12_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm48c0cm38cm6c15c0c4cm3cm3cm1cm3cm1c0cm18cm1c0,
			CxB => R_cm1c13c3cm20cm11cm6cm6c3c7c0cm14cm36cm2cm8cm4c12
		);




end architecture;
