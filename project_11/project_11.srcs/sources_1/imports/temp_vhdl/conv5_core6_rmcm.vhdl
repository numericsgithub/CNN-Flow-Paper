library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core6_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c0c1c5c2c2c1c1c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c1c2cm3c19c0c3c8cm10c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm20cm2c11c9cm1cm8cm5c72c0c0c0c0c0c0c0c0 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm2cm6c28cm3c4cm24c43cm6c0c0c0c0c0c0c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm2cm12c1cm2cm1cm10c54cm5c0c0c0c0c0c0c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm2c3cm7c6c0c5cm6cm4c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_cm1cm2cm2c0cm2cm4c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(2, -8)
        R_cm15c6c15cm1cm23c2cm15c5c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1c2cm3c2c7c4c4c4c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_cm6c12cm3cm29c0c3c10c0c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1c1c2c1c0cm1cm8c3c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c0c5cm1c0c2c1cm2c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c0cm1c4c4c0c2cm1c14c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0cm1c0c57c0c0c0c15c0c0c0c0c0c0c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c3c2cm2cm1c3c6cm3cm5c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_cm2cm2c5c1c0c1c17c4c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0c5cm5c1c2c8c0c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1c1c0cm10c1cm1c1cm7c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm9c1c0c2cm16cm2c2c0c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c2c1cm1c4cm3cm1cm5c2c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c14c0c10cm20c5cm1c1c2c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3c3c1cm2c2cm7cm1cm21c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c13c7cm14cm1cm23c0c8c2c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1cm5c4cm3cm4c1c7cm1c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c4c33c2c7c3c1c0c18c0c0c0c0c0c0c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0c0c3c3c1cm1c2cm2c0c0c0c0c0c0c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(2, -8)
        R_c13c1c1cm2c17c1cm4c0c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm26cm1c2c50c2c4c1cm1c0c0c0c0c0c0c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c2c0cm1c2c2c4cm3c3c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c2c0c2cm1c0c0c2c2c0c0c0c0c0c0c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(2, -8)
        R_cm7c2c5c0cm18cm2cm4cm1c0c0c0c0c0c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm12cm2c4c1cm13c0cm8c0c0c0c0c0c0c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core6_rmcm;

