library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core4_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm1cm2c11c0c1c0c3cm1c0c4cm3cm1c4c12cm45cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c6cm13c2cm2c10c0cm5c1cm12c17c0c4c0c13cm2cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm6c0cm15c2c3cm1c6c0cm11cm2cm11cm1c8cm25cm8c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2c0cm15cm18cm2c2cm3c1cm8cm7c4c5c1c35cm1cm13 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c3c0c2c1c4c3c2cm6cm23c1cm3c1c2c1cm2cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3cm1cm1c15c0cm3cm8c4cm2cm8c2c10c5c13c0cm9 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c2c6cm5cm1c5cm4c2cm1cm2c0c5cm1c0cm2c1cm14 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm2c2c12c0cm2c6c17cm8c5cm1c1c7c1c9c23c15 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c11c9cm14c1c1c10cm2cm2cm2c10cm2cm4cm1c2c6c12 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm5c12cm2cm1cm3cm2c4c1c17cm2c22c2c21c4cm6c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1cm10c3cm12cm1cm1cm4c0c1cm6c6c4c2c19c6c4 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm37c2cm5c1c1c1c0c0c58c1c6c2c0cm7c4c11 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1c1cm10c0c1c1cm13c0c1c0c0c1c5c1cm22c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm25c3c1cm4cm7cm1cm1cm8cm48c0cm4c3cm5cm1cm6cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c2c23c8c1c6cm1c0c2c0cm22cm10c17c1c2cm36c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm20cm2c0c22cm8c2cm6c3cm45cm2c1cm8cm3c4c4c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c11c1cm3cm14c4cm1c3c7cm4c3c4c42c1c0c1cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c11cm4cm4c17cm4cm3cm2c8cm14cm3cm1c2c2c9cm4cm15 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1cm16cm14c10c0cm9cm7c1cm1cm18cm5cm4c3cm7cm7cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm8c23cm3c4cm6c0cm2c3cm3cm15c14cm1c0c1cm22c27 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2cm1cm5c0c1c0c33cm2c1c1c13cm1c0cm1c17cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c13cm2c16c4cm2c1c1cm10c4cm2cm1c5cm37cm3c0c3 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0cm6cm2cm11cm7c5c2cm3cm2c16cm1cm10c1c16cm2c4 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c5cm1c17cm16c1cm4c3c1cm22c7c0c6c2cm27cm9cm13 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c4c21c3c3c0c4c2c5cm3c5c1c2c6c3c14cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1cm2c4c2c0cm3cm1cm1c0c2cm8cm5c0cm2c1c3 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_cm6cm1c12c4c2c11cm1c1c1cm4cm12cm1cm4c3cm42cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm2c16cm4c7c69cm13cm2c13c4cm12c5cm3cm12c0cm2cm3 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c1cm2c0cm2cm2cm2cm4cm2c3c2c2c5cm13cm4cm3c5 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c7cm3cm29cm2cm4c1cm1cm2cm2c0c26c3c5c2cm2cm32 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm5c10c8cm9cm4c1cm1c5c4c0c0c7cm2c9c3cm3 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm1cm3c22cm2c1cm10c17c2c2c9c4c2c2cm25c13cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core4_rmcm;

