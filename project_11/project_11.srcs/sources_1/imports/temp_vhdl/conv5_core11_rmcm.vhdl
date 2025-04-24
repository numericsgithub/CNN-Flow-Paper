library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core11_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c2c1cm2c2c0c1c0cm2cm1cm1cm4c1cm1c10c43c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0c0cm1c1c20c4cm5cm4c0c4c6c31cm3cm10c0c4 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c1cm4c1c1c0cm6c1c34c3c16c2c10cm18c8cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm2c1cm1cm2cm34cm7c3cm4cm3c5c74cm9cm3cm55c0c1 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm3cm1cm2cm2c64c0c0c1cm3cm8c4cm8c4c0cm7c0 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c3c5c1cm2c14cm4c0c7c3c4c1c0cm11cm8c0c17 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0cm1c1c2c0c8c2c1cm2cm5c0cm1cm4c12cm3cm13 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1c0c1cm2c1cm3cm1c6cm16c4c14cm19c5c2c3cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1c2c5c2c1c3cm3cm1c2c3cm3c5c1cm1cm6cm4 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_cm1c2c1cm2cm5cm2cm10c0cm2c2c1cm16cm33cm6c3c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0cm4c1c0c3c1c1c1c1cm2cm3cm3cm1cm30cm1cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1cm1cm2c2cm3c1c36cm2cm3c1c1cm2cm4c2c1c0 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1cm3c1c1cm1c0c2c2c0cm3cm2c15cm3c2c21c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm3c0c1c0cm8cm1cm3cm1cm1c1c0cm36cm1c0c3cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1c5cm1cm2c1cm6c0c6cm7c0c3c5cm1c4c11cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c4c1c0c0cm3c3cm2cm4c5c0cm5c0c2c5c7c0 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c0c0c1cm5cm2c0c1c2c0c0c2c1c10c4c1c4 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1c1cm2cm1cm4cm5c1cm7cm2c3c0c8c5c1c0cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm1cm1cm3cm1c1cm2cm26c5cm6cm2c0c0c2c2c5cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm5cm2c0c0c1c16cm2cm2c0c0cm6c2c3cm3c0c45 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm1c0cm4c1cm1c1c2c0c21c0c6c25c2c0c12cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2c0c0c2cm1c3cm13cm33cm3c1c0c0c9c1c6cm13 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0cm1cm1c1c1cm3cm1cm14c0cm5cm10c4cm15cm2c6cm6 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm4cm1c0c1cm1cm3cm4c2c2cm3c2c8c3cm8c10c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c3cm1c1cm1cm6cm2c0cm3c4c14c0cm13c1cm1cm8cm4 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c2cm1cm3c0c0cm113c1c2c0c4c3c1c1cm1c1 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c2c0c0c0cm1cm1c3c0c22c1c1cm1cm3c4c11cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1cm1cm2cm2cm16cm3c10cm1cm1cm2cm1cm47c11c5c3cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c3cm1c0c5cm3c2c7c0cm1c0cm1c1c1c3cm1cm5 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c4cm2cm1c3c4c1cm6c4c2c1c1cm2cm14c1c0c8 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1c1c3cm2cm2cm3c5cm5cm49c16c4c0cm1cm5c3c2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1c0c4cm2c1c0cm4c4cm12cm2c0c0c0c4c0cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core11_rmcm;

