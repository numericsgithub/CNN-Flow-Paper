library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core13_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm6c5c7cm2cm7cm2c5c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c32c5c1cm10cm1cm24c4cm17c0c0c0c0c0c0c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c5c4cm22c6cm4c0cm14c0c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1cm1cm15c15c2cm6cm5c14c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm4c1c3cm2c5c1cm14c0c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c10cm14c0cm2c0cm29cm8c12c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c2c3cm7cm2cm2cm1cm13c2c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm3cm2c1cm3c0cm10cm1c2c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm14cm2cm5c0c7c0cm6cm21c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm28cm1cm2c1cm16cm9c5c1c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3cm7cm3cm6cm1cm2c5cm14c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm21c4cm3c4c0cm4c3c6c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c6cm17cm25c1cm3cm2c10c1c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c6cm1c17c0c0c1cm6cm1c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c4cm6cm9c5c0cm9c6c0c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm20c2cm5cm14cm2cm2cm15cm5c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c13cm6c0c8c2cm2c2c1c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1c4cm3cm6cm6cm2c3c3c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c0c15cm17c31cm4cm2c5c2c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c7cm1c17c3c1c0c17cm4c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0cm9c0c3c0cm16cm2c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c4c7c6c2c12cm7cm1cm29c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3c0cm4cm11cm4cm2cm15c1c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c7c11c11c7cm2c4c18c8c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c7cm1c2c0cm6c14c4c9c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1cm4cm1c4c2c4cm1cm3c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c0cm2cm12c16c7c16c18cm2c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2cm4c12c0cm9c12c5cm2c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c8c4cm2cm6cm15c21c5cm10c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm6c1c11cm3cm2cm4cm7c13c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm4cm8c3c13cm3cm4c5c5c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1c1cm3c2c1c13cm9cm2c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core13_rmcm;

