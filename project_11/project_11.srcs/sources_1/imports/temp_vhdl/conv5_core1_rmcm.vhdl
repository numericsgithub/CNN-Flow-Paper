library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core1_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c6cm13c41c1cm1cm5cm36c1c18cm8cm18c2cm11c2c4c2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm10c0c1cm1cm19c9cm1c2c54cm9c1c0cm13c12cm2c3 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c4c16c0c2cm5cm12cm5c1cm3c15cm22c0c7cm2cm8cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c4c46c0cm4cm5c2c0c6c1c18c4c2cm6cm1c3cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c3c0c2c1c3c1c7c2cm3c1cm5c2cm8c0cm2cm2 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_cm12c3cm1c32cm2c2c1c14cm7cm12c0c3cm10cm5c4cm15 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0c7c1c12c3c7c1c2c4cm5cm6c11cm1c7cm2c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1c4c6c3c0c2c18c6c2c13c7cm10c2cm4c8cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c6cm6cm5c1cm1cm2c22c7c7c8cm4c0cm15c10c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm15c3cm16c1cm14c5c15c0cm8cm9c24c2c8cm1c1cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c51c2c1c1cm4cm4c2c1cm6cm2cm7cm3cm3cm2c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0cm1c0c26c8cm2c3cm10c4c1cm4cm21cm3cm1c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c2c2c5c1c3cm1cm15c2c3c10cm9c0c10cm15c0cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm1c0cm2c0c8c1c3cm6cm1c0c1c0c17cm1c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1cm1cm55cm5c0c4c14cm10cm3c0c9cm18c4cm1cm8c4 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1c4c4c1cm9c2cm2c8cm4c8cm1c3c6c4c4c3 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1c1c0c4c3c0cm1c5cm12c6c0cm1c8cm3cm4c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c5c3cm3c0cm3cm9cm4c14cm7c5cm6cm2c1cm5cm12c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c3cm6c1cm7c3cm7c2cm1c1cm5c4cm16cm2c6c9cm8 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm2cm5c6cm13cm4cm5c0c5c1cm1cm1cm34c5cm7c3cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0cm2c6c0c1cm1c5cm1c0cm1c6c0cm4c1c1c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c32c0c1c6cm39c3c4c1cm6cm6cm3cm8cm6cm1c11cm37 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm7c5cm1cm14c12c7cm10cm2cm8c4c0cm2cm4c8c5c11 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm3c15c6c1cm4cm52c4cm16cm6c3c2c5cm6cm5c12cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c4c1cm21cm2c4c3c19c3c19cm2c14cm1c3cm7cm3cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0cm1cm1c3c2cm1cm3c5c1cm4c1c6cm1c4cm12cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm2c3c9cm2cm2c12cm2cm1cm1c4c2cm1cm8c2c1cm5 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c8c5cm1cm4cm9cm2c0c7c2c1cm13c3cm7c0cm3c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm1cm1c3c3cm15c14cm3cm10cm9c5cm18cm19c4cm1c4cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm4c1c0cm27c3cm1cm2c2cm20c6cm6c43cm3cm8cm6cm9 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c3c1cm4c3cm2c4cm6c2c7cm3c41c4c3cm1c1cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0c0c4c0c1cm9c0cm1c0cm4c6c2cm1cm3c8cm5 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core1_rmcm;