architecture arch of conv5_core11_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1CM2C2C0C1C0CM2CM1CM1CM4C1CM1C10C43C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM1C1C20C4CM5CM4C0C4C6C31CM3CM10C0C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1CM4C1C1C0CM6C1C34C3C16C2C10CM18C8CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1CM1CM2CM34CM7C3CM4CM3C5C74CM9CM3CM55C0C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM1CM2CM2C64C0C0C1CM3CM8C4CM8C4C0CM7C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C5C1CM2C14CM4C0C7C3C4C1C0CM11CM8C0C17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C1C2C0C8C2C1CM2CM5C0CM1CM4C12CM3CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0C1CM2C1CM3CM1C6CM16C4C14CM19C5C2C3CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C2C5C2C1C3CM3CM1C2C3CM3C5C1CM1CM6CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C2C1CM2CM5CM2CM10C0CM2C2C1CM16CM33CM6C3C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM4C1C0C3C1C1C1C1CM2CM3CM3CM1CM30CM1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1CM2C2CM3C1C36CM2CM3C1C1CM2CM4C2C1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM3C1C1CM1C0C2C2C0CM3CM2C15CM3C2C21C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C0C1C0CM8CM1CM3CM1CM1C1C0CM36CM1C0C3CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C5CM1CM2C1CM6C0C6CM7C0C3C5CM1C4C11CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C1C0C0CM3C3CM2CM4C5C0CM5C0C2C5C7C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C1CM5CM2C0C1C2C0C0C2C1C10C4C1C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1CM2CM1CM4CM5C1CM7CM2C3C0C8C5C1C0CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1CM3CM1C1CM2CM26C5CM6CM2C0C0C2C2C5CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM2C0C0C1C16CM2CM2C0C0CM6C2C3CM3C0C45_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0CM4C1CM1C1C2C0C21C0C6C25C2C0C12CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C0C0C2CM1C3CM13CM33CM3C1C0C0C9C1C6CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1CM1C1C1CM3CM1CM14C0CM5CM10C4CM15CM2C6CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM1C0C1CM1CM3CM4C2C2CM3C2C8C3CM8C10C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM1C1CM1CM6CM2C0CM3C4C14C0CM13C1CM1CM8CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C2CM1CM3C0C0CM113C1C2C0C4C3C1C1CM1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C0C0C0CM1CM1C3C0C22C1C1CM1CM3C4C11CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM1CM2CM2CM16CM3C10CM1CM1CM2CM1CM47C11C5C3CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM1C0C5CM3C2C7C0CM1C0CM1C1C1C3CM1CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM2CM1C3C4C1CM6C4C2C1C1CM2CM14C1C0C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1C3CM2CM2CM3C5CM5CM49C16C4C0CM1CM5C3C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0C4CM2C1C0CM4C4CM12CM2C0C0C0C4C0CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal c2c1cm2c2c0c1c0cm2cm1cm1cm4c1cm1c10c43c1_weight : PIPELINE_TYPE_FOR_C2C1CM2C2C0C1C0CM2CM1CM1CM4C1CM1C10C43C1_WEIGHT;
    -- sfix(2, -6)
    signal c0c0cm1c1c20c4cm5cm4c0c4c6c31cm3cm10c0c4_weight : PIPELINE_TYPE_FOR_C0C0CM1C1C20C4CM5CM4C0C4C6C31CM3CM10C0C4_WEIGHT;
    -- sfix(2, -6)
    signal c0c1cm4c1c1c0cm6c1c34c3c16c2c10cm18c8cm1_weight : PIPELINE_TYPE_FOR_C0C1CM4C1C1C0CM6C1C34C3C16C2C10CM18C8CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm2c1cm1cm2cm34cm7c3cm4cm3c5c74cm9cm3cm55c0c1_weight : PIPELINE_TYPE_FOR_CM2C1CM1CM2CM34CM7C3CM4CM3C5C74CM9CM3CM55C0C1_WEIGHT;
    -- sfix(2, -6)
    signal cm3cm1cm2cm2c64c0c0c1cm3cm8c4cm8c4c0cm7c0_weight : PIPELINE_TYPE_FOR_CM3CM1CM2CM2C64C0C0C1CM3CM8C4CM8C4C0CM7C0_WEIGHT;
    -- sfix(2, -6)
    signal c3c5c1cm2c14cm4c0c7c3c4c1c0cm11cm8c0c17_weight : PIPELINE_TYPE_FOR_C3C5C1CM2C14CM4C0C7C3C4C1C0CM11CM8C0C17_WEIGHT;
    -- sfix(2, -6)
    signal c0cm1c1c2c0c8c2c1cm2cm5c0cm1cm4c12cm3cm13_weight : PIPELINE_TYPE_FOR_C0CM1C1C2C0C8C2C1CM2CM5C0CM1CM4C12CM3CM13_WEIGHT;
    -- sfix(2, -6)
    signal c1c0c1cm2c1cm3cm1c6cm16c4c14cm19c5c2c3cm8_weight : PIPELINE_TYPE_FOR_C1C0C1CM2C1CM3CM1C6CM16C4C14CM19C5C2C3CM8_WEIGHT;
    -- sfix(2, -6)
    signal c1c2c5c2c1c3cm3cm1c2c3cm3c5c1cm1cm6cm4_weight : PIPELINE_TYPE_FOR_C1C2C5C2C1C3CM3CM1C2C3CM3C5C1CM1CM6CM4_WEIGHT;
    -- sfix(2, -6)
    signal cm1c2c1cm2cm5cm2cm10c0cm2c2c1cm16cm33cm6c3c1_weight : PIPELINE_TYPE_FOR_CM1C2C1CM2CM5CM2CM10C0CM2C2C1CM16CM33CM6C3C1_WEIGHT;
    -- sfix(2, -6)
    signal c0cm4c1c0c3c1c1c1c1cm2cm3cm3cm1cm30cm1cm1_weight : PIPELINE_TYPE_FOR_C0CM4C1C0C3C1C1C1C1CM2CM3CM3CM1CM30CM1CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm1cm2c2cm3c1c36cm2cm3c1c1cm2cm4c2c1c0_weight : PIPELINE_TYPE_FOR_CM1CM1CM2C2CM3C1C36CM2CM3C1C1CM2CM4C2C1C0_WEIGHT;
    -- sfix(2, -6)
    signal c1cm3c1c1cm1c0c2c2c0cm3cm2c15cm3c2c21c1_weight : PIPELINE_TYPE_FOR_C1CM3C1C1CM1C0C2C2C0CM3CM2C15CM3C2C21C1_WEIGHT;
    -- sfix(2, -6)
    signal cm3c0c1c0cm8cm1cm3cm1cm1c1c0cm36cm1c0c3cm2_weight : PIPELINE_TYPE_FOR_CM3C0C1C0CM8CM1CM3CM1CM1C1C0CM36CM1C0C3CM2_WEIGHT;
    -- sfix(2, -6)
    signal c1c5cm1cm2c1cm6c0c6cm7c0c3c5cm1c4c11cm1_weight : PIPELINE_TYPE_FOR_C1C5CM1CM2C1CM6C0C6CM7C0C3C5CM1C4C11CM1_WEIGHT;
    -- sfix(2, -6)
    signal c4c1c0c0cm3c3cm2cm4c5c0cm5c0c2c5c7c0_weight : PIPELINE_TYPE_FOR_C4C1C0C0CM3C3CM2CM4C5C0CM5C0C2C5C7C0_WEIGHT;
    -- sfix(2, -6)
    signal c0c0c1cm5cm2c0c1c2c0c0c2c1c10c4c1c4_weight : PIPELINE_TYPE_FOR_C0C0C1CM5CM2C0C1C2C0C0C2C1C10C4C1C4_WEIGHT;
    -- sfix(2, -6)
    signal c1c1cm2cm1cm4cm5c1cm7cm2c3c0c8c5c1c0cm2_weight : PIPELINE_TYPE_FOR_C1C1CM2CM1CM4CM5C1CM7CM2C3C0C8C5C1C0CM2_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm1cm3cm1c1cm2cm26c5cm6cm2c0c0c2c2c5cm4_weight : PIPELINE_TYPE_FOR_CM1CM1CM3CM1C1CM2CM26C5CM6CM2C0C0C2C2C5CM4_WEIGHT;
    -- sfix(2, -6)
    signal cm5cm2c0c0c1c16cm2cm2c0c0cm6c2c3cm3c0c45_weight : PIPELINE_TYPE_FOR_CM5CM2C0C0C1C16CM2CM2C0C0CM6C2C3CM3C0C45_WEIGHT;
    -- sfix(2, -6)
    signal cm1c0cm4c1cm1c1c2c0c21c0c6c25c2c0c12cm1_weight : PIPELINE_TYPE_FOR_CM1C0CM4C1CM1C1C2C0C21C0C6C25C2C0C12CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm2c0c0c2cm1c3cm13cm33cm3c1c0c0c9c1c6cm13_weight : PIPELINE_TYPE_FOR_CM2C0C0C2CM1C3CM13CM33CM3C1C0C0C9C1C6CM13_WEIGHT;
    -- sfix(2, -6)
    signal c0cm1cm1c1c1cm3cm1cm14c0cm5cm10c4cm15cm2c6cm6_weight : PIPELINE_TYPE_FOR_C0CM1CM1C1C1CM3CM1CM14C0CM5CM10C4CM15CM2C6CM6_WEIGHT;
    -- sfix(2, -6)
    signal cm4cm1c0c1cm1cm3cm4c2c2cm3c2c8c3cm8c10c0_weight : PIPELINE_TYPE_FOR_CM4CM1C0C1CM1CM3CM4C2C2CM3C2C8C3CM8C10C0_WEIGHT;
    -- sfix(2, -6)
    signal c3cm1c1cm1cm6cm2c0cm3c4c14c0cm13c1cm1cm8cm4_weight : PIPELINE_TYPE_FOR_C3CM1C1CM1CM6CM2C0CM3C4C14C0CM13C1CM1CM8CM4_WEIGHT;
    -- sfix(2, -6)
    signal c0c2cm1cm3c0c0cm113c1c2c0c4c3c1c1cm1c1_weight : PIPELINE_TYPE_FOR_C0C2CM1CM3C0C0CM113C1C2C0C4C3C1C1CM1C1_WEIGHT;
    -- sfix(2, -6)
    signal c2c0c0c0cm1cm1c3c0c22c1c1cm1cm3c4c11cm4_weight : PIPELINE_TYPE_FOR_C2C0C0C0CM1CM1C3C0C22C1C1CM1CM3C4C11CM4_WEIGHT;
    -- sfix(2, -6)
    signal c1cm1cm2cm2cm16cm3c10cm1cm1cm2cm1cm47c11c5c3cm3_weight : PIPELINE_TYPE_FOR_C1CM1CM2CM2CM16CM3C10CM1CM1CM2CM1CM47C11C5C3CM3_WEIGHT;
    -- sfix(2, -6)
    signal c3cm1c0c5cm3c2c7c0cm1c0cm1c1c1c3cm1cm5_weight : PIPELINE_TYPE_FOR_C3CM1C0C5CM3C2C7C0CM1C0CM1C1C1C3CM1CM5_WEIGHT;
    -- sfix(2, -6)
    signal c4cm2cm1c3c4c1cm6c4c2c1c1cm2cm14c1c0c8_weight : PIPELINE_TYPE_FOR_C4CM2CM1C3C4C1CM6C4C2C1C1CM2CM14C1C0C8_WEIGHT;
    -- sfix(2, -6)
    signal c1c1c3cm2cm2cm3c5cm5cm49c16c4c0cm1cm5c3c2_weight : PIPELINE_TYPE_FOR_C1C1C3CM2CM2CM3C5CM5CM49C16C4C0CM1CM5C3C2_WEIGHT;
    -- sfix(2, -6)
    signal c1c0c4cm2c1c0cm4c4cm12cm2c0c0c0c4c0cm1_weight : PIPELINE_TYPE_FOR_C1C0C4CM2C1C0CM4C4CM12CM2C0C0C0C4C0CM1_WEIGHT;
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



    WEIGHT_ROM: entity work.conv5_core11_rmcm_weightsconstant_memory
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
        
            dout1   => c2c1cm2c2c0c1c0cm2cm1cm1cm4c1cm1c10c43c1_weight(0), 
            dout2   => c0c0cm1c1c20c4cm5cm4c0c4c6c31cm3cm10c0c4_weight(0), 
            dout3   => c0c1cm4c1c1c0cm6c1c34c3c16c2c10cm18c8cm1_weight(0), 
            dout4   => cm2c1cm1cm2cm34cm7c3cm4cm3c5c74cm9cm3cm55c0c1_weight(0), 
            dout5   => cm3cm1cm2cm2c64c0c0c1cm3cm8c4cm8c4c0cm7c0_weight(0), 
            dout6   => c3c5c1cm2c14cm4c0c7c3c4c1c0cm11cm8c0c17_weight(0), 
            dout7   => c0cm1c1c2c0c8c2c1cm2cm5c0cm1cm4c12cm3cm13_weight(0), 
            dout8   => c1c0c1cm2c1cm3cm1c6cm16c4c14cm19c5c2c3cm8_weight(0), 
            dout9   => c1c2c5c2c1c3cm3cm1c2c3cm3c5c1cm1cm6cm4_weight(0), 
            dout10   => cm1c2c1cm2cm5cm2cm10c0cm2c2c1cm16cm33cm6c3c1_weight(0), 
            dout11   => c0cm4c1c0c3c1c1c1c1cm2cm3cm3cm1cm30cm1cm1_weight(0), 
            dout12   => cm1cm1cm2c2cm3c1c36cm2cm3c1c1cm2cm4c2c1c0_weight(0), 
            dout13   => c1cm3c1c1cm1c0c2c2c0cm3cm2c15cm3c2c21c1_weight(0), 
            dout14   => cm3c0c1c0cm8cm1cm3cm1cm1c1c0cm36cm1c0c3cm2_weight(0), 
            dout15   => c1c5cm1cm2c1cm6c0c6cm7c0c3c5cm1c4c11cm1_weight(0), 
            dout16   => c4c1c0c0cm3c3cm2cm4c5c0cm5c0c2c5c7c0_weight(0), 
            dout17   => c0c0c1cm5cm2c0c1c2c0c0c2c1c10c4c1c4_weight(0), 
            dout18   => c1c1cm2cm1cm4cm5c1cm7cm2c3c0c8c5c1c0cm2_weight(0), 
            dout19   => cm1cm1cm3cm1c1cm2cm26c5cm6cm2c0c0c2c2c5cm4_weight(0), 
            dout20   => cm5cm2c0c0c1c16cm2cm2c0c0cm6c2c3cm3c0c45_weight(0), 
            dout21   => cm1c0cm4c1cm1c1c2c0c21c0c6c25c2c0c12cm1_weight(0), 
            dout22   => cm2c0c0c2cm1c3cm13cm33cm3c1c0c0c9c1c6cm13_weight(0), 
            dout23   => c0cm1cm1c1c1cm3cm1cm14c0cm5cm10c4cm15cm2c6cm6_weight(0), 
            dout24   => cm4cm1c0c1cm1cm3cm4c2c2cm3c2c8c3cm8c10c0_weight(0), 
            dout25   => c3cm1c1cm1cm6cm2c0cm3c4c14c0cm13c1cm1cm8cm4_weight(0), 
            dout26   => c0c2cm1cm3c0c0cm113c1c2c0c4c3c1c1cm1c1_weight(0), 
            dout27   => c2c0c0c0cm1cm1c3c0c22c1c1cm1cm3c4c11cm4_weight(0), 
            dout28   => c1cm1cm2cm2cm16cm3c10cm1cm1cm2cm1cm47c11c5c3cm3_weight(0), 
            dout29   => c3cm1c0c5cm3c2c7c0cm1c0cm1c1c1c3cm1cm5_weight(0), 
            dout30   => c4cm2cm1c3c4c1cm6c4c2c1c1cm2cm14c1c0c8_weight(0), 
            dout31   => c1c1c3cm2cm2cm3c5cm5cm49c16c4c0cm1cm5c3c2_weight(0), 
            dout32   => c1c0c4cm2c1c0cm4c4cm12cm2c0c0c0c4c0cm1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c2c1cm2c2c0c1c0cm2cm1cm1cm4c1cm1c10c43c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1cm2c2c0c1c0cm2cm1cm1cm4c1cm1c10c43c1_weight(0), c2c1cm2c2c0c1c0cm2cm1cm1cm4c1cm1c10c43c1_weight(1));
    PL_STEP_0_for_c0c0cm1c1c20c4cm5cm4c0c4c6c31cm3cm10c0c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm1c1c20c4cm5cm4c0c4c6c31cm3cm10c0c4_weight(0), c0c0cm1c1c20c4cm5cm4c0c4c6c31cm3cm10c0c4_weight(1));
    PL_STEP_0_for_c0c1cm4c1c1c0cm6c1c34c3c16c2c10cm18c8cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1cm4c1c1c0cm6c1c34c3c16c2c10cm18c8cm1_weight(0), c0c1cm4c1c1c0cm6c1c34c3c16c2c10cm18c8cm1_weight(1));
    PL_STEP_0_for_cm2c1cm1cm2cm34cm7c3cm4cm3c5c74cm9cm3cm55c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1cm1cm2cm34cm7c3cm4cm3c5c74cm9cm3cm55c0c1_weight(0), cm2c1cm1cm2cm34cm7c3cm4cm3c5c74cm9cm3cm55c0c1_weight(1));
    PL_STEP_0_for_cm3cm1cm2cm2c64c0c0c1cm3cm8c4cm8c4c0cm7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm1cm2cm2c64c0c0c1cm3cm8c4cm8c4c0cm7c0_weight(0), cm3cm1cm2cm2c64c0c0c1cm3cm8c4cm8c4c0cm7c0_weight(1));
    PL_STEP_0_for_c3c5c1cm2c14cm4c0c7c3c4c1c0cm11cm8c0c17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c5c1cm2c14cm4c0c7c3c4c1c0cm11cm8c0c17_weight(0), c3c5c1cm2c14cm4c0c7c3c4c1c0cm11cm8c0c17_weight(1));
    PL_STEP_0_for_c0cm1c1c2c0c8c2c1cm2cm5c0cm1cm4c12cm3cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c1c2c0c8c2c1cm2cm5c0cm1cm4c12cm3cm13_weight(0), c0cm1c1c2c0c8c2c1cm2cm5c0cm1cm4c12cm3cm13_weight(1));
    PL_STEP_0_for_c1c0c1cm2c1cm3cm1c6cm16c4c14cm19c5c2c3cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0c1cm2c1cm3cm1c6cm16c4c14cm19c5c2c3cm8_weight(0), c1c0c1cm2c1cm3cm1c6cm16c4c14cm19c5c2c3cm8_weight(1));
    PL_STEP_0_for_c1c2c5c2c1c3cm3cm1c2c3cm3c5c1cm1cm6cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c2c5c2c1c3cm3cm1c2c3cm3c5c1cm1cm6cm4_weight(0), c1c2c5c2c1c3cm3cm1c2c3cm3c5c1cm1cm6cm4_weight(1));
    PL_STEP_0_for_cm1c2c1cm2cm5cm2cm10c0cm2c2c1cm16cm33cm6c3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c2c1cm2cm5cm2cm10c0cm2c2c1cm16cm33cm6c3c1_weight(0), cm1c2c1cm2cm5cm2cm10c0cm2c2c1cm16cm33cm6c3c1_weight(1));
    PL_STEP_0_for_c0cm4c1c0c3c1c1c1c1cm2cm3cm3cm1cm30cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm4c1c0c3c1c1c1c1cm2cm3cm3cm1cm30cm1cm1_weight(0), c0cm4c1c0c3c1c1c1c1cm2cm3cm3cm1cm30cm1cm1_weight(1));
    PL_STEP_0_for_cm1cm1cm2c2cm3c1c36cm2cm3c1c1cm2cm4c2c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1cm2c2cm3c1c36cm2cm3c1c1cm2cm4c2c1c0_weight(0), cm1cm1cm2c2cm3c1c36cm2cm3c1c1cm2cm4c2c1c0_weight(1));
    PL_STEP_0_for_c1cm3c1c1cm1c0c2c2c0cm3cm2c15cm3c2c21c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm3c1c1cm1c0c2c2c0cm3cm2c15cm3c2c21c1_weight(0), c1cm3c1c1cm1c0c2c2c0cm3cm2c15cm3c2c21c1_weight(1));
    PL_STEP_0_for_cm3c0c1c0cm8cm1cm3cm1cm1c1c0cm36cm1c0c3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c0c1c0cm8cm1cm3cm1cm1c1c0cm36cm1c0c3cm2_weight(0), cm3c0c1c0cm8cm1cm3cm1cm1c1c0cm36cm1c0c3cm2_weight(1));
    PL_STEP_0_for_c1c5cm1cm2c1cm6c0c6cm7c0c3c5cm1c4c11cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c5cm1cm2c1cm6c0c6cm7c0c3c5cm1c4c11cm1_weight(0), c1c5cm1cm2c1cm6c0c6cm7c0c3c5cm1c4c11cm1_weight(1));
    PL_STEP_0_for_c4c1c0c0cm3c3cm2cm4c5c0cm5c0c2c5c7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c1c0c0cm3c3cm2cm4c5c0cm5c0c2c5c7c0_weight(0), c4c1c0c0cm3c3cm2cm4c5c0cm5c0c2c5c7c0_weight(1));
    PL_STEP_0_for_c0c0c1cm5cm2c0c1c2c0c0c2c1c10c4c1c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c1cm5cm2c0c1c2c0c0c2c1c10c4c1c4_weight(0), c0c0c1cm5cm2c0c1c2c0c0c2c1c10c4c1c4_weight(1));
    PL_STEP_0_for_c1c1cm2cm1cm4cm5c1cm7cm2c3c0c8c5c1c0cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1cm2cm1cm4cm5c1cm7cm2c3c0c8c5c1c0cm2_weight(0), c1c1cm2cm1cm4cm5c1cm7cm2c3c0c8c5c1c0cm2_weight(1));
    PL_STEP_0_for_cm1cm1cm3cm1c1cm2cm26c5cm6cm2c0c0c2c2c5cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1cm3cm1c1cm2cm26c5cm6cm2c0c0c2c2c5cm4_weight(0), cm1cm1cm3cm1c1cm2cm26c5cm6cm2c0c0c2c2c5cm4_weight(1));
    PL_STEP_0_for_cm5cm2c0c0c1c16cm2cm2c0c0cm6c2c3cm3c0c45_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm2c0c0c1c16cm2cm2c0c0cm6c2c3cm3c0c45_weight(0), cm5cm2c0c0c1c16cm2cm2c0c0cm6c2c3cm3c0c45_weight(1));
    PL_STEP_0_for_cm1c0cm4c1cm1c1c2c0c21c0c6c25c2c0c12cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0cm4c1cm1c1c2c0c21c0c6c25c2c0c12cm1_weight(0), cm1c0cm4c1cm1c1c2c0c21c0c6c25c2c0c12cm1_weight(1));
    PL_STEP_0_for_cm2c0c0c2cm1c3cm13cm33cm3c1c0c0c9c1c6cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c0c0c2cm1c3cm13cm33cm3c1c0c0c9c1c6cm13_weight(0), cm2c0c0c2cm1c3cm13cm33cm3c1c0c0c9c1c6cm13_weight(1));
    PL_STEP_0_for_c0cm1cm1c1c1cm3cm1cm14c0cm5cm10c4cm15cm2c6cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1cm1c1c1cm3cm1cm14c0cm5cm10c4cm15cm2c6cm6_weight(0), c0cm1cm1c1c1cm3cm1cm14c0cm5cm10c4cm15cm2c6cm6_weight(1));
    PL_STEP_0_for_cm4cm1c0c1cm1cm3cm4c2c2cm3c2c8c3cm8c10c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm1c0c1cm1cm3cm4c2c2cm3c2c8c3cm8c10c0_weight(0), cm4cm1c0c1cm1cm3cm4c2c2cm3c2c8c3cm8c10c0_weight(1));
    PL_STEP_0_for_c3cm1c1cm1cm6cm2c0cm3c4c14c0cm13c1cm1cm8cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm1c1cm1cm6cm2c0cm3c4c14c0cm13c1cm1cm8cm4_weight(0), c3cm1c1cm1cm6cm2c0cm3c4c14c0cm13c1cm1cm8cm4_weight(1));
    PL_STEP_0_for_c0c2cm1cm3c0c0cm113c1c2c0c4c3c1c1cm1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c2cm1cm3c0c0cm113c1c2c0c4c3c1c1cm1c1_weight(0), c0c2cm1cm3c0c0cm113c1c2c0c4c3c1c1cm1c1_weight(1));
    PL_STEP_0_for_c2c0c0c0cm1cm1c3c0c22c1c1cm1cm3c4c11cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c0c0c0cm1cm1c3c0c22c1c1cm1cm3c4c11cm4_weight(0), c2c0c0c0cm1cm1c3c0c22c1c1cm1cm3c4c11cm4_weight(1));
    PL_STEP_0_for_c1cm1cm2cm2cm16cm3c10cm1cm1cm2cm1cm47c11c5c3cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm1cm2cm2cm16cm3c10cm1cm1cm2cm1cm47c11c5c3cm3_weight(0), c1cm1cm2cm2cm16cm3c10cm1cm1cm2cm1cm47c11c5c3cm3_weight(1));
    PL_STEP_0_for_c3cm1c0c5cm3c2c7c0cm1c0cm1c1c1c3cm1cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm1c0c5cm3c2c7c0cm1c0cm1c1c1c3cm1cm5_weight(0), c3cm1c0c5cm3c2c7c0cm1c0cm1c1c1c3cm1cm5_weight(1));
    PL_STEP_0_for_c4cm2cm1c3c4c1cm6c4c2c1c1cm2cm14c1c0c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm2cm1c3c4c1cm6c4c2c1c1cm2cm14c1c0c8_weight(0), c4cm2cm1c3c4c1cm6c4c2c1c1cm2cm14c1c0c8_weight(1));
    PL_STEP_0_for_c1c1c3cm2cm2cm3c5cm5cm49c16c4c0cm1cm5c3c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1c3cm2cm2cm3c5cm5cm49c16c4c0cm1cm5c3c2_weight(0), c1c1c3cm2cm2cm3c5cm5cm49c16c4c0cm1cm5c3c2_weight(1));
    PL_STEP_0_for_c1c0c4cm2c1c0cm4c4cm12cm2c0c0c0c4c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0c4cm2c1c0cm4c4cm12cm2c0c0c0c4c0cm1_weight(0), c1c0c4cm2c1c0cm4c4cm12cm2c0c0c0c4c0cm1_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm2c1cm1cm2cm34cm7c3cm4cm3c5c74cm9cm3cm55c0c1_c3cm1c0c5cm3c2c7c0cm1c0cm1c1c1c3cm1cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c1cm1cm2cm34cm7c3cm4cm3c5c74cm9cm3cm55c0c1_weight(1)(8-1 downto 0),
			B	=> c3cm1c0c5cm3c2c7c0cm1c0cm1c1c1c3cm1cm5_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c1cm1cm2cm34cm7c3cm4cm3c5c74cm9cm3cm55c0c1,
			CxB => R_c3cm1c0c5cm3c2c7c0cm1c0cm1c1c1c3cm1cm5
		);

    cm3cm1cm2cm2c64c0c0c1cm3cm8c4cm8c4c0cm7c0_c4c1c0c0cm3c3cm2cm4c5c0cm5c0c2c5c7c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3cm1cm2cm2c64c0c0c1cm3cm8c4cm8c4c0cm7c0_weight(1)(8-1 downto 0),
			B	=> c4c1c0c0cm3c3cm2cm4c5c0cm5c0c2c5c7c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3cm1cm2cm2c64c0c0c1cm3cm8c4cm8c4c0cm7c0,
			CxB => R_c4c1c0c0cm3c3cm2cm4c5c0cm5c0c2c5c7c0
		);

    c0c2cm1cm3c0c0cm113c1c2c0c4c3c1c1cm1c1_c1c2c5c2c1c3cm3cm1c2c3cm3c5c1cm1cm6cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c2cm1cm3c0c0cm113c1c2c0c4c3c1c1cm1c1_weight(1)(8-1 downto 0),
			B	=> c1c2c5c2c1c3cm3cm1c2c3cm3c5c1cm1cm6cm4_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c2cm1cm3c0c0cm113c1c2c0c4c3c1c1cm1c1,
			CxB => R_c1c2c5c2c1c3cm3cm1c2c3cm3c5c1cm1cm6cm4
		);

    c2c1cm2c2c0c1c0cm2cm1cm1cm4c1cm1c10c43c1_c1c0c4cm2c1c0cm4c4cm12cm2c0c0c0c4c0cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c1cm2c2c0c1c0cm2cm1cm1cm4c1cm1c10c43c1_weight(1)(7-1 downto 0),
			B	=> c1c0c4cm2c1c0cm4c4cm12cm2c0c0c0c4c0cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c1cm2c2c0c1c0cm2cm1cm1cm4c1cm1c10c43c1,
			CxB => R_c1c0c4cm2c1c0cm4c4cm12cm2c0c0c0c4c0cm1
		);

    c0c1cm4c1c1c0cm6c1c34c3c16c2c10cm18c8cm1_c4cm2cm1c3c4c1cm6c4c2c1c1cm2cm14c1c0c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c1cm4c1c1c0cm6c1c34c3c16c2c10cm18c8cm1_weight(1)(7-1 downto 0),
			B	=> c4cm2cm1c3c4c1cm6c4c2c1c1cm2cm14c1c0c8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c1cm4c1c1c0cm6c1c34c3c16c2c10cm18c8cm1,
			CxB => R_c4cm2cm1c3c4c1cm6c4c2c1c1cm2cm14c1c0c8
		);

    cm1c2c1cm2cm5cm2cm10c0cm2c2c1cm16cm33cm6c3c1_c3cm1c1cm1cm6cm2c0cm3c4c14c0cm13c1cm1cm8cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c2c1cm2cm5cm2cm10c0cm2c2c1cm16cm33cm6c3c1_weight(1)(7-1 downto 0),
			B	=> c3cm1c1cm1cm6cm2c0cm3c4c14c0cm13c1cm1cm8cm4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c2c1cm2cm5cm2cm10c0cm2c2c1cm16cm33cm6c3c1,
			CxB => R_c3cm1c1cm1cm6cm2c0cm3c4c14c0cm13c1cm1cm8cm4
		);

    cm1cm1cm2c2cm3c1c36cm2cm3c1c1cm2cm4c2c1c0_cm4cm1c0c1cm1cm3cm4c2c2cm3c2c8c3cm8c10c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm1cm2c2cm3c1c36cm2cm3c1c1cm2cm4c2c1c0_weight(1)(7-1 downto 0),
			B	=> cm4cm1c0c1cm1cm3cm4c2c2cm3c2c8c3cm8c10c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm1cm2c2cm3c1c36cm2cm3c1c1cm2cm4c2c1c0,
			CxB => R_cm4cm1c0c1cm1cm3cm4c2c2cm3c2c8c3cm8c10c0
		);

    cm3c0c1c0cm8cm1cm3cm1cm1c1c0cm36cm1c0c3cm2_c0cm1cm1c1c1cm3cm1cm14c0cm5cm10c4cm15cm2c6cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c0c1c0cm8cm1cm3cm1cm1c1c0cm36cm1c0c3cm2_weight(1)(7-1 downto 0),
			B	=> c0cm1cm1c1c1cm3cm1cm14c0cm5cm10c4cm15cm2c6cm6_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c0c1c0cm8cm1cm3cm1cm1c1c0cm36cm1c0c3cm2,
			CxB => R_c0cm1cm1c1c1cm3cm1cm14c0cm5cm10c4cm15cm2c6cm6
		);

    cm5cm2c0c0c1c16cm2cm2c0c0cm6c2c3cm3c0c45_c1c1cm2cm1cm4cm5c1cm7cm2c3c0c8c5c1c0cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5cm2c0c0c1c16cm2cm2c0c0cm6c2c3cm3c0c45_weight(1)(7-1 downto 0),
			B	=> c1c1cm2cm1cm4cm5c1cm7cm2c3c0c8c5c1c0cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5cm2c0c0c1c16cm2cm2c0c0cm6c2c3cm3c0c45,
			CxB => R_c1c1cm2cm1cm4cm5c1cm7cm2c3c0c8c5c1c0cm2
		);

    cm2c0c0c2cm1c3cm13cm33cm3c1c0c0c9c1c6cm13_c0c0c1cm5cm2c0c1c2c0c0c2c1c10c4c1c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c0c0c2cm1c3cm13cm33cm3c1c0c0c9c1c6cm13_weight(1)(7-1 downto 0),
			B	=> c0c0c1cm5cm2c0c1c2c0c0c2c1c10c4c1c4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c0c0c2cm1c3cm13cm33cm3c1c0c0c9c1c6cm13,
			CxB => R_c0c0c1cm5cm2c0c1c2c0c0c2c1c10c4c1c4
		);

    c1cm1cm2cm2cm16cm3c10cm1cm1cm2cm1cm47c11c5c3cm3_c1c5cm1cm2c1cm6c0c6cm7c0c3c5cm1c4c11cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm1cm2cm2cm16cm3c10cm1cm1cm2cm1cm47c11c5c3cm3_weight(1)(7-1 downto 0),
			B	=> c1c5cm1cm2c1cm6c0c6cm7c0c3c5cm1c4c11cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm1cm2cm2cm16cm3c10cm1cm1cm2cm1cm47c11c5c3cm3,
			CxB => R_c1c5cm1cm2c1cm6c0c6cm7c0c3c5cm1c4c11cm1
		);

    c1c1c3cm2cm2cm3c5cm5cm49c16c4c0cm1cm5c3c2_c0cm1c1c2c0c8c2c1cm2cm5c0cm1cm4c12cm3cm13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c1c3cm2cm2cm3c5cm5cm49c16c4c0cm1cm5c3c2_weight(1)(7-1 downto 0),
			B	=> c0cm1c1c2c0c8c2c1cm2cm5c0cm1cm4c12cm3cm13_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c1c3cm2cm2cm3c5cm5cm49c16c4c0cm1cm5c3c2,
			CxB => R_c0cm1c1c2c0c8c2c1cm2cm5c0cm1cm4c12cm3cm13
		);

    c0c0cm1c1c20c4cm5cm4c0c4c6c31cm3cm10c0c4_c2c0c0c0cm1cm1c3c0c22c1c1cm1cm3c4c11cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c0cm1c1c20c4cm5cm4c0c4c6c31cm3cm10c0c4_weight(1)(6-1 downto 0),
			B	=> c2c0c0c0cm1cm1c3c0c22c1c1cm1cm3c4c11cm4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0cm1c1c20c4cm5cm4c0c4c6c31cm3cm10c0c4,
			CxB => R_c2c0c0c0cm1cm1c3c0c22c1c1cm1cm3c4c11cm4
		);

    c3c5c1cm2c14cm4c0c7c3c4c1c0cm11cm8c0c17_cm1c0cm4c1cm1c1c2c0c21c0c6c25c2c0c12cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c5c1cm2c14cm4c0c7c3c4c1c0cm11cm8c0c17_weight(1)(6-1 downto 0),
			B	=> cm1c0cm4c1cm1c1c2c0c21c0c6c25c2c0c12cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c5c1cm2c14cm4c0c7c3c4c1c0cm11cm8c0c17,
			CxB => R_cm1c0cm4c1cm1c1c2c0c21c0c6c25c2c0c12cm1
		);

    c1c0c1cm2c1cm3cm1c6cm16c4c14cm19c5c2c3cm8_cm1cm1cm3cm1c1cm2cm26c5cm6cm2c0c0c2c2c5cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c0c1cm2c1cm3cm1c6cm16c4c14cm19c5c2c3cm8_weight(1)(6-1 downto 0),
			B	=> cm1cm1cm3cm1c1cm2cm26c5cm6cm2c0c0c2c2c5cm4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c0c1cm2c1cm3cm1c6cm16c4c14cm19c5c2c3cm8,
			CxB => R_cm1cm1cm3cm1c1cm2cm26c5cm6cm2c0c0c2c2c5cm4
		);

    c0cm4c1c0c3c1c1c1c1cm2cm3cm3cm1cm30cm1cm1_c1cm3c1c1cm1c0c2c2c0cm3cm2c15cm3c2c21c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm4c1c0c3c1c1c1c1cm2cm3cm3cm1cm30cm1cm1_weight(1)(6-1 downto 0),
			B	=> c1cm3c1c1cm1c0c2c2c0cm3cm2c15cm3c2c21c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm4c1c0c3c1c1c1c1cm2cm3cm3cm1cm30cm1cm1,
			CxB => R_c1cm3c1c1cm1c0c2c2c0cm3cm2c15cm3c2c21c1
		);




end architecture;
