library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core22_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c1c0c2c0cm3c2c3cm7cm1c4cm5c7c1c4c5c0 : out std_logic_vector(11-1 downto 0);   --	sfix(1, -10)
        R_c1cm12cm11cm8c16cm16c2c2cm1c5c8cm3c13c29cm20c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm8c3c8cm1c16c0c1cm3c4cm25cm8c2cm1cm11cm3cm9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm11c1cm42cm1c6c7c1c1c10c2c8cm2c15c2cm15c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm7cm16cm7cm18c0cm6c14cm1c5c6c6cm2c2c22c5c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2c2cm17cm13c10c7c8c18c0c4cm1c17c0c17c18c33 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c17c4c2cm16cm5c4cm6cm9cm9cm11c0cm12c15c4cm3c4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm11cm1c2cm27c7cm22cm14c6c4c29c7cm2c5c21c2cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c37cm6c16c38cm6c14c8cm12cm8cm3cm57c15c7cm3cm12cm11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2c1c20c13cm14cm4cm1cm6c5cm4c59c5cm3cm4c12c11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1c3cm31c1c0c1c7c1cm9cm1cm2c29cm18c0cm19cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c3c0c11c9cm28cm5c15cm5c1c2cm2cm3c7c4c9cm12 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c76cm6c0c6c11c12c6cm10cm20c2c4cm5c7c7cm6cm7 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm13cm3cm5c3cm20c2c4cm2cm13cm1cm1c0cm27c4c4cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm13c7c0c14cm11c8c5cm17c17cm17c0c9c1cm9c7cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1cm16cm6c2cm12c2c1cm10c0cm1cm1cm6c7c3cm4c8 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c2cm4cm1cm29cm1c9cm15c8cm10c2cm17cm8c3c26cm31c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2c2c3cm12c19c1c2c2cm5c0c3c29cm6cm2c9c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0cm5cm3cm1cm2cm8c7c7c0cm15c1c0c0c1c4c12 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c0c1c2c2c13cm9c4cm48c1cm3cm17c6c1c8cm22cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3c30c2cm4cm1c7cm15c0c1c6c2cm11cm1c28c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0cm33c40cm17cm1c2c12cm3cm5cm7cm4cm10c8cm7c17cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2c3cm21c11c7c2cm1c14cm6c5c7c26cm12c18cm4c6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm24cm22cm43cm2c1c23c10c0c9cm2c14cm4c12cm9cm6c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c7cm2c2c22cm7cm4cm3c4cm1c1c3c5cm4c0c5c11 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm13c2cm9cm4cm6c1cm2c6cm13c3cm14c6c11c3cm21c9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c4c4c4c8c9cm14c2cm42cm2c1c0c1c14cm6c5cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c12cm7cm8c1c0c10cm8c9c1cm11c9cm4c2cm9c18cm14 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm4cm1cm1c10cm1cm1cm6cm4cm10c0cm4c1cm4c10cm17cm16 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c11c7cm5cm4cm3cm3cm8c8c5c9cm6c9c5cm2c7c12 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c6c9c6cm5c13cm5cm11c34c6c2cm3cm3cm10c21cm3c14 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm21c5cm6c11c4c4cm19cm10c3c0cm6c3c5cm9c7c18 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core22_rmcm;

