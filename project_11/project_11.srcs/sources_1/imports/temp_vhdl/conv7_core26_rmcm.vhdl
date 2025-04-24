library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core26_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c1c5cm15c3c4c1cm1c0cm6c0cm2c3c2c4cm11cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm13c3c9cm6cm5cm2cm3cm7cm1c0c0c0c1c4c7c0 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm12c2c5c2c10cm4c2c9c1cm6c3cm2cm13c0cm8cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm8cm13c43c12c5c0c13cm4c15c2cm2c1cm8c2c29c13 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm24cm8cm9cm10c0cm2c43c1c1c19c7c0cm3c2c60cm8 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm13cm4cm16cm4cm5cm2c1cm9c1cm3c8cm22c3c1cm8c21 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c34c3c4c0cm97c10c1cm20cm1cm1cm1cm3cm19c0cm1c2 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm20c14cm2c3cm14c12c22cm2c1c4cm4cm3c18cm13cm6cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c1cm13c13c4c99cm6cm5cm21c5c3c11c1c30c21cm1 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c10cm2cm10c5cm4cm2cm6c21cm1c1cm19c0cm8cm1cm1cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0cm16cm16cm3c1cm1c0cm3c1c5c1c22cm12c0cm6cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c62cm1c0c1c1c1c3c3c4c0c1cm1c2cm2c2cm8 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3cm2cm15c1c2cm2cm6c8c1cm1c1c1c0c2cm3cm6 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c9cm3cm9c6cm12cm4cm4c3c2c3c2cm3c12c7cm3c0 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c6cm3c5c8c0cm22c13c1c5cm2c1cm8c7c43cm1cm7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm14c1c3c0c0c5c3c4c1c25cm4cm6c5cm11cm4cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c3c13c7cm24cm4cm2c5cm1cm10c13c6cm5c14c10c2cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm57cm8cm3c4cm2c0c2c0cm6c6cm2cm14c0cm3c7c8 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2c17cm10cm14c0cm116cm11cm7c3cm1c1c4c26cm59cm5c6 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c12c4cm4c45cm4cm6cm5c5c3cm1c18cm7c10c7cm4cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3c3c3cm6cm3cm2c1c10c1cm4c0c123c0cm12c8cm15 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm1c0cm12cm5c8cm7cm1cm19cm1c1cm3c5cm20c10cm2c14 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm16c0cm1cm10cm6cm8c3c0cm9c2c2c4cm3c3cm8c5 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm2cm30cm3cm1c2c3cm12c3cm1c10cm6cm2c12cm36c3cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c11c4cm18cm3c2cm4c14cm2c1c2cm3c0cm10cm5cm9c8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm3c0c0cm7cm1c5c1c2c7c3cm29cm6c4cm22c3c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm4cm12cm20cm1c91cm4cm5c0cm4c1c2c0c34c1c5c8 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c22c17cm18cm11cm5cm9c2cm93c0c0c13c1cm1cm7cm6cm17 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c0c2c16c0cm5cm7cm2c1c2cm4c1cm2c8c9c1c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm13c9c10cm1cm18cm11cm15cm2cm2cm16cm3cm2cm127c5c26c3 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm35c10c3c12cm3c58c0cm9c0cm2c1c6cm19c17cm5cm8 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2cm6cm11cm18cm6cm15cm1c13c4c4c2c10c5c24c11cm25 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core26_rmcm;

