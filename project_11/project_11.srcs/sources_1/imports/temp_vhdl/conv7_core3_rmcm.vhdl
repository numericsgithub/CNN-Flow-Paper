library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core3_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm5c2cm3c0c8cm1cm4cm6c18c10c11c6c1c1cm1c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c9c4cm1cm1c1cm1c12cm9cm25c5c1c7c11c0cm15c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm12cm5cm17c16cm4cm14cm8c0cm14cm10c9cm2c4c3c127c18 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c1cm6cm9c18cm1cm4cm4cm3cm7cm4c2cm25cm5cm2cm6cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm4cm3c9cm6c9c3c1c14c12cm2c5c0c3c4c1c1 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm11c3cm10c1cm1cm1c4cm13cm5c0c5cm11c5c1cm2c1 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c3c0c0c4cm1cm3cm7c11cm12cm4c4cm19cm4cm3cm1c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm4cm2cm2cm1c0c6c12c12cm7c17c9cm11c0cm2c0c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm6cm19c10cm6cm68c19cm11cm2cm2c4c3c0c0c0c0cm5 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c4cm2c2c1c3c1c1cm4cm8cm3c4c15cm8c0cm8c1 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c3cm5c2c1cm4cm5c11cm11c8c17cm9cm2cm3cm4cm2cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c4cm7c1c4c3c2c0cm8c12c6cm10cm13cm9c0cm1cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c1cm6cm16c1cm5cm1cm1cm6c10cm1cm18c6c1cm3c3c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm9c0c3c1c16c9c10cm8cm5c0c0c2cm4c0c3cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c4c15cm1c44c6cm21cm5cm17cm15c5cm2c1c1c0cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c6cm7c2cm1cm3cm4c2c4cm13cm1cm2c2c6cm4c0c5 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm2c3cm2cm8c0c23cm6c5c3c1c0cm10c3cm1c3c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm12c1c19c3cm1cm4cm7cm6cm12c0cm4c2c3c5c4cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c9c1c9cm12cm3c19c3c3cm17c6cm9c0cm2cm2c2cm18 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm8c4c0cm4c1cm1cm4cm13c16c3c7cm5cm1c0c11cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm12c6cm3cm3cm2c39c1c12c3cm3cm2cm4c1c3c11cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1c4cm2cm3cm1c12c8c6c11cm1cm7cm37c0cm2c1c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm8cm9c0cm1c21cm12cm13c18cm5cm3cm3cm1c6cm32c6cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1cm2cm5cm3c4c0c58c6c0cm9cm12cm2cm1cm2c2cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2c3c7c1c3c2cm11c29c5c2c6cm6cm3cm6c1c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c7cm5c3c0c15cm4c17cm4cm15c12c1cm7c1cm2c4cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm9cm34cm11c27c5cm6cm3c1c4cm6cm6c0c0cm14cm14cm10 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1cm5cm7cm4cm10cm8cm2c2cm13cm44c5cm6cm1cm1c1cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm4cm1cm1cm1c2cm7cm12cm2c10c0c4cm12cm2cm4cm1cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c10cm1cm11cm2cm8c10c4c7c0cm4cm1cm1c5c5cm6c2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm2c1c0c1cm1c1cm6c7c2cm7c6cm20c17cm1cm1cm9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c3c1cm7c9c18cm12c1cm8c2cm3cm22c2cm1c1c2c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core3_rmcm;

