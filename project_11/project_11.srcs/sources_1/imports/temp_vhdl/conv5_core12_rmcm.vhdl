library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core12_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c0cm1c2c2cm1cm2cm2c0cm1c0c2c0c3cm1c1c0 : out std_logic_vector(10-1 downto 0);   --	sfix(2, -8)
        R_c8c4cm25c2c5c5cm14c8cm2cm3cm29c1c4c2c1c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1c5cm18cm7c7c0c3c10cm1c2cm2c10c0c3cm1c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c2cm1c15cm1c1c2cm18c89c0cm3cm2c52c18cm5cm4cm1 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c2c1cm13cm8cm3c1c39cm2cm1c0c0cm7cm21c0cm2cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm1cm1cm1c3c1c12cm10c1c2cm5cm15c2cm7c1cm1c19 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm13cm1cm3c1c2cm2cm18c0cm1cm1cm50c0c0c56c4c0 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm4c1cm5c37cm4cm2c0c2c3c1cm1cm14cm1cm1cm1c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c5c1c2c5c22c0cm11c2c16c0c5cm1cm3cm2cm3cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3c2c3c5cm2cm14cm12c2c0cm26c5cm1cm20c0cm5c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2cm5cm2cm2c1cm2cm7c41c0cm2c8c23c0cm4c3c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c2cm1c2cm3cm6cm28cm1c1c3cm51c1cm1cm6c3c4c0 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1c0cm2cm13c0cm2c20c1c0c0cm9cm1cm2c2c12c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm4c0c1c10cm1c0cm4cm2cm2cm2c2c5c4c0cm3cm3 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c28c2c8c2cm8c1c0cm2cm1cm2c0c3cm1c6c16c16 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm5cm18cm14c2c1c3c7c1c1cm2cm5c1c0c1c1c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c5cm2c5cm3c0c2c12cm2c2cm1c10cm1cm86c0cm1cm9 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm3cm5c0c26c1cm6c1cm9cm1c2c0c4cm1c1c0cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm7cm5c7c0cm3c4cm5c7cm3c0c4cm2c0cm6cm7c1 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_cm4c0cm1c3c0cm2c6c1c0c0cm5c0cm1c2c0c3 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_cm12c0c34cm24cm7c0cm1cm7cm1cm1cm7c2cm1cm3cm2c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1c1cm1c2cm2cm3cm1cm23c2c89c1c19cm4cm1cm7c3 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm26cm6c5cm2cm6c0c72c1c7cm1c30cm1cm5cm1c0cm3 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c0cm1c5c0c1c4cm1cm1cm1cm1c2c2cm25c4c5c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c2cm6c1c10cm5cm5cm1c52c3c3c1c9cm1c4cm3cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm3c1c1cm12cm8c4c1cm2cm17cm2c0c1c0cm1cm6cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm16c5c1c1cm9c3c3cm9cm23cm2cm4cm22cm1c0c5c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm29c0c2c19c1cm1cm1c7c1cm2cm1cm9c2cm2cm1c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3c0c0c4c5cm4c15c1cm2cm2cm7cm2c2c1cm2c1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm3cm4c3c1c4cm1c3c0cm5c1cm2c0c2c0cm2cm4 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_cm40cm6cm2c2cm28c26cm3c0cm37c22c3c0c6c3c0c2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c4c4cm16c2c2cm15cm6cm1cm1c1cm17c0cm1c3cm3c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core12_rmcm;