architecture arch of conv7_core26_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C5CM15C3C4C1CM1C0CM6C0CM2C3C2C4CM11CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C3C9CM6CM5CM2CM3CM7CM1C0C0C0C1C4C7C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12C2C5C2C10CM4C2C9C1CM6C3CM2CM13C0CM8CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8CM13C43C12C5C0C13CM4C15C2CM2C1CM8C2C29C13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM24CM8CM9CM10C0CM2C43C1C1C19C7C0CM3C2C60CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13CM4CM16CM4CM5CM2C1CM9C1CM3C8CM22C3C1CM8C21_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C34C3C4C0CM97C10C1CM20CM1CM1CM1CM3CM19C0CM1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM20C14CM2C3CM14C12C22CM2C1C4CM4CM3C18CM13CM6CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1CM13C13C4C99CM6CM5CM21C5C3C11C1C30C21CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10CM2CM10C5CM4CM2CM6C21CM1C1CM19C0CM8CM1CM1CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM16CM16CM3C1CM1C0CM3C1C5C1C22CM12C0CM6CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C62CM1C0C1C1C1C3C3C4C0C1CM1C2CM2C2CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM2CM15C1C2CM2CM6C8C1CM1C1C1C0C2CM3CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9CM3CM9C6CM12CM4CM4C3C2C3C2CM3C12C7CM3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM3C5C8C0CM22C13C1C5CM2C1CM8C7C43CM1CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14C1C3C0C0C5C3C4C1C25CM4CM6C5CM11CM4CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C13C7CM24CM4CM2C5CM1CM10C13C6CM5C14C10C2CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM57CM8CM3C4CM2C0C2C0CM6C6CM2CM14C0CM3C7C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C17CM10CM14C0CM116CM11CM7C3CM1C1C4C26CM59CM5C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12C4CM4C45CM4CM6CM5C5C3CM1C18CM7C10C7CM4CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C3C3CM6CM3CM2C1C10C1CM4C0C123C0CM12C8CM15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0CM12CM5C8CM7CM1CM19CM1C1CM3C5CM20C10CM2C14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM16C0CM1CM10CM6CM8C3C0CM9C2C2C4CM3C3CM8C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM30CM3CM1C2C3CM12C3CM1C10CM6CM2C12CM36C3CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C4CM18CM3C2CM4C14CM2C1C2CM3C0CM10CM5CM9C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C0C0CM7CM1C5C1C2C7C3CM29CM6C4CM22C3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM12CM20CM1C91CM4CM5C0CM4C1C2C0C34C1C5C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C22C17CM18CM11CM5CM9C2CM93C0C0C13C1CM1CM7CM6CM17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C2C16C0CM5CM7CM2C1C2CM4C1CM2C8C9C1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C9C10CM1CM18CM11CM15CM2CM2CM16CM3CM2CM127C5C26C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM35C10C3C12CM3C58C0CM9C0CM2C1C6CM19C17CM5CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM6CM11CM18CM6CM15CM1C13C4C4C2C10C5C24C11CM25_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c1c5cm15c3c4c1cm1c0cm6c0cm2c3c2c4cm11cm2_weight : PIPELINE_TYPE_FOR_C1C5CM15C3C4C1CM1C0CM6C0CM2C3C2C4CM11CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm13c3c9cm6cm5cm2cm3cm7cm1c0c0c0c1c4c7c0_weight : PIPELINE_TYPE_FOR_CM13C3C9CM6CM5CM2CM3CM7CM1C0C0C0C1C4C7C0_WEIGHT;
    -- sfix(1, -7)
    signal cm12c2c5c2c10cm4c2c9c1cm6c3cm2cm13c0cm8cm1_weight : PIPELINE_TYPE_FOR_CM12C2C5C2C10CM4C2C9C1CM6C3CM2CM13C0CM8CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm8cm13c43c12c5c0c13cm4c15c2cm2c1cm8c2c29c13_weight : PIPELINE_TYPE_FOR_CM8CM13C43C12C5C0C13CM4C15C2CM2C1CM8C2C29C13_WEIGHT;
    -- sfix(1, -7)
    signal cm24cm8cm9cm10c0cm2c43c1c1c19c7c0cm3c2c60cm8_weight : PIPELINE_TYPE_FOR_CM24CM8CM9CM10C0CM2C43C1C1C19C7C0CM3C2C60CM8_WEIGHT;
    -- sfix(1, -7)
    signal cm13cm4cm16cm4cm5cm2c1cm9c1cm3c8cm22c3c1cm8c21_weight : PIPELINE_TYPE_FOR_CM13CM4CM16CM4CM5CM2C1CM9C1CM3C8CM22C3C1CM8C21_WEIGHT;
    -- sfix(1, -7)
    signal c34c3c4c0cm97c10c1cm20cm1cm1cm1cm3cm19c0cm1c2_weight : PIPELINE_TYPE_FOR_C34C3C4C0CM97C10C1CM20CM1CM1CM1CM3CM19C0CM1C2_WEIGHT;
    -- sfix(1, -7)
    signal cm20c14cm2c3cm14c12c22cm2c1c4cm4cm3c18cm13cm6cm2_weight : PIPELINE_TYPE_FOR_CM20C14CM2C3CM14C12C22CM2C1C4CM4CM3C18CM13CM6CM2_WEIGHT;
    -- sfix(1, -7)
    signal c0c1cm13c13c4c99cm6cm5cm21c5c3c11c1c30c21cm1_weight : PIPELINE_TYPE_FOR_C0C1CM13C13C4C99CM6CM5CM21C5C3C11C1C30C21CM1_WEIGHT;
    -- sfix(1, -7)
    signal c10cm2cm10c5cm4cm2cm6c21cm1c1cm19c0cm8cm1cm1cm4_weight : PIPELINE_TYPE_FOR_C10CM2CM10C5CM4CM2CM6C21CM1C1CM19C0CM8CM1CM1CM4_WEIGHT;
    -- sfix(1, -7)
    signal c0cm16cm16cm3c1cm1c0cm3c1c5c1c22cm12c0cm6cm4_weight : PIPELINE_TYPE_FOR_C0CM16CM16CM3C1CM1C0CM3C1C5C1C22CM12C0CM6CM4_WEIGHT;
    -- sfix(1, -7)
    signal c62cm1c0c1c1c1c3c3c4c0c1cm1c2cm2c2cm8_weight : PIPELINE_TYPE_FOR_C62CM1C0C1C1C1C3C3C4C0C1CM1C2CM2C2CM8_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm2cm15c1c2cm2cm6c8c1cm1c1c1c0c2cm3cm6_weight : PIPELINE_TYPE_FOR_CM3CM2CM15C1C2CM2CM6C8C1CM1C1C1C0C2CM3CM6_WEIGHT;
    -- sfix(1, -7)
    signal c9cm3cm9c6cm12cm4cm4c3c2c3c2cm3c12c7cm3c0_weight : PIPELINE_TYPE_FOR_C9CM3CM9C6CM12CM4CM4C3C2C3C2CM3C12C7CM3C0_WEIGHT;
    -- sfix(1, -7)
    signal c6cm3c5c8c0cm22c13c1c5cm2c1cm8c7c43cm1cm7_weight : PIPELINE_TYPE_FOR_C6CM3C5C8C0CM22C13C1C5CM2C1CM8C7C43CM1CM7_WEIGHT;
    -- sfix(1, -7)
    signal cm14c1c3c0c0c5c3c4c1c25cm4cm6c5cm11cm4cm7_weight : PIPELINE_TYPE_FOR_CM14C1C3C0C0C5C3C4C1C25CM4CM6C5CM11CM4CM7_WEIGHT;
    -- sfix(1, -7)
    signal c3c13c7cm24cm4cm2c5cm1cm10c13c6cm5c14c10c2cm5_weight : PIPELINE_TYPE_FOR_C3C13C7CM24CM4CM2C5CM1CM10C13C6CM5C14C10C2CM5_WEIGHT;
    -- sfix(1, -7)
    signal cm57cm8cm3c4cm2c0c2c0cm6c6cm2cm14c0cm3c7c8_weight : PIPELINE_TYPE_FOR_CM57CM8CM3C4CM2C0C2C0CM6C6CM2CM14C0CM3C7C8_WEIGHT;
    -- sfix(1, -7)
    signal c2c17cm10cm14c0cm116cm11cm7c3cm1c1c4c26cm59cm5c6_weight : PIPELINE_TYPE_FOR_C2C17CM10CM14C0CM116CM11CM7C3CM1C1C4C26CM59CM5C6_WEIGHT;
    -- sfix(1, -7)
    signal c12c4cm4c45cm4cm6cm5c5c3cm1c18cm7c10c7cm4cm2_weight : PIPELINE_TYPE_FOR_C12C4CM4C45CM4CM6CM5C5C3CM1C18CM7C10C7CM4CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm3c3c3cm6cm3cm2c1c10c1cm4c0c123c0cm12c8cm15_weight : PIPELINE_TYPE_FOR_CM3C3C3CM6CM3CM2C1C10C1CM4C0C123C0CM12C8CM15_WEIGHT;
    -- sfix(1, -7)
    signal cm1c0cm12cm5c8cm7cm1cm19cm1c1cm3c5cm20c10cm2c14_weight : PIPELINE_TYPE_FOR_CM1C0CM12CM5C8CM7CM1CM19CM1C1CM3C5CM20C10CM2C14_WEIGHT;
    -- sfix(1, -7)
    signal cm16c0cm1cm10cm6cm8c3c0cm9c2c2c4cm3c3cm8c5_weight : PIPELINE_TYPE_FOR_CM16C0CM1CM10CM6CM8C3C0CM9C2C2C4CM3C3CM8C5_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm30cm3cm1c2c3cm12c3cm1c10cm6cm2c12cm36c3cm3_weight : PIPELINE_TYPE_FOR_CM2CM30CM3CM1C2C3CM12C3CM1C10CM6CM2C12CM36C3CM3_WEIGHT;
    -- sfix(1, -7)
    signal c11c4cm18cm3c2cm4c14cm2c1c2cm3c0cm10cm5cm9c8_weight : PIPELINE_TYPE_FOR_C11C4CM18CM3C2CM4C14CM2C1C2CM3C0CM10CM5CM9C8_WEIGHT;
    -- sfix(1, -7)
    signal cm3c0c0cm7cm1c5c1c2c7c3cm29cm6c4cm22c3c0_weight : PIPELINE_TYPE_FOR_CM3C0C0CM7CM1C5C1C2C7C3CM29CM6C4CM22C3C0_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm12cm20cm1c91cm4cm5c0cm4c1c2c0c34c1c5c8_weight : PIPELINE_TYPE_FOR_CM4CM12CM20CM1C91CM4CM5C0CM4C1C2C0C34C1C5C8_WEIGHT;
    -- sfix(1, -7)
    signal c22c17cm18cm11cm5cm9c2cm93c0c0c13c1cm1cm7cm6cm17_weight : PIPELINE_TYPE_FOR_C22C17CM18CM11CM5CM9C2CM93C0C0C13C1CM1CM7CM6CM17_WEIGHT;
    -- sfix(1, -7)
    signal c0c2c16c0cm5cm7cm2c1c2cm4c1cm2c8c9c1c2_weight : PIPELINE_TYPE_FOR_C0C2C16C0CM5CM7CM2C1C2CM4C1CM2C8C9C1C2_WEIGHT;
    -- sfix(1, -7)
    signal cm13c9c10cm1cm18cm11cm15cm2cm2cm16cm3cm2cm127c5c26c3_weight : PIPELINE_TYPE_FOR_CM13C9C10CM1CM18CM11CM15CM2CM2CM16CM3CM2CM127C5C26C3_WEIGHT;
    -- sfix(1, -7)
    signal cm35c10c3c12cm3c58c0cm9c0cm2c1c6cm19c17cm5cm8_weight : PIPELINE_TYPE_FOR_CM35C10C3C12CM3C58C0CM9C0CM2C1C6CM19C17CM5CM8_WEIGHT;
    -- sfix(1, -7)
    signal c2cm6cm11cm18cm6cm15cm1c13c4c4c2c10c5c24c11cm25_weight : PIPELINE_TYPE_FOR_C2CM6CM11CM18CM6CM15CM1C13C4C4C2C10C5C24C11CM25_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core26_rmcm_weightsconstant_memory
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
        
            dout1   => c1c5cm15c3c4c1cm1c0cm6c0cm2c3c2c4cm11cm2_weight(0), 
            dout2   => cm13c3c9cm6cm5cm2cm3cm7cm1c0c0c0c1c4c7c0_weight(0), 
            dout3   => cm12c2c5c2c10cm4c2c9c1cm6c3cm2cm13c0cm8cm1_weight(0), 
            dout4   => cm8cm13c43c12c5c0c13cm4c15c2cm2c1cm8c2c29c13_weight(0), 
            dout5   => cm24cm8cm9cm10c0cm2c43c1c1c19c7c0cm3c2c60cm8_weight(0), 
            dout6   => cm13cm4cm16cm4cm5cm2c1cm9c1cm3c8cm22c3c1cm8c21_weight(0), 
            dout7   => c34c3c4c0cm97c10c1cm20cm1cm1cm1cm3cm19c0cm1c2_weight(0), 
            dout8   => cm20c14cm2c3cm14c12c22cm2c1c4cm4cm3c18cm13cm6cm2_weight(0), 
            dout9   => c0c1cm13c13c4c99cm6cm5cm21c5c3c11c1c30c21cm1_weight(0), 
            dout10   => c10cm2cm10c5cm4cm2cm6c21cm1c1cm19c0cm8cm1cm1cm4_weight(0), 
            dout11   => c0cm16cm16cm3c1cm1c0cm3c1c5c1c22cm12c0cm6cm4_weight(0), 
            dout12   => c62cm1c0c1c1c1c3c3c4c0c1cm1c2cm2c2cm8_weight(0), 
            dout13   => cm3cm2cm15c1c2cm2cm6c8c1cm1c1c1c0c2cm3cm6_weight(0), 
            dout14   => c9cm3cm9c6cm12cm4cm4c3c2c3c2cm3c12c7cm3c0_weight(0), 
            dout15   => c6cm3c5c8c0cm22c13c1c5cm2c1cm8c7c43cm1cm7_weight(0), 
            dout16   => cm14c1c3c0c0c5c3c4c1c25cm4cm6c5cm11cm4cm7_weight(0), 
            dout17   => c3c13c7cm24cm4cm2c5cm1cm10c13c6cm5c14c10c2cm5_weight(0), 
            dout18   => cm57cm8cm3c4cm2c0c2c0cm6c6cm2cm14c0cm3c7c8_weight(0), 
            dout19   => c2c17cm10cm14c0cm116cm11cm7c3cm1c1c4c26cm59cm5c6_weight(0), 
            dout20   => c12c4cm4c45cm4cm6cm5c5c3cm1c18cm7c10c7cm4cm2_weight(0), 
            dout21   => cm3c3c3cm6cm3cm2c1c10c1cm4c0c123c0cm12c8cm15_weight(0), 
            dout22   => cm1c0cm12cm5c8cm7cm1cm19cm1c1cm3c5cm20c10cm2c14_weight(0), 
            dout23   => cm16c0cm1cm10cm6cm8c3c0cm9c2c2c4cm3c3cm8c5_weight(0), 
            dout24   => cm2cm30cm3cm1c2c3cm12c3cm1c10cm6cm2c12cm36c3cm3_weight(0), 
            dout25   => c11c4cm18cm3c2cm4c14cm2c1c2cm3c0cm10cm5cm9c8_weight(0), 
            dout26   => cm3c0c0cm7cm1c5c1c2c7c3cm29cm6c4cm22c3c0_weight(0), 
            dout27   => cm4cm12cm20cm1c91cm4cm5c0cm4c1c2c0c34c1c5c8_weight(0), 
            dout28   => c22c17cm18cm11cm5cm9c2cm93c0c0c13c1cm1cm7cm6cm17_weight(0), 
            dout29   => c0c2c16c0cm5cm7cm2c1c2cm4c1cm2c8c9c1c2_weight(0), 
            dout30   => cm13c9c10cm1cm18cm11cm15cm2cm2cm16cm3cm2cm127c5c26c3_weight(0), 
            dout31   => cm35c10c3c12cm3c58c0cm9c0cm2c1c6cm19c17cm5cm8_weight(0), 
            dout32   => c2cm6cm11cm18cm6cm15cm1c13c4c4c2c10c5c24c11cm25_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c1c5cm15c3c4c1cm1c0cm6c0cm2c3c2c4cm11cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c5cm15c3c4c1cm1c0cm6c0cm2c3c2c4cm11cm2_weight(0), c1c5cm15c3c4c1cm1c0cm6c0cm2c3c2c4cm11cm2_weight(1));
    PL_STEP_0_for_cm13c3c9cm6cm5cm2cm3cm7cm1c0c0c0c1c4c7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c3c9cm6cm5cm2cm3cm7cm1c0c0c0c1c4c7c0_weight(0), cm13c3c9cm6cm5cm2cm3cm7cm1c0c0c0c1c4c7c0_weight(1));
    PL_STEP_0_for_cm12c2c5c2c10cm4c2c9c1cm6c3cm2cm13c0cm8cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12c2c5c2c10cm4c2c9c1cm6c3cm2cm13c0cm8cm1_weight(0), cm12c2c5c2c10cm4c2c9c1cm6c3cm2cm13c0cm8cm1_weight(1));
    PL_STEP_0_for_cm8cm13c43c12c5c0c13cm4c15c2cm2c1cm8c2c29c13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8cm13c43c12c5c0c13cm4c15c2cm2c1cm8c2c29c13_weight(0), cm8cm13c43c12c5c0c13cm4c15c2cm2c1cm8c2c29c13_weight(1));
    PL_STEP_0_for_cm24cm8cm9cm10c0cm2c43c1c1c19c7c0cm3c2c60cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm24cm8cm9cm10c0cm2c43c1c1c19c7c0cm3c2c60cm8_weight(0), cm24cm8cm9cm10c0cm2c43c1c1c19c7c0cm3c2c60cm8_weight(1));
    PL_STEP_0_for_cm13cm4cm16cm4cm5cm2c1cm9c1cm3c8cm22c3c1cm8c21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13cm4cm16cm4cm5cm2c1cm9c1cm3c8cm22c3c1cm8c21_weight(0), cm13cm4cm16cm4cm5cm2c1cm9c1cm3c8cm22c3c1cm8c21_weight(1));
    PL_STEP_0_for_c34c3c4c0cm97c10c1cm20cm1cm1cm1cm3cm19c0cm1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c34c3c4c0cm97c10c1cm20cm1cm1cm1cm3cm19c0cm1c2_weight(0), c34c3c4c0cm97c10c1cm20cm1cm1cm1cm3cm19c0cm1c2_weight(1));
    PL_STEP_0_for_cm20c14cm2c3cm14c12c22cm2c1c4cm4cm3c18cm13cm6cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm20c14cm2c3cm14c12c22cm2c1c4cm4cm3c18cm13cm6cm2_weight(0), cm20c14cm2c3cm14c12c22cm2c1c4cm4cm3c18cm13cm6cm2_weight(1));
    PL_STEP_0_for_c0c1cm13c13c4c99cm6cm5cm21c5c3c11c1c30c21cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1cm13c13c4c99cm6cm5cm21c5c3c11c1c30c21cm1_weight(0), c0c1cm13c13c4c99cm6cm5cm21c5c3c11c1c30c21cm1_weight(1));
    PL_STEP_0_for_c10cm2cm10c5cm4cm2cm6c21cm1c1cm19c0cm8cm1cm1cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10cm2cm10c5cm4cm2cm6c21cm1c1cm19c0cm8cm1cm1cm4_weight(0), c10cm2cm10c5cm4cm2cm6c21cm1c1cm19c0cm8cm1cm1cm4_weight(1));
    PL_STEP_0_for_c0cm16cm16cm3c1cm1c0cm3c1c5c1c22cm12c0cm6cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm16cm16cm3c1cm1c0cm3c1c5c1c22cm12c0cm6cm4_weight(0), c0cm16cm16cm3c1cm1c0cm3c1c5c1c22cm12c0cm6cm4_weight(1));
    PL_STEP_0_for_c62cm1c0c1c1c1c3c3c4c0c1cm1c2cm2c2cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c62cm1c0c1c1c1c3c3c4c0c1cm1c2cm2c2cm8_weight(0), c62cm1c0c1c1c1c3c3c4c0c1cm1c2cm2c2cm8_weight(1));
    PL_STEP_0_for_cm3cm2cm15c1c2cm2cm6c8c1cm1c1c1c0c2cm3cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm2cm15c1c2cm2cm6c8c1cm1c1c1c0c2cm3cm6_weight(0), cm3cm2cm15c1c2cm2cm6c8c1cm1c1c1c0c2cm3cm6_weight(1));
    PL_STEP_0_for_c9cm3cm9c6cm12cm4cm4c3c2c3c2cm3c12c7cm3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9cm3cm9c6cm12cm4cm4c3c2c3c2cm3c12c7cm3c0_weight(0), c9cm3cm9c6cm12cm4cm4c3c2c3c2cm3c12c7cm3c0_weight(1));
    PL_STEP_0_for_c6cm3c5c8c0cm22c13c1c5cm2c1cm8c7c43cm1cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm3c5c8c0cm22c13c1c5cm2c1cm8c7c43cm1cm7_weight(0), c6cm3c5c8c0cm22c13c1c5cm2c1cm8c7c43cm1cm7_weight(1));
    PL_STEP_0_for_cm14c1c3c0c0c5c3c4c1c25cm4cm6c5cm11cm4cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14c1c3c0c0c5c3c4c1c25cm4cm6c5cm11cm4cm7_weight(0), cm14c1c3c0c0c5c3c4c1c25cm4cm6c5cm11cm4cm7_weight(1));
    PL_STEP_0_for_c3c13c7cm24cm4cm2c5cm1cm10c13c6cm5c14c10c2cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c13c7cm24cm4cm2c5cm1cm10c13c6cm5c14c10c2cm5_weight(0), c3c13c7cm24cm4cm2c5cm1cm10c13c6cm5c14c10c2cm5_weight(1));
    PL_STEP_0_for_cm57cm8cm3c4cm2c0c2c0cm6c6cm2cm14c0cm3c7c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm57cm8cm3c4cm2c0c2c0cm6c6cm2cm14c0cm3c7c8_weight(0), cm57cm8cm3c4cm2c0c2c0cm6c6cm2cm14c0cm3c7c8_weight(1));
    PL_STEP_0_for_c2c17cm10cm14c0cm116cm11cm7c3cm1c1c4c26cm59cm5c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c17cm10cm14c0cm116cm11cm7c3cm1c1c4c26cm59cm5c6_weight(0), c2c17cm10cm14c0cm116cm11cm7c3cm1c1c4c26cm59cm5c6_weight(1));
    PL_STEP_0_for_c12c4cm4c45cm4cm6cm5c5c3cm1c18cm7c10c7cm4cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12c4cm4c45cm4cm6cm5c5c3cm1c18cm7c10c7cm4cm2_weight(0), c12c4cm4c45cm4cm6cm5c5c3cm1c18cm7c10c7cm4cm2_weight(1));
    PL_STEP_0_for_cm3c3c3cm6cm3cm2c1c10c1cm4c0c123c0cm12c8cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c3c3cm6cm3cm2c1c10c1cm4c0c123c0cm12c8cm15_weight(0), cm3c3c3cm6cm3cm2c1c10c1cm4c0c123c0cm12c8cm15_weight(1));
    PL_STEP_0_for_cm1c0cm12cm5c8cm7cm1cm19cm1c1cm3c5cm20c10cm2c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0cm12cm5c8cm7cm1cm19cm1c1cm3c5cm20c10cm2c14_weight(0), cm1c0cm12cm5c8cm7cm1cm19cm1c1cm3c5cm20c10cm2c14_weight(1));
    PL_STEP_0_for_cm16c0cm1cm10cm6cm8c3c0cm9c2c2c4cm3c3cm8c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm16c0cm1cm10cm6cm8c3c0cm9c2c2c4cm3c3cm8c5_weight(0), cm16c0cm1cm10cm6cm8c3c0cm9c2c2c4cm3c3cm8c5_weight(1));
    PL_STEP_0_for_cm2cm30cm3cm1c2c3cm12c3cm1c10cm6cm2c12cm36c3cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm30cm3cm1c2c3cm12c3cm1c10cm6cm2c12cm36c3cm3_weight(0), cm2cm30cm3cm1c2c3cm12c3cm1c10cm6cm2c12cm36c3cm3_weight(1));
    PL_STEP_0_for_c11c4cm18cm3c2cm4c14cm2c1c2cm3c0cm10cm5cm9c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c4cm18cm3c2cm4c14cm2c1c2cm3c0cm10cm5cm9c8_weight(0), c11c4cm18cm3c2cm4c14cm2c1c2cm3c0cm10cm5cm9c8_weight(1));
    PL_STEP_0_for_cm3c0c0cm7cm1c5c1c2c7c3cm29cm6c4cm22c3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c0c0cm7cm1c5c1c2c7c3cm29cm6c4cm22c3c0_weight(0), cm3c0c0cm7cm1c5c1c2c7c3cm29cm6c4cm22c3c0_weight(1));
    PL_STEP_0_for_cm4cm12cm20cm1c91cm4cm5c0cm4c1c2c0c34c1c5c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm12cm20cm1c91cm4cm5c0cm4c1c2c0c34c1c5c8_weight(0), cm4cm12cm20cm1c91cm4cm5c0cm4c1c2c0c34c1c5c8_weight(1));
    PL_STEP_0_for_c22c17cm18cm11cm5cm9c2cm93c0c0c13c1cm1cm7cm6cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c22c17cm18cm11cm5cm9c2cm93c0c0c13c1cm1cm7cm6cm17_weight(0), c22c17cm18cm11cm5cm9c2cm93c0c0c13c1cm1cm7cm6cm17_weight(1));
    PL_STEP_0_for_c0c2c16c0cm5cm7cm2c1c2cm4c1cm2c8c9c1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c2c16c0cm5cm7cm2c1c2cm4c1cm2c8c9c1c2_weight(0), c0c2c16c0cm5cm7cm2c1c2cm4c1cm2c8c9c1c2_weight(1));
    PL_STEP_0_for_cm13c9c10cm1cm18cm11cm15cm2cm2cm16cm3cm2cm127c5c26c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c9c10cm1cm18cm11cm15cm2cm2cm16cm3cm2cm127c5c26c3_weight(0), cm13c9c10cm1cm18cm11cm15cm2cm2cm16cm3cm2cm127c5c26c3_weight(1));
    PL_STEP_0_for_cm35c10c3c12cm3c58c0cm9c0cm2c1c6cm19c17cm5cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm35c10c3c12cm3c58c0cm9c0cm2c1c6cm19c17cm5cm8_weight(0), cm35c10c3c12cm3c58c0cm9c0cm2c1c6cm19c17cm5cm8_weight(1));
    PL_STEP_0_for_c2cm6cm11cm18cm6cm15cm1c13c4c4c2c10c5c24c11cm25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm6cm11cm18cm6cm15cm1c13c4c4c2c10c5c24c11cm25_weight(0), c2cm6cm11cm18cm6cm15cm1c13c4c4c2c10c5c24c11cm25_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c34c3c4c0cm97c10c1cm20cm1cm1cm1cm3cm19c0cm1c2_cm16c0cm1cm10cm6cm8c3c0cm9c2c2c4cm3c3cm8c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c34c3c4c0cm97c10c1cm20cm1cm1cm1cm3cm19c0cm1c2_weight(1)(8-1 downto 0),
			B	=> cm16c0cm1cm10cm6cm8c3c0cm9c2c2c4cm3c3cm8c5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c34c3c4c0cm97c10c1cm20cm1cm1cm1cm3cm19c0cm1c2,
			CxB => R_cm16c0cm1cm10cm6cm8c3c0cm9c2c2c4cm3c3cm8c5
		);

    c0c1cm13c13c4c99cm6cm5cm21c5c3c11c1c30c21cm1_c9cm3cm9c6cm12cm4cm4c3c2c3c2cm3c12c7cm3c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c1cm13c13c4c99cm6cm5cm21c5c3c11c1c30c21cm1_weight(1)(8-1 downto 0),
			B	=> c9cm3cm9c6cm12cm4cm4c3c2c3c2cm3c12c7cm3c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c1cm13c13c4c99cm6cm5cm21c5c3c11c1c30c21cm1,
			CxB => R_c9cm3cm9c6cm12cm4cm4c3c2c3c2cm3c12c7cm3c0
		);

    c2c17cm10cm14c0cm116cm11cm7c3cm1c1c4c26cm59cm5c6_cm3cm2cm15c1c2cm2cm6c8c1cm1c1c1c0c2cm3cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c17cm10cm14c0cm116cm11cm7c3cm1c1c4c26cm59cm5c6_weight(1)(8-1 downto 0),
			B	=> cm3cm2cm15c1c2cm2cm6c8c1cm1c1c1c0c2cm3cm6_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c17cm10cm14c0cm116cm11cm7c3cm1c1c4c26cm59cm5c6,
			CxB => R_cm3cm2cm15c1c2cm2cm6c8c1cm1c1c1c0c2cm3cm6
		);

    cm3c3c3cm6cm3cm2c1c10c1cm4c0c123c0cm12c8cm15_cm12c2c5c2c10cm4c2c9c1cm6c3cm2cm13c0cm8cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c3c3cm6cm3cm2c1c10c1cm4c0c123c0cm12c8cm15_weight(1)(8-1 downto 0),
			B	=> cm12c2c5c2c10cm4c2c9c1cm6c3cm2cm13c0cm8cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c3c3cm6cm3cm2c1c10c1cm4c0c123c0cm12c8cm15,
			CxB => R_cm12c2c5c2c10cm4c2c9c1cm6c3cm2cm13c0cm8cm1
		);

    cm4cm12cm20cm1c91cm4cm5c0cm4c1c2c0c34c1c5c8_cm13c3c9cm6cm5cm2cm3cm7cm1c0c0c0c1c4c7c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm12cm20cm1c91cm4cm5c0cm4c1c2c0c34c1c5c8_weight(1)(8-1 downto 0),
			B	=> cm13c3c9cm6cm5cm2cm3cm7cm1c0c0c0c1c4c7c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm12cm20cm1c91cm4cm5c0cm4c1c2c0c34c1c5c8,
			CxB => R_cm13c3c9cm6cm5cm2cm3cm7cm1c0c0c0c1c4c7c0
		);

    c22c17cm18cm11cm5cm9c2cm93c0c0c13c1cm1cm7cm6cm17_c1c5cm15c3c4c1cm1c0cm6c0cm2c3c2c4cm11cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c22c17cm18cm11cm5cm9c2cm93c0c0c13c1cm1cm7cm6cm17_weight(1)(8-1 downto 0),
			B	=> c1c5cm15c3c4c1cm1c0cm6c0cm2c3c2c4cm11cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c22c17cm18cm11cm5cm9c2cm93c0c0c13c1cm1cm7cm6cm17,
			CxB => R_c1c5cm15c3c4c1cm1c0cm6c0cm2c3c2c4cm11cm2
		);

    cm13c9c10cm1cm18cm11cm15cm2cm2cm16cm3cm2cm127c5c26c3_c2cm6cm11cm18cm6cm15cm1c13c4c4c2c10c5c24c11cm25_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm13c9c10cm1cm18cm11cm15cm2cm2cm16cm3cm2cm127c5c26c3_weight(1)(8-1 downto 0),
			B	=> c2cm6cm11cm18cm6cm15cm1c13c4c4c2c10c5c24c11cm25_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm13c9c10cm1cm18cm11cm15cm2cm2cm16cm3cm2cm127c5c26c3,
			CxB => R_c2cm6cm11cm18cm6cm15cm1c13c4c4c2c10c5c24c11cm25
		);

    cm8cm13c43c12c5c0c13cm4c15c2cm2c1cm8c2c29c13_c0c2c16c0cm5cm7cm2c1c2cm4c1cm2c8c9c1c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm8cm13c43c12c5c0c13cm4c15c2cm2c1cm8c2c29c13_weight(1)(7-1 downto 0),
			B	=> c0c2c16c0cm5cm7cm2c1c2cm4c1cm2c8c9c1c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm8cm13c43c12c5c0c13cm4c15c2cm2c1cm8c2c29c13,
			CxB => R_c0c2c16c0cm5cm7cm2c1c2cm4c1cm2c8c9c1c2
		);

    cm24cm8cm9cm10c0cm2c43c1c1c19c7c0cm3c2c60cm8_cm3c0c0cm7cm1c5c1c2c7c3cm29cm6c4cm22c3c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm24cm8cm9cm10c0cm2c43c1c1c19c7c0cm3c2c60cm8_weight(1)(7-1 downto 0),
			B	=> cm3c0c0cm7cm1c5c1c2c7c3cm29cm6c4cm22c3c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm24cm8cm9cm10c0cm2c43c1c1c19c7c0cm3c2c60cm8,
			CxB => R_cm3c0c0cm7cm1c5c1c2c7c3cm29cm6c4cm22c3c0
		);

    c62cm1c0c1c1c1c3c3c4c0c1cm1c2cm2c2cm8_c11c4cm18cm3c2cm4c14cm2c1c2cm3c0cm10cm5cm9c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c62cm1c0c1c1c1c3c3c4c0c1cm1c2cm2c2cm8_weight(1)(7-1 downto 0),
			B	=> c11c4cm18cm3c2cm4c14cm2c1c2cm3c0cm10cm5cm9c8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c62cm1c0c1c1c1c3c3c4c0c1cm1c2cm2c2cm8,
			CxB => R_c11c4cm18cm3c2cm4c14cm2c1c2cm3c0cm10cm5cm9c8
		);

    c6cm3c5c8c0cm22c13c1c5cm2c1cm8c7c43cm1cm7_cm1c0cm12cm5c8cm7cm1cm19cm1c1cm3c5cm20c10cm2c14_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6cm3c5c8c0cm22c13c1c5cm2c1cm8c7c43cm1cm7_weight(1)(7-1 downto 0),
			B	=> cm1c0cm12cm5c8cm7cm1cm19cm1c1cm3c5cm20c10cm2c14_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm3c5c8c0cm22c13c1c5cm2c1cm8c7c43cm1cm7,
			CxB => R_cm1c0cm12cm5c8cm7cm1cm19cm1c1cm3c5cm20c10cm2c14
		);

    cm57cm8cm3c4cm2c0c2c0cm6c6cm2cm14c0cm3c7c8_c3c13c7cm24cm4cm2c5cm1cm10c13c6cm5c14c10c2cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm57cm8cm3c4cm2c0c2c0cm6c6cm2cm14c0cm3c7c8_weight(1)(7-1 downto 0),
			B	=> c3c13c7cm24cm4cm2c5cm1cm10c13c6cm5c14c10c2cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm57cm8cm3c4cm2c0c2c0cm6c6cm2cm14c0cm3c7c8,
			CxB => R_c3c13c7cm24cm4cm2c5cm1cm10c13c6cm5c14c10c2cm5
		);

    c12c4cm4c45cm4cm6cm5c5c3cm1c18cm7c10c7cm4cm2_cm14c1c3c0c0c5c3c4c1c25cm4cm6c5cm11cm4cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c12c4cm4c45cm4cm6cm5c5c3cm1c18cm7c10c7cm4cm2_weight(1)(7-1 downto 0),
			B	=> cm14c1c3c0c0c5c3c4c1c25cm4cm6c5cm11cm4cm7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c12c4cm4c45cm4cm6cm5c5c3cm1c18cm7c10c7cm4cm2,
			CxB => R_cm14c1c3c0c0c5c3c4c1c25cm4cm6c5cm11cm4cm7
		);

    cm2cm30cm3cm1c2c3cm12c3cm1c10cm6cm2c12cm36c3cm3_c0cm16cm16cm3c1cm1c0cm3c1c5c1c22cm12c0cm6cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm30cm3cm1c2c3cm12c3cm1c10cm6cm2c12cm36c3cm3_weight(1)(7-1 downto 0),
			B	=> c0cm16cm16cm3c1cm1c0cm3c1c5c1c22cm12c0cm6cm4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm30cm3cm1c2c3cm12c3cm1c10cm6cm2c12cm36c3cm3,
			CxB => R_c0cm16cm16cm3c1cm1c0cm3c1c5c1c22cm12c0cm6cm4
		);

    cm35c10c3c12cm3c58c0cm9c0cm2c1c6cm19c17cm5cm8_c10cm2cm10c5cm4cm2cm6c21cm1c1cm19c0cm8cm1cm1cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm35c10c3c12cm3c58c0cm9c0cm2c1c6cm19c17cm5cm8_weight(1)(7-1 downto 0),
			B	=> c10cm2cm10c5cm4cm2cm6c21cm1c1cm19c0cm8cm1cm1cm4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm35c10c3c12cm3c58c0cm9c0cm2c1c6cm19c17cm5cm8,
			CxB => R_c10cm2cm10c5cm4cm2cm6c21cm1c1cm19c0cm8cm1cm1cm4
		);

    cm13cm4cm16cm4cm5cm2c1cm9c1cm3c8cm22c3c1cm8c21_cm20c14cm2c3cm14c12c22cm2c1c4cm4cm3c18cm13cm6cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm13cm4cm16cm4cm5cm2c1cm9c1cm3c8cm22c3c1cm8c21_weight(1)(6-1 downto 0),
			B	=> cm20c14cm2c3cm14c12c22cm2c1c4cm4cm3c18cm13cm6cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm13cm4cm16cm4cm5cm2c1cm9c1cm3c8cm22c3c1cm8c21,
			CxB => R_cm20c14cm2c3cm14c12c22cm2c1c4cm4cm3c18cm13cm6cm2
		);




end architecture;
