library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core3_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm12c1cm10cm2c0cm2cm2cm1c0c0c0c0c2cm5cm11cm4 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm1c9c2c6cm13c8c21cm2c0c0c0c0c7c17cm7c11 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2cm4c5cm3c13c1c6c3c0c0c0c0c4cm5c0cm3 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c21cm5c2c2cm1cm3c22c0c0c0c0c0c11cm3c0c16 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c25c0c3c0c2c2cm14cm4c0c0c0c0cm11c1c0cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm40cm5c1cm9c0c8c3c5c0c0c0c0cm3cm4cm2c6 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm2cm16c1c0cm2cm3c2c1c0c0c0c0c0c4c12c1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0cm3cm1cm6cm7c3c32c11c0c0c0c0cm6c3cm12cm14 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c8c2cm3cm4c2cm4c1cm1c0c0c0c0cm22c13cm23cm10 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm4c3cm18c1cm1c4c12cm9c0c0c0c0c30cm9c5c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c4c2cm4c4c0cm3c0cm2c0c0c0c0c2c7c3c11 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm8c5c15cm3c3cm6c2cm2c0c0c0c0c22c1cm5cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c30cm15cm14c1c1c2cm2c5c0c0c0c0c3c15c4c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm7c0c16cm1c1c0cm2cm16c0c0c0c0c5cm3cm11cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1cm2cm3c70c1c4c8c4c0c0c0c0c3cm27cm2cm13 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm1c0c5c2cm2c4cm1c1c0c0c0c0cm14c3c6cm37 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm8cm1c0cm7c1cm10cm7cm8c0c0c0c0cm19cm4cm10c11 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm6cm2c15cm3cm2c0c1cm1c0c0c0c0c6c7cm3cm24 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0cm8cm41c18c4cm8c14cm1c0c0c0c0c4c29cm2c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm6c3cm7c1c3cm4c7cm6c0c0c0c0c19c1c1c6 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1c0c6c2c1c0c13c15c0c0c0c0cm4c0c9c3 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm2cm2cm36c21c0cm2cm2c3c0c0c0c0cm3cm8cm8cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c7cm4c2c4c0c20c8cm5c0c0c0c0c6cm2c7c15 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2c0c6cm3c0c2c13cm1c0c0c0c0c3cm1cm44c8 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm1cm8cm1c2c0cm10c0cm27c0c0c0c0cm10c10cm6c5 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1cm2cm4c1c0c0c1cm1c0c0c0c0c2cm3cm2cm2 : out std_logic_vector(10-1 downto 0);   --	sfix(2, -8)
        R_c2cm1c5cm4c12c1c7c6c0c0c0c0c0c5cm1cm5 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm2c2cm4cm2c36cm7c2cm22c0c0c0c0cm6cm33c15c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm5c0c4c2c0c0cm1c4c0c0c0c0cm8cm5c0c3 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c3c10cm13c0c0c2c5c1c0c0c0c0c7c0c36c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c2c1cm12cm5cm6cm2cm1cm3c0c0c0c0c18cm9c4c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0cm4cm13c5c2c1c17c1c0c0c0c0c1c1cm13c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core3_rmcm;

