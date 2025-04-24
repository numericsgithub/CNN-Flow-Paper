library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core2_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c1cm1c2cm5cm1c0c2c0c0cm1c3cm1c4c4cm4cm2 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c27c5cm5c2cm2c2c0c2c7c0cm2c1c27c1cm7cm14 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0cm4cm7c3c1cm3cm2c2c1c4cm10c2c6c2c65cm3 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm6cm6c3c1cm2c3c2c6c27c9c0cm5c0cm1cm12cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm11c1cm1cm3cm2c1c0c1c41c0c1cm2c1c3cm5cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm37cm8c2c10cm57c2c0cm12c7c3c0cm5cm3cm2cm4c2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm3c1c3c0c2c99c2cm1cm2c7c4c1c2cm4cm1cm1 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm1cm6c7cm4c0c0cm1cm1c1cm1c0c0c3c2cm11cm13 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm4c9cm11cm4c1c0c4cm1cm6c0cm3c1cm4c4cm2c1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm1cm13c4c1c11c1c1cm1c5cm1cm15c1cm3c2c2cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c6cm3c1c3cm1c3c0c1c2c3cm3c2c6cm2c1cm2 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c14c2cm3cm2c2cm1cm3c2cm7c0c27c2c7cm9c0cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c1c5cm2c1cm1cm4c1c0cm1c13c0c2cm1cm6cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm4cm1cm1cm4c2c1cm1c4c13cm1cm1cm2cm4c0c3cm6 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm3cm19c3c36c0c0cm2c10c0cm9c0cm8c5c5cm4c5 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm15c3c4c1c5c0c3c3cm6c1cm3cm2c2c5cm5cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c9c5c0c9c15cm1c0c4cm24c0c1c2c3c5cm2cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm3cm8c7c22cm1c2c0cm2c1cm3c1c2c1c4c1cm24 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c2c2cm24c19cm1c1cm1cm2cm1c8cm2c6c2cm3cm1cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1c8c5c0c1cm1c2c4c1c14c0cm4c3c0c7c1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm1cm3c12c0c0cm1cm5c0cm1cm1cm4cm1cm3c0cm7c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c4c1c13cm66cm3cm5c0c3c0c4c15cm27c3cm5c2cm5 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c0c19c1c2c3c3cm3c3cm2c0c2c25cm3c27cm8cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c18c0cm25c8c1cm3c2c1cm29c2cm7c3cm3c3c1cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm14c10c1c2c0cm6c3c2cm6c2c1c2cm3cm3cm3cm9 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1cm6c8c3c0c1c3c0c0c0c25c2c0cm6c0c8 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c4cm2cm5c1c2cm1cm2cm1c1cm1c0cm2cm6cm7c7c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_cm19cm10c25c0cm3cm3c1c0c2cm3c2cm1c1c4c4c8 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm4c0c20cm1c2c2c1c1cm3c2c5c2c3cm1c0cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c4c11c1cm3c3cm1c2cm2c1c3cm6c3cm8c11c1c1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm3cm6cm3c3c0c0c0cm2cm1cm3c5c4cm19cm1cm4cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c5cm2c12c0c1c1c0c0c2c5c1c3c9c3c4 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core2_rmcm;