architecture arch of conv5_core6_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1C5C2C2C1C1C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C2CM3C19C0C3C8CM10C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM20CM2C11C9CM1CM8CM5C72C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM6C28CM3C4CM24C43CM6C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM12C1CM2CM1CM10C54CM5C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C3CM7C6C0C5CM6CM4C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM2CM2C0CM2CM4C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15C6C15CM1CM23C2CM15C5C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C2CM3C2C7C4C4C4C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C12CM3CM29C0C3C10C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1C2C1C0CM1CM8C3C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C5CM1C0C2C1CM2C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C4C4C0C2CM1C14C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C0C57C0C0C0C15C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C2CM2CM1C3C6CM3CM5C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM2C5C1C0C1C17C4C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C5CM5C1C2C8C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1C0CM10C1CM1C1CM7C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C1C0C2CM16CM2C2C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1CM1C4CM3CM1CM5C2C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14C0C10CM20C5CM1C1C2C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C3C1CM2C2CM7CM1CM21C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13C7CM14CM1CM23C0C8C2C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM5C4CM3CM4C1C7CM1C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C33C2C7C3C1C0C18C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C3C3C1CM1C2CM2C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13C1C1CM2C17C1CM4C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM26CM1C2C50C2C4C1CM1C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C0CM1C2C2C4CM3C3C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C0C2CM1C0C0C2C2C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C2C5C0CM18CM2CM4CM1C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12CM2C4C1CM13C0CM8C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal c0c1c5c2c2c1c1c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C1C5C2C2C1C1C0C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c1c2cm3c19c0c3c8cm10c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C1C2CM3C19C0C3C8CM10C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm20cm2c11c9cm1cm8cm5c72c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM20CM2C11C9CM1CM8CM5C72C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm6c28cm3c4cm24c43cm6c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM2CM6C28CM3C4CM24C43CM6C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm12c1cm2cm1cm10c54cm5c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM2CM12C1CM2CM1CM10C54CM5C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm2c3cm7c6c0c5cm6cm4c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM2C3CM7C6C0C5CM6CM4C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm2cm2c0cm2cm4c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM1CM2CM2C0CM2CM4C0C0C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm15c6c15cm1cm23c2cm15c5c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM15C6C15CM1CM23C2CM15C5C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm1c2cm3c2c7c4c4c4c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM1C2CM3C2C7C4C4C4C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm6c12cm3cm29c0c3c10c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM6C12CM3CM29C0C3C10C0C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c1c1c2c1c0cm1cm8c3c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C1C1C2C1C0CM1CM8C3C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c0c5cm1c0c2c1cm2c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C5CM1C0C2C1CM2C0C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c0cm1c4c4c0c2cm1c14c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0CM1C4C4C0C2CM1C14C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c0cm1c0c57c0c0c0c15c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0CM1C0C57C0C0C0C15C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c3c2cm2cm1c3c6cm3cm5c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C3C2CM2CM1C3C6CM3CM5C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm2c5c1c0c1c17c4c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM2CM2C5C1C0C1C17C4C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c0c0c5cm5c1c2c8c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C5CM5C1C2C8C0C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c1c1c0cm10c1cm1c1cm7c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C1C1C0CM10C1CM1C1CM7C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm9c1c0c2cm16cm2c2c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM9C1C0C2CM16CM2C2C0C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c2c1cm1c4cm3cm1cm5c2c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C2C1CM1C4CM3CM1CM5C2C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c14c0c10cm20c5cm1c1c2c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C14C0C10CM20C5CM1C1C2C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c3c3c1cm2c2cm7cm1cm21c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C3C3C1CM2C2CM7CM1CM21C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c13c7cm14cm1cm23c0c8c2c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C13C7CM14CM1CM23C0C8C2C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c1cm5c4cm3cm4c1c7cm1c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C1CM5C4CM3CM4C1C7CM1C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c4c33c2c7c3c1c0c18c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C4C33C2C7C3C1C0C18C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c0c0c3c3c1cm1c2cm2c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C3C3C1CM1C2CM2C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c13c1c1cm2c17c1cm4c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C13C1C1CM2C17C1CM4C0C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm26cm1c2c50c2c4c1cm1c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM26CM1C2C50C2C4C1CM1C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c2c0cm1c2c2c4cm3c3c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C2C0CM1C2C2C4CM3C3C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal c2c0c2cm1c0c0c2c2c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C2C0C2CM1C0C0C2C2C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm7c2c5c0cm18cm2cm4cm1c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM7C2C5C0CM18CM2CM4CM1C0C0C0C0C0C0C0C0_WEIGHT;
    -- sfix(2, -6)
    signal cm12cm2c4c1cm13c0cm8c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_CM12CM2C4C1CM13C0CM8C0C0C0C0C0C0C0C0C0_WEIGHT;
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



    WEIGHT_ROM: entity work.conv5_core6_rmcm_weightsconstant_memory
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
        
            dout1   => c0c1c5c2c2c1c1c0c0c0c0c0c0c0c0c0_weight(0), 
            dout2   => c1c2cm3c19c0c3c8cm10c0c0c0c0c0c0c0c0_weight(0), 
            dout3   => cm20cm2c11c9cm1cm8cm5c72c0c0c0c0c0c0c0c0_weight(0), 
            dout4   => cm2cm6c28cm3c4cm24c43cm6c0c0c0c0c0c0c0c0_weight(0), 
            dout5   => cm2cm12c1cm2cm1cm10c54cm5c0c0c0c0c0c0c0c0_weight(0), 
            dout6   => cm2c3cm7c6c0c5cm6cm4c0c0c0c0c0c0c0c0_weight(0), 
            dout7   => cm1cm2cm2c0cm2cm4c0c0c0c0c0c0c0c0c0c0_weight(0), 
            dout8   => cm15c6c15cm1cm23c2cm15c5c0c0c0c0c0c0c0c0_weight(0), 
            dout9   => cm1c2cm3c2c7c4c4c4c0c0c0c0c0c0c0c0_weight(0), 
            dout10   => cm6c12cm3cm29c0c3c10c0c0c0c0c0c0c0c0c0_weight(0), 
            dout11   => c1c1c2c1c0cm1cm8c3c0c0c0c0c0c0c0c0_weight(0), 
            dout12   => c0c5cm1c0c2c1cm2c0c0c0c0c0c0c0c0c0_weight(0), 
            dout13   => c0cm1c4c4c0c2cm1c14c0c0c0c0c0c0c0c0_weight(0), 
            dout14   => c0cm1c0c57c0c0c0c15c0c0c0c0c0c0c0c0_weight(0), 
            dout15   => c3c2cm2cm1c3c6cm3cm5c0c0c0c0c0c0c0c0_weight(0), 
            dout16   => cm2cm2c5c1c0c1c17c4c0c0c0c0c0c0c0c0_weight(0), 
            dout17   => c0c0c5cm5c1c2c8c0c0c0c0c0c0c0c0c0_weight(0), 
            dout18   => c1c1c0cm10c1cm1c1cm7c0c0c0c0c0c0c0c0_weight(0), 
            dout19   => cm9c1c0c2cm16cm2c2c0c0c0c0c0c0c0c0c0_weight(0), 
            dout20   => c2c1cm1c4cm3cm1cm5c2c0c0c0c0c0c0c0c0_weight(0), 
            dout21   => c14c0c10cm20c5cm1c1c2c0c0c0c0c0c0c0c0_weight(0), 
            dout22   => c3c3c1cm2c2cm7cm1cm21c0c0c0c0c0c0c0c0_weight(0), 
            dout23   => c13c7cm14cm1cm23c0c8c2c0c0c0c0c0c0c0c0_weight(0), 
            dout24   => c1cm5c4cm3cm4c1c7cm1c0c0c0c0c0c0c0c0_weight(0), 
            dout25   => c4c33c2c7c3c1c0c18c0c0c0c0c0c0c0c0_weight(0), 
            dout26   => c0c0c3c3c1cm1c2cm2c0c0c0c0c0c0c0c0_weight(0), 
            dout27   => c13c1c1cm2c17c1cm4c0c0c0c0c0c0c0c0c0_weight(0), 
            dout28   => cm26cm1c2c50c2c4c1cm1c0c0c0c0c0c0c0c0_weight(0), 
            dout29   => c2c0cm1c2c2c4cm3c3c0c0c0c0c0c0c0c0_weight(0), 
            dout30   => c2c0c2cm1c0c0c2c2c0c0c0c0c0c0c0c0_weight(0), 
            dout31   => cm7c2c5c0cm18cm2cm4cm1c0c0c0c0c0c0c0c0_weight(0), 
            dout32   => cm12cm2c4c1cm13c0cm8c0c0c0c0c0c0c0c0c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c0c1c5c2c2c1c1c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1c5c2c2c1c1c0c0c0c0c0c0c0c0c0_weight(0), c0c1c5c2c2c1c1c0c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c1c2cm3c19c0c3c8cm10c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c2cm3c19c0c3c8cm10c0c0c0c0c0c0c0c0_weight(0), c1c2cm3c19c0c3c8cm10c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm20cm2c11c9cm1cm8cm5c72c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm20cm2c11c9cm1cm8cm5c72c0c0c0c0c0c0c0c0_weight(0), cm20cm2c11c9cm1cm8cm5c72c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm2cm6c28cm3c4cm24c43cm6c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm6c28cm3c4cm24c43cm6c0c0c0c0c0c0c0c0_weight(0), cm2cm6c28cm3c4cm24c43cm6c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm2cm12c1cm2cm1cm10c54cm5c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm12c1cm2cm1cm10c54cm5c0c0c0c0c0c0c0c0_weight(0), cm2cm12c1cm2cm1cm10c54cm5c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm2c3cm7c6c0c5cm6cm4c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c3cm7c6c0c5cm6cm4c0c0c0c0c0c0c0c0_weight(0), cm2c3cm7c6c0c5cm6cm4c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm1cm2cm2c0cm2cm4c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm2cm2c0cm2cm4c0c0c0c0c0c0c0c0c0c0_weight(0), cm1cm2cm2c0cm2cm4c0c0c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm15c6c15cm1cm23c2cm15c5c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15c6c15cm1cm23c2cm15c5c0c0c0c0c0c0c0c0_weight(0), cm15c6c15cm1cm23c2cm15c5c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm1c2cm3c2c7c4c4c4c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c2cm3c2c7c4c4c4c0c0c0c0c0c0c0c0_weight(0), cm1c2cm3c2c7c4c4c4c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm6c12cm3cm29c0c3c10c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c12cm3cm29c0c3c10c0c0c0c0c0c0c0c0c0_weight(0), cm6c12cm3cm29c0c3c10c0c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c1c1c2c1c0cm1cm8c3c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1c2c1c0cm1cm8c3c0c0c0c0c0c0c0c0_weight(0), c1c1c2c1c0cm1cm8c3c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c0c5cm1c0c2c1cm2c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c5cm1c0c2c1cm2c0c0c0c0c0c0c0c0c0_weight(0), c0c5cm1c0c2c1cm2c0c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c0cm1c4c4c0c2cm1c14c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c4c4c0c2cm1c14c0c0c0c0c0c0c0c0_weight(0), c0cm1c4c4c0c2cm1c14c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c0cm1c0c57c0c0c0c15c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c0c57c0c0c0c15c0c0c0c0c0c0c0c0_weight(0), c0cm1c0c57c0c0c0c15c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c3c2cm2cm1c3c6cm3cm5c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c2cm2cm1c3c6cm3cm5c0c0c0c0c0c0c0c0_weight(0), c3c2cm2cm1c3c6cm3cm5c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm2cm2c5c1c0c1c17c4c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm2c5c1c0c1c17c4c0c0c0c0c0c0c0c0_weight(0), cm2cm2c5c1c0c1c17c4c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c0c0c5cm5c1c2c8c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c5cm5c1c2c8c0c0c0c0c0c0c0c0c0_weight(0), c0c0c5cm5c1c2c8c0c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c1c1c0cm10c1cm1c1cm7c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1c0cm10c1cm1c1cm7c0c0c0c0c0c0c0c0_weight(0), c1c1c0cm10c1cm1c1cm7c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm9c1c0c2cm16cm2c2c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c1c0c2cm16cm2c2c0c0c0c0c0c0c0c0c0_weight(0), cm9c1c0c2cm16cm2c2c0c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c2c1cm1c4cm3cm1cm5c2c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1cm1c4cm3cm1cm5c2c0c0c0c0c0c0c0c0_weight(0), c2c1cm1c4cm3cm1cm5c2c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c14c0c10cm20c5cm1c1c2c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14c0c10cm20c5cm1c1c2c0c0c0c0c0c0c0c0_weight(0), c14c0c10cm20c5cm1c1c2c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c3c3c1cm2c2cm7cm1cm21c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c3c1cm2c2cm7cm1cm21c0c0c0c0c0c0c0c0_weight(0), c3c3c1cm2c2cm7cm1cm21c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c13c7cm14cm1cm23c0c8c2c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13c7cm14cm1cm23c0c8c2c0c0c0c0c0c0c0c0_weight(0), c13c7cm14cm1cm23c0c8c2c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c1cm5c4cm3cm4c1c7cm1c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm5c4cm3cm4c1c7cm1c0c0c0c0c0c0c0c0_weight(0), c1cm5c4cm3cm4c1c7cm1c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c4c33c2c7c3c1c0c18c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c33c2c7c3c1c0c18c0c0c0c0c0c0c0c0_weight(0), c4c33c2c7c3c1c0c18c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c0c0c3c3c1cm1c2cm2c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c3c3c1cm1c2cm2c0c0c0c0c0c0c0c0_weight(0), c0c0c3c3c1cm1c2cm2c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c13c1c1cm2c17c1cm4c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13c1c1cm2c17c1cm4c0c0c0c0c0c0c0c0c0_weight(0), c13c1c1cm2c17c1cm4c0c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm26cm1c2c50c2c4c1cm1c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm26cm1c2c50c2c4c1cm1c0c0c0c0c0c0c0c0_weight(0), cm26cm1c2c50c2c4c1cm1c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c2c0cm1c2c2c4cm3c3c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c0cm1c2c2c4cm3c3c0c0c0c0c0c0c0c0_weight(0), c2c0cm1c2c2c4cm3c3c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c2c0c2cm1c0c0c2c2c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c0c2cm1c0c0c2c2c0c0c0c0c0c0c0c0_weight(0), c2c0c2cm1c0c0c2c2c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm7c2c5c0cm18cm2cm4cm1c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c2c5c0cm18cm2cm4cm1c0c0c0c0c0c0c0c0_weight(0), cm7c2c5c0cm18cm2cm4cm1c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_cm12cm2c4c1cm13c0cm8c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12cm2c4c1cm13c0cm8c0c0c0c0c0c0c0c0c0_weight(0), cm12cm2c4c1cm13c0cm8c0c0c0c0c0c0c0c0c0_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm20cm2c11c9cm1cm8cm5c72c0c0c0c0c0c0c0c0_c2c0c2cm1c0c0c2c2c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm20cm2c11c9cm1cm8cm5c72c0c0c0c0c0c0c0c0_weight(1)(8-1 downto 0),
			B	=> c2c0c2cm1c0c0c2c2c0c0c0c0c0c0c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm20cm2c11c9cm1cm8cm5c72c0c0c0c0c0c0c0c0,
			CxB => R_c2c0c2cm1c0c0c2c2c0c0c0c0c0c0c0c0
		);

    cm2cm6c28cm3c4cm24c43cm6c0c0c0c0c0c0c0c0_c0c0c3c3c1cm1c2cm2c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm2cm6c28cm3c4cm24c43cm6c0c0c0c0c0c0c0c0_weight(1)(7-1 downto 0),
			B	=> c0c0c3c3c1cm1c2cm2c0c0c0c0c0c0c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm6c28cm3c4cm24c43cm6c0c0c0c0c0c0c0c0,
			CxB => R_c0c0c3c3c1cm1c2cm2c0c0c0c0c0c0c0c0
		);

    cm2cm12c1cm2cm1cm10c54cm5c0c0c0c0c0c0c0c0_cm1cm2cm2c0cm2cm4c0c0c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm2cm12c1cm2cm1cm10c54cm5c0c0c0c0c0c0c0c0_weight(1)(7-1 downto 0),
			B	=> cm1cm2cm2c0cm2cm4c0c0c0c0c0c0c0c0c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm12c1cm2cm1cm10c54cm5c0c0c0c0c0c0c0c0,
			CxB => R_cm1cm2cm2c0cm2cm4c0c0c0c0c0c0c0c0c0c0
		);

    c0cm1c0c57c0c0c0c15c0c0c0c0c0c0c0c0_c2c0cm1c2c2c4cm3c3c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm1c0c57c0c0c0c15c0c0c0c0c0c0c0c0_weight(1)(7-1 downto 0),
			B	=> c2c0cm1c2c2c4cm3c3c0c0c0c0c0c0c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm1c0c57c0c0c0c15c0c0c0c0c0c0c0c0,
			CxB => R_c2c0cm1c2c2c4cm3c3c0c0c0c0c0c0c0c0
		);

    c4c33c2c7c3c1c0c18c0c0c0c0c0c0c0c0_c1cm5c4cm3cm4c1c7cm1c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c33c2c7c3c1c0c18c0c0c0c0c0c0c0c0_weight(1)(7-1 downto 0),
			B	=> c1cm5c4cm3cm4c1c7cm1c0c0c0c0c0c0c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c33c2c7c3c1c0c18c0c0c0c0c0c0c0c0,
			CxB => R_c1cm5c4cm3cm4c1c7cm1c0c0c0c0c0c0c0c0
		);

    cm26cm1c2c50c2c4c1cm1c0c0c0c0c0c0c0c0_c2c1cm1c4cm3cm1cm5c2c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm26cm1c2c50c2c4c1cm1c0c0c0c0c0c0c0c0_weight(1)(7-1 downto 0),
			B	=> c2c1cm1c4cm3cm1cm5c2c0c0c0c0c0c0c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm26cm1c2c50c2c4c1cm1c0c0c0c0c0c0c0c0,
			CxB => R_c2c1cm1c4cm3cm1cm5c2c0c0c0c0c0c0c0c0
		);

    c1c2cm3c19c0c3c8cm10c0c0c0c0c0c0c0c0_c3c2cm2cm1c3c6cm3cm5c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c2cm3c19c0c3c8cm10c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> c3c2cm2cm1c3c6cm3cm5c0c0c0c0c0c0c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c2cm3c19c0c3c8cm10c0c0c0c0c0c0c0c0,
			CxB => R_c3c2cm2cm1c3c6cm3cm5c0c0c0c0c0c0c0c0
		);

    cm15c6c15cm1cm23c2cm15c5c0c0c0c0c0c0c0c0_c0c5cm1c0c2c1cm2c0c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm15c6c15cm1cm23c2cm15c5c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> c0c5cm1c0c2c1cm2c0c0c0c0c0c0c0c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm15c6c15cm1cm23c2cm15c5c0c0c0c0c0c0c0c0,
			CxB => R_c0c5cm1c0c2c1cm2c0c0c0c0c0c0c0c0c0
		);

    cm6c12cm3cm29c0c3c10c0c0c0c0c0c0c0c0c0_c1c1c2c1c0cm1cm8c3c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6c12cm3cm29c0c3c10c0c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> c1c1c2c1c0cm1cm8c3c0c0c0c0c0c0c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c12cm3cm29c0c3c10c0c0c0c0c0c0c0c0c0,
			CxB => R_c1c1c2c1c0cm1cm8c3c0c0c0c0c0c0c0c0
		);

    cm2cm2c5c1c0c1c17c4c0c0c0c0c0c0c0c0_cm1c2cm3c2c7c4c4c4c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm2c5c1c0c1c17c4c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> cm1c2cm3c2c7c4c4c4c0c0c0c0c0c0c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm2c5c1c0c1c17c4c0c0c0c0c0c0c0c0,
			CxB => R_cm1c2cm3c2c7c4c4c4c0c0c0c0c0c0c0c0
		);

    c14c0c10cm20c5cm1c1c2c0c0c0c0c0c0c0c0_cm2c3cm7c6c0c5cm6cm4c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c14c0c10cm20c5cm1c1c2c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> cm2c3cm7c6c0c5cm6cm4c0c0c0c0c0c0c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c14c0c10cm20c5cm1c1c2c0c0c0c0c0c0c0c0,
			CxB => R_cm2c3cm7c6c0c5cm6cm4c0c0c0c0c0c0c0c0
		);

    c3c3c1cm2c2cm7cm1cm21c0c0c0c0c0c0c0c0_c0c1c5c2c2c1c1c0c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c3c1cm2c2cm7cm1cm21c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> c0c1c5c2c2c1c1c0c0c0c0c0c0c0c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c3c1cm2c2cm7cm1cm21c0c0c0c0c0c0c0c0,
			CxB => R_c0c1c5c2c2c1c1c0c0c0c0c0c0c0c0c0
		);

    c13c7cm14cm1cm23c0c8c2c0c0c0c0c0c0c0c0_cm12cm2c4c1cm13c0cm8c0c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c13c7cm14cm1cm23c0c8c2c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> cm12cm2c4c1cm13c0cm8c0c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c13c7cm14cm1cm23c0c8c2c0c0c0c0c0c0c0c0,
			CxB => R_cm12cm2c4c1cm13c0cm8c0c0c0c0c0c0c0c0c0
		);

    c13c1c1cm2c17c1cm4c0c0c0c0c0c0c0c0c0_cm9c1c0c2cm16cm2c2c0c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c13c1c1cm2c17c1cm4c0c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> cm9c1c0c2cm16cm2c2c0c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c13c1c1cm2c17c1cm4c0c0c0c0c0c0c0c0c0,
			CxB => R_cm9c1c0c2cm16cm2c2c0c0c0c0c0c0c0c0c0
		);

    cm7c2c5c0cm18cm2cm4cm1c0c0c0c0c0c0c0c0_c1c1c0cm10c1cm1c1cm7c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm7c2c5c0cm18cm2cm4cm1c0c0c0c0c0c0c0c0_weight(1)(6-1 downto 0),
			B	=> c1c1c0cm10c1cm1c1cm7c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7c2c5c0cm18cm2cm4cm1c0c0c0c0c0c0c0c0,
			CxB => R_c1c1c0cm10c1cm1c1cm7c0c0c0c0c0c0c0c0
		);

    c0cm1c4c4c0c2cm1c14c0c0c0c0c0c0c0c0_c0c0c5cm5c1c2c8c0c0c0c0c0c0c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm1c4c4c0c2cm1c14c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			B	=> c0c0c5cm5c1c2c8c0c0c0c0c0c0c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm1c4c4c0c2cm1c14c0c0c0c0c0c0c0c0,
			CxB => R_c0c0c5cm5c1c2c8c0c0c0c0c0c0c0c0c0
		);




end architecture;
