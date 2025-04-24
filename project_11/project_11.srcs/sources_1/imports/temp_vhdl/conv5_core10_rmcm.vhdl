library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core10_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm1cm16c21c1c3c0c4c1c0c0c0c0c3c0cm4c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1c9c0c0cm6c2cm15cm2c0c0c0c0cm8c5cm14c7 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c2c15c8c1c1cm3cm6cm43c0c0c0c0c4c0c1cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm2c6c1cm9c2cm7c7cm1c0c0c0c0c1cm3c13cm35 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1c0cm4c0c0cm2cm29cm2c0c0c0c0c1c0c2cm26 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c10c11cm1cm21cm3c3c3cm3c0c0c0c0c1c2c3c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1cm9c1c11cm3cm1c6c1c0c0c0c0c2cm2cm13c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c1c3cm2c22c6cm11c5c0c0c0c0cm1c1c9cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1cm3c7cm11cm7c4c9c3c0c0c0c0c80c1c9c0 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm11c1cm4c1c0c5c1c9c0c0c0c0c1c26c7c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1cm49c6c1c0cm2c1c6c0c0c0c0cm3cm2cm4c29 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm4c0c1c28c3cm23c0c0c0c0c0c0c2cm3c3cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1cm2c14c0c1c4cm4cm3c0c0c0c0c2cm2c6c2 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm3c0c2cm2c2cm1c4c11c0c0c0c0cm3cm10cm1c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1cm2c54c7c5c2c1cm2c0c0c0c0cm6c7cm1cm9 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0c2c1c3c0cm4cm55c3c0c0c0c0c4c0c2c22 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c9c0c0c1c1c0c2cm1c0c0c0c0c8c3c35cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm3c7c0c2c2c7cm1c0c0c0c0c0c1c2cm1c10 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1c1cm1cm2c5cm3cm1cm5c0c0c0c0cm2cm4c9cm9 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0cm2c2cm40cm1c1cm7c1c0c0c0c0c2c2c3c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1c0c3c0c10c0c9c3c0c0c0c0cm1cm1cm4c3 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c46cm4c0c4c2c12c2c9c0c0c0c0c0c8c0c8 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm2c4c0c2c8c0c4c1c0c0c0c0cm4cm5c1c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c5cm1c2c0cm2cm2cm3c0c0c0c0cm2cm1c7cm1 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_cm2cm1cm19cm3c6cm3c1c0c0c0c0c0c4c2c0cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0cm1c0c0cm4cm3c1c0c0c0c0c0c5c2cm1c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_cm2cm4c5cm1cm45c0cm7cm4c0c0c0c0c1c2c1c47 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c9cm4c0cm2cm5c0c1cm5c0c0c0c0cm1c6c0c1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c11cm5c5c6c3c1cm8c3c0c0c0c0c1cm1cm5cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c12c0c0cm18cm1c3c0cm3c0c0c0c0c3cm1c3cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1c1c47c1cm25c6cm1cm1c0c0c0c0c30cm25cm1cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0cm1c8c0c0c0c5c2c0c0c0c0c1c2c2cm3 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core10_rmcm;