architecture arch of conv5_core2_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM1C2CM5CM1C0C2C0C0CM1C3CM1C4C4CM4CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C27C5CM5C2CM2C2C0C2C7C0CM2C1C27C1CM7CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM4CM7C3C1CM3CM2C2C1C4CM10C2C6C2C65CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM6C3C1CM2C3C2C6C27C9C0CM5C0CM1CM12CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11C1CM1CM3CM2C1C0C1C41C0C1CM2C1C3CM5CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM37CM8C2C10CM57C2C0CM12C7C3C0CM5CM3CM2CM4C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C1C3C0C2C99C2CM1CM2C7C4C1C2CM4CM1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM6C7CM4C0C0CM1CM1C1CM1C0C0C3C2CM11CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C9CM11CM4C1C0C4CM1CM6C0CM3C1CM4C4CM2C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM13C4C1C11C1C1CM1C5CM1CM15C1CM3C2C2CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM3C1C3CM1C3C0C1C2C3CM3C2C6CM2C1CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14C2CM3CM2C2CM1CM3C2CM7C0C27C2C7CM9C0CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1C5CM2C1CM1CM4C1C0CM1C13C0C2CM1CM6CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM1CM1CM4C2C1CM1C4C13CM1CM1CM2CM4C0C3CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM19C3C36C0C0CM2C10C0CM9C0CM8C5C5CM4C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15C3C4C1C5C0C3C3CM6C1CM3CM2C2C5CM5CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9C5C0C9C15CM1C0C4CM24C0C1C2C3C5CM2CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM8C7C22CM1C2C0CM2C1CM3C1C2C1C4C1CM24_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C2CM24C19CM1C1CM1CM2CM1C8CM2C6C2CM3CM1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C8C5C0C1CM1C2C4C1C14C0CM4C3C0C7C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM3C12C0C0CM1CM5C0CM1CM1CM4CM1CM3C0CM7C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C1C13CM66CM3CM5C0C3C0C4C15CM27C3CM5C2CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C19C1C2C3C3CM3C3CM2C0C2C25CM3C27CM8CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C18C0CM25C8C1CM3C2C1CM29C2CM7C3CM3C3C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14C10C1C2C0CM6C3C2CM6C2C1C2CM3CM3CM3CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM6C8C3C0C1C3C0C0C0C25C2C0CM6C0C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM2CM5C1C2CM1CM2CM1C1CM1C0CM2CM6CM7C7C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM19CM10C25C0CM3CM3C1C0C2CM3C2CM1C1C4C4C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C0C20CM1C2C2C1C1CM3C2C5C2C3CM1C0CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C11C1CM3C3CM1C2CM2C1C3CM6C3CM8C11C1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM6CM3C3C0C0C0CM2CM1CM3C5C4CM19CM1CM4CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C5CM2C12C0C1C1C0C0C2C5C1C3C9C3C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal c1cm1c2cm5cm1c0c2c0c0cm1c3cm1c4c4cm4cm2_weight : PIPELINE_TYPE_FOR_C1CM1C2CM5CM1C0C2C0C0CM1C3CM1C4C4CM4CM2_WEIGHT;
    -- sfix(2, -6)
    signal c27c5cm5c2cm2c2c0c2c7c0cm2c1c27c1cm7cm14_weight : PIPELINE_TYPE_FOR_C27C5CM5C2CM2C2C0C2C7C0CM2C1C27C1CM7CM14_WEIGHT;
    -- sfix(2, -6)
    signal c0cm4cm7c3c1cm3cm2c2c1c4cm10c2c6c2c65cm3_weight : PIPELINE_TYPE_FOR_C0CM4CM7C3C1CM3CM2C2C1C4CM10C2C6C2C65CM3_WEIGHT;
    -- sfix(2, -6)
    signal cm6cm6c3c1cm2c3c2c6c27c9c0cm5c0cm1cm12cm6_weight : PIPELINE_TYPE_FOR_CM6CM6C3C1CM2C3C2C6C27C9C0CM5C0CM1CM12CM6_WEIGHT;
    -- sfix(2, -6)
    signal cm11c1cm1cm3cm2c1c0c1c41c0c1cm2c1c3cm5cm1_weight : PIPELINE_TYPE_FOR_CM11C1CM1CM3CM2C1C0C1C41C0C1CM2C1C3CM5CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm37cm8c2c10cm57c2c0cm12c7c3c0cm5cm3cm2cm4c2_weight : PIPELINE_TYPE_FOR_CM37CM8C2C10CM57C2C0CM12C7C3C0CM5CM3CM2CM4C2_WEIGHT;
    -- sfix(2, -6)
    signal cm3c1c3c0c2c99c2cm1cm2c7c4c1c2cm4cm1cm1_weight : PIPELINE_TYPE_FOR_CM3C1C3C0C2C99C2CM1CM2C7C4C1C2CM4CM1CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm6c7cm4c0c0cm1cm1c1cm1c0c0c3c2cm11cm13_weight : PIPELINE_TYPE_FOR_CM1CM6C7CM4C0C0CM1CM1C1CM1C0C0C3C2CM11CM13_WEIGHT;
    -- sfix(2, -6)
    signal cm4c9cm11cm4c1c0c4cm1cm6c0cm3c1cm4c4cm2c1_weight : PIPELINE_TYPE_FOR_CM4C9CM11CM4C1C0C4CM1CM6C0CM3C1CM4C4CM2C1_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm13c4c1c11c1c1cm1c5cm1cm15c1cm3c2c2cm1_weight : PIPELINE_TYPE_FOR_CM1CM13C4C1C11C1C1CM1C5CM1CM15C1CM3C2C2CM1_WEIGHT;
    -- sfix(2, -6)
    signal c6cm3c1c3cm1c3c0c1c2c3cm3c2c6cm2c1cm2_weight : PIPELINE_TYPE_FOR_C6CM3C1C3CM1C3C0C1C2C3CM3C2C6CM2C1CM2_WEIGHT;
    -- sfix(2, -6)
    signal c14c2cm3cm2c2cm1cm3c2cm7c0c27c2c7cm9c0cm3_weight : PIPELINE_TYPE_FOR_C14C2CM3CM2C2CM1CM3C2CM7C0C27C2C7CM9C0CM3_WEIGHT;
    -- sfix(2, -6)
    signal c0c1c5cm2c1cm1cm4c1c0cm1c13c0c2cm1cm6cm2_weight : PIPELINE_TYPE_FOR_C0C1C5CM2C1CM1CM4C1C0CM1C13C0C2CM1CM6CM2_WEIGHT;
    -- sfix(2, -6)
    signal cm4cm1cm1cm4c2c1cm1c4c13cm1cm1cm2cm4c0c3cm6_weight : PIPELINE_TYPE_FOR_CM4CM1CM1CM4C2C1CM1C4C13CM1CM1CM2CM4C0C3CM6_WEIGHT;
    -- sfix(2, -6)
    signal cm3cm19c3c36c0c0cm2c10c0cm9c0cm8c5c5cm4c5_weight : PIPELINE_TYPE_FOR_CM3CM19C3C36C0C0CM2C10C0CM9C0CM8C5C5CM4C5_WEIGHT;
    -- sfix(2, -6)
    signal cm15c3c4c1c5c0c3c3cm6c1cm3cm2c2c5cm5cm2_weight : PIPELINE_TYPE_FOR_CM15C3C4C1C5C0C3C3CM6C1CM3CM2C2C5CM5CM2_WEIGHT;
    -- sfix(2, -6)
    signal c9c5c0c9c15cm1c0c4cm24c0c1c2c3c5cm2cm1_weight : PIPELINE_TYPE_FOR_C9C5C0C9C15CM1C0C4CM24C0C1C2C3C5CM2CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm3cm8c7c22cm1c2c0cm2c1cm3c1c2c1c4c1cm24_weight : PIPELINE_TYPE_FOR_CM3CM8C7C22CM1C2C0CM2C1CM3C1C2C1C4C1CM24_WEIGHT;
    -- sfix(2, -6)
    signal c2c2cm24c19cm1c1cm1cm2cm1c8cm2c6c2cm3cm1cm1_weight : PIPELINE_TYPE_FOR_C2C2CM24C19CM1C1CM1CM2CM1C8CM2C6C2CM3CM1CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm1c8c5c0c1cm1c2c4c1c14c0cm4c3c0c7c1_weight : PIPELINE_TYPE_FOR_CM1C8C5C0C1CM1C2C4C1C14C0CM4C3C0C7C1_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm3c12c0c0cm1cm5c0cm1cm1cm4cm1cm3c0cm7c0_weight : PIPELINE_TYPE_FOR_CM1CM3C12C0C0CM1CM5C0CM1CM1CM4CM1CM3C0CM7C0_WEIGHT;
    -- sfix(2, -6)
    signal c4c1c13cm66cm3cm5c0c3c0c4c15cm27c3cm5c2cm5_weight : PIPELINE_TYPE_FOR_C4C1C13CM66CM3CM5C0C3C0C4C15CM27C3CM5C2CM5_WEIGHT;
    -- sfix(2, -6)
    signal c0c19c1c2c3c3cm3c3cm2c0c2c25cm3c27cm8cm2_weight : PIPELINE_TYPE_FOR_C0C19C1C2C3C3CM3C3CM2C0C2C25CM3C27CM8CM2_WEIGHT;
    -- sfix(2, -6)
    signal c18c0cm25c8c1cm3c2c1cm29c2cm7c3cm3c3c1cm1_weight : PIPELINE_TYPE_FOR_C18C0CM25C8C1CM3C2C1CM29C2CM7C3CM3C3C1CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm14c10c1c2c0cm6c3c2cm6c2c1c2cm3cm3cm3cm9_weight : PIPELINE_TYPE_FOR_CM14C10C1C2C0CM6C3C2CM6C2C1C2CM3CM3CM3CM9_WEIGHT;
    -- sfix(2, -6)
    signal c1cm6c8c3c0c1c3c0c0c0c25c2c0cm6c0c8_weight : PIPELINE_TYPE_FOR_C1CM6C8C3C0C1C3C0C0C0C25C2C0CM6C0C8_WEIGHT;
    -- sfix(2, -6)
    signal c4cm2cm5c1c2cm1cm2cm1c1cm1c0cm2cm6cm7c7c0_weight : PIPELINE_TYPE_FOR_C4CM2CM5C1C2CM1CM2CM1C1CM1C0CM2CM6CM7C7C0_WEIGHT;
    -- sfix(2, -6)
    signal cm19cm10c25c0cm3cm3c1c0c2cm3c2cm1c1c4c4c8_weight : PIPELINE_TYPE_FOR_CM19CM10C25C0CM3CM3C1C0C2CM3C2CM1C1C4C4C8_WEIGHT;
    -- sfix(2, -6)
    signal cm4c0c20cm1c2c2c1c1cm3c2c5c2c3cm1c0cm1_weight : PIPELINE_TYPE_FOR_CM4C0C20CM1C2C2C1C1CM3C2C5C2C3CM1C0CM1_WEIGHT;
    -- sfix(2, -6)
    signal c4c11c1cm3c3cm1c2cm2c1c3cm6c3cm8c11c1c1_weight : PIPELINE_TYPE_FOR_C4C11C1CM3C3CM1C2CM2C1C3CM6C3CM8C11C1C1_WEIGHT;
    -- sfix(2, -6)
    signal cm3cm6cm3c3c0c0c0cm2cm1cm3c5c4cm19cm1cm4cm2_weight : PIPELINE_TYPE_FOR_CM3CM6CM3C3C0C0C0CM2CM1CM3C5C4CM19CM1CM4CM2_WEIGHT;
    -- sfix(2, -6)
    signal c0c5cm2c12c0c1c1c0c0c2c5c1c3c9c3c4_weight : PIPELINE_TYPE_FOR_C0C5CM2C12C0C1C1C0C0C2C5C1C3C9C3C4_WEIGHT;
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



    WEIGHT_ROM: entity work.conv5_core2_rmcm_weightsconstant_memory
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
        
            dout1   => c1cm1c2cm5cm1c0c2c0c0cm1c3cm1c4c4cm4cm2_weight(0), 
            dout2   => c27c5cm5c2cm2c2c0c2c7c0cm2c1c27c1cm7cm14_weight(0), 
            dout3   => c0cm4cm7c3c1cm3cm2c2c1c4cm10c2c6c2c65cm3_weight(0), 
            dout4   => cm6cm6c3c1cm2c3c2c6c27c9c0cm5c0cm1cm12cm6_weight(0), 
            dout5   => cm11c1cm1cm3cm2c1c0c1c41c0c1cm2c1c3cm5cm1_weight(0), 
            dout6   => cm37cm8c2c10cm57c2c0cm12c7c3c0cm5cm3cm2cm4c2_weight(0), 
            dout7   => cm3c1c3c0c2c99c2cm1cm2c7c4c1c2cm4cm1cm1_weight(0), 
            dout8   => cm1cm6c7cm4c0c0cm1cm1c1cm1c0c0c3c2cm11cm13_weight(0), 
            dout9   => cm4c9cm11cm4c1c0c4cm1cm6c0cm3c1cm4c4cm2c1_weight(0), 
            dout10   => cm1cm13c4c1c11c1c1cm1c5cm1cm15c1cm3c2c2cm1_weight(0), 
            dout11   => c6cm3c1c3cm1c3c0c1c2c3cm3c2c6cm2c1cm2_weight(0), 
            dout12   => c14c2cm3cm2c2cm1cm3c2cm7c0c27c2c7cm9c0cm3_weight(0), 
            dout13   => c0c1c5cm2c1cm1cm4c1c0cm1c13c0c2cm1cm6cm2_weight(0), 
            dout14   => cm4cm1cm1cm4c2c1cm1c4c13cm1cm1cm2cm4c0c3cm6_weight(0), 
            dout15   => cm3cm19c3c36c0c0cm2c10c0cm9c0cm8c5c5cm4c5_weight(0), 
            dout16   => cm15c3c4c1c5c0c3c3cm6c1cm3cm2c2c5cm5cm2_weight(0), 
            dout17   => c9c5c0c9c15cm1c0c4cm24c0c1c2c3c5cm2cm1_weight(0), 
            dout18   => cm3cm8c7c22cm1c2c0cm2c1cm3c1c2c1c4c1cm24_weight(0), 
            dout19   => c2c2cm24c19cm1c1cm1cm2cm1c8cm2c6c2cm3cm1cm1_weight(0), 
            dout20   => cm1c8c5c0c1cm1c2c4c1c14c0cm4c3c0c7c1_weight(0), 
            dout21   => cm1cm3c12c0c0cm1cm5c0cm1cm1cm4cm1cm3c0cm7c0_weight(0), 
            dout22   => c4c1c13cm66cm3cm5c0c3c0c4c15cm27c3cm5c2cm5_weight(0), 
            dout23   => c0c19c1c2c3c3cm3c3cm2c0c2c25cm3c27cm8cm2_weight(0), 
            dout24   => c18c0cm25c8c1cm3c2c1cm29c2cm7c3cm3c3c1cm1_weight(0), 
            dout25   => cm14c10c1c2c0cm6c3c2cm6c2c1c2cm3cm3cm3cm9_weight(0), 
            dout26   => c1cm6c8c3c0c1c3c0c0c0c25c2c0cm6c0c8_weight(0), 
            dout27   => c4cm2cm5c1c2cm1cm2cm1c1cm1c0cm2cm6cm7c7c0_weight(0), 
            dout28   => cm19cm10c25c0cm3cm3c1c0c2cm3c2cm1c1c4c4c8_weight(0), 
            dout29   => cm4c0c20cm1c2c2c1c1cm3c2c5c2c3cm1c0cm1_weight(0), 
            dout30   => c4c11c1cm3c3cm1c2cm2c1c3cm6c3cm8c11c1c1_weight(0), 
            dout31   => cm3cm6cm3c3c0c0c0cm2cm1cm3c5c4cm19cm1cm4cm2_weight(0), 
            dout32   => c0c5cm2c12c0c1c1c0c0c2c5c1c3c9c3c4_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c1cm1c2cm5cm1c0c2c0c0cm1c3cm1c4c4cm4cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm1c2cm5cm1c0c2c0c0cm1c3cm1c4c4cm4cm2_weight(0), c1cm1c2cm5cm1c0c2c0c0cm1c3cm1c4c4cm4cm2_weight(1));
    PL_STEP_0_for_c27c5cm5c2cm2c2c0c2c7c0cm2c1c27c1cm7cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c27c5cm5c2cm2c2c0c2c7c0cm2c1c27c1cm7cm14_weight(0), c27c5cm5c2cm2c2c0c2c7c0cm2c1c27c1cm7cm14_weight(1));
    PL_STEP_0_for_c0cm4cm7c3c1cm3cm2c2c1c4cm10c2c6c2c65cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm4cm7c3c1cm3cm2c2c1c4cm10c2c6c2c65cm3_weight(0), c0cm4cm7c3c1cm3cm2c2c1c4cm10c2c6c2c65cm3_weight(1));
    PL_STEP_0_for_cm6cm6c3c1cm2c3c2c6c27c9c0cm5c0cm1cm12cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm6c3c1cm2c3c2c6c27c9c0cm5c0cm1cm12cm6_weight(0), cm6cm6c3c1cm2c3c2c6c27c9c0cm5c0cm1cm12cm6_weight(1));
    PL_STEP_0_for_cm11c1cm1cm3cm2c1c0c1c41c0c1cm2c1c3cm5cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11c1cm1cm3cm2c1c0c1c41c0c1cm2c1c3cm5cm1_weight(0), cm11c1cm1cm3cm2c1c0c1c41c0c1cm2c1c3cm5cm1_weight(1));
    PL_STEP_0_for_cm37cm8c2c10cm57c2c0cm12c7c3c0cm5cm3cm2cm4c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm37cm8c2c10cm57c2c0cm12c7c3c0cm5cm3cm2cm4c2_weight(0), cm37cm8c2c10cm57c2c0cm12c7c3c0cm5cm3cm2cm4c2_weight(1));
    PL_STEP_0_for_cm3c1c3c0c2c99c2cm1cm2c7c4c1c2cm4cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c1c3c0c2c99c2cm1cm2c7c4c1c2cm4cm1cm1_weight(0), cm3c1c3c0c2c99c2cm1cm2c7c4c1c2cm4cm1cm1_weight(1));
    PL_STEP_0_for_cm1cm6c7cm4c0c0cm1cm1c1cm1c0c0c3c2cm11cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm6c7cm4c0c0cm1cm1c1cm1c0c0c3c2cm11cm13_weight(0), cm1cm6c7cm4c0c0cm1cm1c1cm1c0c0c3c2cm11cm13_weight(1));
    PL_STEP_0_for_cm4c9cm11cm4c1c0c4cm1cm6c0cm3c1cm4c4cm2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c9cm11cm4c1c0c4cm1cm6c0cm3c1cm4c4cm2c1_weight(0), cm4c9cm11cm4c1c0c4cm1cm6c0cm3c1cm4c4cm2c1_weight(1));
    PL_STEP_0_for_cm1cm13c4c1c11c1c1cm1c5cm1cm15c1cm3c2c2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm13c4c1c11c1c1cm1c5cm1cm15c1cm3c2c2cm1_weight(0), cm1cm13c4c1c11c1c1cm1c5cm1cm15c1cm3c2c2cm1_weight(1));
    PL_STEP_0_for_c6cm3c1c3cm1c3c0c1c2c3cm3c2c6cm2c1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm3c1c3cm1c3c0c1c2c3cm3c2c6cm2c1cm2_weight(0), c6cm3c1c3cm1c3c0c1c2c3cm3c2c6cm2c1cm2_weight(1));
    PL_STEP_0_for_c14c2cm3cm2c2cm1cm3c2cm7c0c27c2c7cm9c0cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14c2cm3cm2c2cm1cm3c2cm7c0c27c2c7cm9c0cm3_weight(0), c14c2cm3cm2c2cm1cm3c2cm7c0c27c2c7cm9c0cm3_weight(1));
    PL_STEP_0_for_c0c1c5cm2c1cm1cm4c1c0cm1c13c0c2cm1cm6cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1c5cm2c1cm1cm4c1c0cm1c13c0c2cm1cm6cm2_weight(0), c0c1c5cm2c1cm1cm4c1c0cm1c13c0c2cm1cm6cm2_weight(1));
    PL_STEP_0_for_cm4cm1cm1cm4c2c1cm1c4c13cm1cm1cm2cm4c0c3cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm1cm1cm4c2c1cm1c4c13cm1cm1cm2cm4c0c3cm6_weight(0), cm4cm1cm1cm4c2c1cm1c4c13cm1cm1cm2cm4c0c3cm6_weight(1));
    PL_STEP_0_for_cm3cm19c3c36c0c0cm2c10c0cm9c0cm8c5c5cm4c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm19c3c36c0c0cm2c10c0cm9c0cm8c5c5cm4c5_weight(0), cm3cm19c3c36c0c0cm2c10c0cm9c0cm8c5c5cm4c5_weight(1));
    PL_STEP_0_for_cm15c3c4c1c5c0c3c3cm6c1cm3cm2c2c5cm5cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15c3c4c1c5c0c3c3cm6c1cm3cm2c2c5cm5cm2_weight(0), cm15c3c4c1c5c0c3c3cm6c1cm3cm2c2c5cm5cm2_weight(1));
    PL_STEP_0_for_c9c5c0c9c15cm1c0c4cm24c0c1c2c3c5cm2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9c5c0c9c15cm1c0c4cm24c0c1c2c3c5cm2cm1_weight(0), c9c5c0c9c15cm1c0c4cm24c0c1c2c3c5cm2cm1_weight(1));
    PL_STEP_0_for_cm3cm8c7c22cm1c2c0cm2c1cm3c1c2c1c4c1cm24_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm8c7c22cm1c2c0cm2c1cm3c1c2c1c4c1cm24_weight(0), cm3cm8c7c22cm1c2c0cm2c1cm3c1c2c1c4c1cm24_weight(1));
    PL_STEP_0_for_c2c2cm24c19cm1c1cm1cm2cm1c8cm2c6c2cm3cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c2cm24c19cm1c1cm1cm2cm1c8cm2c6c2cm3cm1cm1_weight(0), c2c2cm24c19cm1c1cm1cm2cm1c8cm2c6c2cm3cm1cm1_weight(1));
    PL_STEP_0_for_cm1c8c5c0c1cm1c2c4c1c14c0cm4c3c0c7c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c8c5c0c1cm1c2c4c1c14c0cm4c3c0c7c1_weight(0), cm1c8c5c0c1cm1c2c4c1c14c0cm4c3c0c7c1_weight(1));
    PL_STEP_0_for_cm1cm3c12c0c0cm1cm5c0cm1cm1cm4cm1cm3c0cm7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm3c12c0c0cm1cm5c0cm1cm1cm4cm1cm3c0cm7c0_weight(0), cm1cm3c12c0c0cm1cm5c0cm1cm1cm4cm1cm3c0cm7c0_weight(1));
    PL_STEP_0_for_c4c1c13cm66cm3cm5c0c3c0c4c15cm27c3cm5c2cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c1c13cm66cm3cm5c0c3c0c4c15cm27c3cm5c2cm5_weight(0), c4c1c13cm66cm3cm5c0c3c0c4c15cm27c3cm5c2cm5_weight(1));
    PL_STEP_0_for_c0c19c1c2c3c3cm3c3cm2c0c2c25cm3c27cm8cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c19c1c2c3c3cm3c3cm2c0c2c25cm3c27cm8cm2_weight(0), c0c19c1c2c3c3cm3c3cm2c0c2c25cm3c27cm8cm2_weight(1));
    PL_STEP_0_for_c18c0cm25c8c1cm3c2c1cm29c2cm7c3cm3c3c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c18c0cm25c8c1cm3c2c1cm29c2cm7c3cm3c3c1cm1_weight(0), c18c0cm25c8c1cm3c2c1cm29c2cm7c3cm3c3c1cm1_weight(1));
    PL_STEP_0_for_cm14c10c1c2c0cm6c3c2cm6c2c1c2cm3cm3cm3cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14c10c1c2c0cm6c3c2cm6c2c1c2cm3cm3cm3cm9_weight(0), cm14c10c1c2c0cm6c3c2cm6c2c1c2cm3cm3cm3cm9_weight(1));
    PL_STEP_0_for_c1cm6c8c3c0c1c3c0c0c0c25c2c0cm6c0c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm6c8c3c0c1c3c0c0c0c25c2c0cm6c0c8_weight(0), c1cm6c8c3c0c1c3c0c0c0c25c2c0cm6c0c8_weight(1));
    PL_STEP_0_for_c4cm2cm5c1c2cm1cm2cm1c1cm1c0cm2cm6cm7c7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm2cm5c1c2cm1cm2cm1c1cm1c0cm2cm6cm7c7c0_weight(0), c4cm2cm5c1c2cm1cm2cm1c1cm1c0cm2cm6cm7c7c0_weight(1));
    PL_STEP_0_for_cm19cm10c25c0cm3cm3c1c0c2cm3c2cm1c1c4c4c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm19cm10c25c0cm3cm3c1c0c2cm3c2cm1c1c4c4c8_weight(0), cm19cm10c25c0cm3cm3c1c0c2cm3c2cm1c1c4c4c8_weight(1));
    PL_STEP_0_for_cm4c0c20cm1c2c2c1c1cm3c2c5c2c3cm1c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c0c20cm1c2c2c1c1cm3c2c5c2c3cm1c0cm1_weight(0), cm4c0c20cm1c2c2c1c1cm3c2c5c2c3cm1c0cm1_weight(1));
    PL_STEP_0_for_c4c11c1cm3c3cm1c2cm2c1c3cm6c3cm8c11c1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c11c1cm3c3cm1c2cm2c1c3cm6c3cm8c11c1c1_weight(0), c4c11c1cm3c3cm1c2cm2c1c3cm6c3cm8c11c1c1_weight(1));
    PL_STEP_0_for_cm3cm6cm3c3c0c0c0cm2cm1cm3c5c4cm19cm1cm4cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm6cm3c3c0c0c0cm2cm1cm3c5c4cm19cm1cm4cm2_weight(0), cm3cm6cm3c3c0c0c0cm2cm1cm3c5c4cm19cm1cm4cm2_weight(1));
    PL_STEP_0_for_c0c5cm2c12c0c1c1c0c0c2c5c1c3c9c3c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c5cm2c12c0c1c1c0c0c2c5c1c3c9c3c4_weight(0), c0c5cm2c12c0c1c1c0c0c2c5c1c3c9c3c4_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c0cm4cm7c3c1cm3cm2c2c1c4cm10c2c6c2c65cm3_c4cm2cm5c1c2cm1cm2cm1c1cm1c0cm2cm6cm7c7c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm4cm7c3c1cm3cm2c2c1c4cm10c2c6c2c65cm3_weight(1)(8-1 downto 0),
			B	=> c4cm2cm5c1c2cm1cm2cm1c1cm1c0cm2cm6cm7c7c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm4cm7c3c1cm3cm2c2c1c4cm10c2c6c2c65cm3,
			CxB => R_c4cm2cm5c1c2cm1cm2cm1c1cm1c0cm2cm6cm7c7c0
		);

    cm3c1c3c0c2c99c2cm1cm2c7c4c1c2cm4cm1cm1_c6cm3c1c3cm1c3c0c1c2c3cm3c2c6cm2c1cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c1c3c0c2c99c2cm1cm2c7c4c1c2cm4cm1cm1_weight(1)(8-1 downto 0),
			B	=> c6cm3c1c3cm1c3c0c1c2c3cm3c2c6cm2c1cm2_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c1c3c0c2c99c2cm1cm2c7c4c1c2cm4cm1cm1,
			CxB => R_c6cm3c1c3cm1c3c0c1c2c3cm3c2c6cm2c1cm2
		);

    c4c1c13cm66cm3cm5c0c3c0c4c15cm27c3cm5c2cm5_c1cm1c2cm5cm1c0c2c0c0cm1c3cm1c4c4cm4cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c1c13cm66cm3cm5c0c3c0c4c15cm27c3cm5c2cm5_weight(1)(8-1 downto 0),
			B	=> c1cm1c2cm5cm1c0c2c0c0cm1c3cm1c4c4cm4cm2_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c1c13cm66cm3cm5c0c3c0c4c15cm27c3cm5c2cm5,
			CxB => R_c1cm1c2cm5cm1c0c2c0c0cm1c3cm1c4c4cm4cm2
		);

    cm11c1cm1cm3cm2c1c0c1c41c0c1cm2c1c3cm5cm1_c0c5cm2c12c0c1c1c0c0c2c5c1c3c9c3c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm11c1cm1cm3cm2c1c0c1c41c0c1cm2c1c3cm5cm1_weight(1)(7-1 downto 0),
			B	=> c0c5cm2c12c0c1c1c0c0c2c5c1c3c9c3c4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm11c1cm1cm3cm2c1c0c1c41c0c1cm2c1c3cm5cm1,
			CxB => R_c0c5cm2c12c0c1c1c0c0c2c5c1c3c9c3c4
		);

    cm37cm8c2c10cm57c2c0cm12c7c3c0cm5cm3cm2cm4c2_c4c11c1cm3c3cm1c2cm2c1c3cm6c3cm8c11c1c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm37cm8c2c10cm57c2c0cm12c7c3c0cm5cm3cm2cm4c2_weight(1)(7-1 downto 0),
			B	=> c4c11c1cm3c3cm1c2cm2c1c3cm6c3cm8c11c1c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm37cm8c2c10cm57c2c0cm12c7c3c0cm5cm3cm2cm4c2,
			CxB => R_c4c11c1cm3c3cm1c2cm2c1c3cm6c3cm8c11c1c1
		);

    cm3cm19c3c36c0c0cm2c10c0cm9c0cm8c5c5cm4c5_cm14c10c1c2c0cm6c3c2cm6c2c1c2cm3cm3cm3cm9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3cm19c3c36c0c0cm2c10c0cm9c0cm8c5c5cm4c5_weight(1)(7-1 downto 0),
			B	=> cm14c10c1c2c0cm6c3c2cm6c2c1c2cm3cm3cm3cm9_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3cm19c3c36c0c0cm2c10c0cm9c0cm8c5c5cm4c5,
			CxB => R_cm14c10c1c2c0cm6c3c2cm6c2c1c2cm3cm3cm3cm9
		);

    c27c5cm5c2cm2c2c0c2c7c0cm2c1c27c1cm7cm14_cm1cm3c12c0c0cm1cm5c0cm1cm1cm4cm1cm3c0cm7c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c27c5cm5c2cm2c2c0c2c7c0cm2c1c27c1cm7cm14_weight(1)(6-1 downto 0),
			B	=> cm1cm3c12c0c0cm1cm5c0cm1cm1cm4cm1cm3c0cm7c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c27c5cm5c2cm2c2c0c2c7c0cm2c1c27c1cm7cm14,
			CxB => R_cm1cm3c12c0c0cm1cm5c0cm1cm1cm4cm1cm3c0cm7c0
		);

    cm6cm6c3c1cm2c3c2c6c27c9c0cm5c0cm1cm12cm6_cm1c8c5c0c1cm1c2c4c1c14c0cm4c3c0c7c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6cm6c3c1cm2c3c2c6c27c9c0cm5c0cm1cm12cm6_weight(1)(6-1 downto 0),
			B	=> cm1c8c5c0c1cm1c2c4c1c14c0cm4c3c0c7c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6cm6c3c1cm2c3c2c6c27c9c0cm5c0cm1cm12cm6,
			CxB => R_cm1c8c5c0c1cm1c2c4c1c14c0cm4c3c0c7c1
		);

    c14c2cm3cm2c2cm1cm3c2cm7c0c27c2c7cm9c0cm3_cm15c3c4c1c5c0c3c3cm6c1cm3cm2c2c5cm5cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c14c2cm3cm2c2cm1cm3c2cm7c0c27c2c7cm9c0cm3_weight(1)(6-1 downto 0),
			B	=> cm15c3c4c1c5c0c3c3cm6c1cm3cm2c2c5cm5cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c14c2cm3cm2c2cm1cm3c2cm7c0c27c2c7cm9c0cm3,
			CxB => R_cm15c3c4c1c5c0c3c3cm6c1cm3cm2c2c5cm5cm2
		);

    c9c5c0c9c15cm1c0c4cm24c0c1c2c3c5cm2cm1_cm4cm1cm1cm4c2c1cm1c4c13cm1cm1cm2cm4c0c3cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c9c5c0c9c15cm1c0c4cm24c0c1c2c3c5cm2cm1_weight(1)(6-1 downto 0),
			B	=> cm4cm1cm1cm4c2c1cm1c4c13cm1cm1cm2cm4c0c3cm6_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9c5c0c9c15cm1c0c4cm24c0c1c2c3c5cm2cm1,
			CxB => R_cm4cm1cm1cm4c2c1cm1c4c13cm1cm1cm2cm4c0c3cm6
		);

    cm3cm8c7c22cm1c2c0cm2c1cm3c1c2c1c4c1cm24_c0c1c5cm2c1cm1cm4c1c0cm1c13c0c2cm1cm6cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3cm8c7c22cm1c2c0cm2c1cm3c1c2c1c4c1cm24_weight(1)(6-1 downto 0),
			B	=> c0c1c5cm2c1cm1cm4c1c0cm1c13c0c2cm1cm6cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3cm8c7c22cm1c2c0cm2c1cm3c1c2c1c4c1cm24,
			CxB => R_c0c1c5cm2c1cm1cm4c1c0cm1c13c0c2cm1cm6cm2
		);

    c2c2cm24c19cm1c1cm1cm2cm1c8cm2c6c2cm3cm1cm1_cm1cm13c4c1c11c1c1cm1c5cm1cm15c1cm3c2c2cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c2cm24c19cm1c1cm1cm2cm1c8cm2c6c2cm3cm1cm1_weight(1)(6-1 downto 0),
			B	=> cm1cm13c4c1c11c1c1cm1c5cm1cm15c1cm3c2c2cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c2cm24c19cm1c1cm1cm2cm1c8cm2c6c2cm3cm1cm1,
			CxB => R_cm1cm13c4c1c11c1c1cm1c5cm1cm15c1cm3c2c2cm1
		);

    c0c19c1c2c3c3cm3c3cm2c0c2c25cm3c27cm8cm2_cm4c9cm11cm4c1c0c4cm1cm6c0cm3c1cm4c4cm2c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c19c1c2c3c3cm3c3cm2c0c2c25cm3c27cm8cm2_weight(1)(6-1 downto 0),
			B	=> cm4c9cm11cm4c1c0c4cm1cm6c0cm3c1cm4c4cm2c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c19c1c2c3c3cm3c3cm2c0c2c25cm3c27cm8cm2,
			CxB => R_cm4c9cm11cm4c1c0c4cm1cm6c0cm3c1cm4c4cm2c1
		);

    c18c0cm25c8c1cm3c2c1cm29c2cm7c3cm3c3c1cm1_cm1cm6c7cm4c0c0cm1cm1c1cm1c0c0c3c2cm11cm13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c18c0cm25c8c1cm3c2c1cm29c2cm7c3cm3c3c1cm1_weight(1)(6-1 downto 0),
			B	=> cm1cm6c7cm4c0c0cm1cm1c1cm1c0c0c3c2cm11cm13_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c18c0cm25c8c1cm3c2c1cm29c2cm7c3cm3c3c1cm1,
			CxB => R_cm1cm6c7cm4c0c0cm1cm1c1cm1c0c0c3c2cm11cm13
		);

    c1cm6c8c3c0c1c3c0c0c0c25c2c0cm6c0c8_cm3cm6cm3c3c0c0c0cm2cm1cm3c5c4cm19cm1cm4cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm6c8c3c0c1c3c0c0c0c25c2c0cm6c0c8_weight(1)(6-1 downto 0),
			B	=> cm3cm6cm3c3c0c0c0cm2cm1cm3c5c4cm19cm1cm4cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm6c8c3c0c1c3c0c0c0c25c2c0cm6c0c8,
			CxB => R_cm3cm6cm3c3c0c0c0cm2cm1cm3c5c4cm19cm1cm4cm2
		);

    cm19cm10c25c0cm3cm3c1c0c2cm3c2cm1c1c4c4c8_cm4c0c20cm1c2c2c1c1cm3c2c5c2c3cm1c0cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm19cm10c25c0cm3cm3c1c0c2cm3c2cm1c1c4c4c8_weight(1)(6-1 downto 0),
			B	=> cm4c0c20cm1c2c2c1c1cm3c2c5c2c3cm1c0cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm19cm10c25c0cm3cm3c1c0c2cm3c2cm1c1c4c4c8,
			CxB => R_cm4c0c20cm1c2c2c1c1cm3c2c5c2c3cm1c0cm1
		);




end architecture;