architecture arch of conv5_core4_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM2C11C0C1C0C3CM1C0C4CM3CM1C4C12CM45CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM13C2CM2C10C0CM5C1CM12C17C0C4C0C13CM2CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C0CM15C2C3CM1C6C0CM11CM2CM11CM1C8CM25CM8C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C0CM15CM18CM2C2CM3C1CM8CM7C4C5C1C35CM1CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0C2C1C4C3C2CM6CM23C1CM3C1C2C1CM2CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM1CM1C15C0CM3CM8C4CM2CM8C2C10C5C13C0CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C6CM5CM1C5CM4C2CM1CM2C0C5CM1C0CM2C1CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C2C12C0CM2C6C17CM8C5CM1C1C7C1C9C23C15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C9CM14C1C1C10CM2CM2CM2C10CM2CM4CM1C2C6C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C12CM2CM1CM3CM2C4C1C17CM2C22C2C21C4CM6C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM10C3CM12CM1CM1CM4C0C1CM6C6C4C2C19C6C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM37C2CM5C1C1C1C0C0C58C1C6C2C0CM7C4C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1CM10C0C1C1CM13C0C1C0C0C1C5C1CM22C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM25C3C1CM4CM7CM1CM1CM8CM48C0CM4C3CM5CM1CM6CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C23C8C1C6CM1C0C2C0CM22CM10C17C1C2CM36C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM20CM2C0C22CM8C2CM6C3CM45CM2C1CM8CM3C4C4C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C1CM3CM14C4CM1C3C7CM4C3C4C42C1C0C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11CM4CM4C17CM4CM3CM2C8CM14CM3CM1C2C2C9CM4CM15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM16CM14C10C0CM9CM7C1CM1CM18CM5CM4C3CM7CM7CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8C23CM3C4CM6C0CM2C3CM3CM15C14CM1C0C1CM22C27_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM1CM5C0C1C0C33CM2C1C1C13CM1C0CM1C17CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13CM2C16C4CM2C1C1CM10C4CM2CM1C5CM37CM3C0C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM6CM2CM11CM7C5C2CM3CM2C16CM1CM10C1C16CM2C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM1C17CM16C1CM4C3C1CM22C7C0C6C2CM27CM9CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C21C3C3C0C4C2C5CM3C5C1C2C6C3C14CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM2C4C2C0CM3CM1CM1C0C2CM8CM5C0CM2C1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM1C12C4C2C11CM1C1C1CM4CM12CM1CM4C3CM42CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C16CM4C7C69CM13CM2C13C4CM12C5CM3CM12C0CM2CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM2C0CM2CM2CM2CM4CM2C3C2C2C5CM13CM4CM3C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM3CM29CM2CM4C1CM1CM2CM2C0C26C3C5C2CM2CM32_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C10C8CM9CM4C1CM1C5C4C0C0C7CM2C9C3CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM3C22CM2C1CM10C17C2C2C9C4C2C2CM25C13CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal cm1cm2c11c0c1c0c3cm1c0c4cm3cm1c4c12cm45cm1_weight : PIPELINE_TYPE_FOR_CM1CM2C11C0C1C0C3CM1C0C4CM3CM1C4C12CM45CM1_WEIGHT;
    -- sfix(2, -6)
    signal c6cm13c2cm2c10c0cm5c1cm12c17c0c4c0c13cm2cm5_weight : PIPELINE_TYPE_FOR_C6CM13C2CM2C10C0CM5C1CM12C17C0C4C0C13CM2CM5_WEIGHT;
    -- sfix(2, -6)
    signal cm6c0cm15c2c3cm1c6c0cm11cm2cm11cm1c8cm25cm8c0_weight : PIPELINE_TYPE_FOR_CM6C0CM15C2C3CM1C6C0CM11CM2CM11CM1C8CM25CM8C0_WEIGHT;
    -- sfix(2, -6)
    signal cm2c0cm15cm18cm2c2cm3c1cm8cm7c4c5c1c35cm1cm13_weight : PIPELINE_TYPE_FOR_CM2C0CM15CM18CM2C2CM3C1CM8CM7C4C5C1C35CM1CM13_WEIGHT;
    -- sfix(2, -6)
    signal c3c0c2c1c4c3c2cm6cm23c1cm3c1c2c1cm2cm1_weight : PIPELINE_TYPE_FOR_C3C0C2C1C4C3C2CM6CM23C1CM3C1C2C1CM2CM1_WEIGHT;
    -- sfix(2, -6)
    signal c3cm1cm1c15c0cm3cm8c4cm2cm8c2c10c5c13c0cm9_weight : PIPELINE_TYPE_FOR_C3CM1CM1C15C0CM3CM8C4CM2CM8C2C10C5C13C0CM9_WEIGHT;
    -- sfix(2, -6)
    signal c2c6cm5cm1c5cm4c2cm1cm2c0c5cm1c0cm2c1cm14_weight : PIPELINE_TYPE_FOR_C2C6CM5CM1C5CM4C2CM1CM2C0C5CM1C0CM2C1CM14_WEIGHT;
    -- sfix(2, -6)
    signal cm2c2c12c0cm2c6c17cm8c5cm1c1c7c1c9c23c15_weight : PIPELINE_TYPE_FOR_CM2C2C12C0CM2C6C17CM8C5CM1C1C7C1C9C23C15_WEIGHT;
    -- sfix(2, -6)
    signal c11c9cm14c1c1c10cm2cm2cm2c10cm2cm4cm1c2c6c12_weight : PIPELINE_TYPE_FOR_C11C9CM14C1C1C10CM2CM2CM2C10CM2CM4CM1C2C6C12_WEIGHT;
    -- sfix(2, -6)
    signal cm5c12cm2cm1cm3cm2c4c1c17cm2c22c2c21c4cm6c2_weight : PIPELINE_TYPE_FOR_CM5C12CM2CM1CM3CM2C4C1C17CM2C22C2C21C4CM6C2_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm10c3cm12cm1cm1cm4c0c1cm6c6c4c2c19c6c4_weight : PIPELINE_TYPE_FOR_CM1CM10C3CM12CM1CM1CM4C0C1CM6C6C4C2C19C6C4_WEIGHT;
    -- sfix(2, -6)
    signal cm37c2cm5c1c1c1c0c0c58c1c6c2c0cm7c4c11_weight : PIPELINE_TYPE_FOR_CM37C2CM5C1C1C1C0C0C58C1C6C2C0CM7C4C11_WEIGHT;
    -- sfix(2, -6)
    signal c1c1cm10c0c1c1cm13c0c1c0c0c1c5c1cm22c1_weight : PIPELINE_TYPE_FOR_C1C1CM10C0C1C1CM13C0C1C0C0C1C5C1CM22C1_WEIGHT;
    -- sfix(2, -6)
    signal cm25c3c1cm4cm7cm1cm1cm8cm48c0cm4c3cm5cm1cm6cm4_weight : PIPELINE_TYPE_FOR_CM25C3C1CM4CM7CM1CM1CM8CM48C0CM4C3CM5CM1CM6CM4_WEIGHT;
    -- sfix(2, -6)
    signal c2c23c8c1c6cm1c0c2c0cm22cm10c17c1c2cm36c1_weight : PIPELINE_TYPE_FOR_C2C23C8C1C6CM1C0C2C0CM22CM10C17C1C2CM36C1_WEIGHT;
    -- sfix(2, -6)
    signal cm20cm2c0c22cm8c2cm6c3cm45cm2c1cm8cm3c4c4c1_weight : PIPELINE_TYPE_FOR_CM20CM2C0C22CM8C2CM6C3CM45CM2C1CM8CM3C4C4C1_WEIGHT;
    -- sfix(2, -6)
    signal c11c1cm3cm14c4cm1c3c7cm4c3c4c42c1c0c1cm1_weight : PIPELINE_TYPE_FOR_C11C1CM3CM14C4CM1C3C7CM4C3C4C42C1C0C1CM1_WEIGHT;
    -- sfix(2, -6)
    signal c11cm4cm4c17cm4cm3cm2c8cm14cm3cm1c2c2c9cm4cm15_weight : PIPELINE_TYPE_FOR_C11CM4CM4C17CM4CM3CM2C8CM14CM3CM1C2C2C9CM4CM15_WEIGHT;
    -- sfix(2, -6)
    signal c1cm16cm14c10c0cm9cm7c1cm1cm18cm5cm4c3cm7cm7cm6_weight : PIPELINE_TYPE_FOR_C1CM16CM14C10C0CM9CM7C1CM1CM18CM5CM4C3CM7CM7CM6_WEIGHT;
    -- sfix(2, -6)
    signal cm8c23cm3c4cm6c0cm2c3cm3cm15c14cm1c0c1cm22c27_weight : PIPELINE_TYPE_FOR_CM8C23CM3C4CM6C0CM2C3CM3CM15C14CM1C0C1CM22C27_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm1cm5c0c1c0c33cm2c1c1c13cm1c0cm1c17cm1_weight : PIPELINE_TYPE_FOR_CM2CM1CM5C0C1C0C33CM2C1C1C13CM1C0CM1C17CM1_WEIGHT;
    -- sfix(2, -6)
    signal c13cm2c16c4cm2c1c1cm10c4cm2cm1c5cm37cm3c0c3_weight : PIPELINE_TYPE_FOR_C13CM2C16C4CM2C1C1CM10C4CM2CM1C5CM37CM3C0C3_WEIGHT;
    -- sfix(2, -6)
    signal c0cm6cm2cm11cm7c5c2cm3cm2c16cm1cm10c1c16cm2c4_weight : PIPELINE_TYPE_FOR_C0CM6CM2CM11CM7C5C2CM3CM2C16CM1CM10C1C16CM2C4_WEIGHT;
    -- sfix(2, -6)
    signal c5cm1c17cm16c1cm4c3c1cm22c7c0c6c2cm27cm9cm13_weight : PIPELINE_TYPE_FOR_C5CM1C17CM16C1CM4C3C1CM22C7C0C6C2CM27CM9CM13_WEIGHT;
    -- sfix(2, -6)
    signal c4c21c3c3c0c4c2c5cm3c5c1c2c6c3c14cm6_weight : PIPELINE_TYPE_FOR_C4C21C3C3C0C4C2C5CM3C5C1C2C6C3C14CM6_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm2c4c2c0cm3cm1cm1c0c2cm8cm5c0cm2c1c3_weight : PIPELINE_TYPE_FOR_CM1CM2C4C2C0CM3CM1CM1C0C2CM8CM5C0CM2C1C3_WEIGHT;
    -- sfix(2, -6)
    signal cm6cm1c12c4c2c11cm1c1c1cm4cm12cm1cm4c3cm42cm1_weight : PIPELINE_TYPE_FOR_CM6CM1C12C4C2C11CM1C1C1CM4CM12CM1CM4C3CM42CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm2c16cm4c7c69cm13cm2c13c4cm12c5cm3cm12c0cm2cm3_weight : PIPELINE_TYPE_FOR_CM2C16CM4C7C69CM13CM2C13C4CM12C5CM3CM12C0CM2CM3_WEIGHT;
    -- sfix(2, -6)
    signal c1cm2c0cm2cm2cm2cm4cm2c3c2c2c5cm13cm4cm3c5_weight : PIPELINE_TYPE_FOR_C1CM2C0CM2CM2CM2CM4CM2C3C2C2C5CM13CM4CM3C5_WEIGHT;
    -- sfix(2, -6)
    signal c7cm3cm29cm2cm4c1cm1cm2cm2c0c26c3c5c2cm2cm32_weight : PIPELINE_TYPE_FOR_C7CM3CM29CM2CM4C1CM1CM2CM2C0C26C3C5C2CM2CM32_WEIGHT;
    -- sfix(2, -6)
    signal cm5c10c8cm9cm4c1cm1c5c4c0c0c7cm2c9c3cm3_weight : PIPELINE_TYPE_FOR_CM5C10C8CM9CM4C1CM1C5C4C0C0C7CM2C9C3CM3_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm3c22cm2c1cm10c17c2c2c9c4c2c2cm25c13cm1_weight : PIPELINE_TYPE_FOR_CM1CM3C22CM2C1CM10C17C2C2C9C4C2C2CM25C13CM1_WEIGHT;
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



    WEIGHT_ROM: entity work.conv5_core4_rmcm_weightsconstant_memory
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
        
            dout1   => cm1cm2c11c0c1c0c3cm1c0c4cm3cm1c4c12cm45cm1_weight(0), 
            dout2   => c6cm13c2cm2c10c0cm5c1cm12c17c0c4c0c13cm2cm5_weight(0), 
            dout3   => cm6c0cm15c2c3cm1c6c0cm11cm2cm11cm1c8cm25cm8c0_weight(0), 
            dout4   => cm2c0cm15cm18cm2c2cm3c1cm8cm7c4c5c1c35cm1cm13_weight(0), 
            dout5   => c3c0c2c1c4c3c2cm6cm23c1cm3c1c2c1cm2cm1_weight(0), 
            dout6   => c3cm1cm1c15c0cm3cm8c4cm2cm8c2c10c5c13c0cm9_weight(0), 
            dout7   => c2c6cm5cm1c5cm4c2cm1cm2c0c5cm1c0cm2c1cm14_weight(0), 
            dout8   => cm2c2c12c0cm2c6c17cm8c5cm1c1c7c1c9c23c15_weight(0), 
            dout9   => c11c9cm14c1c1c10cm2cm2cm2c10cm2cm4cm1c2c6c12_weight(0), 
            dout10   => cm5c12cm2cm1cm3cm2c4c1c17cm2c22c2c21c4cm6c2_weight(0), 
            dout11   => cm1cm10c3cm12cm1cm1cm4c0c1cm6c6c4c2c19c6c4_weight(0), 
            dout12   => cm37c2cm5c1c1c1c0c0c58c1c6c2c0cm7c4c11_weight(0), 
            dout13   => c1c1cm10c0c1c1cm13c0c1c0c0c1c5c1cm22c1_weight(0), 
            dout14   => cm25c3c1cm4cm7cm1cm1cm8cm48c0cm4c3cm5cm1cm6cm4_weight(0), 
            dout15   => c2c23c8c1c6cm1c0c2c0cm22cm10c17c1c2cm36c1_weight(0), 
            dout16   => cm20cm2c0c22cm8c2cm6c3cm45cm2c1cm8cm3c4c4c1_weight(0), 
            dout17   => c11c1cm3cm14c4cm1c3c7cm4c3c4c42c1c0c1cm1_weight(0), 
            dout18   => c11cm4cm4c17cm4cm3cm2c8cm14cm3cm1c2c2c9cm4cm15_weight(0), 
            dout19   => c1cm16cm14c10c0cm9cm7c1cm1cm18cm5cm4c3cm7cm7cm6_weight(0), 
            dout20   => cm8c23cm3c4cm6c0cm2c3cm3cm15c14cm1c0c1cm22c27_weight(0), 
            dout21   => cm2cm1cm5c0c1c0c33cm2c1c1c13cm1c0cm1c17cm1_weight(0), 
            dout22   => c13cm2c16c4cm2c1c1cm10c4cm2cm1c5cm37cm3c0c3_weight(0), 
            dout23   => c0cm6cm2cm11cm7c5c2cm3cm2c16cm1cm10c1c16cm2c4_weight(0), 
            dout24   => c5cm1c17cm16c1cm4c3c1cm22c7c0c6c2cm27cm9cm13_weight(0), 
            dout25   => c4c21c3c3c0c4c2c5cm3c5c1c2c6c3c14cm6_weight(0), 
            dout26   => cm1cm2c4c2c0cm3cm1cm1c0c2cm8cm5c0cm2c1c3_weight(0), 
            dout27   => cm6cm1c12c4c2c11cm1c1c1cm4cm12cm1cm4c3cm42cm1_weight(0), 
            dout28   => cm2c16cm4c7c69cm13cm2c13c4cm12c5cm3cm12c0cm2cm3_weight(0), 
            dout29   => c1cm2c0cm2cm2cm2cm4cm2c3c2c2c5cm13cm4cm3c5_weight(0), 
            dout30   => c7cm3cm29cm2cm4c1cm1cm2cm2c0c26c3c5c2cm2cm32_weight(0), 
            dout31   => cm5c10c8cm9cm4c1cm1c5c4c0c0c7cm2c9c3cm3_weight(0), 
            dout32   => cm1cm3c22cm2c1cm10c17c2c2c9c4c2c2cm25c13cm1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm1cm2c11c0c1c0c3cm1c0c4cm3cm1c4c12cm45cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm2c11c0c1c0c3cm1c0c4cm3cm1c4c12cm45cm1_weight(0), cm1cm2c11c0c1c0c3cm1c0c4cm3cm1c4c12cm45cm1_weight(1));
    PL_STEP_0_for_c6cm13c2cm2c10c0cm5c1cm12c17c0c4c0c13cm2cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm13c2cm2c10c0cm5c1cm12c17c0c4c0c13cm2cm5_weight(0), c6cm13c2cm2c10c0cm5c1cm12c17c0c4c0c13cm2cm5_weight(1));
    PL_STEP_0_for_cm6c0cm15c2c3cm1c6c0cm11cm2cm11cm1c8cm25cm8c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c0cm15c2c3cm1c6c0cm11cm2cm11cm1c8cm25cm8c0_weight(0), cm6c0cm15c2c3cm1c6c0cm11cm2cm11cm1c8cm25cm8c0_weight(1));
    PL_STEP_0_for_cm2c0cm15cm18cm2c2cm3c1cm8cm7c4c5c1c35cm1cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c0cm15cm18cm2c2cm3c1cm8cm7c4c5c1c35cm1cm13_weight(0), cm2c0cm15cm18cm2c2cm3c1cm8cm7c4c5c1c35cm1cm13_weight(1));
    PL_STEP_0_for_c3c0c2c1c4c3c2cm6cm23c1cm3c1c2c1cm2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0c2c1c4c3c2cm6cm23c1cm3c1c2c1cm2cm1_weight(0), c3c0c2c1c4c3c2cm6cm23c1cm3c1c2c1cm2cm1_weight(1));
    PL_STEP_0_for_c3cm1cm1c15c0cm3cm8c4cm2cm8c2c10c5c13c0cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm1cm1c15c0cm3cm8c4cm2cm8c2c10c5c13c0cm9_weight(0), c3cm1cm1c15c0cm3cm8c4cm2cm8c2c10c5c13c0cm9_weight(1));
    PL_STEP_0_for_c2c6cm5cm1c5cm4c2cm1cm2c0c5cm1c0cm2c1cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c6cm5cm1c5cm4c2cm1cm2c0c5cm1c0cm2c1cm14_weight(0), c2c6cm5cm1c5cm4c2cm1cm2c0c5cm1c0cm2c1cm14_weight(1));
    PL_STEP_0_for_cm2c2c12c0cm2c6c17cm8c5cm1c1c7c1c9c23c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c2c12c0cm2c6c17cm8c5cm1c1c7c1c9c23c15_weight(0), cm2c2c12c0cm2c6c17cm8c5cm1c1c7c1c9c23c15_weight(1));
    PL_STEP_0_for_c11c9cm14c1c1c10cm2cm2cm2c10cm2cm4cm1c2c6c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c9cm14c1c1c10cm2cm2cm2c10cm2cm4cm1c2c6c12_weight(0), c11c9cm14c1c1c10cm2cm2cm2c10cm2cm4cm1c2c6c12_weight(1));
    PL_STEP_0_for_cm5c12cm2cm1cm3cm2c4c1c17cm2c22c2c21c4cm6c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c12cm2cm1cm3cm2c4c1c17cm2c22c2c21c4cm6c2_weight(0), cm5c12cm2cm1cm3cm2c4c1c17cm2c22c2c21c4cm6c2_weight(1));
    PL_STEP_0_for_cm1cm10c3cm12cm1cm1cm4c0c1cm6c6c4c2c19c6c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm10c3cm12cm1cm1cm4c0c1cm6c6c4c2c19c6c4_weight(0), cm1cm10c3cm12cm1cm1cm4c0c1cm6c6c4c2c19c6c4_weight(1));
    PL_STEP_0_for_cm37c2cm5c1c1c1c0c0c58c1c6c2c0cm7c4c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm37c2cm5c1c1c1c0c0c58c1c6c2c0cm7c4c11_weight(0), cm37c2cm5c1c1c1c0c0c58c1c6c2c0cm7c4c11_weight(1));
    PL_STEP_0_for_c1c1cm10c0c1c1cm13c0c1c0c0c1c5c1cm22c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1cm10c0c1c1cm13c0c1c0c0c1c5c1cm22c1_weight(0), c1c1cm10c0c1c1cm13c0c1c0c0c1c5c1cm22c1_weight(1));
    PL_STEP_0_for_cm25c3c1cm4cm7cm1cm1cm8cm48c0cm4c3cm5cm1cm6cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm25c3c1cm4cm7cm1cm1cm8cm48c0cm4c3cm5cm1cm6cm4_weight(0), cm25c3c1cm4cm7cm1cm1cm8cm48c0cm4c3cm5cm1cm6cm4_weight(1));
    PL_STEP_0_for_c2c23c8c1c6cm1c0c2c0cm22cm10c17c1c2cm36c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c23c8c1c6cm1c0c2c0cm22cm10c17c1c2cm36c1_weight(0), c2c23c8c1c6cm1c0c2c0cm22cm10c17c1c2cm36c1_weight(1));
    PL_STEP_0_for_cm20cm2c0c22cm8c2cm6c3cm45cm2c1cm8cm3c4c4c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm20cm2c0c22cm8c2cm6c3cm45cm2c1cm8cm3c4c4c1_weight(0), cm20cm2c0c22cm8c2cm6c3cm45cm2c1cm8cm3c4c4c1_weight(1));
    PL_STEP_0_for_c11c1cm3cm14c4cm1c3c7cm4c3c4c42c1c0c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c1cm3cm14c4cm1c3c7cm4c3c4c42c1c0c1cm1_weight(0), c11c1cm3cm14c4cm1c3c7cm4c3c4c42c1c0c1cm1_weight(1));
    PL_STEP_0_for_c11cm4cm4c17cm4cm3cm2c8cm14cm3cm1c2c2c9cm4cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11cm4cm4c17cm4cm3cm2c8cm14cm3cm1c2c2c9cm4cm15_weight(0), c11cm4cm4c17cm4cm3cm2c8cm14cm3cm1c2c2c9cm4cm15_weight(1));
    PL_STEP_0_for_c1cm16cm14c10c0cm9cm7c1cm1cm18cm5cm4c3cm7cm7cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm16cm14c10c0cm9cm7c1cm1cm18cm5cm4c3cm7cm7cm6_weight(0), c1cm16cm14c10c0cm9cm7c1cm1cm18cm5cm4c3cm7cm7cm6_weight(1));
    PL_STEP_0_for_cm8c23cm3c4cm6c0cm2c3cm3cm15c14cm1c0c1cm22c27_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8c23cm3c4cm6c0cm2c3cm3cm15c14cm1c0c1cm22c27_weight(0), cm8c23cm3c4cm6c0cm2c3cm3cm15c14cm1c0c1cm22c27_weight(1));
    PL_STEP_0_for_cm2cm1cm5c0c1c0c33cm2c1c1c13cm1c0cm1c17cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm1cm5c0c1c0c33cm2c1c1c13cm1c0cm1c17cm1_weight(0), cm2cm1cm5c0c1c0c33cm2c1c1c13cm1c0cm1c17cm1_weight(1));
    PL_STEP_0_for_c13cm2c16c4cm2c1c1cm10c4cm2cm1c5cm37cm3c0c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13cm2c16c4cm2c1c1cm10c4cm2cm1c5cm37cm3c0c3_weight(0), c13cm2c16c4cm2c1c1cm10c4cm2cm1c5cm37cm3c0c3_weight(1));
    PL_STEP_0_for_c0cm6cm2cm11cm7c5c2cm3cm2c16cm1cm10c1c16cm2c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm6cm2cm11cm7c5c2cm3cm2c16cm1cm10c1c16cm2c4_weight(0), c0cm6cm2cm11cm7c5c2cm3cm2c16cm1cm10c1c16cm2c4_weight(1));
    PL_STEP_0_for_c5cm1c17cm16c1cm4c3c1cm22c7c0c6c2cm27cm9cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm1c17cm16c1cm4c3c1cm22c7c0c6c2cm27cm9cm13_weight(0), c5cm1c17cm16c1cm4c3c1cm22c7c0c6c2cm27cm9cm13_weight(1));
    PL_STEP_0_for_c4c21c3c3c0c4c2c5cm3c5c1c2c6c3c14cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c21c3c3c0c4c2c5cm3c5c1c2c6c3c14cm6_weight(0), c4c21c3c3c0c4c2c5cm3c5c1c2c6c3c14cm6_weight(1));
    PL_STEP_0_for_cm1cm2c4c2c0cm3cm1cm1c0c2cm8cm5c0cm2c1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm2c4c2c0cm3cm1cm1c0c2cm8cm5c0cm2c1c3_weight(0), cm1cm2c4c2c0cm3cm1cm1c0c2cm8cm5c0cm2c1c3_weight(1));
    PL_STEP_0_for_cm6cm1c12c4c2c11cm1c1c1cm4cm12cm1cm4c3cm42cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm1c12c4c2c11cm1c1c1cm4cm12cm1cm4c3cm42cm1_weight(0), cm6cm1c12c4c2c11cm1c1c1cm4cm12cm1cm4c3cm42cm1_weight(1));
    PL_STEP_0_for_cm2c16cm4c7c69cm13cm2c13c4cm12c5cm3cm12c0cm2cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c16cm4c7c69cm13cm2c13c4cm12c5cm3cm12c0cm2cm3_weight(0), cm2c16cm4c7c69cm13cm2c13c4cm12c5cm3cm12c0cm2cm3_weight(1));
    PL_STEP_0_for_c1cm2c0cm2cm2cm2cm4cm2c3c2c2c5cm13cm4cm3c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm2c0cm2cm2cm2cm4cm2c3c2c2c5cm13cm4cm3c5_weight(0), c1cm2c0cm2cm2cm2cm4cm2c3c2c2c5cm13cm4cm3c5_weight(1));
    PL_STEP_0_for_c7cm3cm29cm2cm4c1cm1cm2cm2c0c26c3c5c2cm2cm32_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm3cm29cm2cm4c1cm1cm2cm2c0c26c3c5c2cm2cm32_weight(0), c7cm3cm29cm2cm4c1cm1cm2cm2c0c26c3c5c2cm2cm32_weight(1));
    PL_STEP_0_for_cm5c10c8cm9cm4c1cm1c5c4c0c0c7cm2c9c3cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c10c8cm9cm4c1cm1c5c4c0c0c7cm2c9c3cm3_weight(0), cm5c10c8cm9cm4c1cm1c5c4c0c0c7cm2c9c3cm3_weight(1));
    PL_STEP_0_for_cm1cm3c22cm2c1cm10c17c2c2c9c4c2c2cm25c13cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm3c22cm2c1cm10c17c2c2c9c4c2c2cm25c13cm1_weight(0), cm1cm3c22cm2c1cm10c17c2c2c9c4c2c2cm25c13cm1_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm2c16cm4c7c69cm13cm2c13c4cm12c5cm3cm12c0cm2cm3_cm1cm2c4c2c0cm3cm1cm1c0c2cm8cm5c0cm2c1c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c16cm4c7c69cm13cm2c13c4cm12c5cm3cm12c0cm2cm3_weight(1)(8-1 downto 0),
			B	=> cm1cm2c4c2c0cm3cm1cm1c0c2cm8cm5c0cm2c1c3_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c16cm4c7c69cm13cm2c13c4cm12c5cm3cm12c0cm2cm3,
			CxB => R_cm1cm2c4c2c0cm3cm1cm1c0c2cm8cm5c0cm2c1c3
		);

    cm1cm2c11c0c1c0c3cm1c0c4cm3cm1c4c12cm45cm1_cm5c10c8cm9cm4c1cm1c5c4c0c0c7cm2c9c3cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm2c11c0c1c0c3cm1c0c4cm3cm1c4c12cm45cm1_weight(1)(7-1 downto 0),
			B	=> cm5c10c8cm9cm4c1cm1c5c4c0c0c7cm2c9c3cm3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm2c11c0c1c0c3cm1c0c4cm3cm1c4c12cm45cm1,
			CxB => R_cm5c10c8cm9cm4c1cm1c5c4c0c0c7cm2c9c3cm3
		);

    cm2c0cm15cm18cm2c2cm3c1cm8cm7c4c5c1c35cm1cm13_c1cm2c0cm2cm2cm2cm4cm2c3c2c2c5cm13cm4cm3c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c0cm15cm18cm2c2cm3c1cm8cm7c4c5c1c35cm1cm13_weight(1)(7-1 downto 0),
			B	=> c1cm2c0cm2cm2cm2cm4cm2c3c2c2c5cm13cm4cm3c5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c0cm15cm18cm2c2cm3c1cm8cm7c4c5c1c35cm1cm13,
			CxB => R_c1cm2c0cm2cm2cm2cm4cm2c3c2c2c5cm13cm4cm3c5
		);

    cm37c2cm5c1c1c1c0c0c58c1c6c2c0cm7c4c11_c11c9cm14c1c1c10cm2cm2cm2c10cm2cm4cm1c2c6c12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm37c2cm5c1c1c1c0c0c58c1c6c2c0cm7c4c11_weight(1)(7-1 downto 0),
			B	=> c11c9cm14c1c1c10cm2cm2cm2c10cm2cm4cm1c2c6c12_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm37c2cm5c1c1c1c0c0c58c1c6c2c0cm7c4c11,
			CxB => R_c11c9cm14c1c1c10cm2cm2cm2c10cm2cm4cm1c2c6c12
		);

    cm25c3c1cm4cm7cm1cm1cm8cm48c0cm4c3cm5cm1cm6cm4_c2c6cm5cm1c5cm4c2cm1cm2c0c5cm1c0cm2c1cm14_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm25c3c1cm4cm7cm1cm1cm8cm48c0cm4c3cm5cm1cm6cm4_weight(1)(7-1 downto 0),
			B	=> c2c6cm5cm1c5cm4c2cm1cm2c0c5cm1c0cm2c1cm14_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm25c3c1cm4cm7cm1cm1cm8cm48c0cm4c3cm5cm1cm6cm4,
			CxB => R_c2c6cm5cm1c5cm4c2cm1cm2c0c5cm1c0cm2c1cm14
		);

    c2c23c8c1c6cm1c0c2c0cm22cm10c17c1c2cm36c1_c3cm1cm1c15c0cm3cm8c4cm2cm8c2c10c5c13c0cm9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c23c8c1c6cm1c0c2c0cm22cm10c17c1c2cm36c1_weight(1)(7-1 downto 0),
			B	=> c3cm1cm1c15c0cm3cm8c4cm2cm8c2c10c5c13c0cm9_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c23c8c1c6cm1c0c2c0cm22cm10c17c1c2cm36c1,
			CxB => R_c3cm1cm1c15c0cm3cm8c4cm2cm8c2c10c5c13c0cm9
		);

    cm20cm2c0c22cm8c2cm6c3cm45cm2c1cm8cm3c4c4c1_cm1cm3c22cm2c1cm10c17c2c2c9c4c2c2cm25c13cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm20cm2c0c22cm8c2cm6c3cm45cm2c1cm8cm3c4c4c1_weight(1)(7-1 downto 0),
			B	=> cm1cm3c22cm2c1cm10c17c2c2c9c4c2c2cm25c13cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm20cm2c0c22cm8c2cm6c3cm45cm2c1cm8cm3c4c4c1,
			CxB => R_cm1cm3c22cm2c1cm10c17c2c2c9c4c2c2cm25c13cm1
		);

    c11c1cm3cm14c4cm1c3c7cm4c3c4c42c1c0c1cm1_c7cm3cm29cm2cm4c1cm1cm2cm2c0c26c3c5c2cm2cm32_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c11c1cm3cm14c4cm1c3c7cm4c3c4c42c1c0c1cm1_weight(1)(7-1 downto 0),
			B	=> c7cm3cm29cm2cm4c1cm1cm2cm2c0c26c3c5c2cm2cm32_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c11c1cm3cm14c4cm1c3c7cm4c3c4c42c1c0c1cm1,
			CxB => R_c7cm3cm29cm2cm4c1cm1cm2cm2c0c26c3c5c2cm2cm32
		);

    cm2cm1cm5c0c1c0c33cm2c1c1c13cm1c0cm1c17cm1_c4c21c3c3c0c4c2c5cm3c5c1c2c6c3c14cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm1cm5c0c1c0c33cm2c1c1c13cm1c0cm1c17cm1_weight(1)(7-1 downto 0),
			B	=> c4c21c3c3c0c4c2c5cm3c5c1c2c6c3c14cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm1cm5c0c1c0c33cm2c1c1c13cm1c0cm1c17cm1,
			CxB => R_c4c21c3c3c0c4c2c5cm3c5c1c2c6c3c14cm6
		);

    c13cm2c16c4cm2c1c1cm10c4cm2cm1c5cm37cm3c0c3_c5cm1c17cm16c1cm4c3c1cm22c7c0c6c2cm27cm9cm13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c13cm2c16c4cm2c1c1cm10c4cm2cm1c5cm37cm3c0c3_weight(1)(7-1 downto 0),
			B	=> c5cm1c17cm16c1cm4c3c1cm22c7c0c6c2cm27cm9cm13_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c13cm2c16c4cm2c1c1cm10c4cm2cm1c5cm37cm3c0c3,
			CxB => R_c5cm1c17cm16c1cm4c3c1cm22c7c0c6c2cm27cm9cm13
		);

    cm6cm1c12c4c2c11cm1c1c1cm4cm12cm1cm4c3cm42cm1_c0cm6cm2cm11cm7c5c2cm3cm2c16cm1cm10c1c16cm2c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6cm1c12c4c2c11cm1c1c1cm4cm12cm1cm4c3cm42cm1_weight(1)(7-1 downto 0),
			B	=> c0cm6cm2cm11cm7c5c2cm3cm2c16cm1cm10c1c16cm2c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6cm1c12c4c2c11cm1c1c1cm4cm12cm1cm4c3cm42cm1,
			CxB => R_c0cm6cm2cm11cm7c5c2cm3cm2c16cm1cm10c1c16cm2c4
		);

    c6cm13c2cm2c10c0cm5c1cm12c17c0c4c0c13cm2cm5_cm8c23cm3c4cm6c0cm2c3cm3cm15c14cm1c0c1cm22c27_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6cm13c2cm2c10c0cm5c1cm12c17c0c4c0c13cm2cm5_weight(1)(6-1 downto 0),
			B	=> cm8c23cm3c4cm6c0cm2c3cm3cm15c14cm1c0c1cm22c27_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm13c2cm2c10c0cm5c1cm12c17c0c4c0c13cm2cm5,
			CxB => R_cm8c23cm3c4cm6c0cm2c3cm3cm15c14cm1c0c1cm22c27
		);

    cm6c0cm15c2c3cm1c6c0cm11cm2cm11cm1c8cm25cm8c0_c1cm16cm14c10c0cm9cm7c1cm1cm18cm5cm4c3cm7cm7cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6c0cm15c2c3cm1c6c0cm11cm2cm11cm1c8cm25cm8c0_weight(1)(6-1 downto 0),
			B	=> c1cm16cm14c10c0cm9cm7c1cm1cm18cm5cm4c3cm7cm7cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c0cm15c2c3cm1c6c0cm11cm2cm11cm1c8cm25cm8c0,
			CxB => R_c1cm16cm14c10c0cm9cm7c1cm1cm18cm5cm4c3cm7cm7cm6
		);

    c3c0c2c1c4c3c2cm6cm23c1cm3c1c2c1cm2cm1_c11cm4cm4c17cm4cm3cm2c8cm14cm3cm1c2c2c9cm4cm15_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c0c2c1c4c3c2cm6cm23c1cm3c1c2c1cm2cm1_weight(1)(6-1 downto 0),
			B	=> c11cm4cm4c17cm4cm3cm2c8cm14cm3cm1c2c2c9cm4cm15_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c0c2c1c4c3c2cm6cm23c1cm3c1c2c1cm2cm1,
			CxB => R_c11cm4cm4c17cm4cm3cm2c8cm14cm3cm1c2c2c9cm4cm15
		);

    cm2c2c12c0cm2c6c17cm8c5cm1c1c7c1c9c23c15_c1c1cm10c0c1c1cm13c0c1c0c0c1c5c1cm22c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c2c12c0cm2c6c17cm8c5cm1c1c7c1c9c23c15_weight(1)(6-1 downto 0),
			B	=> c1c1cm10c0c1c1cm13c0c1c0c0c1c5c1cm22c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c2c12c0cm2c6c17cm8c5cm1c1c7c1c9c23c15,
			CxB => R_c1c1cm10c0c1c1cm13c0c1c0c0c1c5c1cm22c1
		);

    cm5c12cm2cm1cm3cm2c4c1c17cm2c22c2c21c4cm6c2_cm1cm10c3cm12cm1cm1cm4c0c1cm6c6c4c2c19c6c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5c12cm2cm1cm3cm2c4c1c17cm2c22c2c21c4cm6c2_weight(1)(6-1 downto 0),
			B	=> cm1cm10c3cm12cm1cm1cm4c0c1cm6c6c4c2c19c6c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5c12cm2cm1cm3cm2c4c1c17cm2c22c2c21c4cm6c2,
			CxB => R_cm1cm10c3cm12cm1cm1cm4c0c1cm6c6c4c2c19c6c4
		);




end architecture;