architecture arch of conv5_core10_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM16C21C1C3C0C4C1C0C0C0C0C3C0CM4C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C9C0C0CM6C2CM15CM2C0C0C0C0CM8C5CM14C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C15C8C1C1CM3CM6CM43C0C0C0C0C4C0C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C6C1CM9C2CM7C7CM1C0C0C0C0C1CM3C13CM35_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0CM4C0C0CM2CM29CM2C0C0C0C0C1C0C2CM26_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10C11CM1CM21CM3C3C3CM3C0C0C0C0C1C2C3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM9C1C11CM3CM1C6C1C0C0C0C0C2CM2CM13C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1C3CM2C22C6CM11C5C0C0C0C0CM1C1C9CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM3C7CM11CM7C4C9C3C0C0C0C0C80C1C9C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11C1CM4C1C0C5C1C9C0C0C0C0C1C26C7C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM49C6C1C0CM2C1C6C0C0C0C0CM3CM2CM4C29_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C0C1C28C3CM23C0C0C0C0C0C0C2CM3C3CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM2C14C0C1C4CM4CM3C0C0C0C0C2CM2C6C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C0C2CM2C2CM1C4C11C0C0C0C0CM3CM10CM1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM2C54C7C5C2C1CM2C0C0C0C0CM6C7CM1CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C2C1C3C0CM4CM55C3C0C0C0C0C4C0C2C22_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9C0C0C1C1C0C2CM1C0C0C0C0C8C3C35CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C7C0C2C2C7CM1C0C0C0C0C0C1C2CM1C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1CM1CM2C5CM3CM1CM5C0C0C0C0CM2CM4C9CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2C2CM40CM1C1CM7C1C0C0C0C0C2C2C3C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0C3C0C10C0C9C3C0C0C0C0CM1CM1CM4C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C46CM4C0C4C2C12C2C9C0C0C0C0C0C8C0C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C4C0C2C8C0C4C1C0C0C0C0CM4CM5C1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C5CM1C2C0CM2CM2CM3C0C0C0C0CM2CM1C7CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM1CM19CM3C6CM3C1C0C0C0C0C0C4C2C0CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C0C0CM4CM3C1C0C0C0C0C0C5C2CM1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM4C5CM1CM45C0CM7CM4C0C0C0C0C1C2C1C47_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9CM4C0CM2CM5C0C1CM5C0C0C0C0CM1C6C0C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11CM5C5C6C3C1CM8C3C0C0C0C0C1CM1CM5CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12C0C0CM18CM1C3C0CM3C0C0C0C0C3CM1C3CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1C47C1CM25C6CM1CM1C0C0C0C0C30CM25CM1CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C8C0C0C0C5C2C0C0C0C0C1C2C2CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal cm1cm16c21c1c3c0c4c1c0c0c0c0c3c0cm4c2_weight : PIPELINE_TYPE_FOR_CM1CM16C21C1C3C0C4C1C0C0C0C0C3C0CM4C2_WEIGHT;
    -- sfix(2, -6)
    signal c1c9c0c0cm6c2cm15cm2c0c0c0c0cm8c5cm14c7_weight : PIPELINE_TYPE_FOR_C1C9C0C0CM6C2CM15CM2C0C0C0C0CM8C5CM14C7_WEIGHT;
    -- sfix(2, -6)
    signal c2c15c8c1c1cm3cm6cm43c0c0c0c0c4c0c1cm1_weight : PIPELINE_TYPE_FOR_C2C15C8C1C1CM3CM6CM43C0C0C0C0C4C0C1CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm2c6c1cm9c2cm7c7cm1c0c0c0c0c1cm3c13cm35_weight : PIPELINE_TYPE_FOR_CM2C6C1CM9C2CM7C7CM1C0C0C0C0C1CM3C13CM35_WEIGHT;
    -- sfix(2, -6)
    signal c1c0cm4c0c0cm2cm29cm2c0c0c0c0c1c0c2cm26_weight : PIPELINE_TYPE_FOR_C1C0CM4C0C0CM2CM29CM2C0C0C0C0C1C0C2CM26_WEIGHT;
    -- sfix(2, -6)
    signal c10c11cm1cm21cm3c3c3cm3c0c0c0c0c1c2c3c0_weight : PIPELINE_TYPE_FOR_C10C11CM1CM21CM3C3C3CM3C0C0C0C0C1C2C3C0_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm9c1c11cm3cm1c6c1c0c0c0c0c2cm2cm13c0_weight : PIPELINE_TYPE_FOR_CM1CM9C1C11CM3CM1C6C1C0C0C0C0C2CM2CM13C0_WEIGHT;
    -- sfix(2, -6)
    signal c0c1c3cm2c22c6cm11c5c0c0c0c0cm1c1c9cm2_weight : PIPELINE_TYPE_FOR_C0C1C3CM2C22C6CM11C5C0C0C0C0CM1C1C9CM2_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm3c7cm11cm7c4c9c3c0c0c0c0c80c1c9c0_weight : PIPELINE_TYPE_FOR_CM1CM3C7CM11CM7C4C9C3C0C0C0C0C80C1C9C0_WEIGHT;
    -- sfix(2, -6)
    signal cm11c1cm4c1c0c5c1c9c0c0c0c0c1c26c7c1_weight : PIPELINE_TYPE_FOR_CM11C1CM4C1C0C5C1C9C0C0C0C0C1C26C7C1_WEIGHT;
    -- sfix(2, -6)
    signal c1cm49c6c1c0cm2c1c6c0c0c0c0cm3cm2cm4c29_weight : PIPELINE_TYPE_FOR_C1CM49C6C1C0CM2C1C6C0C0C0C0CM3CM2CM4C29_WEIGHT;
    -- sfix(2, -6)
    signal cm4c0c1c28c3cm23c0c0c0c0c0c0c2cm3c3cm2_weight : PIPELINE_TYPE_FOR_CM4C0C1C28C3CM23C0C0C0C0C0C0C2CM3C3CM2_WEIGHT;
    -- sfix(2, -6)
    signal c1cm2c14c0c1c4cm4cm3c0c0c0c0c2cm2c6c2_weight : PIPELINE_TYPE_FOR_C1CM2C14C0C1C4CM4CM3C0C0C0C0C2CM2C6C2_WEIGHT;
    -- sfix(2, -6)
    signal cm3c0c2cm2c2cm1c4c11c0c0c0c0cm3cm10cm1c0_weight : PIPELINE_TYPE_FOR_CM3C0C2CM2C2CM1C4C11C0C0C0C0CM3CM10CM1C0_WEIGHT;
    -- sfix(2, -6)
    signal c1cm2c54c7c5c2c1cm2c0c0c0c0cm6c7cm1cm9_weight : PIPELINE_TYPE_FOR_C1CM2C54C7C5C2C1CM2C0C0C0C0CM6C7CM1CM9_WEIGHT;
    -- sfix(2, -6)
    signal c0c2c1c3c0cm4cm55c3c0c0c0c0c4c0c2c22_weight : PIPELINE_TYPE_FOR_C0C2C1C3C0CM4CM55C3C0C0C0C0C4C0C2C22_WEIGHT;
    -- sfix(2, -6)
    signal c9c0c0c1c1c0c2cm1c0c0c0c0c8c3c35cm5_weight : PIPELINE_TYPE_FOR_C9C0C0C1C1C0C2CM1C0C0C0C0C8C3C35CM5_WEIGHT;
    -- sfix(2, -6)
    signal cm3c7c0c2c2c7cm1c0c0c0c0c0c1c2cm1c10_weight : PIPELINE_TYPE_FOR_CM3C7C0C2C2C7CM1C0C0C0C0C0C1C2CM1C10_WEIGHT;
    -- sfix(2, -6)
    signal c1c1cm1cm2c5cm3cm1cm5c0c0c0c0cm2cm4c9cm9_weight : PIPELINE_TYPE_FOR_C1C1CM1CM2C5CM3CM1CM5C0C0C0C0CM2CM4C9CM9_WEIGHT;
    -- sfix(2, -6)
    signal c0cm2c2cm40cm1c1cm7c1c0c0c0c0c2c2c3c1_weight : PIPELINE_TYPE_FOR_C0CM2C2CM40CM1C1CM7C1C0C0C0C0C2C2C3C1_WEIGHT;
    -- sfix(2, -6)
    signal c1c0c3c0c10c0c9c3c0c0c0c0cm1cm1cm4c3_weight : PIPELINE_TYPE_FOR_C1C0C3C0C10C0C9C3C0C0C0C0CM1CM1CM4C3_WEIGHT;
    -- sfix(2, -6)
    signal c46cm4c0c4c2c12c2c9c0c0c0c0c0c8c0c8_weight : PIPELINE_TYPE_FOR_C46CM4C0C4C2C12C2C9C0C0C0C0C0C8C0C8_WEIGHT;
    -- sfix(2, -6)
    signal cm2c4c0c2c8c0c4c1c0c0c0c0cm4cm5c1c0_weight : PIPELINE_TYPE_FOR_CM2C4C0C2C8C0C4C1C0C0C0C0CM4CM5C1C0_WEIGHT;
    -- sfix(2, -6)
    signal c0c5cm1c2c0cm2cm2cm3c0c0c0c0cm2cm1c7cm1_weight : PIPELINE_TYPE_FOR_C0C5CM1C2C0CM2CM2CM3C0C0C0C0CM2CM1C7CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm1cm19cm3c6cm3c1c0c0c0c0c0c4c2c0cm5_weight : PIPELINE_TYPE_FOR_CM2CM1CM19CM3C6CM3C1C0C0C0C0C0C4C2C0CM5_WEIGHT;
    -- sfix(2, -6)
    signal c0cm1c0c0cm4cm3c1c0c0c0c0c0c5c2cm1c0_weight : PIPELINE_TYPE_FOR_C0CM1C0C0CM4CM3C1C0C0C0C0C0C5C2CM1C0_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm4c5cm1cm45c0cm7cm4c0c0c0c0c1c2c1c47_weight : PIPELINE_TYPE_FOR_CM2CM4C5CM1CM45C0CM7CM4C0C0C0C0C1C2C1C47_WEIGHT;
    -- sfix(2, -6)
    signal c9cm4c0cm2cm5c0c1cm5c0c0c0c0cm1c6c0c1_weight : PIPELINE_TYPE_FOR_C9CM4C0CM2CM5C0C1CM5C0C0C0C0CM1C6C0C1_WEIGHT;
    -- sfix(2, -6)
    signal c11cm5c5c6c3c1cm8c3c0c0c0c0c1cm1cm5cm1_weight : PIPELINE_TYPE_FOR_C11CM5C5C6C3C1CM8C3C0C0C0C0C1CM1CM5CM1_WEIGHT;
    -- sfix(2, -6)
    signal c12c0c0cm18cm1c3c0cm3c0c0c0c0c3cm1c3cm5_weight : PIPELINE_TYPE_FOR_C12C0C0CM18CM1C3C0CM3C0C0C0C0C3CM1C3CM5_WEIGHT;
    -- sfix(2, -6)
    signal c1c1c47c1cm25c6cm1cm1c0c0c0c0c30cm25cm1cm3_weight : PIPELINE_TYPE_FOR_C1C1C47C1CM25C6CM1CM1C0C0C0C0C30CM25CM1CM3_WEIGHT;
    -- sfix(2, -6)
    signal c0cm1c8c0c0c0c5c2c0c0c0c0c1c2c2cm3_weight : PIPELINE_TYPE_FOR_C0CM1C8C0C0C0C5C2C0C0C0C0C1C2C2CM3_WEIGHT;
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



    WEIGHT_ROM: entity work.conv5_core10_rmcm_weightsconstant_memory
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
        
            dout1   => cm1cm16c21c1c3c0c4c1c0c0c0c0c3c0cm4c2_weight(0), 
            dout2   => c1c9c0c0cm6c2cm15cm2c0c0c0c0cm8c5cm14c7_weight(0), 
            dout3   => c2c15c8c1c1cm3cm6cm43c0c0c0c0c4c0c1cm1_weight(0), 
            dout4   => cm2c6c1cm9c2cm7c7cm1c0c0c0c0c1cm3c13cm35_weight(0), 
            dout5   => c1c0cm4c0c0cm2cm29cm2c0c0c0c0c1c0c2cm26_weight(0), 
            dout6   => c10c11cm1cm21cm3c3c3cm3c0c0c0c0c1c2c3c0_weight(0), 
            dout7   => cm1cm9c1c11cm3cm1c6c1c0c0c0c0c2cm2cm13c0_weight(0), 
            dout8   => c0c1c3cm2c22c6cm11c5c0c0c0c0cm1c1c9cm2_weight(0), 
            dout9   => cm1cm3c7cm11cm7c4c9c3c0c0c0c0c80c1c9c0_weight(0), 
            dout10   => cm11c1cm4c1c0c5c1c9c0c0c0c0c1c26c7c1_weight(0), 
            dout11   => c1cm49c6c1c0cm2c1c6c0c0c0c0cm3cm2cm4c29_weight(0), 
            dout12   => cm4c0c1c28c3cm23c0c0c0c0c0c0c2cm3c3cm2_weight(0), 
            dout13   => c1cm2c14c0c1c4cm4cm3c0c0c0c0c2cm2c6c2_weight(0), 
            dout14   => cm3c0c2cm2c2cm1c4c11c0c0c0c0cm3cm10cm1c0_weight(0), 
            dout15   => c1cm2c54c7c5c2c1cm2c0c0c0c0cm6c7cm1cm9_weight(0), 
            dout16   => c0c2c1c3c0cm4cm55c3c0c0c0c0c4c0c2c22_weight(0), 
            dout17   => c9c0c0c1c1c0c2cm1c0c0c0c0c8c3c35cm5_weight(0), 
            dout18   => cm3c7c0c2c2c7cm1c0c0c0c0c0c1c2cm1c10_weight(0), 
            dout19   => c1c1cm1cm2c5cm3cm1cm5c0c0c0c0cm2cm4c9cm9_weight(0), 
            dout20   => c0cm2c2cm40cm1c1cm7c1c0c0c0c0c2c2c3c1_weight(0), 
            dout21   => c1c0c3c0c10c0c9c3c0c0c0c0cm1cm1cm4c3_weight(0), 
            dout22   => c46cm4c0c4c2c12c2c9c0c0c0c0c0c8c0c8_weight(0), 
            dout23   => cm2c4c0c2c8c0c4c1c0c0c0c0cm4cm5c1c0_weight(0), 
            dout24   => c0c5cm1c2c0cm2cm2cm3c0c0c0c0cm2cm1c7cm1_weight(0), 
            dout25   => cm2cm1cm19cm3c6cm3c1c0c0c0c0c0c4c2c0cm5_weight(0), 
            dout26   => c0cm1c0c0cm4cm3c1c0c0c0c0c0c5c2cm1c0_weight(0), 
            dout27   => cm2cm4c5cm1cm45c0cm7cm4c0c0c0c0c1c2c1c47_weight(0), 
            dout28   => c9cm4c0cm2cm5c0c1cm5c0c0c0c0cm1c6c0c1_weight(0), 
            dout29   => c11cm5c5c6c3c1cm8c3c0c0c0c0c1cm1cm5cm1_weight(0), 
            dout30   => c12c0c0cm18cm1c3c0cm3c0c0c0c0c3cm1c3cm5_weight(0), 
            dout31   => c1c1c47c1cm25c6cm1cm1c0c0c0c0c30cm25cm1cm3_weight(0), 
            dout32   => c0cm1c8c0c0c0c5c2c0c0c0c0c1c2c2cm3_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm1cm16c21c1c3c0c4c1c0c0c0c0c3c0cm4c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm16c21c1c3c0c4c1c0c0c0c0c3c0cm4c2_weight(0), cm1cm16c21c1c3c0c4c1c0c0c0c0c3c0cm4c2_weight(1));
    PL_STEP_0_for_c1c9c0c0cm6c2cm15cm2c0c0c0c0cm8c5cm14c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c9c0c0cm6c2cm15cm2c0c0c0c0cm8c5cm14c7_weight(0), c1c9c0c0cm6c2cm15cm2c0c0c0c0cm8c5cm14c7_weight(1));
    PL_STEP_0_for_c2c15c8c1c1cm3cm6cm43c0c0c0c0c4c0c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c15c8c1c1cm3cm6cm43c0c0c0c0c4c0c1cm1_weight(0), c2c15c8c1c1cm3cm6cm43c0c0c0c0c4c0c1cm1_weight(1));
    PL_STEP_0_for_cm2c6c1cm9c2cm7c7cm1c0c0c0c0c1cm3c13cm35_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c6c1cm9c2cm7c7cm1c0c0c0c0c1cm3c13cm35_weight(0), cm2c6c1cm9c2cm7c7cm1c0c0c0c0c1cm3c13cm35_weight(1));
    PL_STEP_0_for_c1c0cm4c0c0cm2cm29cm2c0c0c0c0c1c0c2cm26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0cm4c0c0cm2cm29cm2c0c0c0c0c1c0c2cm26_weight(0), c1c0cm4c0c0cm2cm29cm2c0c0c0c0c1c0c2cm26_weight(1));
    PL_STEP_0_for_c10c11cm1cm21cm3c3c3cm3c0c0c0c0c1c2c3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10c11cm1cm21cm3c3c3cm3c0c0c0c0c1c2c3c0_weight(0), c10c11cm1cm21cm3c3c3cm3c0c0c0c0c1c2c3c0_weight(1));
    PL_STEP_0_for_cm1cm9c1c11cm3cm1c6c1c0c0c0c0c2cm2cm13c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm9c1c11cm3cm1c6c1c0c0c0c0c2cm2cm13c0_weight(0), cm1cm9c1c11cm3cm1c6c1c0c0c0c0c2cm2cm13c0_weight(1));
    PL_STEP_0_for_c0c1c3cm2c22c6cm11c5c0c0c0c0cm1c1c9cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1c3cm2c22c6cm11c5c0c0c0c0cm1c1c9cm2_weight(0), c0c1c3cm2c22c6cm11c5c0c0c0c0cm1c1c9cm2_weight(1));
    PL_STEP_0_for_cm1cm3c7cm11cm7c4c9c3c0c0c0c0c80c1c9c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm3c7cm11cm7c4c9c3c0c0c0c0c80c1c9c0_weight(0), cm1cm3c7cm11cm7c4c9c3c0c0c0c0c80c1c9c0_weight(1));
    PL_STEP_0_for_cm11c1cm4c1c0c5c1c9c0c0c0c0c1c26c7c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11c1cm4c1c0c5c1c9c0c0c0c0c1c26c7c1_weight(0), cm11c1cm4c1c0c5c1c9c0c0c0c0c1c26c7c1_weight(1));
    PL_STEP_0_for_c1cm49c6c1c0cm2c1c6c0c0c0c0cm3cm2cm4c29_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm49c6c1c0cm2c1c6c0c0c0c0cm3cm2cm4c29_weight(0), c1cm49c6c1c0cm2c1c6c0c0c0c0cm3cm2cm4c29_weight(1));
    PL_STEP_0_for_cm4c0c1c28c3cm23c0c0c0c0c0c0c2cm3c3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c0c1c28c3cm23c0c0c0c0c0c0c2cm3c3cm2_weight(0), cm4c0c1c28c3cm23c0c0c0c0c0c0c2cm3c3cm2_weight(1));
    PL_STEP_0_for_c1cm2c14c0c1c4cm4cm3c0c0c0c0c2cm2c6c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm2c14c0c1c4cm4cm3c0c0c0c0c2cm2c6c2_weight(0), c1cm2c14c0c1c4cm4cm3c0c0c0c0c2cm2c6c2_weight(1));
    PL_STEP_0_for_cm3c0c2cm2c2cm1c4c11c0c0c0c0cm3cm10cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c0c2cm2c2cm1c4c11c0c0c0c0cm3cm10cm1c0_weight(0), cm3c0c2cm2c2cm1c4c11c0c0c0c0cm3cm10cm1c0_weight(1));
    PL_STEP_0_for_c1cm2c54c7c5c2c1cm2c0c0c0c0cm6c7cm1cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm2c54c7c5c2c1cm2c0c0c0c0cm6c7cm1cm9_weight(0), c1cm2c54c7c5c2c1cm2c0c0c0c0cm6c7cm1cm9_weight(1));
    PL_STEP_0_for_c0c2c1c3c0cm4cm55c3c0c0c0c0c4c0c2c22_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c2c1c3c0cm4cm55c3c0c0c0c0c4c0c2c22_weight(0), c0c2c1c3c0cm4cm55c3c0c0c0c0c4c0c2c22_weight(1));
    PL_STEP_0_for_c9c0c0c1c1c0c2cm1c0c0c0c0c8c3c35cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9c0c0c1c1c0c2cm1c0c0c0c0c8c3c35cm5_weight(0), c9c0c0c1c1c0c2cm1c0c0c0c0c8c3c35cm5_weight(1));
    PL_STEP_0_for_cm3c7c0c2c2c7cm1c0c0c0c0c0c1c2cm1c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c7c0c2c2c7cm1c0c0c0c0c0c1c2cm1c10_weight(0), cm3c7c0c2c2c7cm1c0c0c0c0c0c1c2cm1c10_weight(1));
    PL_STEP_0_for_c1c1cm1cm2c5cm3cm1cm5c0c0c0c0cm2cm4c9cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1cm1cm2c5cm3cm1cm5c0c0c0c0cm2cm4c9cm9_weight(0), c1c1cm1cm2c5cm3cm1cm5c0c0c0c0cm2cm4c9cm9_weight(1));
    PL_STEP_0_for_c0cm2c2cm40cm1c1cm7c1c0c0c0c0c2c2c3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2c2cm40cm1c1cm7c1c0c0c0c0c2c2c3c1_weight(0), c0cm2c2cm40cm1c1cm7c1c0c0c0c0c2c2c3c1_weight(1));
    PL_STEP_0_for_c1c0c3c0c10c0c9c3c0c0c0c0cm1cm1cm4c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0c3c0c10c0c9c3c0c0c0c0cm1cm1cm4c3_weight(0), c1c0c3c0c10c0c9c3c0c0c0c0cm1cm1cm4c3_weight(1));
    PL_STEP_0_for_c46cm4c0c4c2c12c2c9c0c0c0c0c0c8c0c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c46cm4c0c4c2c12c2c9c0c0c0c0c0c8c0c8_weight(0), c46cm4c0c4c2c12c2c9c0c0c0c0c0c8c0c8_weight(1));
    PL_STEP_0_for_cm2c4c0c2c8c0c4c1c0c0c0c0cm4cm5c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c4c0c2c8c0c4c1c0c0c0c0cm4cm5c1c0_weight(0), cm2c4c0c2c8c0c4c1c0c0c0c0cm4cm5c1c0_weight(1));
    PL_STEP_0_for_c0c5cm1c2c0cm2cm2cm3c0c0c0c0cm2cm1c7cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c5cm1c2c0cm2cm2cm3c0c0c0c0cm2cm1c7cm1_weight(0), c0c5cm1c2c0cm2cm2cm3c0c0c0c0cm2cm1c7cm1_weight(1));
    PL_STEP_0_for_cm2cm1cm19cm3c6cm3c1c0c0c0c0c0c4c2c0cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm1cm19cm3c6cm3c1c0c0c0c0c0c4c2c0cm5_weight(0), cm2cm1cm19cm3c6cm3c1c0c0c0c0c0c4c2c0cm5_weight(1));
    PL_STEP_0_for_c0cm1c0c0cm4cm3c1c0c0c0c0c0c5c2cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c0c0cm4cm3c1c0c0c0c0c0c5c2cm1c0_weight(0), c0cm1c0c0cm4cm3c1c0c0c0c0c0c5c2cm1c0_weight(1));
    PL_STEP_0_for_cm2cm4c5cm1cm45c0cm7cm4c0c0c0c0c1c2c1c47_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm4c5cm1cm45c0cm7cm4c0c0c0c0c1c2c1c47_weight(0), cm2cm4c5cm1cm45c0cm7cm4c0c0c0c0c1c2c1c47_weight(1));
    PL_STEP_0_for_c9cm4c0cm2cm5c0c1cm5c0c0c0c0cm1c6c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9cm4c0cm2cm5c0c1cm5c0c0c0c0cm1c6c0c1_weight(0), c9cm4c0cm2cm5c0c1cm5c0c0c0c0cm1c6c0c1_weight(1));
    PL_STEP_0_for_c11cm5c5c6c3c1cm8c3c0c0c0c0c1cm1cm5cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11cm5c5c6c3c1cm8c3c0c0c0c0c1cm1cm5cm1_weight(0), c11cm5c5c6c3c1cm8c3c0c0c0c0c1cm1cm5cm1_weight(1));
    PL_STEP_0_for_c12c0c0cm18cm1c3c0cm3c0c0c0c0c3cm1c3cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12c0c0cm18cm1c3c0cm3c0c0c0c0c3cm1c3cm5_weight(0), c12c0c0cm18cm1c3c0cm3c0c0c0c0c3cm1c3cm5_weight(1));
    PL_STEP_0_for_c1c1c47c1cm25c6cm1cm1c0c0c0c0c30cm25cm1cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1c47c1cm25c6cm1cm1c0c0c0c0c30cm25cm1cm3_weight(0), c1c1c47c1cm25c6cm1cm1c0c0c0c0c30cm25cm1cm3_weight(1));
    PL_STEP_0_for_c0cm1c8c0c0c0c5c2c0c0c0c0c1c2c2cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c8c0c0c0c5c2c0c0c0c0c1c2c2cm3_weight(0), c0cm1c8c0c0c0c5c2c0c0c0c0c1c2c2cm3_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm1cm3c7cm11cm7c4c9c3c0c0c0c0c80c1c9c0_c0cm1c0c0cm4cm3c1c0c0c0c0c0c5c2cm1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm3c7cm11cm7c4c9c3c0c0c0c0c80c1c9c0_weight(1)(8-1 downto 0),
			B	=> c0cm1c0c0cm4cm3c1c0c0c0c0c0c5c2cm1c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm3c7cm11cm7c4c9c3c0c0c0c0c80c1c9c0,
			CxB => R_c0cm1c0c0cm4cm3c1c0c0c0c0c0c5c2cm1c0
		);

    c2c15c8c1c1cm3cm6cm43c0c0c0c0c4c0c1cm1_c0c5cm1c2c0cm2cm2cm3c0c0c0c0cm2cm1c7cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c15c8c1c1cm3cm6cm43c0c0c0c0c4c0c1cm1_weight(1)(7-1 downto 0),
			B	=> c0c5cm1c2c0cm2cm2cm3c0c0c0c0cm2cm1c7cm1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c15c8c1c1cm3cm6cm43c0c0c0c0c4c0c1cm1,
			CxB => R_c0c5cm1c2c0cm2cm2cm3c0c0c0c0cm2cm1c7cm1
		);

    cm2c6c1cm9c2cm7c7cm1c0c0c0c0c1cm3c13cm35_c0cm1c8c0c0c0c5c2c0c0c0c0c1c2c2cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c6c1cm9c2cm7c7cm1c0c0c0c0c1cm3c13cm35_weight(1)(7-1 downto 0),
			B	=> c0cm1c8c0c0c0c5c2c0c0c0c0c1c2c2cm3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c6c1cm9c2cm7c7cm1c0c0c0c0c1cm3c13cm35,
			CxB => R_c0cm1c8c0c0c0c5c2c0c0c0c0c1c2c2cm3
		);

    c1cm49c6c1c0cm2c1c6c0c0c0c0cm3cm2cm4c29_c11cm5c5c6c3c1cm8c3c0c0c0c0c1cm1cm5cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm49c6c1c0cm2c1c6c0c0c0c0cm3cm2cm4c29_weight(1)(7-1 downto 0),
			B	=> c11cm5c5c6c3c1cm8c3c0c0c0c0c1cm1cm5cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm49c6c1c0cm2c1c6c0c0c0c0cm3cm2cm4c29,
			CxB => R_c11cm5c5c6c3c1cm8c3c0c0c0c0c1cm1cm5cm1
		);

    c1cm2c54c7c5c2c1cm2c0c0c0c0cm6c7cm1cm9_c9cm4c0cm2cm5c0c1cm5c0c0c0c0cm1c6c0c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm2c54c7c5c2c1cm2c0c0c0c0cm6c7cm1cm9_weight(1)(7-1 downto 0),
			B	=> c9cm4c0cm2cm5c0c1cm5c0c0c0c0cm1c6c0c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm2c54c7c5c2c1cm2c0c0c0c0cm6c7cm1cm9,
			CxB => R_c9cm4c0cm2cm5c0c1cm5c0c0c0c0cm1c6c0c1
		);

    c0c2c1c3c0cm4cm55c3c0c0c0c0c4c0c2c22_cm2c4c0c2c8c0c4c1c0c0c0c0cm4cm5c1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c2c1c3c0cm4cm55c3c0c0c0c0c4c0c2c22_weight(1)(7-1 downto 0),
			B	=> cm2c4c0c2c8c0c4c1c0c0c0c0cm4cm5c1c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c2c1c3c0cm4cm55c3c0c0c0c0c4c0c2c22,
			CxB => R_cm2c4c0c2c8c0c4c1c0c0c0c0cm4cm5c1c0
		);

    c9c0c0c1c1c0c2cm1c0c0c0c0c8c3c35cm5_c1c0c3c0c10c0c9c3c0c0c0c0cm1cm1cm4c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c9c0c0c1c1c0c2cm1c0c0c0c0c8c3c35cm5_weight(1)(7-1 downto 0),
			B	=> c1c0c3c0c10c0c9c3c0c0c0c0cm1cm1cm4c3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9c0c0c1c1c0c2cm1c0c0c0c0c8c3c35cm5,
			CxB => R_c1c0c3c0c10c0c9c3c0c0c0c0cm1cm1cm4c3
		);

    c0cm2c2cm40cm1c1cm7c1c0c0c0c0c2c2c3c1_c1c1cm1cm2c5cm3cm1cm5c0c0c0c0cm2cm4c9cm9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm2c2cm40cm1c1cm7c1c0c0c0c0c2c2c3c1_weight(1)(7-1 downto 0),
			B	=> c1c1cm1cm2c5cm3cm1cm5c0c0c0c0cm2cm4c9cm9_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm2c2cm40cm1c1cm7c1c0c0c0c0c2c2c3c1,
			CxB => R_c1c1cm1cm2c5cm3cm1cm5c0c0c0c0cm2cm4c9cm9
		);

    c46cm4c0c4c2c12c2c9c0c0c0c0c0c8c0c8_cm3c7c0c2c2c7cm1c0c0c0c0c0c1c2cm1c10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c46cm4c0c4c2c12c2c9c0c0c0c0c0c8c0c8_weight(1)(7-1 downto 0),
			B	=> cm3c7c0c2c2c7cm1c0c0c0c0c0c1c2cm1c10_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c46cm4c0c4c2c12c2c9c0c0c0c0c0c8c0c8,
			CxB => R_cm3c7c0c2c2c7cm1c0c0c0c0c0c1c2cm1c10
		);

    cm2cm4c5cm1cm45c0cm7cm4c0c0c0c0c1c2c1c47_cm3c0c2cm2c2cm1c4c11c0c0c0c0cm3cm10cm1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm4c5cm1cm45c0cm7cm4c0c0c0c0c1c2c1c47_weight(1)(7-1 downto 0),
			B	=> cm3c0c2cm2c2cm1c4c11c0c0c0c0cm3cm10cm1c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm4c5cm1cm45c0cm7cm4c0c0c0c0c1c2c1c47,
			CxB => R_cm3c0c2cm2c2cm1c4c11c0c0c0c0cm3cm10cm1c0
		);

    c1c1c47c1cm25c6cm1cm1c0c0c0c0c30cm25cm1cm3_c1cm2c14c0c1c4cm4cm3c0c0c0c0c2cm2c6c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c1c47c1cm25c6cm1cm1c0c0c0c0c30cm25cm1cm3_weight(1)(7-1 downto 0),
			B	=> c1cm2c14c0c1c4cm4cm3c0c0c0c0c2cm2c6c2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c1c47c1cm25c6cm1cm1c0c0c0c0c30cm25cm1cm3,
			CxB => R_c1cm2c14c0c1c4cm4cm3c0c0c0c0c2cm2c6c2
		);

    cm1cm16c21c1c3c0c4c1c0c0c0c0c3c0cm4c2_cm1cm9c1c11cm3cm1c6c1c0c0c0c0c2cm2cm13c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm16c21c1c3c0c4c1c0c0c0c0c3c0cm4c2_weight(1)(6-1 downto 0),
			B	=> cm1cm9c1c11cm3cm1c6c1c0c0c0c0c2cm2cm13c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm16c21c1c3c0c4c1c0c0c0c0c3c0cm4c2,
			CxB => R_cm1cm9c1c11cm3cm1c6c1c0c0c0c0c2cm2cm13c0
		);

    c1c0cm4c0c0cm2cm29cm2c0c0c0c0c1c0c2cm26_c1c9c0c0cm6c2cm15cm2c0c0c0c0cm8c5cm14c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c0cm4c0c0cm2cm29cm2c0c0c0c0c1c0c2cm26_weight(1)(6-1 downto 0),
			B	=> c1c9c0c0cm6c2cm15cm2c0c0c0c0cm8c5cm14c7_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c0cm4c0c0cm2cm29cm2c0c0c0c0c1c0c2cm26,
			CxB => R_c1c9c0c0cm6c2cm15cm2c0c0c0c0cm8c5cm14c7
		);

    c10c11cm1cm21cm3c3c3cm3c0c0c0c0c1c2c3c0_c12c0c0cm18cm1c3c0cm3c0c0c0c0c3cm1c3cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c10c11cm1cm21cm3c3c3cm3c0c0c0c0c1c2c3c0_weight(1)(6-1 downto 0),
			B	=> c12c0c0cm18cm1c3c0cm3c0c0c0c0c3cm1c3cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c10c11cm1cm21cm3c3c3cm3c0c0c0c0c1c2c3c0,
			CxB => R_c12c0c0cm18cm1c3c0cm3c0c0c0c0c3cm1c3cm5
		);

    c0c1c3cm2c22c6cm11c5c0c0c0c0cm1c1c9cm2_cm2cm1cm19cm3c6cm3c1c0c0c0c0c0c4c2c0cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c1c3cm2c22c6cm11c5c0c0c0c0cm1c1c9cm2_weight(1)(6-1 downto 0),
			B	=> cm2cm1cm19cm3c6cm3c1c0c0c0c0c0c4c2c0cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c1c3cm2c22c6cm11c5c0c0c0c0cm1c1c9cm2,
			CxB => R_cm2cm1cm19cm3c6cm3c1c0c0c0c0c0c4c2c0cm5
		);

    cm11c1cm4c1c0c5c1c9c0c0c0c0c1c26c7c1_cm4c0c1c28c3cm23c0c0c0c0c0c0c2cm3c3cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm11c1cm4c1c0c5c1c9c0c0c0c0c1c26c7c1_weight(1)(6-1 downto 0),
			B	=> cm4c0c1c28c3cm23c0c0c0c0c0c0c2cm3c3cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm11c1cm4c1c0c5c1c9c0c0c0c0c1c26c7c1,
			CxB => R_cm4c0c1c28c3cm23c0c0c0c0c0c0c2cm3c3cm2
		);




end architecture;