architecture arch of conv7_core3_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C2CM3C0C8CM1CM4CM6C18C10C11C6C1C1CM1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9C4CM1CM1C1CM1C12CM9CM25C5C1C7C11C0CM15C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12CM5CM17C16CM4CM14CM8C0CM14CM10C9CM2C4C3C127C18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM6CM9C18CM1CM4CM4CM3CM7CM4C2CM25CM5CM2CM6CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM3C9CM6C9C3C1C14C12CM2C5C0C3C4C1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11C3CM10C1CM1CM1C4CM13CM5C0C5CM11C5C1CM2C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0C0C4CM1CM3CM7C11CM12CM4C4CM19CM4CM3CM1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM2CM2CM1C0C6C12C12CM7C17C9CM11C0CM2C0C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM19C10CM6CM68C19CM11CM2CM2C4C3C0C0C0C0CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM2C2C1C3C1C1CM4CM8CM3C4C15CM8C0CM8C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM5C2C1CM4CM5C11CM11C8C17CM9CM2CM3CM4CM2CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM7C1C4C3C2C0CM8C12C6CM10CM13CM9C0CM1CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM6CM16C1CM5CM1CM1CM6C10CM1CM18C6C1CM3C3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C0C3C1C16C9C10CM8CM5C0C0C2CM4C0C3CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C4C15CM1C44C6CM21CM5CM17CM15C5CM2C1C1C0CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM7C2CM1CM3CM4C2C4CM13CM1CM2C2C6CM4C0C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C3CM2CM8C0C23CM6C5C3C1C0CM10C3CM1C3C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12C1C19C3CM1CM4CM7CM6CM12C0CM4C2C3C5C4CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9C1C9CM12CM3C19C3C3CM17C6CM9C0CM2CM2C2CM18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8C4C0CM4C1CM1CM4CM13C16C3C7CM5CM1C0C11CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12C6CM3CM3CM2C39C1C12C3CM3CM2CM4C1C3C11CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C4CM2CM3CM1C12C8C6C11CM1CM7CM37C0CM2C1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8CM9C0CM1C21CM12CM13C18CM5CM3CM3CM1C6CM32C6CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM2CM5CM3C4C0C58C6C0CM9CM12CM2CM1CM2C2CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C3C7C1C3C2CM11C29C5C2C6CM6CM3CM6C1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM5C3C0C15CM4C17CM4CM15C12C1CM7C1CM2C4CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9CM34CM11C27C5CM6CM3C1C4CM6CM6C0C0CM14CM14CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM5CM7CM4CM10CM8CM2C2CM13CM44C5CM6CM1CM1C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM1CM1CM1C2CM7CM12CM2C10C0C4CM12CM2CM4CM1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10CM1CM11CM2CM8C10C4C7C0CM4CM1CM1C5C5CM6C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1C0C1CM1C1CM6C7C2CM7C6CM20C17CM1CM1CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C1CM7C9C18CM12C1CM8C2CM3CM22C2CM1C1C2C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm5c2cm3c0c8cm1cm4cm6c18c10c11c6c1c1cm1c2_weight : PIPELINE_TYPE_FOR_CM5C2CM3C0C8CM1CM4CM6C18C10C11C6C1C1CM1C2_WEIGHT;
    -- sfix(1, -7)
    signal c9c4cm1cm1c1cm1c12cm9cm25c5c1c7c11c0cm15c0_weight : PIPELINE_TYPE_FOR_C9C4CM1CM1C1CM1C12CM9CM25C5C1C7C11C0CM15C0_WEIGHT;
    -- sfix(1, -7)
    signal cm12cm5cm17c16cm4cm14cm8c0cm14cm10c9cm2c4c3c127c18_weight : PIPELINE_TYPE_FOR_CM12CM5CM17C16CM4CM14CM8C0CM14CM10C9CM2C4C3C127C18_WEIGHT;
    -- sfix(1, -7)
    signal c1cm6cm9c18cm1cm4cm4cm3cm7cm4c2cm25cm5cm2cm6cm1_weight : PIPELINE_TYPE_FOR_C1CM6CM9C18CM1CM4CM4CM3CM7CM4C2CM25CM5CM2CM6CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm3c9cm6c9c3c1c14c12cm2c5c0c3c4c1c1_weight : PIPELINE_TYPE_FOR_CM4CM3C9CM6C9C3C1C14C12CM2C5C0C3C4C1C1_WEIGHT;
    -- sfix(1, -7)
    signal cm11c3cm10c1cm1cm1c4cm13cm5c0c5cm11c5c1cm2c1_weight : PIPELINE_TYPE_FOR_CM11C3CM10C1CM1CM1C4CM13CM5C0C5CM11C5C1CM2C1_WEIGHT;
    -- sfix(1, -7)
    signal c3c0c0c4cm1cm3cm7c11cm12cm4c4cm19cm4cm3cm1c1_weight : PIPELINE_TYPE_FOR_C3C0C0C4CM1CM3CM7C11CM12CM4C4CM19CM4CM3CM1C1_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm2cm2cm1c0c6c12c12cm7c17c9cm11c0cm2c0c2_weight : PIPELINE_TYPE_FOR_CM4CM2CM2CM1C0C6C12C12CM7C17C9CM11C0CM2C0C2_WEIGHT;
    -- sfix(1, -7)
    signal cm6cm19c10cm6cm68c19cm11cm2cm2c4c3c0c0c0c0cm5_weight : PIPELINE_TYPE_FOR_CM6CM19C10CM6CM68C19CM11CM2CM2C4C3C0C0C0C0CM5_WEIGHT;
    -- sfix(1, -7)
    signal c4cm2c2c1c3c1c1cm4cm8cm3c4c15cm8c0cm8c1_weight : PIPELINE_TYPE_FOR_C4CM2C2C1C3C1C1CM4CM8CM3C4C15CM8C0CM8C1_WEIGHT;
    -- sfix(1, -7)
    signal c3cm5c2c1cm4cm5c11cm11c8c17cm9cm2cm3cm4cm2cm1_weight : PIPELINE_TYPE_FOR_C3CM5C2C1CM4CM5C11CM11C8C17CM9CM2CM3CM4CM2CM1_WEIGHT;
    -- sfix(1, -7)
    signal c4cm7c1c4c3c2c0cm8c12c6cm10cm13cm9c0cm1cm2_weight : PIPELINE_TYPE_FOR_C4CM7C1C4C3C2C0CM8C12C6CM10CM13CM9C0CM1CM2_WEIGHT;
    -- sfix(1, -7)
    signal c1cm6cm16c1cm5cm1cm1cm6c10cm1cm18c6c1cm3c3c0_weight : PIPELINE_TYPE_FOR_C1CM6CM16C1CM5CM1CM1CM6C10CM1CM18C6C1CM3C3C0_WEIGHT;
    -- sfix(1, -7)
    signal cm9c0c3c1c16c9c10cm8cm5c0c0c2cm4c0c3cm2_weight : PIPELINE_TYPE_FOR_CM9C0C3C1C16C9C10CM8CM5C0C0C2CM4C0C3CM2_WEIGHT;
    -- sfix(1, -7)
    signal c0c4c15cm1c44c6cm21cm5cm17cm15c5cm2c1c1c0cm1_weight : PIPELINE_TYPE_FOR_C0C4C15CM1C44C6CM21CM5CM17CM15C5CM2C1C1C0CM1_WEIGHT;
    -- sfix(1, -7)
    signal c6cm7c2cm1cm3cm4c2c4cm13cm1cm2c2c6cm4c0c5_weight : PIPELINE_TYPE_FOR_C6CM7C2CM1CM3CM4C2C4CM13CM1CM2C2C6CM4C0C5_WEIGHT;
    -- sfix(1, -7)
    signal cm2c3cm2cm8c0c23cm6c5c3c1c0cm10c3cm1c3c3_weight : PIPELINE_TYPE_FOR_CM2C3CM2CM8C0C23CM6C5C3C1C0CM10C3CM1C3C3_WEIGHT;
    -- sfix(1, -7)
    signal cm12c1c19c3cm1cm4cm7cm6cm12c0cm4c2c3c5c4cm4_weight : PIPELINE_TYPE_FOR_CM12C1C19C3CM1CM4CM7CM6CM12C0CM4C2C3C5C4CM4_WEIGHT;
    -- sfix(1, -7)
    signal c9c1c9cm12cm3c19c3c3cm17c6cm9c0cm2cm2c2cm18_weight : PIPELINE_TYPE_FOR_C9C1C9CM12CM3C19C3C3CM17C6CM9C0CM2CM2C2CM18_WEIGHT;
    -- sfix(1, -7)
    signal cm8c4c0cm4c1cm1cm4cm13c16c3c7cm5cm1c0c11cm6_weight : PIPELINE_TYPE_FOR_CM8C4C0CM4C1CM1CM4CM13C16C3C7CM5CM1C0C11CM6_WEIGHT;
    -- sfix(1, -7)
    signal cm12c6cm3cm3cm2c39c1c12c3cm3cm2cm4c1c3c11cm2_weight : PIPELINE_TYPE_FOR_CM12C6CM3CM3CM2C39C1C12C3CM3CM2CM4C1C3C11CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm1c4cm2cm3cm1c12c8c6c11cm1cm7cm37c0cm2c1c0_weight : PIPELINE_TYPE_FOR_CM1C4CM2CM3CM1C12C8C6C11CM1CM7CM37C0CM2C1C0_WEIGHT;
    -- sfix(1, -7)
    signal cm8cm9c0cm1c21cm12cm13c18cm5cm3cm3cm1c6cm32c6cm5_weight : PIPELINE_TYPE_FOR_CM8CM9C0CM1C21CM12CM13C18CM5CM3CM3CM1C6CM32C6CM5_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm2cm5cm3c4c0c58c6c0cm9cm12cm2cm1cm2c2cm3_weight : PIPELINE_TYPE_FOR_CM1CM2CM5CM3C4C0C58C6C0CM9CM12CM2CM1CM2C2CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm2c3c7c1c3c2cm11c29c5c2c6cm6cm3cm6c1c3_weight : PIPELINE_TYPE_FOR_CM2C3C7C1C3C2CM11C29C5C2C6CM6CM3CM6C1C3_WEIGHT;
    -- sfix(1, -7)
    signal c7cm5c3c0c15cm4c17cm4cm15c12c1cm7c1cm2c4cm3_weight : PIPELINE_TYPE_FOR_C7CM5C3C0C15CM4C17CM4CM15C12C1CM7C1CM2C4CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm9cm34cm11c27c5cm6cm3c1c4cm6cm6c0c0cm14cm14cm10_weight : PIPELINE_TYPE_FOR_CM9CM34CM11C27C5CM6CM3C1C4CM6CM6C0C0CM14CM14CM10_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm5cm7cm4cm10cm8cm2c2cm13cm44c5cm6cm1cm1c1cm1_weight : PIPELINE_TYPE_FOR_CM1CM5CM7CM4CM10CM8CM2C2CM13CM44C5CM6CM1CM1C1CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm1cm1cm1c2cm7cm12cm2c10c0c4cm12cm2cm4cm1cm1_weight : PIPELINE_TYPE_FOR_CM4CM1CM1CM1C2CM7CM12CM2C10C0C4CM12CM2CM4CM1CM1_WEIGHT;
    -- sfix(1, -7)
    signal c10cm1cm11cm2cm8c10c4c7c0cm4cm1cm1c5c5cm6c2_weight : PIPELINE_TYPE_FOR_C10CM1CM11CM2CM8C10C4C7C0CM4CM1CM1C5C5CM6C2_WEIGHT;
    -- sfix(1, -7)
    signal cm2c1c0c1cm1c1cm6c7c2cm7c6cm20c17cm1cm1cm9_weight : PIPELINE_TYPE_FOR_CM2C1C0C1CM1C1CM6C7C2CM7C6CM20C17CM1CM1CM9_WEIGHT;
    -- sfix(1, -7)
    signal c3c1cm7c9c18cm12c1cm8c2cm3cm22c2cm1c1c2c1_weight : PIPELINE_TYPE_FOR_C3C1CM7C9C18CM12C1CM8C2CM3CM22C2CM1C1C2C1_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core3_rmcm_weightsconstant_memory
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
        
            dout1   => cm5c2cm3c0c8cm1cm4cm6c18c10c11c6c1c1cm1c2_weight(0), 
            dout2   => c9c4cm1cm1c1cm1c12cm9cm25c5c1c7c11c0cm15c0_weight(0), 
            dout3   => cm12cm5cm17c16cm4cm14cm8c0cm14cm10c9cm2c4c3c127c18_weight(0), 
            dout4   => c1cm6cm9c18cm1cm4cm4cm3cm7cm4c2cm25cm5cm2cm6cm1_weight(0), 
            dout5   => cm4cm3c9cm6c9c3c1c14c12cm2c5c0c3c4c1c1_weight(0), 
            dout6   => cm11c3cm10c1cm1cm1c4cm13cm5c0c5cm11c5c1cm2c1_weight(0), 
            dout7   => c3c0c0c4cm1cm3cm7c11cm12cm4c4cm19cm4cm3cm1c1_weight(0), 
            dout8   => cm4cm2cm2cm1c0c6c12c12cm7c17c9cm11c0cm2c0c2_weight(0), 
            dout9   => cm6cm19c10cm6cm68c19cm11cm2cm2c4c3c0c0c0c0cm5_weight(0), 
            dout10   => c4cm2c2c1c3c1c1cm4cm8cm3c4c15cm8c0cm8c1_weight(0), 
            dout11   => c3cm5c2c1cm4cm5c11cm11c8c17cm9cm2cm3cm4cm2cm1_weight(0), 
            dout12   => c4cm7c1c4c3c2c0cm8c12c6cm10cm13cm9c0cm1cm2_weight(0), 
            dout13   => c1cm6cm16c1cm5cm1cm1cm6c10cm1cm18c6c1cm3c3c0_weight(0), 
            dout14   => cm9c0c3c1c16c9c10cm8cm5c0c0c2cm4c0c3cm2_weight(0), 
            dout15   => c0c4c15cm1c44c6cm21cm5cm17cm15c5cm2c1c1c0cm1_weight(0), 
            dout16   => c6cm7c2cm1cm3cm4c2c4cm13cm1cm2c2c6cm4c0c5_weight(0), 
            dout17   => cm2c3cm2cm8c0c23cm6c5c3c1c0cm10c3cm1c3c3_weight(0), 
            dout18   => cm12c1c19c3cm1cm4cm7cm6cm12c0cm4c2c3c5c4cm4_weight(0), 
            dout19   => c9c1c9cm12cm3c19c3c3cm17c6cm9c0cm2cm2c2cm18_weight(0), 
            dout20   => cm8c4c0cm4c1cm1cm4cm13c16c3c7cm5cm1c0c11cm6_weight(0), 
            dout21   => cm12c6cm3cm3cm2c39c1c12c3cm3cm2cm4c1c3c11cm2_weight(0), 
            dout22   => cm1c4cm2cm3cm1c12c8c6c11cm1cm7cm37c0cm2c1c0_weight(0), 
            dout23   => cm8cm9c0cm1c21cm12cm13c18cm5cm3cm3cm1c6cm32c6cm5_weight(0), 
            dout24   => cm1cm2cm5cm3c4c0c58c6c0cm9cm12cm2cm1cm2c2cm3_weight(0), 
            dout25   => cm2c3c7c1c3c2cm11c29c5c2c6cm6cm3cm6c1c3_weight(0), 
            dout26   => c7cm5c3c0c15cm4c17cm4cm15c12c1cm7c1cm2c4cm3_weight(0), 
            dout27   => cm9cm34cm11c27c5cm6cm3c1c4cm6cm6c0c0cm14cm14cm10_weight(0), 
            dout28   => cm1cm5cm7cm4cm10cm8cm2c2cm13cm44c5cm6cm1cm1c1cm1_weight(0), 
            dout29   => cm4cm1cm1cm1c2cm7cm12cm2c10c0c4cm12cm2cm4cm1cm1_weight(0), 
            dout30   => c10cm1cm11cm2cm8c10c4c7c0cm4cm1cm1c5c5cm6c2_weight(0), 
            dout31   => cm2c1c0c1cm1c1cm6c7c2cm7c6cm20c17cm1cm1cm9_weight(0), 
            dout32   => c3c1cm7c9c18cm12c1cm8c2cm3cm22c2cm1c1c2c1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm5c2cm3c0c8cm1cm4cm6c18c10c11c6c1c1cm1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c2cm3c0c8cm1cm4cm6c18c10c11c6c1c1cm1c2_weight(0), cm5c2cm3c0c8cm1cm4cm6c18c10c11c6c1c1cm1c2_weight(1));
    PL_STEP_0_for_c9c4cm1cm1c1cm1c12cm9cm25c5c1c7c11c0cm15c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9c4cm1cm1c1cm1c12cm9cm25c5c1c7c11c0cm15c0_weight(0), c9c4cm1cm1c1cm1c12cm9cm25c5c1c7c11c0cm15c0_weight(1));
    PL_STEP_0_for_cm12cm5cm17c16cm4cm14cm8c0cm14cm10c9cm2c4c3c127c18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12cm5cm17c16cm4cm14cm8c0cm14cm10c9cm2c4c3c127c18_weight(0), cm12cm5cm17c16cm4cm14cm8c0cm14cm10c9cm2c4c3c127c18_weight(1));
    PL_STEP_0_for_c1cm6cm9c18cm1cm4cm4cm3cm7cm4c2cm25cm5cm2cm6cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm6cm9c18cm1cm4cm4cm3cm7cm4c2cm25cm5cm2cm6cm1_weight(0), c1cm6cm9c18cm1cm4cm4cm3cm7cm4c2cm25cm5cm2cm6cm1_weight(1));
    PL_STEP_0_for_cm4cm3c9cm6c9c3c1c14c12cm2c5c0c3c4c1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm3c9cm6c9c3c1c14c12cm2c5c0c3c4c1c1_weight(0), cm4cm3c9cm6c9c3c1c14c12cm2c5c0c3c4c1c1_weight(1));
    PL_STEP_0_for_cm11c3cm10c1cm1cm1c4cm13cm5c0c5cm11c5c1cm2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11c3cm10c1cm1cm1c4cm13cm5c0c5cm11c5c1cm2c1_weight(0), cm11c3cm10c1cm1cm1c4cm13cm5c0c5cm11c5c1cm2c1_weight(1));
    PL_STEP_0_for_c3c0c0c4cm1cm3cm7c11cm12cm4c4cm19cm4cm3cm1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0c0c4cm1cm3cm7c11cm12cm4c4cm19cm4cm3cm1c1_weight(0), c3c0c0c4cm1cm3cm7c11cm12cm4c4cm19cm4cm3cm1c1_weight(1));
    PL_STEP_0_for_cm4cm2cm2cm1c0c6c12c12cm7c17c9cm11c0cm2c0c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm2cm2cm1c0c6c12c12cm7c17c9cm11c0cm2c0c2_weight(0), cm4cm2cm2cm1c0c6c12c12cm7c17c9cm11c0cm2c0c2_weight(1));
    PL_STEP_0_for_cm6cm19c10cm6cm68c19cm11cm2cm2c4c3c0c0c0c0cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm19c10cm6cm68c19cm11cm2cm2c4c3c0c0c0c0cm5_weight(0), cm6cm19c10cm6cm68c19cm11cm2cm2c4c3c0c0c0c0cm5_weight(1));
    PL_STEP_0_for_c4cm2c2c1c3c1c1cm4cm8cm3c4c15cm8c0cm8c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm2c2c1c3c1c1cm4cm8cm3c4c15cm8c0cm8c1_weight(0), c4cm2c2c1c3c1c1cm4cm8cm3c4c15cm8c0cm8c1_weight(1));
    PL_STEP_0_for_c3cm5c2c1cm4cm5c11cm11c8c17cm9cm2cm3cm4cm2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm5c2c1cm4cm5c11cm11c8c17cm9cm2cm3cm4cm2cm1_weight(0), c3cm5c2c1cm4cm5c11cm11c8c17cm9cm2cm3cm4cm2cm1_weight(1));
    PL_STEP_0_for_c4cm7c1c4c3c2c0cm8c12c6cm10cm13cm9c0cm1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm7c1c4c3c2c0cm8c12c6cm10cm13cm9c0cm1cm2_weight(0), c4cm7c1c4c3c2c0cm8c12c6cm10cm13cm9c0cm1cm2_weight(1));
    PL_STEP_0_for_c1cm6cm16c1cm5cm1cm1cm6c10cm1cm18c6c1cm3c3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm6cm16c1cm5cm1cm1cm6c10cm1cm18c6c1cm3c3c0_weight(0), c1cm6cm16c1cm5cm1cm1cm6c10cm1cm18c6c1cm3c3c0_weight(1));
    PL_STEP_0_for_cm9c0c3c1c16c9c10cm8cm5c0c0c2cm4c0c3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c0c3c1c16c9c10cm8cm5c0c0c2cm4c0c3cm2_weight(0), cm9c0c3c1c16c9c10cm8cm5c0c0c2cm4c0c3cm2_weight(1));
    PL_STEP_0_for_c0c4c15cm1c44c6cm21cm5cm17cm15c5cm2c1c1c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c4c15cm1c44c6cm21cm5cm17cm15c5cm2c1c1c0cm1_weight(0), c0c4c15cm1c44c6cm21cm5cm17cm15c5cm2c1c1c0cm1_weight(1));
    PL_STEP_0_for_c6cm7c2cm1cm3cm4c2c4cm13cm1cm2c2c6cm4c0c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm7c2cm1cm3cm4c2c4cm13cm1cm2c2c6cm4c0c5_weight(0), c6cm7c2cm1cm3cm4c2c4cm13cm1cm2c2c6cm4c0c5_weight(1));
    PL_STEP_0_for_cm2c3cm2cm8c0c23cm6c5c3c1c0cm10c3cm1c3c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c3cm2cm8c0c23cm6c5c3c1c0cm10c3cm1c3c3_weight(0), cm2c3cm2cm8c0c23cm6c5c3c1c0cm10c3cm1c3c3_weight(1));
    PL_STEP_0_for_cm12c1c19c3cm1cm4cm7cm6cm12c0cm4c2c3c5c4cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12c1c19c3cm1cm4cm7cm6cm12c0cm4c2c3c5c4cm4_weight(0), cm12c1c19c3cm1cm4cm7cm6cm12c0cm4c2c3c5c4cm4_weight(1));
    PL_STEP_0_for_c9c1c9cm12cm3c19c3c3cm17c6cm9c0cm2cm2c2cm18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9c1c9cm12cm3c19c3c3cm17c6cm9c0cm2cm2c2cm18_weight(0), c9c1c9cm12cm3c19c3c3cm17c6cm9c0cm2cm2c2cm18_weight(1));
    PL_STEP_0_for_cm8c4c0cm4c1cm1cm4cm13c16c3c7cm5cm1c0c11cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8c4c0cm4c1cm1cm4cm13c16c3c7cm5cm1c0c11cm6_weight(0), cm8c4c0cm4c1cm1cm4cm13c16c3c7cm5cm1c0c11cm6_weight(1));
    PL_STEP_0_for_cm12c6cm3cm3cm2c39c1c12c3cm3cm2cm4c1c3c11cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12c6cm3cm3cm2c39c1c12c3cm3cm2cm4c1c3c11cm2_weight(0), cm12c6cm3cm3cm2c39c1c12c3cm3cm2cm4c1c3c11cm2_weight(1));
    PL_STEP_0_for_cm1c4cm2cm3cm1c12c8c6c11cm1cm7cm37c0cm2c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c4cm2cm3cm1c12c8c6c11cm1cm7cm37c0cm2c1c0_weight(0), cm1c4cm2cm3cm1c12c8c6c11cm1cm7cm37c0cm2c1c0_weight(1));
    PL_STEP_0_for_cm8cm9c0cm1c21cm12cm13c18cm5cm3cm3cm1c6cm32c6cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8cm9c0cm1c21cm12cm13c18cm5cm3cm3cm1c6cm32c6cm5_weight(0), cm8cm9c0cm1c21cm12cm13c18cm5cm3cm3cm1c6cm32c6cm5_weight(1));
    PL_STEP_0_for_cm1cm2cm5cm3c4c0c58c6c0cm9cm12cm2cm1cm2c2cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm2cm5cm3c4c0c58c6c0cm9cm12cm2cm1cm2c2cm3_weight(0), cm1cm2cm5cm3c4c0c58c6c0cm9cm12cm2cm1cm2c2cm3_weight(1));
    PL_STEP_0_for_cm2c3c7c1c3c2cm11c29c5c2c6cm6cm3cm6c1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c3c7c1c3c2cm11c29c5c2c6cm6cm3cm6c1c3_weight(0), cm2c3c7c1c3c2cm11c29c5c2c6cm6cm3cm6c1c3_weight(1));
    PL_STEP_0_for_c7cm5c3c0c15cm4c17cm4cm15c12c1cm7c1cm2c4cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm5c3c0c15cm4c17cm4cm15c12c1cm7c1cm2c4cm3_weight(0), c7cm5c3c0c15cm4c17cm4cm15c12c1cm7c1cm2c4cm3_weight(1));
    PL_STEP_0_for_cm9cm34cm11c27c5cm6cm3c1c4cm6cm6c0c0cm14cm14cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9cm34cm11c27c5cm6cm3c1c4cm6cm6c0c0cm14cm14cm10_weight(0), cm9cm34cm11c27c5cm6cm3c1c4cm6cm6c0c0cm14cm14cm10_weight(1));
    PL_STEP_0_for_cm1cm5cm7cm4cm10cm8cm2c2cm13cm44c5cm6cm1cm1c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm5cm7cm4cm10cm8cm2c2cm13cm44c5cm6cm1cm1c1cm1_weight(0), cm1cm5cm7cm4cm10cm8cm2c2cm13cm44c5cm6cm1cm1c1cm1_weight(1));
    PL_STEP_0_for_cm4cm1cm1cm1c2cm7cm12cm2c10c0c4cm12cm2cm4cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm1cm1cm1c2cm7cm12cm2c10c0c4cm12cm2cm4cm1cm1_weight(0), cm4cm1cm1cm1c2cm7cm12cm2c10c0c4cm12cm2cm4cm1cm1_weight(1));
    PL_STEP_0_for_c10cm1cm11cm2cm8c10c4c7c0cm4cm1cm1c5c5cm6c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10cm1cm11cm2cm8c10c4c7c0cm4cm1cm1c5c5cm6c2_weight(0), c10cm1cm11cm2cm8c10c4c7c0cm4cm1cm1c5c5cm6c2_weight(1));
    PL_STEP_0_for_cm2c1c0c1cm1c1cm6c7c2cm7c6cm20c17cm1cm1cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1c0c1cm1c1cm6c7c2cm7c6cm20c17cm1cm1cm9_weight(0), cm2c1c0c1cm1c1cm6c7c2cm7c6cm20c17cm1cm1cm9_weight(1));
    PL_STEP_0_for_c3c1cm7c9c18cm12c1cm8c2cm3cm22c2cm1c1c2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c1cm7c9c18cm12c1cm8c2cm3cm22c2cm1c1c2c1_weight(0), c3c1cm7c9c18cm12c1cm8c2cm3cm22c2cm1c1c2c1_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm12cm5cm17c16cm4cm14cm8c0cm14cm10c9cm2c4c3c127c18_c10cm1cm11cm2cm8c10c4c7c0cm4cm1cm1c5c5cm6c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm12cm5cm17c16cm4cm14cm8c0cm14cm10c9cm2c4c3c127c18_weight(1)(8-1 downto 0),
			B	=> c10cm1cm11cm2cm8c10c4c7c0cm4cm1cm1c5c5cm6c2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm12cm5cm17c16cm4cm14cm8c0cm14cm10c9cm2c4c3c127c18,
			CxB => R_c10cm1cm11cm2cm8c10c4c7c0cm4cm1cm1c5c5cm6c2
		);

    cm6cm19c10cm6cm68c19cm11cm2cm2c4c3c0c0c0c0cm5_cm4cm1cm1cm1c2cm7cm12cm2c10c0c4cm12cm2cm4cm1cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6cm19c10cm6cm68c19cm11cm2cm2c4c3c0c0c0c0cm5_weight(1)(8-1 downto 0),
			B	=> cm4cm1cm1cm1c2cm7cm12cm2c10c0c4cm12cm2cm4cm1cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6cm19c10cm6cm68c19cm11cm2cm2c4c3c0c0c0c0cm5,
			CxB => R_cm4cm1cm1cm1c2cm7cm12cm2c10c0c4cm12cm2cm4cm1cm1
		);

    c0c4c15cm1c44c6cm21cm5cm17cm15c5cm2c1c1c0cm1_c6cm7c2cm1cm3cm4c2c4cm13cm1cm2c2c6cm4c0c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c4c15cm1c44c6cm21cm5cm17cm15c5cm2c1c1c0cm1_weight(1)(7-1 downto 0),
			B	=> c6cm7c2cm1cm3cm4c2c4cm13cm1cm2c2c6cm4c0c5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c4c15cm1c44c6cm21cm5cm17cm15c5cm2c1c1c0cm1,
			CxB => R_c6cm7c2cm1cm3cm4c2c4cm13cm1cm2c2c6cm4c0c5
		);

    cm12c6cm3cm3cm2c39c1c12c3cm3cm2cm4c1c3c11cm2_c4cm7c1c4c3c2c0cm8c12c6cm10cm13cm9c0cm1cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm12c6cm3cm3cm2c39c1c12c3cm3cm2cm4c1c3c11cm2_weight(1)(7-1 downto 0),
			B	=> c4cm7c1c4c3c2c0cm8c12c6cm10cm13cm9c0cm1cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm12c6cm3cm3cm2c39c1c12c3cm3cm2cm4c1c3c11cm2,
			CxB => R_c4cm7c1c4c3c2c0cm8c12c6cm10cm13cm9c0cm1cm2
		);

    cm1c4cm2cm3cm1c12c8c6c11cm1cm7cm37c0cm2c1c0_c4cm2c2c1c3c1c1cm4cm8cm3c4c15cm8c0cm8c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c4cm2cm3cm1c12c8c6c11cm1cm7cm37c0cm2c1c0_weight(1)(7-1 downto 0),
			B	=> c4cm2c2c1c3c1c1cm4cm8cm3c4c15cm8c0cm8c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c4cm2cm3cm1c12c8c6c11cm1cm7cm37c0cm2c1c0,
			CxB => R_c4cm2c2c1c3c1c1cm4cm8cm3c4c15cm8c0cm8c1
		);

    cm1cm2cm5cm3c4c0c58c6c0cm9cm12cm2cm1cm2c2cm3_cm11c3cm10c1cm1cm1c4cm13cm5c0c5cm11c5c1cm2c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm2cm5cm3c4c0c58c6c0cm9cm12cm2cm1cm2c2cm3_weight(1)(7-1 downto 0),
			B	=> cm11c3cm10c1cm1cm1c4cm13cm5c0c5cm11c5c1cm2c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm2cm5cm3c4c0c58c6c0cm9cm12cm2cm1cm2c2cm3,
			CxB => R_cm11c3cm10c1cm1cm1c4cm13cm5c0c5cm11c5c1cm2c1
		);

    cm9cm34cm11c27c5cm6cm3c1c4cm6cm6c0c0cm14cm14cm10_cm4cm3c9cm6c9c3c1c14c12cm2c5c0c3c4c1c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9cm34cm11c27c5cm6cm3c1c4cm6cm6c0c0cm14cm14cm10_weight(1)(7-1 downto 0),
			B	=> cm4cm3c9cm6c9c3c1c14c12cm2c5c0c3c4c1c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9cm34cm11c27c5cm6cm3c1c4cm6cm6c0c0cm14cm14cm10,
			CxB => R_cm4cm3c9cm6c9c3c1c14c12cm2c5c0c3c4c1c1
		);

    cm1cm5cm7cm4cm10cm8cm2c2cm13cm44c5cm6cm1cm1c1cm1_c3c1cm7c9c18cm12c1cm8c2cm3cm22c2cm1c1c2c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm5cm7cm4cm10cm8cm2c2cm13cm44c5cm6cm1cm1c1cm1_weight(1)(7-1 downto 0),
			B	=> c3c1cm7c9c18cm12c1cm8c2cm3cm22c2cm1c1c2c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm5cm7cm4cm10cm8cm2c2cm13cm44c5cm6cm1cm1c1cm1,
			CxB => R_c3c1cm7c9c18cm12c1cm8c2cm3cm22c2cm1c1c2c1
		);

    cm5c2cm3c0c8cm1cm4cm6c18c10c11c6c1c1cm1c2_cm2c1c0c1cm1c1cm6c7c2cm7c6cm20c17cm1cm1cm9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5c2cm3c0c8cm1cm4cm6c18c10c11c6c1c1cm1c2_weight(1)(6-1 downto 0),
			B	=> cm2c1c0c1cm1c1cm6c7c2cm7c6cm20c17cm1cm1cm9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5c2cm3c0c8cm1cm4cm6c18c10c11c6c1c1cm1c2,
			CxB => R_cm2c1c0c1cm1c1cm6c7c2cm7c6cm20c17cm1cm1cm9
		);

    c9c4cm1cm1c1cm1c12cm9cm25c5c1c7c11c0cm15c0_c7cm5c3c0c15cm4c17cm4cm15c12c1cm7c1cm2c4cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c9c4cm1cm1c1cm1c12cm9cm25c5c1c7c11c0cm15c0_weight(1)(6-1 downto 0),
			B	=> c7cm5c3c0c15cm4c17cm4cm15c12c1cm7c1cm2c4cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9c4cm1cm1c1cm1c12cm9cm25c5c1c7c11c0cm15c0,
			CxB => R_c7cm5c3c0c15cm4c17cm4cm15c12c1cm7c1cm2c4cm3
		);

    c1cm6cm9c18cm1cm4cm4cm3cm7cm4c2cm25cm5cm2cm6cm1_cm2c3c7c1c3c2cm11c29c5c2c6cm6cm3cm6c1c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm6cm9c18cm1cm4cm4cm3cm7cm4c2cm25cm5cm2cm6cm1_weight(1)(6-1 downto 0),
			B	=> cm2c3c7c1c3c2cm11c29c5c2c6cm6cm3cm6c1c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm6cm9c18cm1cm4cm4cm3cm7cm4c2cm25cm5cm2cm6cm1,
			CxB => R_cm2c3c7c1c3c2cm11c29c5c2c6cm6cm3cm6c1c3
		);

    c3c0c0c4cm1cm3cm7c11cm12cm4c4cm19cm4cm3cm1c1_cm8cm9c0cm1c21cm12cm13c18cm5cm3cm3cm1c6cm32c6cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c0c0c4cm1cm3cm7c11cm12cm4c4cm19cm4cm3cm1c1_weight(1)(6-1 downto 0),
			B	=> cm8cm9c0cm1c21cm12cm13c18cm5cm3cm3cm1c6cm32c6cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c0c0c4cm1cm3cm7c11cm12cm4c4cm19cm4cm3cm1c1,
			CxB => R_cm8cm9c0cm1c21cm12cm13c18cm5cm3cm3cm1c6cm32c6cm5
		);

    cm4cm2cm2cm1c0c6c12c12cm7c17c9cm11c0cm2c0c2_cm8c4c0cm4c1cm1cm4cm13c16c3c7cm5cm1c0c11cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm2cm2cm1c0c6c12c12cm7c17c9cm11c0cm2c0c2_weight(1)(6-1 downto 0),
			B	=> cm8c4c0cm4c1cm1cm4cm13c16c3c7cm5cm1c0c11cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm2cm2cm1c0c6c12c12cm7c17c9cm11c0cm2c0c2,
			CxB => R_cm8c4c0cm4c1cm1cm4cm13c16c3c7cm5cm1c0c11cm6
		);

    c3cm5c2c1cm4cm5c11cm11c8c17cm9cm2cm3cm4cm2cm1_c9c1c9cm12cm3c19c3c3cm17c6cm9c0cm2cm2c2cm18_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3cm5c2c1cm4cm5c11cm11c8c17cm9cm2cm3cm4cm2cm1_weight(1)(6-1 downto 0),
			B	=> c9c1c9cm12cm3c19c3c3cm17c6cm9c0cm2cm2c2cm18_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm5c2c1cm4cm5c11cm11c8c17cm9cm2cm3cm4cm2cm1,
			CxB => R_c9c1c9cm12cm3c19c3c3cm17c6cm9c0cm2cm2c2cm18
		);

    c1cm6cm16c1cm5cm1cm1cm6c10cm1cm18c6c1cm3c3c0_cm12c1c19c3cm1cm4cm7cm6cm12c0cm4c2c3c5c4cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm6cm16c1cm5cm1cm1cm6c10cm1cm18c6c1cm3c3c0_weight(1)(6-1 downto 0),
			B	=> cm12c1c19c3cm1cm4cm7cm6cm12c0cm4c2c3c5c4cm4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm6cm16c1cm5cm1cm1cm6c10cm1cm18c6c1cm3c3c0,
			CxB => R_cm12c1c19c3cm1cm4cm7cm6cm12c0cm4c2c3c5c4cm4
		);

    cm9c0c3c1c16c9c10cm8cm5c0c0c2cm4c0c3cm2_cm2c3cm2cm8c0c23cm6c5c3c1c0cm10c3cm1c3c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9c0c3c1c16c9c10cm8cm5c0c0c2cm4c0c3cm2_weight(1)(6-1 downto 0),
			B	=> cm2c3cm2cm8c0c23cm6c5c3c1c0cm10c3cm1c3c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9c0c3c1c16c9c10cm8cm5c0c0c2cm4c0c3cm2,
			CxB => R_cm2c3cm2cm8c0c23cm6c5c3c1c0cm10c3cm1c3c3
		);




end architecture;