architecture arch of conv7_core22_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0C2C0CM3C2C3CM7CM1C4CM5C7C1C4C5C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM12CM11CM8C16CM16C2C2CM1C5C8CM3C13C29CM20C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8C3C8CM1C16C0C1CM3C4CM25CM8C2CM1CM11CM3CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11C1CM42CM1C6C7C1C1C10C2C8CM2C15C2CM15C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7CM16CM7CM18C0CM6C14CM1C5C6C6CM2C2C22C5C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C2CM17CM13C10C7C8C18C0C4CM1C17C0C17C18C33_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C17C4C2CM16CM5C4CM6CM9CM9CM11C0CM12C15C4CM3C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11CM1C2CM27C7CM22CM14C6C4C29C7CM2C5C21C2CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C37CM6C16C38CM6C14C8CM12CM8CM3CM57C15C7CM3CM12CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1C20C13CM14CM4CM1CM6C5CM4C59C5CM3CM4C12C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C3CM31C1C0C1C7C1CM9CM1CM2C29CM18C0CM19CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0C11C9CM28CM5C15CM5C1C2CM2CM3C7C4C9CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C76CM6C0C6C11C12C6CM10CM20C2C4CM5C7C7CM6CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13CM3CM5C3CM20C2C4CM2CM13CM1CM1C0CM27C4C4CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C7C0C14CM11C8C5CM17C17CM17C0C9C1CM9C7CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM16CM6C2CM12C2C1CM10C0CM1CM1CM6C7C3CM4C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM4CM1CM29CM1C9CM15C8CM10C2CM17CM8C3C26CM31C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C2C3CM12C19C1C2C2CM5C0C3C29CM6CM2C9C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM5CM3CM1CM2CM8C7C7C0CM15C1C0C0C1C4C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1C2C2C13CM9C4CM48C1CM3CM17C6C1C8CM22CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C30C2CM4CM1C7CM15C0C1C6C2CM11CM1C28C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM33C40CM17CM1C2C12CM3CM5CM7CM4CM10C8CM7C17CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C3CM21C11C7C2CM1C14CM6C5C7C26CM12C18CM4C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM24CM22CM43CM2C1C23C10C0C9CM2C14CM4C12CM9CM6C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM2C2C22CM7CM4CM3C4CM1C1C3C5CM4C0C5C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C2CM9CM4CM6C1CM2C6CM13C3CM14C6C11C3CM21C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C4C4C8C9CM14C2CM42CM2C1C0C1C14CM6C5CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12CM7CM8C1C0C10CM8C9C1CM11C9CM4C2CM9C18CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM1CM1C10CM1CM1CM6CM4CM10C0CM4C1CM4C10CM17CM16_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C7CM5CM4CM3CM3CM8C8C5C9CM6C9C5CM2C7C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C9C6CM5C13CM5CM11C34C6C2CM3CM3CM10C21CM3C14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM21C5CM6C11C4C4CM19CM10C3C0CM6C3C5CM9C7C18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c1c0c2c0cm3c2c3cm7cm1c4cm5c7c1c4c5c0_weight : PIPELINE_TYPE_FOR_C1C0C2C0CM3C2C3CM7CM1C4CM5C7C1C4C5C0_WEIGHT;
    -- sfix(1, -7)
    signal c1cm12cm11cm8c16cm16c2c2cm1c5c8cm3c13c29cm20c2_weight : PIPELINE_TYPE_FOR_C1CM12CM11CM8C16CM16C2C2CM1C5C8CM3C13C29CM20C2_WEIGHT;
    -- sfix(1, -7)
    signal cm8c3c8cm1c16c0c1cm3c4cm25cm8c2cm1cm11cm3cm9_weight : PIPELINE_TYPE_FOR_CM8C3C8CM1C16C0C1CM3C4CM25CM8C2CM1CM11CM3CM9_WEIGHT;
    -- sfix(1, -7)
    signal cm11c1cm42cm1c6c7c1c1c10c2c8cm2c15c2cm15c1_weight : PIPELINE_TYPE_FOR_CM11C1CM42CM1C6C7C1C1C10C2C8CM2C15C2CM15C1_WEIGHT;
    -- sfix(1, -7)
    signal cm7cm16cm7cm18c0cm6c14cm1c5c6c6cm2c2c22c5c0_weight : PIPELINE_TYPE_FOR_CM7CM16CM7CM18C0CM6C14CM1C5C6C6CM2C2C22C5C0_WEIGHT;
    -- sfix(1, -7)
    signal c2c2cm17cm13c10c7c8c18c0c4cm1c17c0c17c18c33_weight : PIPELINE_TYPE_FOR_C2C2CM17CM13C10C7C8C18C0C4CM1C17C0C17C18C33_WEIGHT;
    -- sfix(1, -7)
    signal c17c4c2cm16cm5c4cm6cm9cm9cm11c0cm12c15c4cm3c4_weight : PIPELINE_TYPE_FOR_C17C4C2CM16CM5C4CM6CM9CM9CM11C0CM12C15C4CM3C4_WEIGHT;
    -- sfix(1, -7)
    signal cm11cm1c2cm27c7cm22cm14c6c4c29c7cm2c5c21c2cm7_weight : PIPELINE_TYPE_FOR_CM11CM1C2CM27C7CM22CM14C6C4C29C7CM2C5C21C2CM7_WEIGHT;
    -- sfix(1, -7)
    signal c37cm6c16c38cm6c14c8cm12cm8cm3cm57c15c7cm3cm12cm11_weight : PIPELINE_TYPE_FOR_C37CM6C16C38CM6C14C8CM12CM8CM3CM57C15C7CM3CM12CM11_WEIGHT;
    -- sfix(1, -7)
    signal cm2c1c20c13cm14cm4cm1cm6c5cm4c59c5cm3cm4c12c11_weight : PIPELINE_TYPE_FOR_CM2C1C20C13CM14CM4CM1CM6C5CM4C59C5CM3CM4C12C11_WEIGHT;
    -- sfix(1, -7)
    signal cm1c3cm31c1c0c1c7c1cm9cm1cm2c29cm18c0cm19cm5_weight : PIPELINE_TYPE_FOR_CM1C3CM31C1C0C1C7C1CM9CM1CM2C29CM18C0CM19CM5_WEIGHT;
    -- sfix(1, -7)
    signal c3c0c11c9cm28cm5c15cm5c1c2cm2cm3c7c4c9cm12_weight : PIPELINE_TYPE_FOR_C3C0C11C9CM28CM5C15CM5C1C2CM2CM3C7C4C9CM12_WEIGHT;
    -- sfix(1, -7)
    signal c76cm6c0c6c11c12c6cm10cm20c2c4cm5c7c7cm6cm7_weight : PIPELINE_TYPE_FOR_C76CM6C0C6C11C12C6CM10CM20C2C4CM5C7C7CM6CM7_WEIGHT;
    -- sfix(1, -7)
    signal cm13cm3cm5c3cm20c2c4cm2cm13cm1cm1c0cm27c4c4cm2_weight : PIPELINE_TYPE_FOR_CM13CM3CM5C3CM20C2C4CM2CM13CM1CM1C0CM27C4C4CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm13c7c0c14cm11c8c5cm17c17cm17c0c9c1cm9c7cm3_weight : PIPELINE_TYPE_FOR_CM13C7C0C14CM11C8C5CM17C17CM17C0C9C1CM9C7CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm16cm6c2cm12c2c1cm10c0cm1cm1cm6c7c3cm4c8_weight : PIPELINE_TYPE_FOR_CM1CM16CM6C2CM12C2C1CM10C0CM1CM1CM6C7C3CM4C8_WEIGHT;
    -- sfix(1, -7)
    signal c2cm4cm1cm29cm1c9cm15c8cm10c2cm17cm8c3c26cm31c3_weight : PIPELINE_TYPE_FOR_C2CM4CM1CM29CM1C9CM15C8CM10C2CM17CM8C3C26CM31C3_WEIGHT;
    -- sfix(1, -7)
    signal c2c2c3cm12c19c1c2c2cm5c0c3c29cm6cm2c9c1_weight : PIPELINE_TYPE_FOR_C2C2C3CM12C19C1C2C2CM5C0C3C29CM6CM2C9C1_WEIGHT;
    -- sfix(1, -7)
    signal c0cm5cm3cm1cm2cm8c7c7c0cm15c1c0c0c1c4c12_weight : PIPELINE_TYPE_FOR_C0CM5CM3CM1CM2CM8C7C7C0CM15C1C0C0C1C4C12_WEIGHT;
    -- sfix(1, -7)
    signal c0c1c2c2c13cm9c4cm48c1cm3cm17c6c1c8cm22cm5_weight : PIPELINE_TYPE_FOR_C0C1C2C2C13CM9C4CM48C1CM3CM17C6C1C8CM22CM5_WEIGHT;
    -- sfix(1, -7)
    signal c3c30c2cm4cm1c7cm15c0c1c6c2cm11cm1c28c0c0_weight : PIPELINE_TYPE_FOR_C3C30C2CM4CM1C7CM15C0C1C6C2CM11CM1C28C0C0_WEIGHT;
    -- sfix(1, -7)
    signal c0cm33c40cm17cm1c2c12cm3cm5cm7cm4cm10c8cm7c17cm4_weight : PIPELINE_TYPE_FOR_C0CM33C40CM17CM1C2C12CM3CM5CM7CM4CM10C8CM7C17CM4_WEIGHT;
    -- sfix(1, -7)
    signal c2c3cm21c11c7c2cm1c14cm6c5c7c26cm12c18cm4c6_weight : PIPELINE_TYPE_FOR_C2C3CM21C11C7C2CM1C14CM6C5C7C26CM12C18CM4C6_WEIGHT;
    -- sfix(1, -7)
    signal cm24cm22cm43cm2c1c23c10c0c9cm2c14cm4c12cm9cm6c1_weight : PIPELINE_TYPE_FOR_CM24CM22CM43CM2C1C23C10C0C9CM2C14CM4C12CM9CM6C1_WEIGHT;
    -- sfix(1, -7)
    signal c7cm2c2c22cm7cm4cm3c4cm1c1c3c5cm4c0c5c11_weight : PIPELINE_TYPE_FOR_C7CM2C2C22CM7CM4CM3C4CM1C1C3C5CM4C0C5C11_WEIGHT;
    -- sfix(1, -7)
    signal cm13c2cm9cm4cm6c1cm2c6cm13c3cm14c6c11c3cm21c9_weight : PIPELINE_TYPE_FOR_CM13C2CM9CM4CM6C1CM2C6CM13C3CM14C6C11C3CM21C9_WEIGHT;
    -- sfix(1, -7)
    signal c4c4c4c8c9cm14c2cm42cm2c1c0c1c14cm6c5cm2_weight : PIPELINE_TYPE_FOR_C4C4C4C8C9CM14C2CM42CM2C1C0C1C14CM6C5CM2_WEIGHT;
    -- sfix(1, -7)
    signal c12cm7cm8c1c0c10cm8c9c1cm11c9cm4c2cm9c18cm14_weight : PIPELINE_TYPE_FOR_C12CM7CM8C1C0C10CM8C9C1CM11C9CM4C2CM9C18CM14_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm1cm1c10cm1cm1cm6cm4cm10c0cm4c1cm4c10cm17cm16_weight : PIPELINE_TYPE_FOR_CM4CM1CM1C10CM1CM1CM6CM4CM10C0CM4C1CM4C10CM17CM16_WEIGHT;
    -- sfix(1, -7)
    signal c11c7cm5cm4cm3cm3cm8c8c5c9cm6c9c5cm2c7c12_weight : PIPELINE_TYPE_FOR_C11C7CM5CM4CM3CM3CM8C8C5C9CM6C9C5CM2C7C12_WEIGHT;
    -- sfix(1, -7)
    signal c6c9c6cm5c13cm5cm11c34c6c2cm3cm3cm10c21cm3c14_weight : PIPELINE_TYPE_FOR_C6C9C6CM5C13CM5CM11C34C6C2CM3CM3CM10C21CM3C14_WEIGHT;
    -- sfix(1, -7)
    signal cm21c5cm6c11c4c4cm19cm10c3c0cm6c3c5cm9c7c18_weight : PIPELINE_TYPE_FOR_CM21C5CM6C11C4C4CM19CM10C3C0CM6C3C5CM9C7C18_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core22_rmcm_weightsconstant_memory
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
        
            dout1   => c1c0c2c0cm3c2c3cm7cm1c4cm5c7c1c4c5c0_weight(0), 
            dout2   => c1cm12cm11cm8c16cm16c2c2cm1c5c8cm3c13c29cm20c2_weight(0), 
            dout3   => cm8c3c8cm1c16c0c1cm3c4cm25cm8c2cm1cm11cm3cm9_weight(0), 
            dout4   => cm11c1cm42cm1c6c7c1c1c10c2c8cm2c15c2cm15c1_weight(0), 
            dout5   => cm7cm16cm7cm18c0cm6c14cm1c5c6c6cm2c2c22c5c0_weight(0), 
            dout6   => c2c2cm17cm13c10c7c8c18c0c4cm1c17c0c17c18c33_weight(0), 
            dout7   => c17c4c2cm16cm5c4cm6cm9cm9cm11c0cm12c15c4cm3c4_weight(0), 
            dout8   => cm11cm1c2cm27c7cm22cm14c6c4c29c7cm2c5c21c2cm7_weight(0), 
            dout9   => c37cm6c16c38cm6c14c8cm12cm8cm3cm57c15c7cm3cm12cm11_weight(0), 
            dout10   => cm2c1c20c13cm14cm4cm1cm6c5cm4c59c5cm3cm4c12c11_weight(0), 
            dout11   => cm1c3cm31c1c0c1c7c1cm9cm1cm2c29cm18c0cm19cm5_weight(0), 
            dout12   => c3c0c11c9cm28cm5c15cm5c1c2cm2cm3c7c4c9cm12_weight(0), 
            dout13   => c76cm6c0c6c11c12c6cm10cm20c2c4cm5c7c7cm6cm7_weight(0), 
            dout14   => cm13cm3cm5c3cm20c2c4cm2cm13cm1cm1c0cm27c4c4cm2_weight(0), 
            dout15   => cm13c7c0c14cm11c8c5cm17c17cm17c0c9c1cm9c7cm3_weight(0), 
            dout16   => cm1cm16cm6c2cm12c2c1cm10c0cm1cm1cm6c7c3cm4c8_weight(0), 
            dout17   => c2cm4cm1cm29cm1c9cm15c8cm10c2cm17cm8c3c26cm31c3_weight(0), 
            dout18   => c2c2c3cm12c19c1c2c2cm5c0c3c29cm6cm2c9c1_weight(0), 
            dout19   => c0cm5cm3cm1cm2cm8c7c7c0cm15c1c0c0c1c4c12_weight(0), 
            dout20   => c0c1c2c2c13cm9c4cm48c1cm3cm17c6c1c8cm22cm5_weight(0), 
            dout21   => c3c30c2cm4cm1c7cm15c0c1c6c2cm11cm1c28c0c0_weight(0), 
            dout22   => c0cm33c40cm17cm1c2c12cm3cm5cm7cm4cm10c8cm7c17cm4_weight(0), 
            dout23   => c2c3cm21c11c7c2cm1c14cm6c5c7c26cm12c18cm4c6_weight(0), 
            dout24   => cm24cm22cm43cm2c1c23c10c0c9cm2c14cm4c12cm9cm6c1_weight(0), 
            dout25   => c7cm2c2c22cm7cm4cm3c4cm1c1c3c5cm4c0c5c11_weight(0), 
            dout26   => cm13c2cm9cm4cm6c1cm2c6cm13c3cm14c6c11c3cm21c9_weight(0), 
            dout27   => c4c4c4c8c9cm14c2cm42cm2c1c0c1c14cm6c5cm2_weight(0), 
            dout28   => c12cm7cm8c1c0c10cm8c9c1cm11c9cm4c2cm9c18cm14_weight(0), 
            dout29   => cm4cm1cm1c10cm1cm1cm6cm4cm10c0cm4c1cm4c10cm17cm16_weight(0), 
            dout30   => c11c7cm5cm4cm3cm3cm8c8c5c9cm6c9c5cm2c7c12_weight(0), 
            dout31   => c6c9c6cm5c13cm5cm11c34c6c2cm3cm3cm10c21cm3c14_weight(0), 
            dout32   => cm21c5cm6c11c4c4cm19cm10c3c0cm6c3c5cm9c7c18_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c1c0c2c0cm3c2c3cm7cm1c4cm5c7c1c4c5c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0c2c0cm3c2c3cm7cm1c4cm5c7c1c4c5c0_weight(0), c1c0c2c0cm3c2c3cm7cm1c4cm5c7c1c4c5c0_weight(1));
    PL_STEP_0_for_c1cm12cm11cm8c16cm16c2c2cm1c5c8cm3c13c29cm20c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm12cm11cm8c16cm16c2c2cm1c5c8cm3c13c29cm20c2_weight(0), c1cm12cm11cm8c16cm16c2c2cm1c5c8cm3c13c29cm20c2_weight(1));
    PL_STEP_0_for_cm8c3c8cm1c16c0c1cm3c4cm25cm8c2cm1cm11cm3cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8c3c8cm1c16c0c1cm3c4cm25cm8c2cm1cm11cm3cm9_weight(0), cm8c3c8cm1c16c0c1cm3c4cm25cm8c2cm1cm11cm3cm9_weight(1));
    PL_STEP_0_for_cm11c1cm42cm1c6c7c1c1c10c2c8cm2c15c2cm15c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11c1cm42cm1c6c7c1c1c10c2c8cm2c15c2cm15c1_weight(0), cm11c1cm42cm1c6c7c1c1c10c2c8cm2c15c2cm15c1_weight(1));
    PL_STEP_0_for_cm7cm16cm7cm18c0cm6c14cm1c5c6c6cm2c2c22c5c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7cm16cm7cm18c0cm6c14cm1c5c6c6cm2c2c22c5c0_weight(0), cm7cm16cm7cm18c0cm6c14cm1c5c6c6cm2c2c22c5c0_weight(1));
    PL_STEP_0_for_c2c2cm17cm13c10c7c8c18c0c4cm1c17c0c17c18c33_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c2cm17cm13c10c7c8c18c0c4cm1c17c0c17c18c33_weight(0), c2c2cm17cm13c10c7c8c18c0c4cm1c17c0c17c18c33_weight(1));
    PL_STEP_0_for_c17c4c2cm16cm5c4cm6cm9cm9cm11c0cm12c15c4cm3c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c17c4c2cm16cm5c4cm6cm9cm9cm11c0cm12c15c4cm3c4_weight(0), c17c4c2cm16cm5c4cm6cm9cm9cm11c0cm12c15c4cm3c4_weight(1));
    PL_STEP_0_for_cm11cm1c2cm27c7cm22cm14c6c4c29c7cm2c5c21c2cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11cm1c2cm27c7cm22cm14c6c4c29c7cm2c5c21c2cm7_weight(0), cm11cm1c2cm27c7cm22cm14c6c4c29c7cm2c5c21c2cm7_weight(1));
    PL_STEP_0_for_c37cm6c16c38cm6c14c8cm12cm8cm3cm57c15c7cm3cm12cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c37cm6c16c38cm6c14c8cm12cm8cm3cm57c15c7cm3cm12cm11_weight(0), c37cm6c16c38cm6c14c8cm12cm8cm3cm57c15c7cm3cm12cm11_weight(1));
    PL_STEP_0_for_cm2c1c20c13cm14cm4cm1cm6c5cm4c59c5cm3cm4c12c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1c20c13cm14cm4cm1cm6c5cm4c59c5cm3cm4c12c11_weight(0), cm2c1c20c13cm14cm4cm1cm6c5cm4c59c5cm3cm4c12c11_weight(1));
    PL_STEP_0_for_cm1c3cm31c1c0c1c7c1cm9cm1cm2c29cm18c0cm19cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c3cm31c1c0c1c7c1cm9cm1cm2c29cm18c0cm19cm5_weight(0), cm1c3cm31c1c0c1c7c1cm9cm1cm2c29cm18c0cm19cm5_weight(1));
    PL_STEP_0_for_c3c0c11c9cm28cm5c15cm5c1c2cm2cm3c7c4c9cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0c11c9cm28cm5c15cm5c1c2cm2cm3c7c4c9cm12_weight(0), c3c0c11c9cm28cm5c15cm5c1c2cm2cm3c7c4c9cm12_weight(1));
    PL_STEP_0_for_c76cm6c0c6c11c12c6cm10cm20c2c4cm5c7c7cm6cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c76cm6c0c6c11c12c6cm10cm20c2c4cm5c7c7cm6cm7_weight(0), c76cm6c0c6c11c12c6cm10cm20c2c4cm5c7c7cm6cm7_weight(1));
    PL_STEP_0_for_cm13cm3cm5c3cm20c2c4cm2cm13cm1cm1c0cm27c4c4cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13cm3cm5c3cm20c2c4cm2cm13cm1cm1c0cm27c4c4cm2_weight(0), cm13cm3cm5c3cm20c2c4cm2cm13cm1cm1c0cm27c4c4cm2_weight(1));
    PL_STEP_0_for_cm13c7c0c14cm11c8c5cm17c17cm17c0c9c1cm9c7cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c7c0c14cm11c8c5cm17c17cm17c0c9c1cm9c7cm3_weight(0), cm13c7c0c14cm11c8c5cm17c17cm17c0c9c1cm9c7cm3_weight(1));
    PL_STEP_0_for_cm1cm16cm6c2cm12c2c1cm10c0cm1cm1cm6c7c3cm4c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm16cm6c2cm12c2c1cm10c0cm1cm1cm6c7c3cm4c8_weight(0), cm1cm16cm6c2cm12c2c1cm10c0cm1cm1cm6c7c3cm4c8_weight(1));
    PL_STEP_0_for_c2cm4cm1cm29cm1c9cm15c8cm10c2cm17cm8c3c26cm31c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm4cm1cm29cm1c9cm15c8cm10c2cm17cm8c3c26cm31c3_weight(0), c2cm4cm1cm29cm1c9cm15c8cm10c2cm17cm8c3c26cm31c3_weight(1));
    PL_STEP_0_for_c2c2c3cm12c19c1c2c2cm5c0c3c29cm6cm2c9c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c2c3cm12c19c1c2c2cm5c0c3c29cm6cm2c9c1_weight(0), c2c2c3cm12c19c1c2c2cm5c0c3c29cm6cm2c9c1_weight(1));
    PL_STEP_0_for_c0cm5cm3cm1cm2cm8c7c7c0cm15c1c0c0c1c4c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm5cm3cm1cm2cm8c7c7c0cm15c1c0c0c1c4c12_weight(0), c0cm5cm3cm1cm2cm8c7c7c0cm15c1c0c0c1c4c12_weight(1));
    PL_STEP_0_for_c0c1c2c2c13cm9c4cm48c1cm3cm17c6c1c8cm22cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1c2c2c13cm9c4cm48c1cm3cm17c6c1c8cm22cm5_weight(0), c0c1c2c2c13cm9c4cm48c1cm3cm17c6c1c8cm22cm5_weight(1));
    PL_STEP_0_for_c3c30c2cm4cm1c7cm15c0c1c6c2cm11cm1c28c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c30c2cm4cm1c7cm15c0c1c6c2cm11cm1c28c0c0_weight(0), c3c30c2cm4cm1c7cm15c0c1c6c2cm11cm1c28c0c0_weight(1));
    PL_STEP_0_for_c0cm33c40cm17cm1c2c12cm3cm5cm7cm4cm10c8cm7c17cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm33c40cm17cm1c2c12cm3cm5cm7cm4cm10c8cm7c17cm4_weight(0), c0cm33c40cm17cm1c2c12cm3cm5cm7cm4cm10c8cm7c17cm4_weight(1));
    PL_STEP_0_for_c2c3cm21c11c7c2cm1c14cm6c5c7c26cm12c18cm4c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c3cm21c11c7c2cm1c14cm6c5c7c26cm12c18cm4c6_weight(0), c2c3cm21c11c7c2cm1c14cm6c5c7c26cm12c18cm4c6_weight(1));
    PL_STEP_0_for_cm24cm22cm43cm2c1c23c10c0c9cm2c14cm4c12cm9cm6c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm24cm22cm43cm2c1c23c10c0c9cm2c14cm4c12cm9cm6c1_weight(0), cm24cm22cm43cm2c1c23c10c0c9cm2c14cm4c12cm9cm6c1_weight(1));
    PL_STEP_0_for_c7cm2c2c22cm7cm4cm3c4cm1c1c3c5cm4c0c5c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm2c2c22cm7cm4cm3c4cm1c1c3c5cm4c0c5c11_weight(0), c7cm2c2c22cm7cm4cm3c4cm1c1c3c5cm4c0c5c11_weight(1));
    PL_STEP_0_for_cm13c2cm9cm4cm6c1cm2c6cm13c3cm14c6c11c3cm21c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c2cm9cm4cm6c1cm2c6cm13c3cm14c6c11c3cm21c9_weight(0), cm13c2cm9cm4cm6c1cm2c6cm13c3cm14c6c11c3cm21c9_weight(1));
    PL_STEP_0_for_c4c4c4c8c9cm14c2cm42cm2c1c0c1c14cm6c5cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c4c4c8c9cm14c2cm42cm2c1c0c1c14cm6c5cm2_weight(0), c4c4c4c8c9cm14c2cm42cm2c1c0c1c14cm6c5cm2_weight(1));
    PL_STEP_0_for_c12cm7cm8c1c0c10cm8c9c1cm11c9cm4c2cm9c18cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12cm7cm8c1c0c10cm8c9c1cm11c9cm4c2cm9c18cm14_weight(0), c12cm7cm8c1c0c10cm8c9c1cm11c9cm4c2cm9c18cm14_weight(1));
    PL_STEP_0_for_cm4cm1cm1c10cm1cm1cm6cm4cm10c0cm4c1cm4c10cm17cm16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm1cm1c10cm1cm1cm6cm4cm10c0cm4c1cm4c10cm17cm16_weight(0), cm4cm1cm1c10cm1cm1cm6cm4cm10c0cm4c1cm4c10cm17cm16_weight(1));
    PL_STEP_0_for_c11c7cm5cm4cm3cm3cm8c8c5c9cm6c9c5cm2c7c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c7cm5cm4cm3cm3cm8c8c5c9cm6c9c5cm2c7c12_weight(0), c11c7cm5cm4cm3cm3cm8c8c5c9cm6c9c5cm2c7c12_weight(1));
    PL_STEP_0_for_c6c9c6cm5c13cm5cm11c34c6c2cm3cm3cm10c21cm3c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c9c6cm5c13cm5cm11c34c6c2cm3cm3cm10c21cm3c14_weight(0), c6c9c6cm5c13cm5cm11c34c6c2cm3cm3cm10c21cm3c14_weight(1));
    PL_STEP_0_for_cm21c5cm6c11c4c4cm19cm10c3c0cm6c3c5cm9c7c18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm21c5cm6c11c4c4cm19cm10c3c0cm6c3c5cm9c7c18_weight(0), cm21c5cm6c11c4c4cm19cm10c3c0cm6c3c5cm9c7c18_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c76cm6c0c6c11c12c6cm10cm20c2c4cm5c7c7cm6cm7_c1c0c2c0cm3c2c3cm7cm1c4cm5c7c1c4c5c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c76cm6c0c6c11c12c6cm10cm20c2c4cm5c7c7cm6cm7_weight(1)(8-1 downto 0),
			B	=> c1c0c2c0cm3c2c3cm7cm1c4cm5c7c1c4c5c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c76cm6c0c6c11c12c6cm10cm20c2c4cm5c7c7cm6cm7,
			CxB => R_c1c0c2c0cm3c2c3cm7cm1c4cm5c7c1c4c5c0
		);

    cm11c1cm42cm1c6c7c1c1c10c2c8cm2c15c2cm15c1_c11c7cm5cm4cm3cm3cm8c8c5c9cm6c9c5cm2c7c12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm11c1cm42cm1c6c7c1c1c10c2c8cm2c15c2cm15c1_weight(1)(7-1 downto 0),
			B	=> c11c7cm5cm4cm3cm3cm8c8c5c9cm6c9c5cm2c7c12_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm11c1cm42cm1c6c7c1c1c10c2c8cm2c15c2cm15c1,
			CxB => R_c11c7cm5cm4cm3cm3cm8c8c5c9cm6c9c5cm2c7c12
		);

    c2c2cm17cm13c10c7c8c18c0c4cm1c17c0c17c18c33_c0cm5cm3cm1cm2cm8c7c7c0cm15c1c0c0c1c4c12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c2cm17cm13c10c7c8c18c0c4cm1c17c0c17c18c33_weight(1)(7-1 downto 0),
			B	=> c0cm5cm3cm1cm2cm8c7c7c0cm15c1c0c0c1c4c12_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c2cm17cm13c10c7c8c18c0c4cm1c17c0c17c18c33,
			CxB => R_c0cm5cm3cm1cm2cm8c7c7c0cm15c1c0c0c1c4c12
		);

    c37cm6c16c38cm6c14c8cm12cm8cm3cm57c15c7cm3cm12cm11_cm1cm16cm6c2cm12c2c1cm10c0cm1cm1cm6c7c3cm4c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c37cm6c16c38cm6c14c8cm12cm8cm3cm57c15c7cm3cm12cm11_weight(1)(7-1 downto 0),
			B	=> cm1cm16cm6c2cm12c2c1cm10c0cm1cm1cm6c7c3cm4c8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c37cm6c16c38cm6c14c8cm12cm8cm3cm57c15c7cm3cm12cm11,
			CxB => R_cm1cm16cm6c2cm12c2c1cm10c0cm1cm1cm6c7c3cm4c8
		);

    cm2c1c20c13cm14cm4cm1cm6c5cm4c59c5cm3cm4c12c11_cm21c5cm6c11c4c4cm19cm10c3c0cm6c3c5cm9c7c18_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c1c20c13cm14cm4cm1cm6c5cm4c59c5cm3cm4c12c11_weight(1)(7-1 downto 0),
			B	=> cm21c5cm6c11c4c4cm19cm10c3c0cm6c3c5cm9c7c18_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c1c20c13cm14cm4cm1cm6c5cm4c59c5cm3cm4c12c11,
			CxB => R_cm21c5cm6c11c4c4cm19cm10c3c0cm6c3c5cm9c7c18
		);

    c0c1c2c2c13cm9c4cm48c1cm3cm17c6c1c8cm22cm5_cm4cm1cm1c10cm1cm1cm6cm4cm10c0cm4c1cm4c10cm17cm16_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c1c2c2c13cm9c4cm48c1cm3cm17c6c1c8cm22cm5_weight(1)(7-1 downto 0),
			B	=> cm4cm1cm1c10cm1cm1cm6cm4cm10c0cm4c1cm4c10cm17cm16_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c1c2c2c13cm9c4cm48c1cm3cm17c6c1c8cm22cm5,
			CxB => R_cm4cm1cm1c10cm1cm1cm6cm4cm10c0cm4c1cm4c10cm17cm16
		);

    c0cm33c40cm17cm1c2c12cm3cm5cm7cm4cm10c8cm7c17cm4_c12cm7cm8c1c0c10cm8c9c1cm11c9cm4c2cm9c18cm14_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm33c40cm17cm1c2c12cm3cm5cm7cm4cm10c8cm7c17cm4_weight(1)(7-1 downto 0),
			B	=> c12cm7cm8c1c0c10cm8c9c1cm11c9cm4c2cm9c18cm14_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm33c40cm17cm1c2c12cm3cm5cm7cm4cm10c8cm7c17cm4,
			CxB => R_c12cm7cm8c1c0c10cm8c9c1cm11c9cm4c2cm9c18cm14
		);

    cm24cm22cm43cm2c1c23c10c0c9cm2c14cm4c12cm9cm6c1_cm13c2cm9cm4cm6c1cm2c6cm13c3cm14c6c11c3cm21c9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm24cm22cm43cm2c1c23c10c0c9cm2c14cm4c12cm9cm6c1_weight(1)(7-1 downto 0),
			B	=> cm13c2cm9cm4cm6c1cm2c6cm13c3cm14c6c11c3cm21c9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm24cm22cm43cm2c1c23c10c0c9cm2c14cm4c12cm9cm6c1,
			CxB => R_cm13c2cm9cm4cm6c1cm2c6cm13c3cm14c6c11c3cm21c9
		);

    c4c4c4c8c9cm14c2cm42cm2c1c0c1c14cm6c5cm2_c7cm2c2c22cm7cm4cm3c4cm1c1c3c5cm4c0c5c11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c4c4c8c9cm14c2cm42cm2c1c0c1c14cm6c5cm2_weight(1)(7-1 downto 0),
			B	=> c7cm2c2c22cm7cm4cm3c4cm1c1c3c5cm4c0c5c11_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c4c4c8c9cm14c2cm42cm2c1c0c1c14cm6c5cm2,
			CxB => R_c7cm2c2c22cm7cm4cm3c4cm1c1c3c5cm4c0c5c11
		);

    c6c9c6cm5c13cm5cm11c34c6c2cm3cm3cm10c21cm3c14_c2c3cm21c11c7c2cm1c14cm6c5c7c26cm12c18cm4c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6c9c6cm5c13cm5cm11c34c6c2cm3cm3cm10c21cm3c14_weight(1)(7-1 downto 0),
			B	=> c2c3cm21c11c7c2cm1c14cm6c5c7c26cm12c18cm4c6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6c9c6cm5c13cm5cm11c34c6c2cm3cm3cm10c21cm3c14,
			CxB => R_c2c3cm21c11c7c2cm1c14cm6c5c7c26cm12c18cm4c6
		);

    c1cm12cm11cm8c16cm16c2c2cm1c5c8cm3c13c29cm20c2_c3c30c2cm4cm1c7cm15c0c1c6c2cm11cm1c28c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm12cm11cm8c16cm16c2c2cm1c5c8cm3c13c29cm20c2_weight(1)(6-1 downto 0),
			B	=> c3c30c2cm4cm1c7cm15c0c1c6c2cm11cm1c28c0c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm12cm11cm8c16cm16c2c2cm1c5c8cm3c13c29cm20c2,
			CxB => R_c3c30c2cm4cm1c7cm15c0c1c6c2cm11cm1c28c0c0
		);

    cm8c3c8cm1c16c0c1cm3c4cm25cm8c2cm1cm11cm3cm9_c2c2c3cm12c19c1c2c2cm5c0c3c29cm6cm2c9c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm8c3c8cm1c16c0c1cm3c4cm25cm8c2cm1cm11cm3cm9_weight(1)(6-1 downto 0),
			B	=> c2c2c3cm12c19c1c2c2cm5c0c3c29cm6cm2c9c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm8c3c8cm1c16c0c1cm3c4cm25cm8c2cm1cm11cm3cm9,
			CxB => R_c2c2c3cm12c19c1c2c2cm5c0c3c29cm6cm2c9c1
		);

    cm7cm16cm7cm18c0cm6c14cm1c5c6c6cm2c2c22c5c0_c2cm4cm1cm29cm1c9cm15c8cm10c2cm17cm8c3c26cm31c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm7cm16cm7cm18c0cm6c14cm1c5c6c6cm2c2c22c5c0_weight(1)(6-1 downto 0),
			B	=> c2cm4cm1cm29cm1c9cm15c8cm10c2cm17cm8c3c26cm31c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7cm16cm7cm18c0cm6c14cm1c5c6c6cm2c2c22c5c0,
			CxB => R_c2cm4cm1cm29cm1c9cm15c8cm10c2cm17cm8c3c26cm31c3
		);

    c17c4c2cm16cm5c4cm6cm9cm9cm11c0cm12c15c4cm3c4_cm13c7c0c14cm11c8c5cm17c17cm17c0c9c1cm9c7cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c17c4c2cm16cm5c4cm6cm9cm9cm11c0cm12c15c4cm3c4_weight(1)(6-1 downto 0),
			B	=> cm13c7c0c14cm11c8c5cm17c17cm17c0c9c1cm9c7cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c17c4c2cm16cm5c4cm6cm9cm9cm11c0cm12c15c4cm3c4,
			CxB => R_cm13c7c0c14cm11c8c5cm17c17cm17c0c9c1cm9c7cm3
		);

    cm11cm1c2cm27c7cm22cm14c6c4c29c7cm2c5c21c2cm7_cm13cm3cm5c3cm20c2c4cm2cm13cm1cm1c0cm27c4c4cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm11cm1c2cm27c7cm22cm14c6c4c29c7cm2c5c21c2cm7_weight(1)(6-1 downto 0),
			B	=> cm13cm3cm5c3cm20c2c4cm2cm13cm1cm1c0cm27c4c4cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm11cm1c2cm27c7cm22cm14c6c4c29c7cm2c5c21c2cm7,
			CxB => R_cm13cm3cm5c3cm20c2c4cm2cm13cm1cm1c0cm27c4c4cm2
		);

    cm1c3cm31c1c0c1c7c1cm9cm1cm2c29cm18c0cm19cm5_c3c0c11c9cm28cm5c15cm5c1c2cm2cm3c7c4c9cm12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c3cm31c1c0c1c7c1cm9cm1cm2c29cm18c0cm19cm5_weight(1)(6-1 downto 0),
			B	=> c3c0c11c9cm28cm5c15cm5c1c2cm2cm3c7c4c9cm12_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c3cm31c1c0c1c7c1cm9cm1cm2c29cm18c0cm19cm5,
			CxB => R_c3c0c11c9cm28cm5c15cm5c1c2cm2cm3c7c4c9cm12
		);




end architecture;