architecture arch of conv5_core1_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM13C41C1CM1CM5CM36C1C18CM8CM18C2CM11C2C4C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C0C1CM1CM19C9CM1C2C54CM9C1C0CM13C12CM2C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C16C0C2CM5CM12CM5C1CM3C15CM22C0C7CM2CM8CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C46C0CM4CM5C2C0C6C1C18C4C2CM6CM1C3CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0C2C1C3C1C7C2CM3C1CM5C2CM8C0CM2CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12C3CM1C32CM2C2C1C14CM7CM12C0C3CM10CM5C4CM15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C7C1C12C3C7C1C2C4CM5CM6C11CM1C7CM2C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C4C6C3C0C2C18C6C2C13C7CM10C2CM4C8CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C6CM6CM5C1CM1CM2C22C7C7C8CM4C0CM15C10C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15C3CM16C1CM14C5C15C0CM8CM9C24C2C8CM1C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C51C2C1C1CM4CM4C2C1CM6CM2CM7CM3CM3CM2C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C0C26C8CM2C3CM10C4C1CM4CM21CM3CM1C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C2C5C1C3CM1CM15C2C3C10CM9C0C10CM15C0CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0CM2C0C8C1C3CM6CM1C0C1C0C17CM1C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM1CM55CM5C0C4C14CM10CM3C0C9CM18C4CM1CM8C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C4C4C1CM9C2CM2C8CM4C8CM1C3C6C4C4C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1C0C4C3C0CM1C5CM12C6C0CM1C8CM3CM4C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C3CM3C0CM3CM9CM4C14CM7C5CM6CM2C1CM5CM12C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM6C1CM7C3CM7C2CM1C1CM5C4CM16CM2C6C9CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM5C6CM13CM4CM5C0C5C1CM1CM1CM34C5CM7C3CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2C6C0C1CM1C5CM1C0CM1C6C0CM4C1C1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C32C0C1C6CM39C3C4C1CM6CM6CM3CM8CM6CM1C11CM37_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C5CM1CM14C12C7CM10CM2CM8C4C0CM2CM4C8C5C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C15C6C1CM4CM52C4CM16CM6C3C2C5CM6CM5C12CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C1CM21CM2C4C3C19C3C19CM2C14CM1C3CM7CM3CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1CM1C3C2CM1CM3C5C1CM4C1C6CM1C4CM12CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C3C9CM2CM2C12CM2CM1CM1C4C2CM1CM8C2C1CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C5CM1CM4CM9CM2C0C7C2C1CM13C3CM7C0CM3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C3C3CM15C14CM3CM10CM9C5CM18CM19C4CM1C4CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C1C0CM27C3CM1CM2C2CM20C6CM6C43CM3CM8CM6CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C1CM4C3CM2C4CM6C2C7CM3C41C4C3CM1C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C4C0C1CM9C0CM1C0CM4C6C2CM1CM3C8CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal c6cm13c41c1cm1cm5cm36c1c18cm8cm18c2cm11c2c4c2_weight : PIPELINE_TYPE_FOR_C6CM13C41C1CM1CM5CM36C1C18CM8CM18C2CM11C2C4C2_WEIGHT;
    -- sfix(2, -6)
    signal cm10c0c1cm1cm19c9cm1c2c54cm9c1c0cm13c12cm2c3_weight : PIPELINE_TYPE_FOR_CM10C0C1CM1CM19C9CM1C2C54CM9C1C0CM13C12CM2C3_WEIGHT;
    -- sfix(2, -6)
    signal c4c16c0c2cm5cm12cm5c1cm3c15cm22c0c7cm2cm8cm1_weight : PIPELINE_TYPE_FOR_C4C16C0C2CM5CM12CM5C1CM3C15CM22C0C7CM2CM8CM1_WEIGHT;
    -- sfix(2, -6)
    signal c4c46c0cm4cm5c2c0c6c1c18c4c2cm6cm1c3cm2_weight : PIPELINE_TYPE_FOR_C4C46C0CM4CM5C2C0C6C1C18C4C2CM6CM1C3CM2_WEIGHT;
    -- sfix(2, -6)
    signal c3c0c2c1c3c1c7c2cm3c1cm5c2cm8c0cm2cm2_weight : PIPELINE_TYPE_FOR_C3C0C2C1C3C1C7C2CM3C1CM5C2CM8C0CM2CM2_WEIGHT;
    -- sfix(2, -6)
    signal cm12c3cm1c32cm2c2c1c14cm7cm12c0c3cm10cm5c4cm15_weight : PIPELINE_TYPE_FOR_CM12C3CM1C32CM2C2C1C14CM7CM12C0C3CM10CM5C4CM15_WEIGHT;
    -- sfix(2, -6)
    signal c0c7c1c12c3c7c1c2c4cm5cm6c11cm1c7cm2c0_weight : PIPELINE_TYPE_FOR_C0C7C1C12C3C7C1C2C4CM5CM6C11CM1C7CM2C0_WEIGHT;
    -- sfix(2, -6)
    signal c1c4c6c3c0c2c18c6c2c13c7cm10c2cm4c8cm5_weight : PIPELINE_TYPE_FOR_C1C4C6C3C0C2C18C6C2C13C7CM10C2CM4C8CM5_WEIGHT;
    -- sfix(2, -6)
    signal c0c6cm6cm5c1cm1cm2c22c7c7c8cm4c0cm15c10c2_weight : PIPELINE_TYPE_FOR_C0C6CM6CM5C1CM1CM2C22C7C7C8CM4C0CM15C10C2_WEIGHT;
    -- sfix(2, -6)
    signal cm15c3cm16c1cm14c5c15c0cm8cm9c24c2c8cm1c1cm1_weight : PIPELINE_TYPE_FOR_CM15C3CM16C1CM14C5C15C0CM8CM9C24C2C8CM1C1CM1_WEIGHT;
    -- sfix(2, -6)
    signal c0c51c2c1c1cm4cm4c2c1cm6cm2cm7cm3cm3cm2c1_weight : PIPELINE_TYPE_FOR_C0C51C2C1C1CM4CM4C2C1CM6CM2CM7CM3CM3CM2C1_WEIGHT;
    -- sfix(2, -6)
    signal c0cm1c0c26c8cm2c3cm10c4c1cm4cm21cm3cm1c0c0_weight : PIPELINE_TYPE_FOR_C0CM1C0C26C8CM2C3CM10C4C1CM4CM21CM3CM1C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c2c2c5c1c3cm1cm15c2c3c10cm9c0c10cm15c0cm2_weight : PIPELINE_TYPE_FOR_C2C2C5C1C3CM1CM15C2C3C10CM9C0C10CM15C0CM2_WEIGHT;
    -- sfix(2, -6)
    signal cm1c0cm2c0c8c1c3cm6cm1c0c1c0c17cm1c0c0_weight : PIPELINE_TYPE_FOR_CM1C0CM2C0C8C1C3CM6CM1C0C1C0C17CM1C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c1cm1cm55cm5c0c4c14cm10cm3c0c9cm18c4cm1cm8c4_weight : PIPELINE_TYPE_FOR_C1CM1CM55CM5C0C4C14CM10CM3C0C9CM18C4CM1CM8C4_WEIGHT;
    -- sfix(2, -6)
    signal c1c4c4c1cm9c2cm2c8cm4c8cm1c3c6c4c4c3_weight : PIPELINE_TYPE_FOR_C1C4C4C1CM9C2CM2C8CM4C8CM1C3C6C4C4C3_WEIGHT;
    -- sfix(2, -6)
    signal c1c1c0c4c3c0cm1c5cm12c6c0cm1c8cm3cm4c0_weight : PIPELINE_TYPE_FOR_C1C1C0C4C3C0CM1C5CM12C6C0CM1C8CM3CM4C0_WEIGHT;
    -- sfix(2, -6)
    signal c5c3cm3c0cm3cm9cm4c14cm7c5cm6cm2c1cm5cm12c0_weight : PIPELINE_TYPE_FOR_C5C3CM3C0CM3CM9CM4C14CM7C5CM6CM2C1CM5CM12C0_WEIGHT;
    -- sfix(2, -6)
    signal c3cm6c1cm7c3cm7c2cm1c1cm5c4cm16cm2c6c9cm8_weight : PIPELINE_TYPE_FOR_C3CM6C1CM7C3CM7C2CM1C1CM5C4CM16CM2C6C9CM8_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm5c6cm13cm4cm5c0c5c1cm1cm1cm34c5cm7c3cm1_weight : PIPELINE_TYPE_FOR_CM2CM5C6CM13CM4CM5C0C5C1CM1CM1CM34C5CM7C3CM1_WEIGHT;
    -- sfix(2, -6)
    signal c0cm2c6c0c1cm1c5cm1c0cm1c6c0cm4c1c1c0_weight : PIPELINE_TYPE_FOR_C0CM2C6C0C1CM1C5CM1C0CM1C6C0CM4C1C1C0_WEIGHT;
    -- sfix(2, -6)
    signal c32c0c1c6cm39c3c4c1cm6cm6cm3cm8cm6cm1c11cm37_weight : PIPELINE_TYPE_FOR_C32C0C1C6CM39C3C4C1CM6CM6CM3CM8CM6CM1C11CM37_WEIGHT;
    -- sfix(2, -6)
    signal cm7c5cm1cm14c12c7cm10cm2cm8c4c0cm2cm4c8c5c11_weight : PIPELINE_TYPE_FOR_CM7C5CM1CM14C12C7CM10CM2CM8C4C0CM2CM4C8C5C11_WEIGHT;
    -- sfix(2, -6)
    signal cm3c15c6c1cm4cm52c4cm16cm6c3c2c5cm6cm5c12cm1_weight : PIPELINE_TYPE_FOR_CM3C15C6C1CM4CM52C4CM16CM6C3C2C5CM6CM5C12CM1_WEIGHT;
    -- sfix(2, -6)
    signal c4c1cm21cm2c4c3c19c3c19cm2c14cm1c3cm7cm3cm6_weight : PIPELINE_TYPE_FOR_C4C1CM21CM2C4C3C19C3C19CM2C14CM1C3CM7CM3CM6_WEIGHT;
    -- sfix(2, -6)
    signal c0cm1cm1c3c2cm1cm3c5c1cm4c1c6cm1c4cm12cm2_weight : PIPELINE_TYPE_FOR_C0CM1CM1C3C2CM1CM3C5C1CM4C1C6CM1C4CM12CM2_WEIGHT;
    -- sfix(2, -6)
    signal cm2c3c9cm2cm2c12cm2cm1cm1c4c2cm1cm8c2c1cm5_weight : PIPELINE_TYPE_FOR_CM2C3C9CM2CM2C12CM2CM1CM1C4C2CM1CM8C2C1CM5_WEIGHT;
    -- sfix(2, -6)
    signal c8c5cm1cm4cm9cm2c0c7c2c1cm13c3cm7c0cm3c0_weight : PIPELINE_TYPE_FOR_C8C5CM1CM4CM9CM2C0C7C2C1CM13C3CM7C0CM3C0_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm1c3c3cm15c14cm3cm10cm9c5cm18cm19c4cm1c4cm5_weight : PIPELINE_TYPE_FOR_CM1CM1C3C3CM15C14CM3CM10CM9C5CM18CM19C4CM1C4CM5_WEIGHT;
    -- sfix(2, -6)
    signal cm4c1c0cm27c3cm1cm2c2cm20c6cm6c43cm3cm8cm6cm9_weight : PIPELINE_TYPE_FOR_CM4C1C0CM27C3CM1CM2C2CM20C6CM6C43CM3CM8CM6CM9_WEIGHT;
    -- sfix(2, -6)
    signal c3c1cm4c3cm2c4cm6c2c7cm3c41c4c3cm1c1cm1_weight : PIPELINE_TYPE_FOR_C3C1CM4C3CM2C4CM6C2C7CM3C41C4C3CM1C1CM1_WEIGHT;
    -- sfix(2, -6)
    signal c0c0c4c0c1cm9c0cm1c0cm4c6c2cm1cm3c8cm5_weight : PIPELINE_TYPE_FOR_C0C0C4C0C1CM9C0CM1C0CM4C6C2CM1CM3C8CM5_WEIGHT;
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



    WEIGHT_ROM: entity work.conv5_core1_rmcm_weightsconstant_memory
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
        
            dout1   => c6cm13c41c1cm1cm5cm36c1c18cm8cm18c2cm11c2c4c2_weight(0), 
            dout2   => cm10c0c1cm1cm19c9cm1c2c54cm9c1c0cm13c12cm2c3_weight(0), 
            dout3   => c4c16c0c2cm5cm12cm5c1cm3c15cm22c0c7cm2cm8cm1_weight(0), 
            dout4   => c4c46c0cm4cm5c2c0c6c1c18c4c2cm6cm1c3cm2_weight(0), 
            dout5   => c3c0c2c1c3c1c7c2cm3c1cm5c2cm8c0cm2cm2_weight(0), 
            dout6   => cm12c3cm1c32cm2c2c1c14cm7cm12c0c3cm10cm5c4cm15_weight(0), 
            dout7   => c0c7c1c12c3c7c1c2c4cm5cm6c11cm1c7cm2c0_weight(0), 
            dout8   => c1c4c6c3c0c2c18c6c2c13c7cm10c2cm4c8cm5_weight(0), 
            dout9   => c0c6cm6cm5c1cm1cm2c22c7c7c8cm4c0cm15c10c2_weight(0), 
            dout10   => cm15c3cm16c1cm14c5c15c0cm8cm9c24c2c8cm1c1cm1_weight(0), 
            dout11   => c0c51c2c1c1cm4cm4c2c1cm6cm2cm7cm3cm3cm2c1_weight(0), 
            dout12   => c0cm1c0c26c8cm2c3cm10c4c1cm4cm21cm3cm1c0c0_weight(0), 
            dout13   => c2c2c5c1c3cm1cm15c2c3c10cm9c0c10cm15c0cm2_weight(0), 
            dout14   => cm1c0cm2c0c8c1c3cm6cm1c0c1c0c17cm1c0c0_weight(0), 
            dout15   => c1cm1cm55cm5c0c4c14cm10cm3c0c9cm18c4cm1cm8c4_weight(0), 
            dout16   => c1c4c4c1cm9c2cm2c8cm4c8cm1c3c6c4c4c3_weight(0), 
            dout17   => c1c1c0c4c3c0cm1c5cm12c6c0cm1c8cm3cm4c0_weight(0), 
            dout18   => c5c3cm3c0cm3cm9cm4c14cm7c5cm6cm2c1cm5cm12c0_weight(0), 
            dout19   => c3cm6c1cm7c3cm7c2cm1c1cm5c4cm16cm2c6c9cm8_weight(0), 
            dout20   => cm2cm5c6cm13cm4cm5c0c5c1cm1cm1cm34c5cm7c3cm1_weight(0), 
            dout21   => c0cm2c6c0c1cm1c5cm1c0cm1c6c0cm4c1c1c0_weight(0), 
            dout22   => c32c0c1c6cm39c3c4c1cm6cm6cm3cm8cm6cm1c11cm37_weight(0), 
            dout23   => cm7c5cm1cm14c12c7cm10cm2cm8c4c0cm2cm4c8c5c11_weight(0), 
            dout24   => cm3c15c6c1cm4cm52c4cm16cm6c3c2c5cm6cm5c12cm1_weight(0), 
            dout25   => c4c1cm21cm2c4c3c19c3c19cm2c14cm1c3cm7cm3cm6_weight(0), 
            dout26   => c0cm1cm1c3c2cm1cm3c5c1cm4c1c6cm1c4cm12cm2_weight(0), 
            dout27   => cm2c3c9cm2cm2c12cm2cm1cm1c4c2cm1cm8c2c1cm5_weight(0), 
            dout28   => c8c5cm1cm4cm9cm2c0c7c2c1cm13c3cm7c0cm3c0_weight(0), 
            dout29   => cm1cm1c3c3cm15c14cm3cm10cm9c5cm18cm19c4cm1c4cm5_weight(0), 
            dout30   => cm4c1c0cm27c3cm1cm2c2cm20c6cm6c43cm3cm8cm6cm9_weight(0), 
            dout31   => c3c1cm4c3cm2c4cm6c2c7cm3c41c4c3cm1c1cm1_weight(0), 
            dout32   => c0c0c4c0c1cm9c0cm1c0cm4c6c2cm1cm3c8cm5_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c6cm13c41c1cm1cm5cm36c1c18cm8cm18c2cm11c2c4c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm13c41c1cm1cm5cm36c1c18cm8cm18c2cm11c2c4c2_weight(0), c6cm13c41c1cm1cm5cm36c1c18cm8cm18c2cm11c2c4c2_weight(1));
    PL_STEP_0_for_cm10c0c1cm1cm19c9cm1c2c54cm9c1c0cm13c12cm2c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c0c1cm1cm19c9cm1c2c54cm9c1c0cm13c12cm2c3_weight(0), cm10c0c1cm1cm19c9cm1c2c54cm9c1c0cm13c12cm2c3_weight(1));
    PL_STEP_0_for_c4c16c0c2cm5cm12cm5c1cm3c15cm22c0c7cm2cm8cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c16c0c2cm5cm12cm5c1cm3c15cm22c0c7cm2cm8cm1_weight(0), c4c16c0c2cm5cm12cm5c1cm3c15cm22c0c7cm2cm8cm1_weight(1));
    PL_STEP_0_for_c4c46c0cm4cm5c2c0c6c1c18c4c2cm6cm1c3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c46c0cm4cm5c2c0c6c1c18c4c2cm6cm1c3cm2_weight(0), c4c46c0cm4cm5c2c0c6c1c18c4c2cm6cm1c3cm2_weight(1));
    PL_STEP_0_for_c3c0c2c1c3c1c7c2cm3c1cm5c2cm8c0cm2cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0c2c1c3c1c7c2cm3c1cm5c2cm8c0cm2cm2_weight(0), c3c0c2c1c3c1c7c2cm3c1cm5c2cm8c0cm2cm2_weight(1));
    PL_STEP_0_for_cm12c3cm1c32cm2c2c1c14cm7cm12c0c3cm10cm5c4cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12c3cm1c32cm2c2c1c14cm7cm12c0c3cm10cm5c4cm15_weight(0), cm12c3cm1c32cm2c2c1c14cm7cm12c0c3cm10cm5c4cm15_weight(1));
    PL_STEP_0_for_c0c7c1c12c3c7c1c2c4cm5cm6c11cm1c7cm2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c7c1c12c3c7c1c2c4cm5cm6c11cm1c7cm2c0_weight(0), c0c7c1c12c3c7c1c2c4cm5cm6c11cm1c7cm2c0_weight(1));
    PL_STEP_0_for_c1c4c6c3c0c2c18c6c2c13c7cm10c2cm4c8cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c4c6c3c0c2c18c6c2c13c7cm10c2cm4c8cm5_weight(0), c1c4c6c3c0c2c18c6c2c13c7cm10c2cm4c8cm5_weight(1));
    PL_STEP_0_for_c0c6cm6cm5c1cm1cm2c22c7c7c8cm4c0cm15c10c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c6cm6cm5c1cm1cm2c22c7c7c8cm4c0cm15c10c2_weight(0), c0c6cm6cm5c1cm1cm2c22c7c7c8cm4c0cm15c10c2_weight(1));
    PL_STEP_0_for_cm15c3cm16c1cm14c5c15c0cm8cm9c24c2c8cm1c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15c3cm16c1cm14c5c15c0cm8cm9c24c2c8cm1c1cm1_weight(0), cm15c3cm16c1cm14c5c15c0cm8cm9c24c2c8cm1c1cm1_weight(1));
    PL_STEP_0_for_c0c51c2c1c1cm4cm4c2c1cm6cm2cm7cm3cm3cm2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c51c2c1c1cm4cm4c2c1cm6cm2cm7cm3cm3cm2c1_weight(0), c0c51c2c1c1cm4cm4c2c1cm6cm2cm7cm3cm3cm2c1_weight(1));
    PL_STEP_0_for_c0cm1c0c26c8cm2c3cm10c4c1cm4cm21cm3cm1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c0c26c8cm2c3cm10c4c1cm4cm21cm3cm1c0c0_weight(0), c0cm1c0c26c8cm2c3cm10c4c1cm4cm21cm3cm1c0c0_weight(1));
    PL_STEP_0_for_c2c2c5c1c3cm1cm15c2c3c10cm9c0c10cm15c0cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c2c5c1c3cm1cm15c2c3c10cm9c0c10cm15c0cm2_weight(0), c2c2c5c1c3cm1cm15c2c3c10cm9c0c10cm15c0cm2_weight(1));
    PL_STEP_0_for_cm1c0cm2c0c8c1c3cm6cm1c0c1c0c17cm1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0cm2c0c8c1c3cm6cm1c0c1c0c17cm1c0c0_weight(0), cm1c0cm2c0c8c1c3cm6cm1c0c1c0c17cm1c0c0_weight(1));
    PL_STEP_0_for_c1cm1cm55cm5c0c4c14cm10cm3c0c9cm18c4cm1cm8c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm1cm55cm5c0c4c14cm10cm3c0c9cm18c4cm1cm8c4_weight(0), c1cm1cm55cm5c0c4c14cm10cm3c0c9cm18c4cm1cm8c4_weight(1));
    PL_STEP_0_for_c1c4c4c1cm9c2cm2c8cm4c8cm1c3c6c4c4c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c4c4c1cm9c2cm2c8cm4c8cm1c3c6c4c4c3_weight(0), c1c4c4c1cm9c2cm2c8cm4c8cm1c3c6c4c4c3_weight(1));
    PL_STEP_0_for_c1c1c0c4c3c0cm1c5cm12c6c0cm1c8cm3cm4c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1c0c4c3c0cm1c5cm12c6c0cm1c8cm3cm4c0_weight(0), c1c1c0c4c3c0cm1c5cm12c6c0cm1c8cm3cm4c0_weight(1));
    PL_STEP_0_for_c5c3cm3c0cm3cm9cm4c14cm7c5cm6cm2c1cm5cm12c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c3cm3c0cm3cm9cm4c14cm7c5cm6cm2c1cm5cm12c0_weight(0), c5c3cm3c0cm3cm9cm4c14cm7c5cm6cm2c1cm5cm12c0_weight(1));
    PL_STEP_0_for_c3cm6c1cm7c3cm7c2cm1c1cm5c4cm16cm2c6c9cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm6c1cm7c3cm7c2cm1c1cm5c4cm16cm2c6c9cm8_weight(0), c3cm6c1cm7c3cm7c2cm1c1cm5c4cm16cm2c6c9cm8_weight(1));
    PL_STEP_0_for_cm2cm5c6cm13cm4cm5c0c5c1cm1cm1cm34c5cm7c3cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm5c6cm13cm4cm5c0c5c1cm1cm1cm34c5cm7c3cm1_weight(0), cm2cm5c6cm13cm4cm5c0c5c1cm1cm1cm34c5cm7c3cm1_weight(1));
    PL_STEP_0_for_c0cm2c6c0c1cm1c5cm1c0cm1c6c0cm4c1c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2c6c0c1cm1c5cm1c0cm1c6c0cm4c1c1c0_weight(0), c0cm2c6c0c1cm1c5cm1c0cm1c6c0cm4c1c1c0_weight(1));
    PL_STEP_0_for_c32c0c1c6cm39c3c4c1cm6cm6cm3cm8cm6cm1c11cm37_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c32c0c1c6cm39c3c4c1cm6cm6cm3cm8cm6cm1c11cm37_weight(0), c32c0c1c6cm39c3c4c1cm6cm6cm3cm8cm6cm1c11cm37_weight(1));
    PL_STEP_0_for_cm7c5cm1cm14c12c7cm10cm2cm8c4c0cm2cm4c8c5c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c5cm1cm14c12c7cm10cm2cm8c4c0cm2cm4c8c5c11_weight(0), cm7c5cm1cm14c12c7cm10cm2cm8c4c0cm2cm4c8c5c11_weight(1));
    PL_STEP_0_for_cm3c15c6c1cm4cm52c4cm16cm6c3c2c5cm6cm5c12cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c15c6c1cm4cm52c4cm16cm6c3c2c5cm6cm5c12cm1_weight(0), cm3c15c6c1cm4cm52c4cm16cm6c3c2c5cm6cm5c12cm1_weight(1));
    PL_STEP_0_for_c4c1cm21cm2c4c3c19c3c19cm2c14cm1c3cm7cm3cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c1cm21cm2c4c3c19c3c19cm2c14cm1c3cm7cm3cm6_weight(0), c4c1cm21cm2c4c3c19c3c19cm2c14cm1c3cm7cm3cm6_weight(1));
    PL_STEP_0_for_c0cm1cm1c3c2cm1cm3c5c1cm4c1c6cm1c4cm12cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1cm1c3c2cm1cm3c5c1cm4c1c6cm1c4cm12cm2_weight(0), c0cm1cm1c3c2cm1cm3c5c1cm4c1c6cm1c4cm12cm2_weight(1));
    PL_STEP_0_for_cm2c3c9cm2cm2c12cm2cm1cm1c4c2cm1cm8c2c1cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c3c9cm2cm2c12cm2cm1cm1c4c2cm1cm8c2c1cm5_weight(0), cm2c3c9cm2cm2c12cm2cm1cm1c4c2cm1cm8c2c1cm5_weight(1));
    PL_STEP_0_for_c8c5cm1cm4cm9cm2c0c7c2c1cm13c3cm7c0cm3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c5cm1cm4cm9cm2c0c7c2c1cm13c3cm7c0cm3c0_weight(0), c8c5cm1cm4cm9cm2c0c7c2c1cm13c3cm7c0cm3c0_weight(1));
    PL_STEP_0_for_cm1cm1c3c3cm15c14cm3cm10cm9c5cm18cm19c4cm1c4cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c3c3cm15c14cm3cm10cm9c5cm18cm19c4cm1c4cm5_weight(0), cm1cm1c3c3cm15c14cm3cm10cm9c5cm18cm19c4cm1c4cm5_weight(1));
    PL_STEP_0_for_cm4c1c0cm27c3cm1cm2c2cm20c6cm6c43cm3cm8cm6cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c1c0cm27c3cm1cm2c2cm20c6cm6c43cm3cm8cm6cm9_weight(0), cm4c1c0cm27c3cm1cm2c2cm20c6cm6c43cm3cm8cm6cm9_weight(1));
    PL_STEP_0_for_c3c1cm4c3cm2c4cm6c2c7cm3c41c4c3cm1c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c1cm4c3cm2c4cm6c2c7cm3c41c4c3cm1c1cm1_weight(0), c3c1cm4c3cm2c4cm6c2c7cm3c41c4c3cm1c1cm1_weight(1));
    PL_STEP_0_for_c0c0c4c0c1cm9c0cm1c0cm4c6c2cm1cm3c8cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c4c0c1cm9c0cm1c0cm4c6c2cm1cm3c8cm5_weight(0), c0c0c4c0c1cm9c0cm1c0cm4c6c2cm1cm3c8cm5_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c6cm13c41c1cm1cm5cm36c1c18cm8cm18c2cm11c2c4c2_c0cm2c6c0c1cm1c5cm1c0cm1c6c0cm4c1c1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6cm13c41c1cm1cm5cm36c1c18cm8cm18c2cm11c2c4c2_weight(1)(7-1 downto 0),
			B	=> c0cm2c6c0c1cm1c5cm1c0cm1c6c0cm4c1c1c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm13c41c1cm1cm5cm36c1c18cm8cm18c2cm11c2c4c2,
			CxB => R_c0cm2c6c0c1cm1c5cm1c0cm1c6c0cm4c1c1c0
		);

    cm10c0c1cm1cm19c9cm1c2c54cm9c1c0cm13c12cm2c3_c3c0c2c1c3c1c7c2cm3c1cm5c2cm8c0cm2cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm10c0c1cm1cm19c9cm1c2c54cm9c1c0cm13c12cm2c3_weight(1)(7-1 downto 0),
			B	=> c3c0c2c1c3c1c7c2cm3c1cm5c2cm8c0cm2cm2_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10c0c1cm1cm19c9cm1c2c54cm9c1c0cm13c12cm2c3,
			CxB => R_c3c0c2c1c3c1c7c2cm3c1cm5c2cm8c0cm2cm2
		);

    c4c46c0cm4cm5c2c0c6c1c18c4c2cm6cm1c3cm2_c0c0c4c0c1cm9c0cm1c0cm4c6c2cm1cm3c8cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c46c0cm4cm5c2c0c6c1c18c4c2cm6cm1c3cm2_weight(1)(7-1 downto 0),
			B	=> c0c0c4c0c1cm9c0cm1c0cm4c6c2cm1cm3c8cm5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c46c0cm4cm5c2c0c6c1c18c4c2cm6cm1c3cm2,
			CxB => R_c0c0c4c0c1cm9c0cm1c0cm4c6c2cm1cm3c8cm5
		);

    cm12c3cm1c32cm2c2c1c14cm7cm12c0c3cm10cm5c4cm15_c8c5cm1cm4cm9cm2c0c7c2c1cm13c3cm7c0cm3c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm12c3cm1c32cm2c2c1c14cm7cm12c0c3cm10cm5c4cm15_weight(1)(7-1 downto 0),
			B	=> c8c5cm1cm4cm9cm2c0c7c2c1cm13c3cm7c0cm3c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm12c3cm1c32cm2c2c1c14cm7cm12c0c3cm10cm5c4cm15,
			CxB => R_c8c5cm1cm4cm9cm2c0c7c2c1cm13c3cm7c0cm3c0
		);

    c0c51c2c1c1cm4cm4c2c1cm6cm2cm7cm3cm3cm2c1_cm2c3c9cm2cm2c12cm2cm1cm1c4c2cm1cm8c2c1cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c51c2c1c1cm4cm4c2c1cm6cm2cm7cm3cm3cm2c1_weight(1)(7-1 downto 0),
			B	=> cm2c3c9cm2cm2c12cm2cm1cm1c4c2cm1cm8c2c1cm5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c51c2c1c1cm4cm4c2c1cm6cm2cm7cm3cm3cm2c1,
			CxB => R_cm2c3c9cm2cm2c12cm2cm1cm1c4c2cm1cm8c2c1cm5
		);

    c1cm1cm55cm5c0c4c14cm10cm3c0c9cm18c4cm1cm8c4_c0cm1cm1c3c2cm1cm3c5c1cm4c1c6cm1c4cm12cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm1cm55cm5c0c4c14cm10cm3c0c9cm18c4cm1cm8c4_weight(1)(7-1 downto 0),
			B	=> c0cm1cm1c3c2cm1cm3c5c1cm4c1c6cm1c4cm12cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm1cm55cm5c0c4c14cm10cm3c0c9cm18c4cm1cm8c4,
			CxB => R_c0cm1cm1c3c2cm1cm3c5c1cm4c1c6cm1c4cm12cm2
		);

    cm2cm5c6cm13cm4cm5c0c5c1cm1cm1cm34c5cm7c3cm1_cm7c5cm1cm14c12c7cm10cm2cm8c4c0cm2cm4c8c5c11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm5c6cm13cm4cm5c0c5c1cm1cm1cm34c5cm7c3cm1_weight(1)(7-1 downto 0),
			B	=> cm7c5cm1cm14c12c7cm10cm2cm8c4c0cm2cm4c8c5c11_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm5c6cm13cm4cm5c0c5c1cm1cm1cm34c5cm7c3cm1,
			CxB => R_cm7c5cm1cm14c12c7cm10cm2cm8c4c0cm2cm4c8c5c11
		);

    c32c0c1c6cm39c3c4c1cm6cm6cm3cm8cm6cm1c11cm37_c3cm6c1cm7c3cm7c2cm1c1cm5c4cm16cm2c6c9cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c32c0c1c6cm39c3c4c1cm6cm6cm3cm8cm6cm1c11cm37_weight(1)(7-1 downto 0),
			B	=> c3cm6c1cm7c3cm7c2cm1c1cm5c4cm16cm2c6c9cm8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c32c0c1c6cm39c3c4c1cm6cm6cm3cm8cm6cm1c11cm37,
			CxB => R_c3cm6c1cm7c3cm7c2cm1c1cm5c4cm16cm2c6c9cm8
		);

    cm3c15c6c1cm4cm52c4cm16cm6c3c2c5cm6cm5c12cm1_c5c3cm3c0cm3cm9cm4c14cm7c5cm6cm2c1cm5cm12c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c15c6c1cm4cm52c4cm16cm6c3c2c5cm6cm5c12cm1_weight(1)(7-1 downto 0),
			B	=> c5c3cm3c0cm3cm9cm4c14cm7c5cm6cm2c1cm5cm12c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c15c6c1cm4cm52c4cm16cm6c3c2c5cm6cm5c12cm1,
			CxB => R_c5c3cm3c0cm3cm9cm4c14cm7c5cm6cm2c1cm5cm12c0
		);

    cm4c1c0cm27c3cm1cm2c2cm20c6cm6c43cm3cm8cm6cm9_c1c1c0c4c3c0cm1c5cm12c6c0cm1c8cm3cm4c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4c1c0cm27c3cm1cm2c2cm20c6cm6c43cm3cm8cm6cm9_weight(1)(7-1 downto 0),
			B	=> c1c1c0c4c3c0cm1c5cm12c6c0cm1c8cm3cm4c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4c1c0cm27c3cm1cm2c2cm20c6cm6c43cm3cm8cm6cm9,
			CxB => R_c1c1c0c4c3c0cm1c5cm12c6c0cm1c8cm3cm4c0
		);

    c3c1cm4c3cm2c4cm6c2c7cm3c41c4c3cm1c1cm1_c1c4c4c1cm9c2cm2c8cm4c8cm1c3c6c4c4c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c1cm4c3cm2c4cm6c2c7cm3c41c4c3cm1c1cm1_weight(1)(7-1 downto 0),
			B	=> c1c4c4c1cm9c2cm2c8cm4c8cm1c3c6c4c4c3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c1cm4c3cm2c4cm6c2c7cm3c41c4c3cm1c1cm1,
			CxB => R_c1c4c4c1cm9c2cm2c8cm4c8cm1c3c6c4c4c3
		);

    c4c16c0c2cm5cm12cm5c1cm3c15cm22c0c7cm2cm8cm1_c2c2c5c1c3cm1cm15c2c3c10cm9c0c10cm15c0cm2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c4c16c0c2cm5cm12cm5c1cm3c15cm22c0c7cm2cm8cm1_weight(1)(6-1 downto 0),
			B	=> c2c2c5c1c3cm1cm15c2c3c10cm9c0c10cm15c0cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c16c0c2cm5cm12cm5c1cm3c15cm22c0c7cm2cm8cm1,
			CxB => R_c2c2c5c1c3cm1cm15c2c3c10cm9c0c10cm15c0cm2
		);

    c1c4c6c3c0c2c18c6c2c13c7cm10c2cm4c8cm5_c0c7c1c12c3c7c1c2c4cm5cm6c11cm1c7cm2c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c4c6c3c0c2c18c6c2c13c7cm10c2cm4c8cm5_weight(1)(6-1 downto 0),
			B	=> c0c7c1c12c3c7c1c2c4cm5cm6c11cm1c7cm2c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c4c6c3c0c2c18c6c2c13c7cm10c2cm4c8cm5,
			CxB => R_c0c7c1c12c3c7c1c2c4cm5cm6c11cm1c7cm2c0
		);

    c0c6cm6cm5c1cm1cm2c22c7c7c8cm4c0cm15c10c2_cm1cm1c3c3cm15c14cm3cm10cm9c5cm18cm19c4cm1c4cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c6cm6cm5c1cm1cm2c22c7c7c8cm4c0cm15c10c2_weight(1)(6-1 downto 0),
			B	=> cm1cm1c3c3cm15c14cm3cm10cm9c5cm18cm19c4cm1c4cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c6cm6cm5c1cm1cm2c22c7c7c8cm4c0cm15c10c2,
			CxB => R_cm1cm1c3c3cm15c14cm3cm10cm9c5cm18cm19c4cm1c4cm5
		);

    cm15c3cm16c1cm14c5c15c0cm8cm9c24c2c8cm1c1cm1_c4c1cm21cm2c4c3c19c3c19cm2c14cm1c3cm7cm3cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm15c3cm16c1cm14c5c15c0cm8cm9c24c2c8cm1c1cm1_weight(1)(6-1 downto 0),
			B	=> c4c1cm21cm2c4c3c19c3c19cm2c14cm1c3cm7cm3cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm15c3cm16c1cm14c5c15c0cm8cm9c24c2c8cm1c1cm1,
			CxB => R_c4c1cm21cm2c4c3c19c3c19cm2c14cm1c3cm7cm3cm6
		);

    c0cm1c0c26c8cm2c3cm10c4c1cm4cm21cm3cm1c0c0_cm1c0cm2c0c8c1c3cm6cm1c0c1c0c17cm1c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm1c0c26c8cm2c3cm10c4c1cm4cm21cm3cm1c0c0_weight(1)(6-1 downto 0),
			B	=> cm1c0cm2c0c8c1c3cm6cm1c0c1c0c17cm1c0c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm1c0c26c8cm2c3cm10c4c1cm4cm21cm3cm1c0c0,
			CxB => R_cm1c0cm2c0c8c1c3cm6cm1c0c1c0c17cm1c0c0
		);




end architecture;