architecture arch of conv5_core3_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12C1CM10CM2C0CM2CM2CM1C0C0C0C0C2CM5CM11CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C9C2C6CM13C8C21CM2C0C0C0C0C7C17CM7C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM4C5CM3C13C1C6C3C0C0C0C0C4CM5C0CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C21CM5C2C2CM1CM3C22C0C0C0C0C0C11CM3C0C16_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C25C0C3C0C2C2CM14CM4C0C0C0C0CM11C1C0CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM40CM5C1CM9C0C8C3C5C0C0C0C0CM3CM4CM2C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM16C1C0CM2CM3C2C1C0C0C0C0C0C4C12C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM3CM1CM6CM7C3C32C11C0C0C0C0CM6C3CM12CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C2CM3CM4C2CM4C1CM1C0C0C0C0CM22C13CM23CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C3CM18C1CM1C4C12CM9C0C0C0C0C30CM9C5C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C2CM4C4C0CM3C0CM2C0C0C0C0C2C7C3C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8C5C15CM3C3CM6C2CM2C0C0C0C0C22C1CM5CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C30CM15CM14C1C1C2CM2C5C0C0C0C0C3C15C4C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C0C16CM1C1C0CM2CM16C0C0C0C0C5CM3CM11CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM2CM3C70C1C4C8C4C0C0C0C0C3CM27CM2CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0C5C2CM2C4CM1C1C0C0C0C0CM14C3C6CM37_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8CM1C0CM7C1CM10CM7CM8C0C0C0C0CM19CM4CM10C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM2C15CM3CM2C0C1CM1C0C0C0C0C6C7CM3CM24_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM8CM41C18C4CM8C14CM1C0C0C0C0C4C29CM2C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C3CM7C1C3CM4C7CM6C0C0C0C0C19C1C1C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0C6C2C1C0C13C15C0C0C0C0CM4C0C9C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM2CM36C21C0CM2CM2C3C0C0C0C0CM3CM8CM8CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM4C2C4C0C20C8CM5C0C0C0C0C6CM2C7C15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C0C6CM3C0C2C13CM1C0C0C0C0C3CM1CM44C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM8CM1C2C0CM10C0CM27C0C0C0C0CM10C10CM6C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM2CM4C1C0C0C1CM1C0C0C0C0C2CM3CM2CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM1C5CM4C12C1C7C6C0C0C0C0C0C5CM1CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C2CM4CM2C36CM7C2CM22C0C0C0C0CM6CM33C15C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C0C4C2C0C0CM1C4C0C0C0C0CM8CM5C0C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C10CM13C0C0C2C5C1C0C0C0C0C7C0C36C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1CM12CM5CM6CM2CM1CM3C0C0C0C0C18CM9C4C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM4CM13C5C2C1C17C1C0C0C0C0C1C1CM13C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal cm12c1cm10cm2c0cm2cm2cm1c0c0c0c0c2cm5cm11cm4_weight : PIPELINE_TYPE_FOR_CM12C1CM10CM2C0CM2CM2CM1C0C0C0C0C2CM5CM11CM4_WEIGHT;
    -- sfix(2, -6)
    signal cm1c9c2c6cm13c8c21cm2c0c0c0c0c7c17cm7c11_weight : PIPELINE_TYPE_FOR_CM1C9C2C6CM13C8C21CM2C0C0C0C0C7C17CM7C11_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm4c5cm3c13c1c6c3c0c0c0c0c4cm5c0cm3_weight : PIPELINE_TYPE_FOR_CM2CM4C5CM3C13C1C6C3C0C0C0C0C4CM5C0CM3_WEIGHT;
    -- sfix(2, -6)
    signal c21cm5c2c2cm1cm3c22c0c0c0c0c0c11cm3c0c16_weight : PIPELINE_TYPE_FOR_C21CM5C2C2CM1CM3C22C0C0C0C0C0C11CM3C0C16_WEIGHT;
    -- sfix(2, -6)
    signal c25c0c3c0c2c2cm14cm4c0c0c0c0cm11c1c0cm8_weight : PIPELINE_TYPE_FOR_C25C0C3C0C2C2CM14CM4C0C0C0C0CM11C1C0CM8_WEIGHT;
    -- sfix(2, -6)
    signal cm40cm5c1cm9c0c8c3c5c0c0c0c0cm3cm4cm2c6_weight : PIPELINE_TYPE_FOR_CM40CM5C1CM9C0C8C3C5C0C0C0C0CM3CM4CM2C6_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm16c1c0cm2cm3c2c1c0c0c0c0c0c4c12c1_weight : PIPELINE_TYPE_FOR_CM2CM16C1C0CM2CM3C2C1C0C0C0C0C0C4C12C1_WEIGHT;
    -- sfix(2, -6)
    signal c0cm3cm1cm6cm7c3c32c11c0c0c0c0cm6c3cm12cm14_weight : PIPELINE_TYPE_FOR_C0CM3CM1CM6CM7C3C32C11C0C0C0C0CM6C3CM12CM14_WEIGHT;
    -- sfix(2, -6)
    signal c8c2cm3cm4c2cm4c1cm1c0c0c0c0cm22c13cm23cm10_weight : PIPELINE_TYPE_FOR_C8C2CM3CM4C2CM4C1CM1C0C0C0C0CM22C13CM23CM10_WEIGHT;
    -- sfix(2, -6)
    signal cm4c3cm18c1cm1c4c12cm9c0c0c0c0c30cm9c5c0_weight : PIPELINE_TYPE_FOR_CM4C3CM18C1CM1C4C12CM9C0C0C0C0C30CM9C5C0_WEIGHT;
    -- sfix(2, -6)
    signal c4c2cm4c4c0cm3c0cm2c0c0c0c0c2c7c3c11_weight : PIPELINE_TYPE_FOR_C4C2CM4C4C0CM3C0CM2C0C0C0C0C2C7C3C11_WEIGHT;
    -- sfix(2, -6)
    signal cm8c5c15cm3c3cm6c2cm2c0c0c0c0c22c1cm5cm3_weight : PIPELINE_TYPE_FOR_CM8C5C15CM3C3CM6C2CM2C0C0C0C0C22C1CM5CM3_WEIGHT;
    -- sfix(2, -6)
    signal c30cm15cm14c1c1c2cm2c5c0c0c0c0c3c15c4c1_weight : PIPELINE_TYPE_FOR_C30CM15CM14C1C1C2CM2C5C0C0C0C0C3C15C4C1_WEIGHT;
    -- sfix(2, -6)
    signal cm7c0c16cm1c1c0cm2cm16c0c0c0c0c5cm3cm11cm2_weight : PIPELINE_TYPE_FOR_CM7C0C16CM1C1C0CM2CM16C0C0C0C0C5CM3CM11CM2_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm2cm3c70c1c4c8c4c0c0c0c0c3cm27cm2cm13_weight : PIPELINE_TYPE_FOR_CM1CM2CM3C70C1C4C8C4C0C0C0C0C3CM27CM2CM13_WEIGHT;
    -- sfix(2, -6)
    signal cm1c0c5c2cm2c4cm1c1c0c0c0c0cm14c3c6cm37_weight : PIPELINE_TYPE_FOR_CM1C0C5C2CM2C4CM1C1C0C0C0C0CM14C3C6CM37_WEIGHT;
    -- sfix(2, -6)
    signal cm8cm1c0cm7c1cm10cm7cm8c0c0c0c0cm19cm4cm10c11_weight : PIPELINE_TYPE_FOR_CM8CM1C0CM7C1CM10CM7CM8C0C0C0C0CM19CM4CM10C11_WEIGHT;
    -- sfix(2, -6)
    signal cm6cm2c15cm3cm2c0c1cm1c0c0c0c0c6c7cm3cm24_weight : PIPELINE_TYPE_FOR_CM6CM2C15CM3CM2C0C1CM1C0C0C0C0C6C7CM3CM24_WEIGHT;
    -- sfix(2, -6)
    signal c0cm8cm41c18c4cm8c14cm1c0c0c0c0c4c29cm2c1_weight : PIPELINE_TYPE_FOR_C0CM8CM41C18C4CM8C14CM1C0C0C0C0C4C29CM2C1_WEIGHT;
    -- sfix(2, -6)
    signal cm6c3cm7c1c3cm4c7cm6c0c0c0c0c19c1c1c6_weight : PIPELINE_TYPE_FOR_CM6C3CM7C1C3CM4C7CM6C0C0C0C0C19C1C1C6_WEIGHT;
    -- sfix(2, -6)
    signal c1c0c6c2c1c0c13c15c0c0c0c0cm4c0c9c3_weight : PIPELINE_TYPE_FOR_C1C0C6C2C1C0C13C15C0C0C0C0CM4C0C9C3_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm2cm36c21c0cm2cm2c3c0c0c0c0cm3cm8cm8cm5_weight : PIPELINE_TYPE_FOR_CM2CM2CM36C21C0CM2CM2C3C0C0C0C0CM3CM8CM8CM5_WEIGHT;
    -- sfix(2, -6)
    signal c7cm4c2c4c0c20c8cm5c0c0c0c0c6cm2c7c15_weight : PIPELINE_TYPE_FOR_C7CM4C2C4C0C20C8CM5C0C0C0C0C6CM2C7C15_WEIGHT;
    -- sfix(2, -6)
    signal cm2c0c6cm3c0c2c13cm1c0c0c0c0c3cm1cm44c8_weight : PIPELINE_TYPE_FOR_CM2C0C6CM3C0C2C13CM1C0C0C0C0C3CM1CM44C8_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm8cm1c2c0cm10c0cm27c0c0c0c0cm10c10cm6c5_weight : PIPELINE_TYPE_FOR_CM1CM8CM1C2C0CM10C0CM27C0C0C0C0CM10C10CM6C5_WEIGHT;
    -- sfix(2, -6)
    signal c1cm2cm4c1c0c0c1cm1c0c0c0c0c2cm3cm2cm2_weight : PIPELINE_TYPE_FOR_C1CM2CM4C1C0C0C1CM1C0C0C0C0C2CM3CM2CM2_WEIGHT;
    -- sfix(2, -6)
    signal c2cm1c5cm4c12c1c7c6c0c0c0c0c0c5cm1cm5_weight : PIPELINE_TYPE_FOR_C2CM1C5CM4C12C1C7C6C0C0C0C0C0C5CM1CM5_WEIGHT;
    -- sfix(2, -6)
    signal cm2c2cm4cm2c36cm7c2cm22c0c0c0c0cm6cm33c15c1_weight : PIPELINE_TYPE_FOR_CM2C2CM4CM2C36CM7C2CM22C0C0C0C0CM6CM33C15C1_WEIGHT;
    -- sfix(2, -6)
    signal cm5c0c4c2c0c0cm1c4c0c0c0c0cm8cm5c0c3_weight : PIPELINE_TYPE_FOR_CM5C0C4C2C0C0CM1C4C0C0C0C0CM8CM5C0C3_WEIGHT;
    -- sfix(2, -6)
    signal c3c10cm13c0c0c2c5c1c0c0c0c0c7c0c36c1_weight : PIPELINE_TYPE_FOR_C3C10CM13C0C0C2C5C1C0C0C0C0C7C0C36C1_WEIGHT;
    -- sfix(2, -6)
    signal c2c1cm12cm5cm6cm2cm1cm3c0c0c0c0c18cm9c4c2_weight : PIPELINE_TYPE_FOR_C2C1CM12CM5CM6CM2CM1CM3C0C0C0C0C18CM9C4C2_WEIGHT;
    -- sfix(2, -6)
    signal c0cm4cm13c5c2c1c17c1c0c0c0c0c1c1cm13c2_weight : PIPELINE_TYPE_FOR_C0CM4CM13C5C2C1C17C1C0C0C0C0C1C1CM13C2_WEIGHT;
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



    WEIGHT_ROM: entity work.conv5_core3_rmcm_weightsconstant_memory
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
        
            dout1   => cm12c1cm10cm2c0cm2cm2cm1c0c0c0c0c2cm5cm11cm4_weight(0), 
            dout2   => cm1c9c2c6cm13c8c21cm2c0c0c0c0c7c17cm7c11_weight(0), 
            dout3   => cm2cm4c5cm3c13c1c6c3c0c0c0c0c4cm5c0cm3_weight(0), 
            dout4   => c21cm5c2c2cm1cm3c22c0c0c0c0c0c11cm3c0c16_weight(0), 
            dout5   => c25c0c3c0c2c2cm14cm4c0c0c0c0cm11c1c0cm8_weight(0), 
            dout6   => cm40cm5c1cm9c0c8c3c5c0c0c0c0cm3cm4cm2c6_weight(0), 
            dout7   => cm2cm16c1c0cm2cm3c2c1c0c0c0c0c0c4c12c1_weight(0), 
            dout8   => c0cm3cm1cm6cm7c3c32c11c0c0c0c0cm6c3cm12cm14_weight(0), 
            dout9   => c8c2cm3cm4c2cm4c1cm1c0c0c0c0cm22c13cm23cm10_weight(0), 
            dout10   => cm4c3cm18c1cm1c4c12cm9c0c0c0c0c30cm9c5c0_weight(0), 
            dout11   => c4c2cm4c4c0cm3c0cm2c0c0c0c0c2c7c3c11_weight(0), 
            dout12   => cm8c5c15cm3c3cm6c2cm2c0c0c0c0c22c1cm5cm3_weight(0), 
            dout13   => c30cm15cm14c1c1c2cm2c5c0c0c0c0c3c15c4c1_weight(0), 
            dout14   => cm7c0c16cm1c1c0cm2cm16c0c0c0c0c5cm3cm11cm2_weight(0), 
            dout15   => cm1cm2cm3c70c1c4c8c4c0c0c0c0c3cm27cm2cm13_weight(0), 
            dout16   => cm1c0c5c2cm2c4cm1c1c0c0c0c0cm14c3c6cm37_weight(0), 
            dout17   => cm8cm1c0cm7c1cm10cm7cm8c0c0c0c0cm19cm4cm10c11_weight(0), 
            dout18   => cm6cm2c15cm3cm2c0c1cm1c0c0c0c0c6c7cm3cm24_weight(0), 
            dout19   => c0cm8cm41c18c4cm8c14cm1c0c0c0c0c4c29cm2c1_weight(0), 
            dout20   => cm6c3cm7c1c3cm4c7cm6c0c0c0c0c19c1c1c6_weight(0), 
            dout21   => c1c0c6c2c1c0c13c15c0c0c0c0cm4c0c9c3_weight(0), 
            dout22   => cm2cm2cm36c21c0cm2cm2c3c0c0c0c0cm3cm8cm8cm5_weight(0), 
            dout23   => c7cm4c2c4c0c20c8cm5c0c0c0c0c6cm2c7c15_weight(0), 
            dout24   => cm2c0c6cm3c0c2c13cm1c0c0c0c0c3cm1cm44c8_weight(0), 
            dout25   => cm1cm8cm1c2c0cm10c0cm27c0c0c0c0cm10c10cm6c5_weight(0), 
            dout26   => c1cm2cm4c1c0c0c1cm1c0c0c0c0c2cm3cm2cm2_weight(0), 
            dout27   => c2cm1c5cm4c12c1c7c6c0c0c0c0c0c5cm1cm5_weight(0), 
            dout28   => cm2c2cm4cm2c36cm7c2cm22c0c0c0c0cm6cm33c15c1_weight(0), 
            dout29   => cm5c0c4c2c0c0cm1c4c0c0c0c0cm8cm5c0c3_weight(0), 
            dout30   => c3c10cm13c0c0c2c5c1c0c0c0c0c7c0c36c1_weight(0), 
            dout31   => c2c1cm12cm5cm6cm2cm1cm3c0c0c0c0c18cm9c4c2_weight(0), 
            dout32   => c0cm4cm13c5c2c1c17c1c0c0c0c0c1c1cm13c2_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm12c1cm10cm2c0cm2cm2cm1c0c0c0c0c2cm5cm11cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12c1cm10cm2c0cm2cm2cm1c0c0c0c0c2cm5cm11cm4_weight(0), cm12c1cm10cm2c0cm2cm2cm1c0c0c0c0c2cm5cm11cm4_weight(1));
    PL_STEP_0_for_cm1c9c2c6cm13c8c21cm2c0c0c0c0c7c17cm7c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c9c2c6cm13c8c21cm2c0c0c0c0c7c17cm7c11_weight(0), cm1c9c2c6cm13c8c21cm2c0c0c0c0c7c17cm7c11_weight(1));
    PL_STEP_0_for_cm2cm4c5cm3c13c1c6c3c0c0c0c0c4cm5c0cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm4c5cm3c13c1c6c3c0c0c0c0c4cm5c0cm3_weight(0), cm2cm4c5cm3c13c1c6c3c0c0c0c0c4cm5c0cm3_weight(1));
    PL_STEP_0_for_c21cm5c2c2cm1cm3c22c0c0c0c0c0c11cm3c0c16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c21cm5c2c2cm1cm3c22c0c0c0c0c0c11cm3c0c16_weight(0), c21cm5c2c2cm1cm3c22c0c0c0c0c0c11cm3c0c16_weight(1));
    PL_STEP_0_for_c25c0c3c0c2c2cm14cm4c0c0c0c0cm11c1c0cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c25c0c3c0c2c2cm14cm4c0c0c0c0cm11c1c0cm8_weight(0), c25c0c3c0c2c2cm14cm4c0c0c0c0cm11c1c0cm8_weight(1));
    PL_STEP_0_for_cm40cm5c1cm9c0c8c3c5c0c0c0c0cm3cm4cm2c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm40cm5c1cm9c0c8c3c5c0c0c0c0cm3cm4cm2c6_weight(0), cm40cm5c1cm9c0c8c3c5c0c0c0c0cm3cm4cm2c6_weight(1));
    PL_STEP_0_for_cm2cm16c1c0cm2cm3c2c1c0c0c0c0c0c4c12c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm16c1c0cm2cm3c2c1c0c0c0c0c0c4c12c1_weight(0), cm2cm16c1c0cm2cm3c2c1c0c0c0c0c0c4c12c1_weight(1));
    PL_STEP_0_for_c0cm3cm1cm6cm7c3c32c11c0c0c0c0cm6c3cm12cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm3cm1cm6cm7c3c32c11c0c0c0c0cm6c3cm12cm14_weight(0), c0cm3cm1cm6cm7c3c32c11c0c0c0c0cm6c3cm12cm14_weight(1));
    PL_STEP_0_for_c8c2cm3cm4c2cm4c1cm1c0c0c0c0cm22c13cm23cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c2cm3cm4c2cm4c1cm1c0c0c0c0cm22c13cm23cm10_weight(0), c8c2cm3cm4c2cm4c1cm1c0c0c0c0cm22c13cm23cm10_weight(1));
    PL_STEP_0_for_cm4c3cm18c1cm1c4c12cm9c0c0c0c0c30cm9c5c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c3cm18c1cm1c4c12cm9c0c0c0c0c30cm9c5c0_weight(0), cm4c3cm18c1cm1c4c12cm9c0c0c0c0c30cm9c5c0_weight(1));
    PL_STEP_0_for_c4c2cm4c4c0cm3c0cm2c0c0c0c0c2c7c3c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c2cm4c4c0cm3c0cm2c0c0c0c0c2c7c3c11_weight(0), c4c2cm4c4c0cm3c0cm2c0c0c0c0c2c7c3c11_weight(1));
    PL_STEP_0_for_cm8c5c15cm3c3cm6c2cm2c0c0c0c0c22c1cm5cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8c5c15cm3c3cm6c2cm2c0c0c0c0c22c1cm5cm3_weight(0), cm8c5c15cm3c3cm6c2cm2c0c0c0c0c22c1cm5cm3_weight(1));
    PL_STEP_0_for_c30cm15cm14c1c1c2cm2c5c0c0c0c0c3c15c4c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c30cm15cm14c1c1c2cm2c5c0c0c0c0c3c15c4c1_weight(0), c30cm15cm14c1c1c2cm2c5c0c0c0c0c3c15c4c1_weight(1));
    PL_STEP_0_for_cm7c0c16cm1c1c0cm2cm16c0c0c0c0c5cm3cm11cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c0c16cm1c1c0cm2cm16c0c0c0c0c5cm3cm11cm2_weight(0), cm7c0c16cm1c1c0cm2cm16c0c0c0c0c5cm3cm11cm2_weight(1));
    PL_STEP_0_for_cm1cm2cm3c70c1c4c8c4c0c0c0c0c3cm27cm2cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm2cm3c70c1c4c8c4c0c0c0c0c3cm27cm2cm13_weight(0), cm1cm2cm3c70c1c4c8c4c0c0c0c0c3cm27cm2cm13_weight(1));
    PL_STEP_0_for_cm1c0c5c2cm2c4cm1c1c0c0c0c0cm14c3c6cm37_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0c5c2cm2c4cm1c1c0c0c0c0cm14c3c6cm37_weight(0), cm1c0c5c2cm2c4cm1c1c0c0c0c0cm14c3c6cm37_weight(1));
    PL_STEP_0_for_cm8cm1c0cm7c1cm10cm7cm8c0c0c0c0cm19cm4cm10c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8cm1c0cm7c1cm10cm7cm8c0c0c0c0cm19cm4cm10c11_weight(0), cm8cm1c0cm7c1cm10cm7cm8c0c0c0c0cm19cm4cm10c11_weight(1));
    PL_STEP_0_for_cm6cm2c15cm3cm2c0c1cm1c0c0c0c0c6c7cm3cm24_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm2c15cm3cm2c0c1cm1c0c0c0c0c6c7cm3cm24_weight(0), cm6cm2c15cm3cm2c0c1cm1c0c0c0c0c6c7cm3cm24_weight(1));
    PL_STEP_0_for_c0cm8cm41c18c4cm8c14cm1c0c0c0c0c4c29cm2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm8cm41c18c4cm8c14cm1c0c0c0c0c4c29cm2c1_weight(0), c0cm8cm41c18c4cm8c14cm1c0c0c0c0c4c29cm2c1_weight(1));
    PL_STEP_0_for_cm6c3cm7c1c3cm4c7cm6c0c0c0c0c19c1c1c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c3cm7c1c3cm4c7cm6c0c0c0c0c19c1c1c6_weight(0), cm6c3cm7c1c3cm4c7cm6c0c0c0c0c19c1c1c6_weight(1));
    PL_STEP_0_for_c1c0c6c2c1c0c13c15c0c0c0c0cm4c0c9c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0c6c2c1c0c13c15c0c0c0c0cm4c0c9c3_weight(0), c1c0c6c2c1c0c13c15c0c0c0c0cm4c0c9c3_weight(1));
    PL_STEP_0_for_cm2cm2cm36c21c0cm2cm2c3c0c0c0c0cm3cm8cm8cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm2cm36c21c0cm2cm2c3c0c0c0c0cm3cm8cm8cm5_weight(0), cm2cm2cm36c21c0cm2cm2c3c0c0c0c0cm3cm8cm8cm5_weight(1));
    PL_STEP_0_for_c7cm4c2c4c0c20c8cm5c0c0c0c0c6cm2c7c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm4c2c4c0c20c8cm5c0c0c0c0c6cm2c7c15_weight(0), c7cm4c2c4c0c20c8cm5c0c0c0c0c6cm2c7c15_weight(1));
    PL_STEP_0_for_cm2c0c6cm3c0c2c13cm1c0c0c0c0c3cm1cm44c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c0c6cm3c0c2c13cm1c0c0c0c0c3cm1cm44c8_weight(0), cm2c0c6cm3c0c2c13cm1c0c0c0c0c3cm1cm44c8_weight(1));
    PL_STEP_0_for_cm1cm8cm1c2c0cm10c0cm27c0c0c0c0cm10c10cm6c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm8cm1c2c0cm10c0cm27c0c0c0c0cm10c10cm6c5_weight(0), cm1cm8cm1c2c0cm10c0cm27c0c0c0c0cm10c10cm6c5_weight(1));
    PL_STEP_0_for_c1cm2cm4c1c0c0c1cm1c0c0c0c0c2cm3cm2cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm2cm4c1c0c0c1cm1c0c0c0c0c2cm3cm2cm2_weight(0), c1cm2cm4c1c0c0c1cm1c0c0c0c0c2cm3cm2cm2_weight(1));
    PL_STEP_0_for_c2cm1c5cm4c12c1c7c6c0c0c0c0c0c5cm1cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm1c5cm4c12c1c7c6c0c0c0c0c0c5cm1cm5_weight(0), c2cm1c5cm4c12c1c7c6c0c0c0c0c0c5cm1cm5_weight(1));
    PL_STEP_0_for_cm2c2cm4cm2c36cm7c2cm22c0c0c0c0cm6cm33c15c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c2cm4cm2c36cm7c2cm22c0c0c0c0cm6cm33c15c1_weight(0), cm2c2cm4cm2c36cm7c2cm22c0c0c0c0cm6cm33c15c1_weight(1));
    PL_STEP_0_for_cm5c0c4c2c0c0cm1c4c0c0c0c0cm8cm5c0c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c0c4c2c0c0cm1c4c0c0c0c0cm8cm5c0c3_weight(0), cm5c0c4c2c0c0cm1c4c0c0c0c0cm8cm5c0c3_weight(1));
    PL_STEP_0_for_c3c10cm13c0c0c2c5c1c0c0c0c0c7c0c36c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c10cm13c0c0c2c5c1c0c0c0c0c7c0c36c1_weight(0), c3c10cm13c0c0c2c5c1c0c0c0c0c7c0c36c1_weight(1));
    PL_STEP_0_for_c2c1cm12cm5cm6cm2cm1cm3c0c0c0c0c18cm9c4c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1cm12cm5cm6cm2cm1cm3c0c0c0c0c18cm9c4c2_weight(0), c2c1cm12cm5cm6cm2cm1cm3c0c0c0c0c18cm9c4c2_weight(1));
    PL_STEP_0_for_c0cm4cm13c5c2c1c17c1c0c0c0c0c1c1cm13c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm4cm13c5c2c1c17c1c0c0c0c0c1c1cm13c2_weight(0), c0cm4cm13c5c2c1c17c1c0c0c0c0c1c1cm13c2_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm1cm2cm3c70c1c4c8c4c0c0c0c0c3cm27cm2cm13_c1cm2cm4c1c0c0c1cm1c0c0c0c0c2cm3cm2cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm2cm3c70c1c4c8c4c0c0c0c0c3cm27cm2cm13_weight(1)(8-1 downto 0),
			B	=> c1cm2cm4c1c0c0c1cm1c0c0c0c0c2cm3cm2cm2_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm2cm3c70c1c4c8c4c0c0c0c0c3cm27cm2cm13,
			CxB => R_c1cm2cm4c1c0c0c1cm1c0c0c0c0c2cm3cm2cm2
		);

    cm40cm5c1cm9c0c8c3c5c0c0c0c0cm3cm4cm2c6_cm5c0c4c2c0c0cm1c4c0c0c0c0cm8cm5c0c3_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm40cm5c1cm9c0c8c3c5c0c0c0c0cm3cm4cm2c6_weight(1)(7-1 downto 0),
			B	=> cm5c0c4c2c0c0cm1c4c0c0c0c0cm8cm5c0c3_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm40cm5c1cm9c0c8c3c5c0c0c0c0cm3cm4cm2c6,
			CxB => R_cm5c0c4c2c0c0cm1c4c0c0c0c0cm8cm5c0c3
		);

    c0cm3cm1cm6cm7c3c32c11c0c0c0c0cm6c3cm12cm14_c2cm1c5cm4c12c1c7c6c0c0c0c0c0c5cm1cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm3cm1cm6cm7c3c32c11c0c0c0c0cm6c3cm12cm14_weight(1)(7-1 downto 0),
			B	=> c2cm1c5cm4c12c1c7c6c0c0c0c0c0c5cm1cm5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm3cm1cm6cm7c3c32c11c0c0c0c0cm6c3cm12cm14,
			CxB => R_c2cm1c5cm4c12c1c7c6c0c0c0c0c0c5cm1cm5
		);

    cm1c0c5c2cm2c4cm1c1c0c0c0c0cm14c3c6cm37_c1c0c6c2c1c0c13c15c0c0c0c0cm4c0c9c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c0c5c2cm2c4cm1c1c0c0c0c0cm14c3c6cm37_weight(1)(7-1 downto 0),
			B	=> c1c0c6c2c1c0c13c15c0c0c0c0cm4c0c9c3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c0c5c2cm2c4cm1c1c0c0c0c0cm14c3c6cm37,
			CxB => R_c1c0c6c2c1c0c13c15c0c0c0c0cm4c0c9c3
		);

    c0cm8cm41c18c4cm8c14cm1c0c0c0c0c4c29cm2c1_c4c2cm4c4c0cm3c0cm2c0c0c0c0c2c7c3c11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm8cm41c18c4cm8c14cm1c0c0c0c0c4c29cm2c1_weight(1)(7-1 downto 0),
			B	=> c4c2cm4c4c0cm3c0cm2c0c0c0c0c2c7c3c11_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm8cm41c18c4cm8c14cm1c0c0c0c0c4c29cm2c1,
			CxB => R_c4c2cm4c4c0cm3c0cm2c0c0c0c0c2c7c3c11
		);

    cm2cm2cm36c21c0cm2cm2c3c0c0c0c0cm3cm8cm8cm5_cm2cm16c1c0cm2cm3c2c1c0c0c0c0c0c4c12c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm2cm36c21c0cm2cm2c3c0c0c0c0cm3cm8cm8cm5_weight(1)(7-1 downto 0),
			B	=> cm2cm16c1c0cm2cm3c2c1c0c0c0c0c0c4c12c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm2cm36c21c0cm2cm2c3c0c0c0c0cm3cm8cm8cm5,
			CxB => R_cm2cm16c1c0cm2cm3c2c1c0c0c0c0c0c4c12c1
		);

    cm2c0c6cm3c0c2c13cm1c0c0c0c0c3cm1cm44c8_cm2cm4c5cm3c13c1c6c3c0c0c0c0c4cm5c0cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c0c6cm3c0c2c13cm1c0c0c0c0c3cm1cm44c8_weight(1)(7-1 downto 0),
			B	=> cm2cm4c5cm3c13c1c6c3c0c0c0c0c4cm5c0cm3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c0c6cm3c0c2c13cm1c0c0c0c0c3cm1cm44c8,
			CxB => R_cm2cm4c5cm3c13c1c6c3c0c0c0c0c4cm5c0cm3
		);

    cm2c2cm4cm2c36cm7c2cm22c0c0c0c0cm6cm33c15c1_cm12c1cm10cm2c0cm2cm2cm1c0c0c0c0c2cm5cm11cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c2cm4cm2c36cm7c2cm22c0c0c0c0cm6cm33c15c1_weight(1)(7-1 downto 0),
			B	=> cm12c1cm10cm2c0cm2cm2cm1c0c0c0c0c2cm5cm11cm4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c2cm4cm2c36cm7c2cm22c0c0c0c0cm6cm33c15c1,
			CxB => R_cm12c1cm10cm2c0cm2cm2cm1c0c0c0c0c2cm5cm11cm4
		);

    c3c10cm13c0c0c2c5c1c0c0c0c0c7c0c36c1_c0cm4cm13c5c2c1c17c1c0c0c0c0c1c1cm13c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c10cm13c0c0c2c5c1c0c0c0c0c7c0c36c1_weight(1)(7-1 downto 0),
			B	=> c0cm4cm13c5c2c1c17c1c0c0c0c0c1c1cm13c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c10cm13c0c0c2c5c1c0c0c0c0c7c0c36c1,
			CxB => R_c0cm4cm13c5c2c1c17c1c0c0c0c0c1c1cm13c2
		);

    cm1c9c2c6cm13c8c21cm2c0c0c0c0c7c17cm7c11_c2c1cm12cm5cm6cm2cm1cm3c0c0c0c0c18cm9c4c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c9c2c6cm13c8c21cm2c0c0c0c0c7c17cm7c11_weight(1)(6-1 downto 0),
			B	=> c2c1cm12cm5cm6cm2cm1cm3c0c0c0c0c18cm9c4c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c9c2c6cm13c8c21cm2c0c0c0c0c7c17cm7c11,
			CxB => R_c2c1cm12cm5cm6cm2cm1cm3c0c0c0c0c18cm9c4c2
		);

    c21cm5c2c2cm1cm3c22c0c0c0c0c0c11cm3c0c16_cm1cm8cm1c2c0cm10c0cm27c0c0c0c0cm10c10cm6c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c21cm5c2c2cm1cm3c22c0c0c0c0c0c11cm3c0c16_weight(1)(6-1 downto 0),
			B	=> cm1cm8cm1c2c0cm10c0cm27c0c0c0c0cm10c10cm6c5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c21cm5c2c2cm1cm3c22c0c0c0c0c0c11cm3c0c16,
			CxB => R_cm1cm8cm1c2c0cm10c0cm27c0c0c0c0cm10c10cm6c5
		);

    c25c0c3c0c2c2cm14cm4c0c0c0c0cm11c1c0cm8_c7cm4c2c4c0c20c8cm5c0c0c0c0c6cm2c7c15_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c25c0c3c0c2c2cm14cm4c0c0c0c0cm11c1c0cm8_weight(1)(6-1 downto 0),
			B	=> c7cm4c2c4c0c20c8cm5c0c0c0c0c6cm2c7c15_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c25c0c3c0c2c2cm14cm4c0c0c0c0cm11c1c0cm8,
			CxB => R_c7cm4c2c4c0c20c8cm5c0c0c0c0c6cm2c7c15
		);

    c8c2cm3cm4c2cm4c1cm1c0c0c0c0cm22c13cm23cm10_cm6c3cm7c1c3cm4c7cm6c0c0c0c0c19c1c1c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c8c2cm3cm4c2cm4c1cm1c0c0c0c0cm22c13cm23cm10_weight(1)(6-1 downto 0),
			B	=> cm6c3cm7c1c3cm4c7cm6c0c0c0c0c19c1c1c6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c8c2cm3cm4c2cm4c1cm1c0c0c0c0cm22c13cm23cm10,
			CxB => R_cm6c3cm7c1c3cm4c7cm6c0c0c0c0c19c1c1c6
		);

    cm4c3cm18c1cm1c4c12cm9c0c0c0c0c30cm9c5c0_cm6cm2c15cm3cm2c0c1cm1c0c0c0c0c6c7cm3cm24_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4c3cm18c1cm1c4c12cm9c0c0c0c0c30cm9c5c0_weight(1)(6-1 downto 0),
			B	=> cm6cm2c15cm3cm2c0c1cm1c0c0c0c0c6c7cm3cm24_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4c3cm18c1cm1c4c12cm9c0c0c0c0c30cm9c5c0,
			CxB => R_cm6cm2c15cm3cm2c0c1cm1c0c0c0c0c6c7cm3cm24
		);

    cm8c5c15cm3c3cm6c2cm2c0c0c0c0c22c1cm5cm3_cm8cm1c0cm7c1cm10cm7cm8c0c0c0c0cm19cm4cm10c11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm8c5c15cm3c3cm6c2cm2c0c0c0c0c22c1cm5cm3_weight(1)(6-1 downto 0),
			B	=> cm8cm1c0cm7c1cm10cm7cm8c0c0c0c0cm19cm4cm10c11_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm8c5c15cm3c3cm6c2cm2c0c0c0c0c22c1cm5cm3,
			CxB => R_cm8cm1c0cm7c1cm10cm7cm8c0c0c0c0cm19cm4cm10c11
		);

    c30cm15cm14c1c1c2cm2c5c0c0c0c0c3c15c4c1_cm7c0c16cm1c1c0cm2cm16c0c0c0c0c5cm3cm11cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c30cm15cm14c1c1c2cm2c5c0c0c0c0c3c15c4c1_weight(1)(6-1 downto 0),
			B	=> cm7c0c16cm1c1c0cm2cm16c0c0c0c0c5cm3cm11cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c30cm15cm14c1c1c2cm2c5c0c0c0c0c3c15c4c1,
			CxB => R_cm7c0c16cm1c1c0cm2cm16c0c0c0c0c5cm3cm11cm2
		);




end architecture;