architecture arch of conv5_core12_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C2C2CM1CM2CM2C0CM1C0C2C0C3CM1C1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C4CM25C2C5C5CM14C8CM2CM3CM29C1C4C2C1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C5CM18CM7C7C0C3C10CM1C2CM2C10C0C3CM1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM1C15CM1C1C2CM18C89C0CM3CM2C52C18CM5CM4CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1CM13CM8CM3C1C39CM2CM1C0C0CM7CM21C0CM2CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1CM1C3C1C12CM10C1C2CM5CM15C2CM7C1CM1C19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13CM1CM3C1C2CM2CM18C0CM1CM1CM50C0C0C56C4C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C1CM5C37CM4CM2C0C2C3C1CM1CM14CM1CM1CM1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C1C2C5C22C0CM11C2C16C0C5CM1CM3CM2CM3CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C2C3C5CM2CM14CM12C2C0CM26C5CM1CM20C0CM5C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM5CM2CM2C1CM2CM7C41C0CM2C8C23C0CM4C3C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM1C2CM3CM6CM28CM1C1C3CM51C1CM1CM6C3C4C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0CM2CM13C0CM2C20C1C0C0CM9CM1CM2C2C12C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C0C1C10CM1C0CM4CM2CM2CM2C2C5C4C0CM3CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C28C2C8C2CM8C1C0CM2CM1CM2C0C3CM1C6C16C16_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM18CM14C2C1C3C7C1C1CM2CM5C1C0C1C1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM2C5CM3C0C2C12CM2C2CM1C10CM1CM86C0CM1CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM5C0C26C1CM6C1CM9CM1C2C0C4CM1C1C0CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7CM5C7C0CM3C4CM5C7CM3C0C4CM2C0CM6CM7C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C0CM1C3C0CM2C6C1C0C0CM5C0CM1C2C0C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12C0C34CM24CM7C0CM1CM7CM1CM1CM7C2CM1CM3CM2C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1CM1C2CM2CM3CM1CM23C2C89C1C19CM4CM1CM7C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM26CM6C5CM2CM6C0C72C1C7CM1C30CM1CM5CM1C0CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C5C0C1C4CM1CM1CM1CM1C2C2CM25C4C5C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM6C1C10CM5CM5CM1C52C3C3C1C9CM1C4CM3CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C1C1CM12CM8C4C1CM2CM17CM2C0C1C0CM1CM6CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM16C5C1C1CM9C3C3CM9CM23CM2CM4CM22CM1C0C5C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM29C0C2C19C1CM1CM1C7C1CM2CM1CM9C2CM2CM1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0C0C4C5CM4C15C1CM2CM2CM7CM2C2C1CM2C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM4C3C1C4CM1C3C0CM5C1CM2C0C2C0CM2CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM40CM6CM2C2CM28C26CM3C0CM37C22C3C0C6C3C0C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C4CM16C2C2CM15CM6CM1CM1C1CM17C0CM1C3CM3C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal c0cm1c2c2cm1cm2cm2c0cm1c0c2c0c3cm1c1c0_weight : PIPELINE_TYPE_FOR_C0CM1C2C2CM1CM2CM2C0CM1C0C2C0C3CM1C1C0_WEIGHT;
    -- sfix(2, -6)
    signal c8c4cm25c2c5c5cm14c8cm2cm3cm29c1c4c2c1c2_weight : PIPELINE_TYPE_FOR_C8C4CM25C2C5C5CM14C8CM2CM3CM29C1C4C2C1C2_WEIGHT;
    -- sfix(2, -6)
    signal c1c5cm18cm7c7c0c3c10cm1c2cm2c10c0c3cm1c0_weight : PIPELINE_TYPE_FOR_C1C5CM18CM7C7C0C3C10CM1C2CM2C10C0C3CM1C0_WEIGHT;
    -- sfix(2, -6)
    signal c2cm1c15cm1c1c2cm18c89c0cm3cm2c52c18cm5cm4cm1_weight : PIPELINE_TYPE_FOR_C2CM1C15CM1C1C2CM18C89C0CM3CM2C52C18CM5CM4CM1_WEIGHT;
    -- sfix(2, -6)
    signal c2c1cm13cm8cm3c1c39cm2cm1c0c0cm7cm21c0cm2cm1_weight : PIPELINE_TYPE_FOR_C2C1CM13CM8CM3C1C39CM2CM1C0C0CM7CM21C0CM2CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm1cm1c3c1c12cm10c1c2cm5cm15c2cm7c1cm1c19_weight : PIPELINE_TYPE_FOR_CM1CM1CM1C3C1C12CM10C1C2CM5CM15C2CM7C1CM1C19_WEIGHT;
    -- sfix(2, -6)
    signal cm13cm1cm3c1c2cm2cm18c0cm1cm1cm50c0c0c56c4c0_weight : PIPELINE_TYPE_FOR_CM13CM1CM3C1C2CM2CM18C0CM1CM1CM50C0C0C56C4C0_WEIGHT;
    -- sfix(2, -6)
    signal cm4c1cm5c37cm4cm2c0c2c3c1cm1cm14cm1cm1cm1c1_weight : PIPELINE_TYPE_FOR_CM4C1CM5C37CM4CM2C0C2C3C1CM1CM14CM1CM1CM1C1_WEIGHT;
    -- sfix(2, -6)
    signal c5c1c2c5c22c0cm11c2c16c0c5cm1cm3cm2cm3cm1_weight : PIPELINE_TYPE_FOR_C5C1C2C5C22C0CM11C2C16C0C5CM1CM3CM2CM3CM1_WEIGHT;
    -- sfix(2, -6)
    signal c3c2c3c5cm2cm14cm12c2c0cm26c5cm1cm20c0cm5c2_weight : PIPELINE_TYPE_FOR_C3C2C3C5CM2CM14CM12C2C0CM26C5CM1CM20C0CM5C2_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm5cm2cm2c1cm2cm7c41c0cm2c8c23c0cm4c3c1_weight : PIPELINE_TYPE_FOR_CM2CM5CM2CM2C1CM2CM7C41C0CM2C8C23C0CM4C3C1_WEIGHT;
    -- sfix(2, -6)
    signal c2cm1c2cm3cm6cm28cm1c1c3cm51c1cm1cm6c3c4c0_weight : PIPELINE_TYPE_FOR_C2CM1C2CM3CM6CM28CM1C1C3CM51C1CM1CM6C3C4C0_WEIGHT;
    -- sfix(2, -6)
    signal c1c0cm2cm13c0cm2c20c1c0c0cm9cm1cm2c2c12c0_weight : PIPELINE_TYPE_FOR_C1C0CM2CM13C0CM2C20C1C0C0CM9CM1CM2C2C12C0_WEIGHT;
    -- sfix(2, -6)
    signal cm4c0c1c10cm1c0cm4cm2cm2cm2c2c5c4c0cm3cm3_weight : PIPELINE_TYPE_FOR_CM4C0C1C10CM1C0CM4CM2CM2CM2C2C5C4C0CM3CM3_WEIGHT;
    -- sfix(2, -6)
    signal c28c2c8c2cm8c1c0cm2cm1cm2c0c3cm1c6c16c16_weight : PIPELINE_TYPE_FOR_C28C2C8C2CM8C1C0CM2CM1CM2C0C3CM1C6C16C16_WEIGHT;
    -- sfix(2, -6)
    signal cm5cm18cm14c2c1c3c7c1c1cm2cm5c1c0c1c1c2_weight : PIPELINE_TYPE_FOR_CM5CM18CM14C2C1C3C7C1C1CM2CM5C1C0C1C1C2_WEIGHT;
    -- sfix(2, -6)
    signal c5cm2c5cm3c0c2c12cm2c2cm1c10cm1cm86c0cm1cm9_weight : PIPELINE_TYPE_FOR_C5CM2C5CM3C0C2C12CM2C2CM1C10CM1CM86C0CM1CM9_WEIGHT;
    -- sfix(2, -6)
    signal cm3cm5c0c26c1cm6c1cm9cm1c2c0c4cm1c1c0cm5_weight : PIPELINE_TYPE_FOR_CM3CM5C0C26C1CM6C1CM9CM1C2C0C4CM1C1C0CM5_WEIGHT;
    -- sfix(2, -6)
    signal cm7cm5c7c0cm3c4cm5c7cm3c0c4cm2c0cm6cm7c1_weight : PIPELINE_TYPE_FOR_CM7CM5C7C0CM3C4CM5C7CM3C0C4CM2C0CM6CM7C1_WEIGHT;
    -- sfix(2, -6)
    signal cm4c0cm1c3c0cm2c6c1c0c0cm5c0cm1c2c0c3_weight : PIPELINE_TYPE_FOR_CM4C0CM1C3C0CM2C6C1C0C0CM5C0CM1C2C0C3_WEIGHT;
    -- sfix(2, -6)
    signal cm12c0c34cm24cm7c0cm1cm7cm1cm1cm7c2cm1cm3cm2c1_weight : PIPELINE_TYPE_FOR_CM12C0C34CM24CM7C0CM1CM7CM1CM1CM7C2CM1CM3CM2C1_WEIGHT;
    -- sfix(2, -6)
    signal c1c1cm1c2cm2cm3cm1cm23c2c89c1c19cm4cm1cm7c3_weight : PIPELINE_TYPE_FOR_C1C1CM1C2CM2CM3CM1CM23C2C89C1C19CM4CM1CM7C3_WEIGHT;
    -- sfix(2, -6)
    signal cm26cm6c5cm2cm6c0c72c1c7cm1c30cm1cm5cm1c0cm3_weight : PIPELINE_TYPE_FOR_CM26CM6C5CM2CM6C0C72C1C7CM1C30CM1CM5CM1C0CM3_WEIGHT;
    -- sfix(2, -6)
    signal c0cm1c5c0c1c4cm1cm1cm1cm1c2c2cm25c4c5c1_weight : PIPELINE_TYPE_FOR_C0CM1C5C0C1C4CM1CM1CM1CM1C2C2CM25C4C5C1_WEIGHT;
    -- sfix(2, -6)
    signal c2cm6c1c10cm5cm5cm1c52c3c3c1c9cm1c4cm3cm1_weight : PIPELINE_TYPE_FOR_C2CM6C1C10CM5CM5CM1C52C3C3C1C9CM1C4CM3CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm3c1c1cm12cm8c4c1cm2cm17cm2c0c1c0cm1cm6cm1_weight : PIPELINE_TYPE_FOR_CM3C1C1CM12CM8C4C1CM2CM17CM2C0C1C0CM1CM6CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm16c5c1c1cm9c3c3cm9cm23cm2cm4cm22cm1c0c5c1_weight : PIPELINE_TYPE_FOR_CM16C5C1C1CM9C3C3CM9CM23CM2CM4CM22CM1C0C5C1_WEIGHT;
    -- sfix(2, -6)
    signal cm29c0c2c19c1cm1cm1c7c1cm2cm1cm9c2cm2cm1c2_weight : PIPELINE_TYPE_FOR_CM29C0C2C19C1CM1CM1C7C1CM2CM1CM9C2CM2CM1C2_WEIGHT;
    -- sfix(2, -6)
    signal c3c0c0c4c5cm4c15c1cm2cm2cm7cm2c2c1cm2c1_weight : PIPELINE_TYPE_FOR_C3C0C0C4C5CM4C15C1CM2CM2CM7CM2C2C1CM2C1_WEIGHT;
    -- sfix(2, -6)
    signal cm3cm4c3c1c4cm1c3c0cm5c1cm2c0c2c0cm2cm4_weight : PIPELINE_TYPE_FOR_CM3CM4C3C1C4CM1C3C0CM5C1CM2C0C2C0CM2CM4_WEIGHT;
    -- sfix(2, -6)
    signal cm40cm6cm2c2cm28c26cm3c0cm37c22c3c0c6c3c0c2_weight : PIPELINE_TYPE_FOR_CM40CM6CM2C2CM28C26CM3C0CM37C22C3C0C6C3C0C2_WEIGHT;
    -- sfix(2, -6)
    signal c4c4cm16c2c2cm15cm6cm1cm1c1cm17c0cm1c3cm3c1_weight : PIPELINE_TYPE_FOR_C4C4CM16C2C2CM15CM6CM1CM1C1CM17C0CM1C3CM3C1_WEIGHT;
    -- sfix(2, -6)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv5_core12_rmcm_weightsconstant_memory
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
        
            dout1   => c0cm1c2c2cm1cm2cm2c0cm1c0c2c0c3cm1c1c0_weight(0), 
            dout2   => c8c4cm25c2c5c5cm14c8cm2cm3cm29c1c4c2c1c2_weight(0), 
            dout3   => c1c5cm18cm7c7c0c3c10cm1c2cm2c10c0c3cm1c0_weight(0), 
            dout4   => c2cm1c15cm1c1c2cm18c89c0cm3cm2c52c18cm5cm4cm1_weight(0), 
            dout5   => c2c1cm13cm8cm3c1c39cm2cm1c0c0cm7cm21c0cm2cm1_weight(0), 
            dout6   => cm1cm1cm1c3c1c12cm10c1c2cm5cm15c2cm7c1cm1c19_weight(0), 
            dout7   => cm13cm1cm3c1c2cm2cm18c0cm1cm1cm50c0c0c56c4c0_weight(0), 
            dout8   => cm4c1cm5c37cm4cm2c0c2c3c1cm1cm14cm1cm1cm1c1_weight(0), 
            dout9   => c5c1c2c5c22c0cm11c2c16c0c5cm1cm3cm2cm3cm1_weight(0), 
            dout10   => c3c2c3c5cm2cm14cm12c2c0cm26c5cm1cm20c0cm5c2_weight(0), 
            dout11   => cm2cm5cm2cm2c1cm2cm7c41c0cm2c8c23c0cm4c3c1_weight(0), 
            dout12   => c2cm1c2cm3cm6cm28cm1c1c3cm51c1cm1cm6c3c4c0_weight(0), 
            dout13   => c1c0cm2cm13c0cm2c20c1c0c0cm9cm1cm2c2c12c0_weight(0), 
            dout14   => cm4c0c1c10cm1c0cm4cm2cm2cm2c2c5c4c0cm3cm3_weight(0), 
            dout15   => c28c2c8c2cm8c1c0cm2cm1cm2c0c3cm1c6c16c16_weight(0), 
            dout16   => cm5cm18cm14c2c1c3c7c1c1cm2cm5c1c0c1c1c2_weight(0), 
            dout17   => c5cm2c5cm3c0c2c12cm2c2cm1c10cm1cm86c0cm1cm9_weight(0), 
            dout18   => cm3cm5c0c26c1cm6c1cm9cm1c2c0c4cm1c1c0cm5_weight(0), 
            dout19   => cm7cm5c7c0cm3c4cm5c7cm3c0c4cm2c0cm6cm7c1_weight(0), 
            dout20   => cm4c0cm1c3c0cm2c6c1c0c0cm5c0cm1c2c0c3_weight(0), 
            dout21   => cm12c0c34cm24cm7c0cm1cm7cm1cm1cm7c2cm1cm3cm2c1_weight(0), 
            dout22   => c1c1cm1c2cm2cm3cm1cm23c2c89c1c19cm4cm1cm7c3_weight(0), 
            dout23   => cm26cm6c5cm2cm6c0c72c1c7cm1c30cm1cm5cm1c0cm3_weight(0), 
            dout24   => c0cm1c5c0c1c4cm1cm1cm1cm1c2c2cm25c4c5c1_weight(0), 
            dout25   => c2cm6c1c10cm5cm5cm1c52c3c3c1c9cm1c4cm3cm1_weight(0), 
            dout26   => cm3c1c1cm12cm8c4c1cm2cm17cm2c0c1c0cm1cm6cm1_weight(0), 
            dout27   => cm16c5c1c1cm9c3c3cm9cm23cm2cm4cm22cm1c0c5c1_weight(0), 
            dout28   => cm29c0c2c19c1cm1cm1c7c1cm2cm1cm9c2cm2cm1c2_weight(0), 
            dout29   => c3c0c0c4c5cm4c15c1cm2cm2cm7cm2c2c1cm2c1_weight(0), 
            dout30   => cm3cm4c3c1c4cm1c3c0cm5c1cm2c0c2c0cm2cm4_weight(0), 
            dout31   => cm40cm6cm2c2cm28c26cm3c0cm37c22c3c0c6c3c0c2_weight(0), 
            dout32   => c4c4cm16c2c2cm15cm6cm1cm1c1cm17c0cm1c3cm3c1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c0cm1c2c2cm1cm2cm2c0cm1c0c2c0c3cm1c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c2c2cm1cm2cm2c0cm1c0c2c0c3cm1c1c0_weight(0), c0cm1c2c2cm1cm2cm2c0cm1c0c2c0c3cm1c1c0_weight(1));
    PL_STEP_0_for_c8c4cm25c2c5c5cm14c8cm2cm3cm29c1c4c2c1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c4cm25c2c5c5cm14c8cm2cm3cm29c1c4c2c1c2_weight(0), c8c4cm25c2c5c5cm14c8cm2cm3cm29c1c4c2c1c2_weight(1));
    PL_STEP_0_for_c1c5cm18cm7c7c0c3c10cm1c2cm2c10c0c3cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c5cm18cm7c7c0c3c10cm1c2cm2c10c0c3cm1c0_weight(0), c1c5cm18cm7c7c0c3c10cm1c2cm2c10c0c3cm1c0_weight(1));
    PL_STEP_0_for_c2cm1c15cm1c1c2cm18c89c0cm3cm2c52c18cm5cm4cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm1c15cm1c1c2cm18c89c0cm3cm2c52c18cm5cm4cm1_weight(0), c2cm1c15cm1c1c2cm18c89c0cm3cm2c52c18cm5cm4cm1_weight(1));
    PL_STEP_0_for_c2c1cm13cm8cm3c1c39cm2cm1c0c0cm7cm21c0cm2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1cm13cm8cm3c1c39cm2cm1c0c0cm7cm21c0cm2cm1_weight(0), c2c1cm13cm8cm3c1c39cm2cm1c0c0cm7cm21c0cm2cm1_weight(1));
    PL_STEP_0_for_cm1cm1cm1c3c1c12cm10c1c2cm5cm15c2cm7c1cm1c19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1cm1c3c1c12cm10c1c2cm5cm15c2cm7c1cm1c19_weight(0), cm1cm1cm1c3c1c12cm10c1c2cm5cm15c2cm7c1cm1c19_weight(1));
    PL_STEP_0_for_cm13cm1cm3c1c2cm2cm18c0cm1cm1cm50c0c0c56c4c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13cm1cm3c1c2cm2cm18c0cm1cm1cm50c0c0c56c4c0_weight(0), cm13cm1cm3c1c2cm2cm18c0cm1cm1cm50c0c0c56c4c0_weight(1));
    PL_STEP_0_for_cm4c1cm5c37cm4cm2c0c2c3c1cm1cm14cm1cm1cm1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c1cm5c37cm4cm2c0c2c3c1cm1cm14cm1cm1cm1c1_weight(0), cm4c1cm5c37cm4cm2c0c2c3c1cm1cm14cm1cm1cm1c1_weight(1));
    PL_STEP_0_for_c5c1c2c5c22c0cm11c2c16c0c5cm1cm3cm2cm3cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c1c2c5c22c0cm11c2c16c0c5cm1cm3cm2cm3cm1_weight(0), c5c1c2c5c22c0cm11c2c16c0c5cm1cm3cm2cm3cm1_weight(1));
    PL_STEP_0_for_c3c2c3c5cm2cm14cm12c2c0cm26c5cm1cm20c0cm5c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c2c3c5cm2cm14cm12c2c0cm26c5cm1cm20c0cm5c2_weight(0), c3c2c3c5cm2cm14cm12c2c0cm26c5cm1cm20c0cm5c2_weight(1));
    PL_STEP_0_for_cm2cm5cm2cm2c1cm2cm7c41c0cm2c8c23c0cm4c3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm5cm2cm2c1cm2cm7c41c0cm2c8c23c0cm4c3c1_weight(0), cm2cm5cm2cm2c1cm2cm7c41c0cm2c8c23c0cm4c3c1_weight(1));
    PL_STEP_0_for_c2cm1c2cm3cm6cm28cm1c1c3cm51c1cm1cm6c3c4c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm1c2cm3cm6cm28cm1c1c3cm51c1cm1cm6c3c4c0_weight(0), c2cm1c2cm3cm6cm28cm1c1c3cm51c1cm1cm6c3c4c0_weight(1));
    PL_STEP_0_for_c1c0cm2cm13c0cm2c20c1c0c0cm9cm1cm2c2c12c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0cm2cm13c0cm2c20c1c0c0cm9cm1cm2c2c12c0_weight(0), c1c0cm2cm13c0cm2c20c1c0c0cm9cm1cm2c2c12c0_weight(1));
    PL_STEP_0_for_cm4c0c1c10cm1c0cm4cm2cm2cm2c2c5c4c0cm3cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c0c1c10cm1c0cm4cm2cm2cm2c2c5c4c0cm3cm3_weight(0), cm4c0c1c10cm1c0cm4cm2cm2cm2c2c5c4c0cm3cm3_weight(1));
    PL_STEP_0_for_c28c2c8c2cm8c1c0cm2cm1cm2c0c3cm1c6c16c16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c28c2c8c2cm8c1c0cm2cm1cm2c0c3cm1c6c16c16_weight(0), c28c2c8c2cm8c1c0cm2cm1cm2c0c3cm1c6c16c16_weight(1));
    PL_STEP_0_for_cm5cm18cm14c2c1c3c7c1c1cm2cm5c1c0c1c1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm18cm14c2c1c3c7c1c1cm2cm5c1c0c1c1c2_weight(0), cm5cm18cm14c2c1c3c7c1c1cm2cm5c1c0c1c1c2_weight(1));
    PL_STEP_0_for_c5cm2c5cm3c0c2c12cm2c2cm1c10cm1cm86c0cm1cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm2c5cm3c0c2c12cm2c2cm1c10cm1cm86c0cm1cm9_weight(0), c5cm2c5cm3c0c2c12cm2c2cm1c10cm1cm86c0cm1cm9_weight(1));
    PL_STEP_0_for_cm3cm5c0c26c1cm6c1cm9cm1c2c0c4cm1c1c0cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm5c0c26c1cm6c1cm9cm1c2c0c4cm1c1c0cm5_weight(0), cm3cm5c0c26c1cm6c1cm9cm1c2c0c4cm1c1c0cm5_weight(1));
    PL_STEP_0_for_cm7cm5c7c0cm3c4cm5c7cm3c0c4cm2c0cm6cm7c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7cm5c7c0cm3c4cm5c7cm3c0c4cm2c0cm6cm7c1_weight(0), cm7cm5c7c0cm3c4cm5c7cm3c0c4cm2c0cm6cm7c1_weight(1));
    PL_STEP_0_for_cm4c0cm1c3c0cm2c6c1c0c0cm5c0cm1c2c0c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c0cm1c3c0cm2c6c1c0c0cm5c0cm1c2c0c3_weight(0), cm4c0cm1c3c0cm2c6c1c0c0cm5c0cm1c2c0c3_weight(1));
    PL_STEP_0_for_cm12c0c34cm24cm7c0cm1cm7cm1cm1cm7c2cm1cm3cm2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12c0c34cm24cm7c0cm1cm7cm1cm1cm7c2cm1cm3cm2c1_weight(0), cm12c0c34cm24cm7c0cm1cm7cm1cm1cm7c2cm1cm3cm2c1_weight(1));
    PL_STEP_0_for_c1c1cm1c2cm2cm3cm1cm23c2c89c1c19cm4cm1cm7c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1cm1c2cm2cm3cm1cm23c2c89c1c19cm4cm1cm7c3_weight(0), c1c1cm1c2cm2cm3cm1cm23c2c89c1c19cm4cm1cm7c3_weight(1));
    PL_STEP_0_for_cm26cm6c5cm2cm6c0c72c1c7cm1c30cm1cm5cm1c0cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm26cm6c5cm2cm6c0c72c1c7cm1c30cm1cm5cm1c0cm3_weight(0), cm26cm6c5cm2cm6c0c72c1c7cm1c30cm1cm5cm1c0cm3_weight(1));
    PL_STEP_0_for_c0cm1c5c0c1c4cm1cm1cm1cm1c2c2cm25c4c5c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c5c0c1c4cm1cm1cm1cm1c2c2cm25c4c5c1_weight(0), c0cm1c5c0c1c4cm1cm1cm1cm1c2c2cm25c4c5c1_weight(1));
    PL_STEP_0_for_c2cm6c1c10cm5cm5cm1c52c3c3c1c9cm1c4cm3cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm6c1c10cm5cm5cm1c52c3c3c1c9cm1c4cm3cm1_weight(0), c2cm6c1c10cm5cm5cm1c52c3c3c1c9cm1c4cm3cm1_weight(1));
    PL_STEP_0_for_cm3c1c1cm12cm8c4c1cm2cm17cm2c0c1c0cm1cm6cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c1c1cm12cm8c4c1cm2cm17cm2c0c1c0cm1cm6cm1_weight(0), cm3c1c1cm12cm8c4c1cm2cm17cm2c0c1c0cm1cm6cm1_weight(1));
    PL_STEP_0_for_cm16c5c1c1cm9c3c3cm9cm23cm2cm4cm22cm1c0c5c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm16c5c1c1cm9c3c3cm9cm23cm2cm4cm22cm1c0c5c1_weight(0), cm16c5c1c1cm9c3c3cm9cm23cm2cm4cm22cm1c0c5c1_weight(1));
    PL_STEP_0_for_cm29c0c2c19c1cm1cm1c7c1cm2cm1cm9c2cm2cm1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm29c0c2c19c1cm1cm1c7c1cm2cm1cm9c2cm2cm1c2_weight(0), cm29c0c2c19c1cm1cm1c7c1cm2cm1cm9c2cm2cm1c2_weight(1));
    PL_STEP_0_for_c3c0c0c4c5cm4c15c1cm2cm2cm7cm2c2c1cm2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0c0c4c5cm4c15c1cm2cm2cm7cm2c2c1cm2c1_weight(0), c3c0c0c4c5cm4c15c1cm2cm2cm7cm2c2c1cm2c1_weight(1));
    PL_STEP_0_for_cm3cm4c3c1c4cm1c3c0cm5c1cm2c0c2c0cm2cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm4c3c1c4cm1c3c0cm5c1cm2c0c2c0cm2cm4_weight(0), cm3cm4c3c1c4cm1c3c0cm5c1cm2c0c2c0cm2cm4_weight(1));
    PL_STEP_0_for_cm40cm6cm2c2cm28c26cm3c0cm37c22c3c0c6c3c0c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm40cm6cm2c2cm28c26cm3c0cm37c22c3c0c6c3c0c2_weight(0), cm40cm6cm2c2cm28c26cm3c0cm37c22c3c0c6c3c0c2_weight(1));
    PL_STEP_0_for_c4c4cm16c2c2cm15cm6cm1cm1c1cm17c0cm1c3cm3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c4cm16c2c2cm15cm6cm1cm1c1cm17c0cm1c3cm3c1_weight(0), c4c4cm16c2c2cm15cm6cm1cm1c1cm17c0cm1c3cm3c1_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c2cm1c15cm1c1c2cm18c89c0cm3cm2c52c18cm5cm4cm1_c0cm1c2c2cm1cm2cm2c0cm1c0c2c0c3cm1c1c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c2cm1c15cm1c1c2cm18c89c0cm3cm2c52c18cm5cm4cm1_weight(1)(8-1 downto 0),
			B	=> c0cm1c2c2cm1cm2cm2c0cm1c0c2c0c3cm1c1c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm1c15cm1c1c2cm18c89c0cm3cm2c52c18cm5cm4cm1,
			CxB => R_c0cm1c2c2cm1cm2cm2c0cm1c0c2c0c3cm1c1c0
		);

    c5cm2c5cm3c0c2c12cm2c2cm1c10cm1cm86c0cm1cm9_cm3cm4c3c1c4cm1c3c0cm5c1cm2c0c2c0cm2cm4_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c5cm2c5cm3c0c2c12cm2c2cm1c10cm1cm86c0cm1cm9_weight(1)(8-1 downto 0),
			B	=> cm3cm4c3c1c4cm1c3c0cm5c1cm2c0c2c0cm2cm4_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5cm2c5cm3c0c2c12cm2c2cm1c10cm1cm86c0cm1cm9,
			CxB => R_cm3cm4c3c1c4cm1c3c0cm5c1cm2c0c2c0cm2cm4
		);

    c1c1cm1c2cm2cm3cm1cm23c2c89c1c19cm4cm1cm7c3_cm4c0cm1c3c0cm2c6c1c0c0cm5c0cm1c2c0c3_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c1cm1c2cm2cm3cm1cm23c2c89c1c19cm4cm1cm7c3_weight(1)(8-1 downto 0),
			B	=> cm4c0cm1c3c0cm2c6c1c0c0cm5c0cm1c2c0c3_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c1cm1c2cm2cm3cm1cm23c2c89c1c19cm4cm1cm7c3,
			CxB => R_cm4c0cm1c3c0cm2c6c1c0c0cm5c0cm1c2c0c3
		);

    cm26cm6c5cm2cm6c0c72c1c7cm1c30cm1cm5cm1c0cm3_cm7cm5c7c0cm3c4cm5c7cm3c0c4cm2c0cm6cm7c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm26cm6c5cm2cm6c0c72c1c7cm1c30cm1cm5cm1c0cm3_weight(1)(8-1 downto 0),
			B	=> cm7cm5c7c0cm3c4cm5c7cm3c0c4cm2c0cm6cm7c1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm26cm6c5cm2cm6c0c72c1c7cm1c30cm1cm5cm1c0cm3,
			CxB => R_cm7cm5c7c0cm3c4cm5c7cm3c0c4cm2c0cm6cm7c1
		);

    c2c1cm13cm8cm3c1c39cm2cm1c0c0cm7cm21c0cm2cm1_c3c0c0c4c5cm4c15c1cm2cm2cm7cm2c2c1cm2c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c2c1cm13cm8cm3c1c39cm2cm1c0c0cm7cm21c0cm2cm1_weight(1)(7-1 downto 0),
			B	=> c3c0c0c4c5cm4c15c1cm2cm2cm7cm2c2c1cm2c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c1cm13cm8cm3c1c39cm2cm1c0c0cm7cm21c0cm2cm1,
			CxB => R_c3c0c0c4c5cm4c15c1cm2cm2cm7cm2c2c1cm2c1
		);

    cm13cm1cm3c1c2cm2cm18c0cm1cm1cm50c0c0c56c4c0_cm4c0c1c10cm1c0cm4cm2cm2cm2c2c5c4c0cm3cm3_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm13cm1cm3c1c2cm2cm18c0cm1cm1cm50c0c0c56c4c0_weight(1)(7-1 downto 0),
			B	=> cm4c0c1c10cm1c0cm4cm2cm2cm2c2c5c4c0cm3cm3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm13cm1cm3c1c2cm2cm18c0cm1cm1cm50c0c0c56c4c0,
			CxB => R_cm4c0c1c10cm1c0cm4cm2cm2cm2c2c5c4c0cm3cm3
		);

    cm4c1cm5c37cm4cm2c0c2c3c1cm1cm14cm1cm1cm1c1_c4c4cm16c2c2cm15cm6cm1cm1c1cm17c0cm1c3cm3c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm4c1cm5c37cm4cm2c0c2c3c1cm1cm14cm1cm1cm1c1_weight(1)(7-1 downto 0),
			B	=> c4c4cm16c2c2cm15cm6cm1cm1c1cm17c0cm1c3cm3c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4c1cm5c37cm4cm2c0c2c3c1cm1cm14cm1cm1cm1c1,
			CxB => R_c4c4cm16c2c2cm15cm6cm1cm1c1cm17c0cm1c3cm3c1
		);

    cm2cm5cm2cm2c1cm2cm7c41c0cm2c8c23c0cm4c3c1_cm29c0c2c19c1cm1cm1c7c1cm2cm1cm9c2cm2cm1c2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm2cm5cm2cm2c1cm2cm7c41c0cm2c8c23c0cm4c3c1_weight(1)(7-1 downto 0),
			B	=> cm29c0c2c19c1cm1cm1c7c1cm2cm1cm9c2cm2cm1c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm5cm2cm2c1cm2cm7c41c0cm2c8c23c0cm4c3c1,
			CxB => R_cm29c0c2c19c1cm1cm1c7c1cm2cm1cm9c2cm2cm1c2
		);

    c2cm1c2cm3cm6cm28cm1c1c3cm51c1cm1cm6c3c4c0_cm16c5c1c1cm9c3c3cm9cm23cm2cm4cm22cm1c0c5c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c2cm1c2cm3cm6cm28cm1c1c3cm51c1cm1cm6c3c4c0_weight(1)(7-1 downto 0),
			B	=> cm16c5c1c1cm9c3c3cm9cm23cm2cm4cm22cm1c0c5c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm1c2cm3cm6cm28cm1c1c3cm51c1cm1cm6c3c4c0,
			CxB => R_cm16c5c1c1cm9c3c3cm9cm23cm2cm4cm22cm1c0c5c1
		);

    cm12c0c34cm24cm7c0cm1cm7cm1cm1cm7c2cm1cm3cm2c1_cm3c1c1cm12cm8c4c1cm2cm17cm2c0c1c0cm1cm6cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm12c0c34cm24cm7c0cm1cm7cm1cm1cm7c2cm1cm3cm2c1_weight(1)(7-1 downto 0),
			B	=> cm3c1c1cm12cm8c4c1cm2cm17cm2c0c1c0cm1cm6cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm12c0c34cm24cm7c0cm1cm7cm1cm1cm7c2cm1cm3cm2c1,
			CxB => R_cm3c1c1cm12cm8c4c1cm2cm17cm2c0c1c0cm1cm6cm1
		);

    c2cm6c1c10cm5cm5cm1c52c3c3c1c9cm1c4cm3cm1_c0cm1c5c0c1c4cm1cm1cm1cm1c2c2cm25c4c5c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c2cm6c1c10cm5cm5cm1c52c3c3c1c9cm1c4cm3cm1_weight(1)(7-1 downto 0),
			B	=> c0cm1c5c0c1c4cm1cm1cm1cm1c2c2cm25c4c5c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm6c1c10cm5cm5cm1c52c3c3c1c9cm1c4cm3cm1,
			CxB => R_c0cm1c5c0c1c4cm1cm1cm1cm1c2c2cm25c4c5c1
		);

    cm40cm6cm2c2cm28c26cm3c0cm37c22c3c0c6c3c0c2_cm3cm5c0c26c1cm6c1cm9cm1c2c0c4cm1c1c0cm5_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm40cm6cm2c2cm28c26cm3c0cm37c22c3c0c6c3c0c2_weight(1)(7-1 downto 0),
			B	=> cm3cm5c0c26c1cm6c1cm9cm1c2c0c4cm1c1c0cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm40cm6cm2c2cm28c26cm3c0cm37c22c3c0c6c3c0c2,
			CxB => R_cm3cm5c0c26c1cm6c1cm9cm1c2c0c4cm1c1c0cm5
		);

    c8c4cm25c2c5c5cm14c8cm2cm3cm29c1c4c2c1c2_cm5cm18cm14c2c1c3c7c1c1cm2cm5c1c0c1c1c2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c8c4cm25c2c5c5cm14c8cm2cm3cm29c1c4c2c1c2_weight(1)(6-1 downto 0),
			B	=> cm5cm18cm14c2c1c3c7c1c1cm2cm5c1c0c1c1c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c8c4cm25c2c5c5cm14c8cm2cm3cm29c1c4c2c1c2,
			CxB => R_cm5cm18cm14c2c1c3c7c1c1cm2cm5c1c0c1c1c2
		);

    c1c5cm18cm7c7c0c3c10cm1c2cm2c10c0c3cm1c0_c28c2c8c2cm8c1c0cm2cm1cm2c0c3cm1c6c16c16_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c5cm18cm7c7c0c3c10cm1c2cm2c10c0c3cm1c0_weight(1)(6-1 downto 0),
			B	=> c28c2c8c2cm8c1c0cm2cm1cm2c0c3cm1c6c16c16_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c5cm18cm7c7c0c3c10cm1c2cm2c10c0c3cm1c0,
			CxB => R_c28c2c8c2cm8c1c0cm2cm1cm2c0c3cm1c6c16c16
		);

    cm1cm1cm1c3c1c12cm10c1c2cm5cm15c2cm7c1cm1c19_c1c0cm2cm13c0cm2c20c1c0c0cm9cm1cm2c2c12c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1cm1cm1c3c1c12cm10c1c2cm5cm15c2cm7c1cm1c19_weight(1)(6-1 downto 0),
			B	=> c1c0cm2cm13c0cm2c20c1c0c0cm9cm1cm2c2c12c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm1cm1c3c1c12cm10c1c2cm5cm15c2cm7c1cm1c19,
			CxB => R_c1c0cm2cm13c0cm2c20c1c0c0cm9cm1cm2c2c12c0
		);

    c5c1c2c5c22c0cm11c2c16c0c5cm1cm3cm2cm3cm1_c3c2c3c5cm2cm14cm12c2c0cm26c5cm1cm20c0cm5c2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c5c1c2c5c22c0cm11c2c16c0c5cm1cm3cm2cm3cm1_weight(1)(6-1 downto 0),
			B	=> c3c2c3c5cm2cm14cm12c2c0cm26c5cm1cm20c0cm5c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c1c2c5c22c0cm11c2c16c0c5cm1cm3cm2cm3cm1,
			CxB => R_c3c2c3c5cm2cm14cm12c2c0cm26c5cm1cm20c0cm5c2
		);




end architecture;