architecture arch of conv5_core13_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C5C7CM2CM7CM2C5C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C32C5C1CM10CM1CM24C4CM17C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C4CM22C6CM4C0CM14C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1CM15C15C2CM6CM5C14C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C1C3CM2C5C1CM14C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10CM14C0CM2C0CM29CM8C12C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C3CM7CM2CM2CM1CM13C2C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM2C1CM3C0CM10CM1C2C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14CM2CM5C0C7C0CM6CM21C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM28CM1CM2C1CM16CM9C5C1C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM7CM3CM6CM1CM2C5CM14C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM21C4CM3C4C0CM4C3C6C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM17CM25C1CM3CM2C10C1C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM1C17C0C0C1CM6CM1C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM6CM9C5C0CM9C6C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM20C2CM5CM14CM2CM2CM15CM5C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13CM6C0C8C2CM2C2C1C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C4CM3CM6CM6CM2C3C3C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C15CM17C31CM4CM2C5C2C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM1C17C3C1C0C17CM4C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM9C0C3C0CM16CM2C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C7C6C2C12CM7CM1CM29C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0CM4CM11CM4CM2CM15C1C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C11C11C7CM2C4C18C8C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM1C2C0CM6C14C4C9C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM4CM1C4C2C4CM1CM3C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2CM12C16C7C16C18CM2C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM4C12C0CM9C12C5CM2C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C4CM2CM6CM15C21C5CM10C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C1C11CM3CM2CM4CM7C13C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM8C3C13CM3CM4C5C5C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1CM3C2C1C13CM9CM2C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal cm6c5c7cm2cm7cm2c5c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM6C5C7CM2CM7CM2C5C0C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c32c5c1cm10cm1cm24c4cm17c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C32C5C1CM10CM1CM24C4CM17C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c5c4cm22c6cm4c0cm14c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C5C4CM22C6CM4C0CM14C0C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm1cm15c15c2cm6cm5c14c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM1CM1CM15C15C2CM6CM5C14C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm4c1c3cm2c5c1cm14c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM4C1C3CM2C5C1CM14C0C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c10cm14c0cm2c0cm29cm8c12c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C10CM14C0CM2C0CM29CM8C12C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c2c3cm7cm2cm2cm1cm13c2c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C2C3CM7CM2CM2CM1CM13C2C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm3cm2c1cm3c0cm10cm1c2c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM3CM2C1CM3C0CM10CM1C2C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm14cm2cm5c0c7c0cm6cm21c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM14CM2CM5C0C7C0CM6CM21C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm28cm1cm2c1cm16cm9c5c1c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM28CM1CM2C1CM16CM9C5C1C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c3cm7cm3cm6cm1cm2c5cm14c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C3CM7CM3CM6CM1CM2C5CM14C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm21c4cm3c4c0cm4c3c6c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM21C4CM3C4C0CM4C3C6C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c6cm17cm25c1cm3cm2c10c1c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C6CM17CM25C1CM3CM2C10C1C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c6cm1c17c0c0c1cm6cm1c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C6CM1C17C0C0C1CM6CM1C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c4cm6cm9c5c0cm9c6c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C4CM6CM9C5C0CM9C6C0C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm20c2cm5cm14cm2cm2cm15cm5c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM20C2CM5CM14CM2CM2CM15CM5C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c13cm6c0c8c2cm2c2c1c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C13CM6C0C8C2CM2C2C1C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c1c4cm3cm6cm6cm2c3c3c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C1C4CM3CM6CM6CM2C3C3C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c0c15cm17c31cm4cm2c5c2c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C15CM17C31CM4CM2C5C2C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c7cm1c17c3c1c0c17cm4c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C7CM1C17C3C1C0C17CM4C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c0c0cm9c0c3c0cm16cm2c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0CM9C0C3C0CM16CM2C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c4c7c6c2c12cm7cm1cm29c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C4C7C6C2C12CM7CM1CM29C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c3c0cm4cm11cm4cm2cm15c1c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C3C0CM4CM11CM4CM2CM15C1C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c7c11c11c7cm2c4c18c8c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C7C11C11C7CM2C4C18C8C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c7cm1c2c0cm6c14c4c9c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C7CM1C2C0CM6C14C4C9C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c1cm4cm1c4c2c4cm1cm3c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C1CM4CM1C4C2C4CM1CM3C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c0cm2cm12c16c7c16c18cm2c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0CM2CM12C16C7C16C18CM2C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm4c12c0cm9c12c5cm2c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM2CM4C12C0CM9C12C5CM2C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c8c4cm2cm6cm15c21c5cm10c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C8C4CM2CM6CM15C21C5CM10C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm6c1c11cm3cm2cm4cm7c13c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM6C1C11CM3CM2CM4CM7C13C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm4cm8c3c13cm3cm4c5c5c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM4CM8C3C13CM3CM4C5C5C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c1c1cm3c2c1c13cm9cm2c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C1C1CM3C2C1C13CM9CM2C0C0C0C0C0C0C0C0_WEIGHT;
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



    WEIGHT_ROM: entity work.conv5_core13_rmcm_weightsconstant_memory
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
        
            dout1   => cm6c5c7cm2cm7cm2c5c0c0c0c0c0c0c0c0c0_weight(0), 
            dout2   => c32c5c1cm10cm1cm24c4cm17c0c0c0c0c0c0c0c0_weight(0), 
            dout3   => c5c4cm22c6cm4c0cm14c0c0c0c0c0c0c0c0c0_weight(0), 
            dout4   => cm1cm1cm15c15c2cm6cm5c14c0c0c0c0c0c0c0c0_weight(0), 
            dout5   => cm4c1c3cm2c5c1cm14c0c0c0c0c0c0c0c0c0_weight(0), 
            dout6   => c10cm14c0cm2c0cm29cm8c12c0c0c0c0c0c0c0c0_weight(0), 
            dout7   => c2c3cm7cm2cm2cm1cm13c2c0c0c0c0c0c0c0c0_weight(0), 
            dout8   => cm3cm2c1cm3c0cm10cm1c2c0c0c0c0c0c0c0c0_weight(0), 
            dout9   => cm14cm2cm5c0c7c0cm6cm21c0c0c0c0c0c0c0c0_weight(0), 
            dout10   => cm28cm1cm2c1cm16cm9c5c1c0c0c0c0c0c0c0c0_weight(0), 
            dout11   => c3cm7cm3cm6cm1cm2c5cm14c0c0c0c0c0c0c0c0_weight(0), 
            dout12   => cm21c4cm3c4c0cm4c3c6c0c0c0c0c0c0c0c0_weight(0), 
            dout13   => c6cm17cm25c1cm3cm2c10c1c0c0c0c0c0c0c0c0_weight(0), 
            dout14   => c6cm1c17c0c0c1cm6cm1c0c0c0c0c0c0c0c0_weight(0), 
            dout15   => c4cm6cm9c5c0cm9c6c0c0c0c0c0c0c0c0c0_weight(0), 
            dout16   => cm20c2cm5cm14cm2cm2cm15cm5c0c0c0c0c0c0c0c0_weight(0), 
            dout17   => c13cm6c0c8c2cm2c2c1c0c0c0c0c0c0c0c0_weight(0), 
            dout18   => c1c4cm3cm6cm6cm2c3c3c0c0c0c0c0c0c0c0_weight(0), 
            dout19   => c0c15cm17c31cm4cm2c5c2c0c0c0c0c0c0c0c0_weight(0), 
            dout20   => c7cm1c17c3c1c0c17cm4c0c0c0c0c0c0c0c0_weight(0), 
            dout21   => c0c0cm9c0c3c0cm16cm2c0c0c0c0c0c0c0c0_weight(0), 
            dout22   => c4c7c6c2c12cm7cm1cm29c0c0c0c0c0c0c0c0_weight(0), 
            dout23   => c3c0cm4cm11cm4cm2cm15c1c0c0c0c0c0c0c0c0_weight(0), 
            dout24   => c7c11c11c7cm2c4c18c8c0c0c0c0c0c0c0c0_weight(0), 
            dout25   => c7cm1c2c0cm6c14c4c9c0c0c0c0c0c0c0c0_weight(0), 
            dout26   => c1cm4cm1c4c2c4cm1cm3c0c0c0c0c0c0c0c0_weight(0), 
            dout27   => c0cm2cm12c16c7c16c18cm2c0c0c0c0c0c0c0c0_weight(0), 
            dout28   => cm2cm4c12c0cm9c12c5cm2c0c0c0c0c0c0c0c0_weight(0), 
            dout29   => c8c4cm2cm6cm15c21c5cm10c0c0c0c0c0c0c0c0_weight(0), 
            dout30   => cm6c1c11cm3cm2cm4cm7c13c0c0c0c0c0c0c0c0_weight(0), 
            dout31   => cm4cm8c3c13cm3cm4c5c5c0c0c0c0c0c0c0c0_weight(0), 
            dout32   => c1c1cm3c2c1c13cm9cm2c0c0c0c0c0c0c0c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm6c5c7cm2cm7cm2c5c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c5c7cm2cm7cm2c5c0c0c0c0c0c0c0c0c0_weight(0), cm6c5c7cm2cm7cm2c5c0c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c32c5c1cm10cm1cm24c4cm17c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c32c5c1cm10cm1cm24c4cm17c0c0c0c0c0c0c0c0_weight(0), c32c5c1cm10cm1cm24c4cm17c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c5c4cm22c6cm4c0cm14c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c4cm22c6cm4c0cm14c0c0c0c0c0c0c0c0c0_weight(0), c5c4cm22c6cm4c0cm14c0c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm1cm1cm15c15c2cm6cm5c14c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1cm15c15c2cm6cm5c14c0c0c0c0c0c0c0c0_weight(0), cm1cm1cm15c15c2cm6cm5c14c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm4c1c3cm2c5c1cm14c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c1c3cm2c5c1cm14c0c0c0c0c0c0c0c0c0_weight(0), cm4c1c3cm2c5c1cm14c0c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c10cm14c0cm2c0cm29cm8c12c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10cm14c0cm2c0cm29cm8c12c0c0c0c0c0c0c0c0_weight(0), c10cm14c0cm2c0cm29cm8c12c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c2c3cm7cm2cm2cm1cm13c2c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c3cm7cm2cm2cm1cm13c2c0c0c0c0c0c0c0c0_weight(0), c2c3cm7cm2cm2cm1cm13c2c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm3cm2c1cm3c0cm10cm1c2c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm2c1cm3c0cm10cm1c2c0c0c0c0c0c0c0c0_weight(0), cm3cm2c1cm3c0cm10cm1c2c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm14cm2cm5c0c7c0cm6cm21c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14cm2cm5c0c7c0cm6cm21c0c0c0c0c0c0c0c0_weight(0), cm14cm2cm5c0c7c0cm6cm21c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm28cm1cm2c1cm16cm9c5c1c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm28cm1cm2c1cm16cm9c5c1c0c0c0c0c0c0c0c0_weight(0), cm28cm1cm2c1cm16cm9c5c1c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c3cm7cm3cm6cm1cm2c5cm14c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm7cm3cm6cm1cm2c5cm14c0c0c0c0c0c0c0c0_weight(0), c3cm7cm3cm6cm1cm2c5cm14c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm21c4cm3c4c0cm4c3c6c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm21c4cm3c4c0cm4c3c6c0c0c0c0c0c0c0c0_weight(0), cm21c4cm3c4c0cm4c3c6c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c6cm17cm25c1cm3cm2c10c1c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm17cm25c1cm3cm2c10c1c0c0c0c0c0c0c0c0_weight(0), c6cm17cm25c1cm3cm2c10c1c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c6cm1c17c0c0c1cm6cm1c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm1c17c0c0c1cm6cm1c0c0c0c0c0c0c0c0_weight(0), c6cm1c17c0c0c1cm6cm1c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c4cm6cm9c5c0cm9c6c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm6cm9c5c0cm9c6c0c0c0c0c0c0c0c0c0_weight(0), c4cm6cm9c5c0cm9c6c0c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm20c2cm5cm14cm2cm2cm15cm5c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm20c2cm5cm14cm2cm2cm15cm5c0c0c0c0c0c0c0c0_weight(0), cm20c2cm5cm14cm2cm2cm15cm5c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c13cm6c0c8c2cm2c2c1c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13cm6c0c8c2cm2c2c1c0c0c0c0c0c0c0c0_weight(0), c13cm6c0c8c2cm2c2c1c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c1c4cm3cm6cm6cm2c3c3c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c4cm3cm6cm6cm2c3c3c0c0c0c0c0c0c0c0_weight(0), c1c4cm3cm6cm6cm2c3c3c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c0c15cm17c31cm4cm2c5c2c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c15cm17c31cm4cm2c5c2c0c0c0c0c0c0c0c0_weight(0), c0c15cm17c31cm4cm2c5c2c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c7cm1c17c3c1c0c17cm4c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm1c17c3c1c0c17cm4c0c0c0c0c0c0c0c0_weight(0), c7cm1c17c3c1c0c17cm4c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c0c0cm9c0c3c0cm16cm2c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm9c0c3c0cm16cm2c0c0c0c0c0c0c0c0_weight(0), c0c0cm9c0c3c0cm16cm2c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c4c7c6c2c12cm7cm1cm29c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c7c6c2c12cm7cm1cm29c0c0c0c0c0c0c0c0_weight(0), c4c7c6c2c12cm7cm1cm29c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c3c0cm4cm11cm4cm2cm15c1c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0cm4cm11cm4cm2cm15c1c0c0c0c0c0c0c0c0_weight(0), c3c0cm4cm11cm4cm2cm15c1c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c7c11c11c7cm2c4c18c8c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c11c11c7cm2c4c18c8c0c0c0c0c0c0c0c0_weight(0), c7c11c11c7cm2c4c18c8c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c7cm1c2c0cm6c14c4c9c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm1c2c0cm6c14c4c9c0c0c0c0c0c0c0c0_weight(0), c7cm1c2c0cm6c14c4c9c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c1cm4cm1c4c2c4cm1cm3c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm4cm1c4c2c4cm1cm3c0c0c0c0c0c0c0c0_weight(0), c1cm4cm1c4c2c4cm1cm3c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c0cm2cm12c16c7c16c18cm2c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2cm12c16c7c16c18cm2c0c0c0c0c0c0c0c0_weight(0), c0cm2cm12c16c7c16c18cm2c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm2cm4c12c0cm9c12c5cm2c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm4c12c0cm9c12c5cm2c0c0c0c0c0c0c0c0_weight(0), cm2cm4c12c0cm9c12c5cm2c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c8c4cm2cm6cm15c21c5cm10c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c4cm2cm6cm15c21c5cm10c0c0c0c0c0c0c0c0_weight(0), c8c4cm2cm6cm15c21c5cm10c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm6c1c11cm3cm2cm4cm7c13c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c1c11cm3cm2cm4cm7c13c0c0c0c0c0c0c0c0_weight(0), cm6c1c11cm3cm2cm4cm7c13c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm4cm8c3c13cm3cm4c5c5c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm8c3c13cm3cm4c5c5c0c0c0c0c0c0c0c0_weight(0), cm4cm8c3c13cm3cm4c5c5c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c1c1cm3c2c1c13cm9cm2c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1cm3c2c1c13cm9cm2c0c0c0c0c0c0c0c0_weight(0), c1c1cm3c2c1c13cm9cm2c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c32c5c1cm10cm1cm24c4cm17c0c0c0c0c0c0c0c0_c1cm4cm1c4c2c4cm1cm3c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c32c5c1cm10cm1cm24c4cm17c0c0c0c0c0c0c0c0_weight(1)(7-1 downto 0),
			B	=> c1cm4cm1c4c2c4cm1cm3c0c0c0c0c0c0c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c32c5c1cm10cm1cm24c4cm17c0c0c0c0c0c0c0c0,
			CxB => R_c1cm4cm1c4c2c4cm1cm3c0c0c0c0c0c0c0c0
		);

    c5c4cm22c6cm4c0cm14c0c0c0c0c0c0c0c0c0_c1c4cm3cm6cm6cm2c3c3c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c5c4cm22c6cm4c0cm14c0c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> c1c4cm3cm6cm6cm2c3c3c0c0c0c0c0c0c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c4cm22c6cm4c0cm14c0c0c0c0c0c0c0c0c0,
			CxB => R_c1c4cm3cm6cm6cm2c3c3c0c0c0c0c0c0c0c0
		);

    c10cm14c0cm2c0cm29cm8c12c0c0c0c0c0c0c0c0_cm6c5c7cm2cm7cm2c5c0c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c10cm14c0cm2c0cm29cm8c12c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> cm6c5c7cm2cm7cm2c5c0c0c0c0c0c0c0c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c10cm14c0cm2c0cm29cm8c12c0c0c0c0c0c0c0c0,
			CxB => R_cm6c5c7cm2cm7cm2c5c0c0c0c0c0c0c0c0c0
		);

    cm14cm2cm5c0c7c0cm6cm21c0c0c0c0c0c0c0c0_c1c1cm3c2c1c13cm9cm2c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm14cm2cm5c0c7c0cm6cm21c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> c1c1cm3c2c1c13cm9cm2c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm14cm2cm5c0c7c0cm6cm21c0c0c0c0c0c0c0c0,
			CxB => R_c1c1cm3c2c1c13cm9cm2c0c0c0c0c0c0c0c0
		);

    cm28cm1cm2c1cm16cm9c5c1c0c0c0c0c0c0c0c0_cm4cm8c3c13cm3cm4c5c5c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm28cm1cm2c1cm16cm9c5c1c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> cm4cm8c3c13cm3cm4c5c5c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm28cm1cm2c1cm16cm9c5c1c0c0c0c0c0c0c0c0,
			CxB => R_cm4cm8c3c13cm3cm4c5c5c0c0c0c0c0c0c0c0
		);

    cm21c4cm3c4c0cm4c3c6c0c0c0c0c0c0c0c0_cm6c1c11cm3cm2cm4cm7c13c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm21c4cm3c4c0cm4c3c6c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> cm6c1c11cm3cm2cm4cm7c13c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm21c4cm3c4c0cm4c3c6c0c0c0c0c0c0c0c0,
			CxB => R_cm6c1c11cm3cm2cm4cm7c13c0c0c0c0c0c0c0c0
		);

    c6cm17cm25c1cm3cm2c10c1c0c0c0c0c0c0c0c0_cm2cm4c12c0cm9c12c5cm2c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6cm17cm25c1cm3cm2c10c1c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> cm2cm4c12c0cm9c12c5cm2c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm17cm25c1cm3cm2c10c1c0c0c0c0c0c0c0c0,
			CxB => R_cm2cm4c12c0cm9c12c5cm2c0c0c0c0c0c0c0c0
		);

    c6cm1c17c0c0c1cm6cm1c0c0c0c0c0c0c0c0_c7cm1c2c0cm6c14c4c9c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6cm1c17c0c0c1cm6cm1c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> c7cm1c2c0cm6c14c4c9c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm1c17c0c0c1cm6cm1c0c0c0c0c0c0c0c0,
			CxB => R_c7cm1c2c0cm6c14c4c9c0c0c0c0c0c0c0c0
		);

    cm20c2cm5cm14cm2cm2cm15cm5c0c0c0c0c0c0c0c0_c3c0cm4cm11cm4cm2cm15c1c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm20c2cm5cm14cm2cm2cm15cm5c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> c3c0cm4cm11cm4cm2cm15c1c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm20c2cm5cm14cm2cm2cm15cm5c0c0c0c0c0c0c0c0,
			CxB => R_c3c0cm4cm11cm4cm2cm15c1c0c0c0c0c0c0c0c0
		);

    c0c15cm17c31cm4cm2c5c2c0c0c0c0c0c0c0c0_c0c0cm9c0c3c0cm16cm2c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c15cm17c31cm4cm2c5c2c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> c0c0cm9c0c3c0cm16cm2c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c15cm17c31cm4cm2c5c2c0c0c0c0c0c0c0c0,
			CxB => R_c0c0cm9c0c3c0cm16cm2c0c0c0c0c0c0c0c0
		);

    c7cm1c17c3c1c0c17cm4c0c0c0c0c0c0c0c0_c13cm6c0c8c2cm2c2c1c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7cm1c17c3c1c0c17cm4c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> c13cm6c0c8c2cm2c2c1c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7cm1c17c3c1c0c17cm4c0c0c0c0c0c0c0c0,
			CxB => R_c13cm6c0c8c2cm2c2c1c0c0c0c0c0c0c0c0
		);

    c4c7c6c2c12cm7cm1cm29c0c0c0c0c0c0c0c0_c4cm6cm9c5c0cm9c6c0c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c7c6c2c12cm7cm1cm29c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> c4cm6cm9c5c0cm9c6c0c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c7c6c2c12cm7cm1cm29c0c0c0c0c0c0c0c0,
			CxB => R_c4cm6cm9c5c0cm9c6c0c0c0c0c0c0c0c0c0
		);

    c7c11c11c7cm2c4c18c8c0c0c0c0c0c0c0c0_c3cm7cm3cm6cm1cm2c5cm14c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7c11c11c7cm2c4c18c8c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> c3cm7cm3cm6cm1cm2c5cm14c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7c11c11c7cm2c4c18c8c0c0c0c0c0c0c0c0,
			CxB => R_c3cm7cm3cm6cm1cm2c5cm14c0c0c0c0c0c0c0c0
		);

    c0cm2cm12c16c7c16c18cm2c0c0c0c0c0c0c0c0_cm3cm2c1cm3c0cm10cm1c2c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm2cm12c16c7c16c18cm2c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> cm3cm2c1cm3c0cm10cm1c2c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm2cm12c16c7c16c18cm2c0c0c0c0c0c0c0c0,
			CxB => R_cm3cm2c1cm3c0cm10cm1c2c0c0c0c0c0c0c0c0
		);

    c8c4cm2cm6cm15c21c5cm10c0c0c0c0c0c0c0c0_c2c3cm7cm2cm2cm1cm13c2c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c8c4cm2cm6cm15c21c5cm10c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> c2c3cm7cm2cm2cm1cm13c2c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c8c4cm2cm6cm15c21c5cm10c0c0c0c0c0c0c0c0,
			CxB => R_c2c3cm7cm2cm2cm1cm13c2c0c0c0c0c0c0c0c0
		);

    cm1cm1cm15c15c2cm6cm5c14c0c0c0c0c0c0c0c0_cm4c1c3cm2c5c1cm14c0c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 5,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1cm1cm15c15c2cm6cm5c14c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			B	=> cm4c1c3cm2c5c1cm14c0c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm1cm15c15c2cm6cm5c14c0c0c0c0c0c0c0c0,
			CxB => R_cm4c1c3cm2c5c1cm14c0c0c0c0c0c0c0c0c0
		);




end architecture;
