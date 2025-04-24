library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core31_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c6c2c4c3c7cm1c3c3cm3cm3c1c2c2c2c3c2 : out std_logic_vector(11-1 downto 0);   --	sfix(1, -10)
        R_cm9c0cm9c4cm16c1c23c7c1c6cm4c15c2c19c3cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm15c5c2cm4c6c3cm19c5c2c8c0c2cm3c3cm4c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm9cm10cm7cm12c3cm10c40c9cm1c1cm8c0c10c1c1c11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm5c1cm19c0cm11c7cm1cm17c3c3cm6c8c14c82c3c9 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c0c1cm2c1cm7c0cm8cm2cm1c1cm5c1c1cm1c24c8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6c3c2c1c36c5cm1cm17c6c8c2c4cm7c1c1c10 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm9c1cm1c4cm15c2c2c4cm3c3cm2cm3cm20c0c9c7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2c22cm2cm4c1cm14c5cm2c59c1c6cm18c5c14cm1c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0cm2cm1cm3c0c0c6cm3c3cm9c12c0cm1cm6c6 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm3cm11cm2cm1c1cm22c7cm2cm2c2c1cm12cm28cm21cm4cm14 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1c2c9c1c2c0cm10cm7c2c0cm2c4c1c1c4cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm7c4cm11cm2cm3c17c4c2cm4c0c1c4cm4cm47cm2cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm5cm4c0c2cm16cm7cm13c11c1cm1cm3c1c11c1cm3c1 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c1cm7c3cm2c3cm16c2cm4cm4cm5c2cm3c5c2c0cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c7c6c1cm7c17c9c5c1c3cm3c11c6cm1cm23cm3cm12 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1c8cm2cm2c17c16c0c3c9cm4c0c6c41c13c4c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6c1c3c0c19c0c0c1cm6cm7c0c31cm5c2c4c4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c10cm1cm5c14cm3c43c5c21cm5c0cm4c2c3cm4cm3c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c24cm1c2c23c40cm18c0c56c0c10cm10c1cm13cm2cm2cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2cm6c1cm4cm2c2c5c0cm1cm4cm3c127c1cm2c2cm11 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c4c3c9cm3c14cm1c10c3c8cm4c1cm4cm36cm5c1cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1c24cm2c4cm10c1c4c3cm3c4c4cm9c0cm8c1c12 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c3cm1cm2cm6cm13c4c7c6cm2cm13cm7c1c10c2cm7 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c8cm1cm4c0c16cm4c2c2c15c0c1cm20c7c0c1c15 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm4cm2c1c0cm11c6cm4c1c1cm2c7c9c1c0c11cm4 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c5c58cm27cm7cm11c19cm5cm12cm2c3c3cm2c3c2c4cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c11c7cm4c1c26c7cm9cm1cm1cm1c3cm4c8c5cm15c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm8cm4c6cm6cm16c6cm5cm11c5c0c7c4c5cm8c7cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm1cm2c5c1cm4c18cm8c5cm13cm8c3cm6c3cm7c1c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm72c7c0c42c3cm14cm3cm33c4c1c3c5cm11cm5cm1c3 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c3c0c39cm5c4c6cm4c4c10cm12cm3c8c3cm1c3cm7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core31_rmcm;

architecture arch of conv7_core31_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C2C4C3C7CM1C3C3CM3CM3C1C2C2C2C3C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C0CM9C4CM16C1C23C7C1C6CM4C15C2C19C3CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15C5C2CM4C6C3CM19C5C2C8C0C2CM3C3CM4C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9CM10CM7CM12C3CM10C40C9CM1C1CM8C0C10C1C1C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C1CM19C0CM11C7CM1CM17C3C3CM6C8C14C82C3C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1CM2C1CM7C0CM8CM2CM1C1CM5C1C1CM1C24C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C3C2C1C36C5CM1CM17C6C8C2C4CM7C1C1C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C1CM1C4CM15C2C2C4CM3C3CM2CM3CM20C0C9C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C22CM2CM4C1CM14C5CM2C59C1C6CM18C5C14CM1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM2CM1CM3C0C0C6CM3C3CM9C12C0CM1CM6C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM11CM2CM1C1CM22C7CM2CM2C2C1CM12CM28CM21CM4CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C2C9C1C2C0CM10CM7C2C0CM2C4C1C1C4CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C4CM11CM2CM3C17C4C2CM4C0C1C4CM4CM47CM2CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM4C0C2CM16CM7CM13C11C1CM1CM3C1C11C1CM3C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM7C3CM2C3CM16C2CM4CM4CM5C2CM3C5C2C0CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C6C1CM7C17C9C5C1C3CM3C11C6CM1CM23CM3CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C8CM2CM2C17C16C0C3C9CM4C0C6C41C13C4C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C1C3C0C19C0C0C1CM6CM7C0C31CM5C2C4C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10CM1CM5C14CM3C43C5C21CM5C0CM4C2C3CM4CM3C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C24CM1C2C23C40CM18C0C56C0C10CM10C1CM13CM2CM2CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM6C1CM4CM2C2C5C0CM1CM4CM3C127C1CM2C2CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C3C9CM3C14CM1C10C3C8CM4C1CM4CM36CM5C1CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C24CM2C4CM10C1C4C3CM3C4C4CM9C0CM8C1C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C3CM1CM2CM6CM13C4C7C6CM2CM13CM7C1C10C2CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8CM1CM4C0C16CM4C2C2C15C0C1CM20C7C0C1C15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM2C1C0CM11C6CM4C1C1CM2C7C9C1C0C11CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C58CM27CM7CM11C19CM5CM12CM2C3C3CM2C3C2C4CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C7CM4C1C26C7CM9CM1CM1CM1C3CM4C8C5CM15C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8CM4C6CM6CM16C6CM5CM11C5C0C7C4C5CM8C7CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM2C5C1CM4C18CM8C5CM13CM8C3CM6C3CM7C1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM72C7C0C42C3CM14CM3CM33C4C1C3C5CM11CM5CM1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0C39CM5C4C6CM4C4C10CM12CM3C8C3CM1C3CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c6c2c4c3c7cm1c3c3cm3cm3c1c2c2c2c3c2_weight : PIPELINE_TYPE_FOR_C6C2C4C3C7CM1C3C3CM3CM3C1C2C2C2C3C2_WEIGHT;
    -- sfix(1, -7)
    signal cm9c0cm9c4cm16c1c23c7c1c6cm4c15c2c19c3cm3_weight : PIPELINE_TYPE_FOR_CM9C0CM9C4CM16C1C23C7C1C6CM4C15C2C19C3CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm15c5c2cm4c6c3cm19c5c2c8c0c2cm3c3cm4c0_weight : PIPELINE_TYPE_FOR_CM15C5C2CM4C6C3CM19C5C2C8C0C2CM3C3CM4C0_WEIGHT;
    -- sfix(1, -7)
    signal cm9cm10cm7cm12c3cm10c40c9cm1c1cm8c0c10c1c1c11_weight : PIPELINE_TYPE_FOR_CM9CM10CM7CM12C3CM10C40C9CM1C1CM8C0C10C1C1C11_WEIGHT;
    -- sfix(1, -7)
    signal cm5c1cm19c0cm11c7cm1cm17c3c3cm6c8c14c82c3c9_weight : PIPELINE_TYPE_FOR_CM5C1CM19C0CM11C7CM1CM17C3C3CM6C8C14C82C3C9_WEIGHT;
    -- sfix(1, -7)
    signal c0c1cm2c1cm7c0cm8cm2cm1c1cm5c1c1cm1c24c8_weight : PIPELINE_TYPE_FOR_C0C1CM2C1CM7C0CM8CM2CM1C1CM5C1C1CM1C24C8_WEIGHT;
    -- sfix(1, -7)
    signal c6c3c2c1c36c5cm1cm17c6c8c2c4cm7c1c1c10_weight : PIPELINE_TYPE_FOR_C6C3C2C1C36C5CM1CM17C6C8C2C4CM7C1C1C10_WEIGHT;
    -- sfix(1, -7)
    signal cm9c1cm1c4cm15c2c2c4cm3c3cm2cm3cm20c0c9c7_weight : PIPELINE_TYPE_FOR_CM9C1CM1C4CM15C2C2C4CM3C3CM2CM3CM20C0C9C7_WEIGHT;
    -- sfix(1, -7)
    signal c2c22cm2cm4c1cm14c5cm2c59c1c6cm18c5c14cm1c2_weight : PIPELINE_TYPE_FOR_C2C22CM2CM4C1CM14C5CM2C59C1C6CM18C5C14CM1C2_WEIGHT;
    -- sfix(1, -7)
    signal c0c0cm2cm1cm3c0c0c6cm3c3cm9c12c0cm1cm6c6_weight : PIPELINE_TYPE_FOR_C0C0CM2CM1CM3C0C0C6CM3C3CM9C12C0CM1CM6C6_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm11cm2cm1c1cm22c7cm2cm2c2c1cm12cm28cm21cm4cm14_weight : PIPELINE_TYPE_FOR_CM3CM11CM2CM1C1CM22C7CM2CM2C2C1CM12CM28CM21CM4CM14_WEIGHT;
    -- sfix(1, -7)
    signal cm1c2c9c1c2c0cm10cm7c2c0cm2c4c1c1c4cm2_weight : PIPELINE_TYPE_FOR_CM1C2C9C1C2C0CM10CM7C2C0CM2C4C1C1C4CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm7c4cm11cm2cm3c17c4c2cm4c0c1c4cm4cm47cm2cm2_weight : PIPELINE_TYPE_FOR_CM7C4CM11CM2CM3C17C4C2CM4C0C1C4CM4CM47CM2CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm5cm4c0c2cm16cm7cm13c11c1cm1cm3c1c11c1cm3c1_weight : PIPELINE_TYPE_FOR_CM5CM4C0C2CM16CM7CM13C11C1CM1CM3C1C11C1CM3C1_WEIGHT;
    -- sfix(1, -7)
    signal c1cm7c3cm2c3cm16c2cm4cm4cm5c2cm3c5c2c0cm2_weight : PIPELINE_TYPE_FOR_C1CM7C3CM2C3CM16C2CM4CM4CM5C2CM3C5C2C0CM2_WEIGHT;
    -- sfix(1, -7)
    signal c7c6c1cm7c17c9c5c1c3cm3c11c6cm1cm23cm3cm12_weight : PIPELINE_TYPE_FOR_C7C6C1CM7C17C9C5C1C3CM3C11C6CM1CM23CM3CM12_WEIGHT;
    -- sfix(1, -7)
    signal c1c8cm2cm2c17c16c0c3c9cm4c0c6c41c13c4c0_weight : PIPELINE_TYPE_FOR_C1C8CM2CM2C17C16C0C3C9CM4C0C6C41C13C4C0_WEIGHT;
    -- sfix(1, -7)
    signal cm6c1c3c0c19c0c0c1cm6cm7c0c31cm5c2c4c4_weight : PIPELINE_TYPE_FOR_CM6C1C3C0C19C0C0C1CM6CM7C0C31CM5C2C4C4_WEIGHT;
    -- sfix(1, -7)
    signal c10cm1cm5c14cm3c43c5c21cm5c0cm4c2c3cm4cm3c4_weight : PIPELINE_TYPE_FOR_C10CM1CM5C14CM3C43C5C21CM5C0CM4C2C3CM4CM3C4_WEIGHT;
    -- sfix(1, -7)
    signal c24cm1c2c23c40cm18c0c56c0c10cm10c1cm13cm2cm2cm4_weight : PIPELINE_TYPE_FOR_C24CM1C2C23C40CM18C0C56C0C10CM10C1CM13CM2CM2CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm6c1cm4cm2c2c5c0cm1cm4cm3c127c1cm2c2cm11_weight : PIPELINE_TYPE_FOR_CM2CM6C1CM4CM2C2C5C0CM1CM4CM3C127C1CM2C2CM11_WEIGHT;
    -- sfix(1, -7)
    signal c4c3c9cm3c14cm1c10c3c8cm4c1cm4cm36cm5c1cm2_weight : PIPELINE_TYPE_FOR_C4C3C9CM3C14CM1C10C3C8CM4C1CM4CM36CM5C1CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm1c24cm2c4cm10c1c4c3cm3c4c4cm9c0cm8c1c12_weight : PIPELINE_TYPE_FOR_CM1C24CM2C4CM10C1C4C3CM3C4C4CM9C0CM8C1C12_WEIGHT;
    -- sfix(1, -7)
    signal c0c3cm1cm2cm6cm13c4c7c6cm2cm13cm7c1c10c2cm7_weight : PIPELINE_TYPE_FOR_C0C3CM1CM2CM6CM13C4C7C6CM2CM13CM7C1C10C2CM7_WEIGHT;
    -- sfix(1, -7)
    signal c8cm1cm4c0c16cm4c2c2c15c0c1cm20c7c0c1c15_weight : PIPELINE_TYPE_FOR_C8CM1CM4C0C16CM4C2C2C15C0C1CM20C7C0C1C15_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm2c1c0cm11c6cm4c1c1cm2c7c9c1c0c11cm4_weight : PIPELINE_TYPE_FOR_CM4CM2C1C0CM11C6CM4C1C1CM2C7C9C1C0C11CM4_WEIGHT;
    -- sfix(1, -7)
    signal c5c58cm27cm7cm11c19cm5cm12cm2c3c3cm2c3c2c4cm2_weight : PIPELINE_TYPE_FOR_C5C58CM27CM7CM11C19CM5CM12CM2C3C3CM2C3C2C4CM2_WEIGHT;
    -- sfix(1, -7)
    signal c11c7cm4c1c26c7cm9cm1cm1cm1c3cm4c8c5cm15c3_weight : PIPELINE_TYPE_FOR_C11C7CM4C1C26C7CM9CM1CM1CM1C3CM4C8C5CM15C3_WEIGHT;
    -- sfix(1, -7)
    signal cm8cm4c6cm6cm16c6cm5cm11c5c0c7c4c5cm8c7cm2_weight : PIPELINE_TYPE_FOR_CM8CM4C6CM6CM16C6CM5CM11C5C0C7C4C5CM8C7CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm2c5c1cm4c18cm8c5cm13cm8c3cm6c3cm7c1c1_weight : PIPELINE_TYPE_FOR_CM1CM2C5C1CM4C18CM8C5CM13CM8C3CM6C3CM7C1C1_WEIGHT;
    -- sfix(1, -7)
    signal cm72c7c0c42c3cm14cm3cm33c4c1c3c5cm11cm5cm1c3_weight : PIPELINE_TYPE_FOR_CM72C7C0C42C3CM14CM3CM33C4C1C3C5CM11CM5CM1C3_WEIGHT;
    -- sfix(1, -7)
    signal c3c0c39cm5c4c6cm4c4c10cm12cm3c8c3cm1c3cm7_weight : PIPELINE_TYPE_FOR_C3C0C39CM5C4C6CM4C4C10CM12CM3C8C3CM1C3CM7_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core31_rmcm_weightsconstant_memory
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
        
            dout1   => c6c2c4c3c7cm1c3c3cm3cm3c1c2c2c2c3c2_weight(0), 
            dout2   => cm9c0cm9c4cm16c1c23c7c1c6cm4c15c2c19c3cm3_weight(0), 
            dout3   => cm15c5c2cm4c6c3cm19c5c2c8c0c2cm3c3cm4c0_weight(0), 
            dout4   => cm9cm10cm7cm12c3cm10c40c9cm1c1cm8c0c10c1c1c11_weight(0), 
            dout5   => cm5c1cm19c0cm11c7cm1cm17c3c3cm6c8c14c82c3c9_weight(0), 
            dout6   => c0c1cm2c1cm7c0cm8cm2cm1c1cm5c1c1cm1c24c8_weight(0), 
            dout7   => c6c3c2c1c36c5cm1cm17c6c8c2c4cm7c1c1c10_weight(0), 
            dout8   => cm9c1cm1c4cm15c2c2c4cm3c3cm2cm3cm20c0c9c7_weight(0), 
            dout9   => c2c22cm2cm4c1cm14c5cm2c59c1c6cm18c5c14cm1c2_weight(0), 
            dout10   => c0c0cm2cm1cm3c0c0c6cm3c3cm9c12c0cm1cm6c6_weight(0), 
            dout11   => cm3cm11cm2cm1c1cm22c7cm2cm2c2c1cm12cm28cm21cm4cm14_weight(0), 
            dout12   => cm1c2c9c1c2c0cm10cm7c2c0cm2c4c1c1c4cm2_weight(0), 
            dout13   => cm7c4cm11cm2cm3c17c4c2cm4c0c1c4cm4cm47cm2cm2_weight(0), 
            dout14   => cm5cm4c0c2cm16cm7cm13c11c1cm1cm3c1c11c1cm3c1_weight(0), 
            dout15   => c1cm7c3cm2c3cm16c2cm4cm4cm5c2cm3c5c2c0cm2_weight(0), 
            dout16   => c7c6c1cm7c17c9c5c1c3cm3c11c6cm1cm23cm3cm12_weight(0), 
            dout17   => c1c8cm2cm2c17c16c0c3c9cm4c0c6c41c13c4c0_weight(0), 
            dout18   => cm6c1c3c0c19c0c0c1cm6cm7c0c31cm5c2c4c4_weight(0), 
            dout19   => c10cm1cm5c14cm3c43c5c21cm5c0cm4c2c3cm4cm3c4_weight(0), 
            dout20   => c24cm1c2c23c40cm18c0c56c0c10cm10c1cm13cm2cm2cm4_weight(0), 
            dout21   => cm2cm6c1cm4cm2c2c5c0cm1cm4cm3c127c1cm2c2cm11_weight(0), 
            dout22   => c4c3c9cm3c14cm1c10c3c8cm4c1cm4cm36cm5c1cm2_weight(0), 
            dout23   => cm1c24cm2c4cm10c1c4c3cm3c4c4cm9c0cm8c1c12_weight(0), 
            dout24   => c0c3cm1cm2cm6cm13c4c7c6cm2cm13cm7c1c10c2cm7_weight(0), 
            dout25   => c8cm1cm4c0c16cm4c2c2c15c0c1cm20c7c0c1c15_weight(0), 
            dout26   => cm4cm2c1c0cm11c6cm4c1c1cm2c7c9c1c0c11cm4_weight(0), 
            dout27   => c5c58cm27cm7cm11c19cm5cm12cm2c3c3cm2c3c2c4cm2_weight(0), 
            dout28   => c11c7cm4c1c26c7cm9cm1cm1cm1c3cm4c8c5cm15c3_weight(0), 
            dout29   => cm8cm4c6cm6cm16c6cm5cm11c5c0c7c4c5cm8c7cm2_weight(0), 
            dout30   => cm1cm2c5c1cm4c18cm8c5cm13cm8c3cm6c3cm7c1c1_weight(0), 
            dout31   => cm72c7c0c42c3cm14cm3cm33c4c1c3c5cm11cm5cm1c3_weight(0), 
            dout32   => c3c0c39cm5c4c6cm4c4c10cm12cm3c8c3cm1c3cm7_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c6c2c4c3c7cm1c3c3cm3cm3c1c2c2c2c3c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c2c4c3c7cm1c3c3cm3cm3c1c2c2c2c3c2_weight(0), c6c2c4c3c7cm1c3c3cm3cm3c1c2c2c2c3c2_weight(1));
    PL_STEP_0_for_cm9c0cm9c4cm16c1c23c7c1c6cm4c15c2c19c3cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c0cm9c4cm16c1c23c7c1c6cm4c15c2c19c3cm3_weight(0), cm9c0cm9c4cm16c1c23c7c1c6cm4c15c2c19c3cm3_weight(1));
    PL_STEP_0_for_cm15c5c2cm4c6c3cm19c5c2c8c0c2cm3c3cm4c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15c5c2cm4c6c3cm19c5c2c8c0c2cm3c3cm4c0_weight(0), cm15c5c2cm4c6c3cm19c5c2c8c0c2cm3c3cm4c0_weight(1));
    PL_STEP_0_for_cm9cm10cm7cm12c3cm10c40c9cm1c1cm8c0c10c1c1c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9cm10cm7cm12c3cm10c40c9cm1c1cm8c0c10c1c1c11_weight(0), cm9cm10cm7cm12c3cm10c40c9cm1c1cm8c0c10c1c1c11_weight(1));
    PL_STEP_0_for_cm5c1cm19c0cm11c7cm1cm17c3c3cm6c8c14c82c3c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c1cm19c0cm11c7cm1cm17c3c3cm6c8c14c82c3c9_weight(0), cm5c1cm19c0cm11c7cm1cm17c3c3cm6c8c14c82c3c9_weight(1));
    PL_STEP_0_for_c0c1cm2c1cm7c0cm8cm2cm1c1cm5c1c1cm1c24c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1cm2c1cm7c0cm8cm2cm1c1cm5c1c1cm1c24c8_weight(0), c0c1cm2c1cm7c0cm8cm2cm1c1cm5c1c1cm1c24c8_weight(1));
    PL_STEP_0_for_c6c3c2c1c36c5cm1cm17c6c8c2c4cm7c1c1c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c3c2c1c36c5cm1cm17c6c8c2c4cm7c1c1c10_weight(0), c6c3c2c1c36c5cm1cm17c6c8c2c4cm7c1c1c10_weight(1));
    PL_STEP_0_for_cm9c1cm1c4cm15c2c2c4cm3c3cm2cm3cm20c0c9c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c1cm1c4cm15c2c2c4cm3c3cm2cm3cm20c0c9c7_weight(0), cm9c1cm1c4cm15c2c2c4cm3c3cm2cm3cm20c0c9c7_weight(1));
    PL_STEP_0_for_c2c22cm2cm4c1cm14c5cm2c59c1c6cm18c5c14cm1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c22cm2cm4c1cm14c5cm2c59c1c6cm18c5c14cm1c2_weight(0), c2c22cm2cm4c1cm14c5cm2c59c1c6cm18c5c14cm1c2_weight(1));
    PL_STEP_0_for_c0c0cm2cm1cm3c0c0c6cm3c3cm9c12c0cm1cm6c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm2cm1cm3c0c0c6cm3c3cm9c12c0cm1cm6c6_weight(0), c0c0cm2cm1cm3c0c0c6cm3c3cm9c12c0cm1cm6c6_weight(1));
    PL_STEP_0_for_cm3cm11cm2cm1c1cm22c7cm2cm2c2c1cm12cm28cm21cm4cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm11cm2cm1c1cm22c7cm2cm2c2c1cm12cm28cm21cm4cm14_weight(0), cm3cm11cm2cm1c1cm22c7cm2cm2c2c1cm12cm28cm21cm4cm14_weight(1));
    PL_STEP_0_for_cm1c2c9c1c2c0cm10cm7c2c0cm2c4c1c1c4cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c2c9c1c2c0cm10cm7c2c0cm2c4c1c1c4cm2_weight(0), cm1c2c9c1c2c0cm10cm7c2c0cm2c4c1c1c4cm2_weight(1));
    PL_STEP_0_for_cm7c4cm11cm2cm3c17c4c2cm4c0c1c4cm4cm47cm2cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c4cm11cm2cm3c17c4c2cm4c0c1c4cm4cm47cm2cm2_weight(0), cm7c4cm11cm2cm3c17c4c2cm4c0c1c4cm4cm47cm2cm2_weight(1));
    PL_STEP_0_for_cm5cm4c0c2cm16cm7cm13c11c1cm1cm3c1c11c1cm3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm4c0c2cm16cm7cm13c11c1cm1cm3c1c11c1cm3c1_weight(0), cm5cm4c0c2cm16cm7cm13c11c1cm1cm3c1c11c1cm3c1_weight(1));
    PL_STEP_0_for_c1cm7c3cm2c3cm16c2cm4cm4cm5c2cm3c5c2c0cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm7c3cm2c3cm16c2cm4cm4cm5c2cm3c5c2c0cm2_weight(0), c1cm7c3cm2c3cm16c2cm4cm4cm5c2cm3c5c2c0cm2_weight(1));
    PL_STEP_0_for_c7c6c1cm7c17c9c5c1c3cm3c11c6cm1cm23cm3cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c6c1cm7c17c9c5c1c3cm3c11c6cm1cm23cm3cm12_weight(0), c7c6c1cm7c17c9c5c1c3cm3c11c6cm1cm23cm3cm12_weight(1));
    PL_STEP_0_for_c1c8cm2cm2c17c16c0c3c9cm4c0c6c41c13c4c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c8cm2cm2c17c16c0c3c9cm4c0c6c41c13c4c0_weight(0), c1c8cm2cm2c17c16c0c3c9cm4c0c6c41c13c4c0_weight(1));
    PL_STEP_0_for_cm6c1c3c0c19c0c0c1cm6cm7c0c31cm5c2c4c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c1c3c0c19c0c0c1cm6cm7c0c31cm5c2c4c4_weight(0), cm6c1c3c0c19c0c0c1cm6cm7c0c31cm5c2c4c4_weight(1));
    PL_STEP_0_for_c10cm1cm5c14cm3c43c5c21cm5c0cm4c2c3cm4cm3c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10cm1cm5c14cm3c43c5c21cm5c0cm4c2c3cm4cm3c4_weight(0), c10cm1cm5c14cm3c43c5c21cm5c0cm4c2c3cm4cm3c4_weight(1));
    PL_STEP_0_for_c24cm1c2c23c40cm18c0c56c0c10cm10c1cm13cm2cm2cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c24cm1c2c23c40cm18c0c56c0c10cm10c1cm13cm2cm2cm4_weight(0), c24cm1c2c23c40cm18c0c56c0c10cm10c1cm13cm2cm2cm4_weight(1));
    PL_STEP_0_for_cm2cm6c1cm4cm2c2c5c0cm1cm4cm3c127c1cm2c2cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm6c1cm4cm2c2c5c0cm1cm4cm3c127c1cm2c2cm11_weight(0), cm2cm6c1cm4cm2c2c5c0cm1cm4cm3c127c1cm2c2cm11_weight(1));
    PL_STEP_0_for_c4c3c9cm3c14cm1c10c3c8cm4c1cm4cm36cm5c1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c3c9cm3c14cm1c10c3c8cm4c1cm4cm36cm5c1cm2_weight(0), c4c3c9cm3c14cm1c10c3c8cm4c1cm4cm36cm5c1cm2_weight(1));
    PL_STEP_0_for_cm1c24cm2c4cm10c1c4c3cm3c4c4cm9c0cm8c1c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c24cm2c4cm10c1c4c3cm3c4c4cm9c0cm8c1c12_weight(0), cm1c24cm2c4cm10c1c4c3cm3c4c4cm9c0cm8c1c12_weight(1));
    PL_STEP_0_for_c0c3cm1cm2cm6cm13c4c7c6cm2cm13cm7c1c10c2cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c3cm1cm2cm6cm13c4c7c6cm2cm13cm7c1c10c2cm7_weight(0), c0c3cm1cm2cm6cm13c4c7c6cm2cm13cm7c1c10c2cm7_weight(1));
    PL_STEP_0_for_c8cm1cm4c0c16cm4c2c2c15c0c1cm20c7c0c1c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8cm1cm4c0c16cm4c2c2c15c0c1cm20c7c0c1c15_weight(0), c8cm1cm4c0c16cm4c2c2c15c0c1cm20c7c0c1c15_weight(1));
    PL_STEP_0_for_cm4cm2c1c0cm11c6cm4c1c1cm2c7c9c1c0c11cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm2c1c0cm11c6cm4c1c1cm2c7c9c1c0c11cm4_weight(0), cm4cm2c1c0cm11c6cm4c1c1cm2c7c9c1c0c11cm4_weight(1));
    PL_STEP_0_for_c5c58cm27cm7cm11c19cm5cm12cm2c3c3cm2c3c2c4cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c58cm27cm7cm11c19cm5cm12cm2c3c3cm2c3c2c4cm2_weight(0), c5c58cm27cm7cm11c19cm5cm12cm2c3c3cm2c3c2c4cm2_weight(1));
    PL_STEP_0_for_c11c7cm4c1c26c7cm9cm1cm1cm1c3cm4c8c5cm15c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c7cm4c1c26c7cm9cm1cm1cm1c3cm4c8c5cm15c3_weight(0), c11c7cm4c1c26c7cm9cm1cm1cm1c3cm4c8c5cm15c3_weight(1));
    PL_STEP_0_for_cm8cm4c6cm6cm16c6cm5cm11c5c0c7c4c5cm8c7cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8cm4c6cm6cm16c6cm5cm11c5c0c7c4c5cm8c7cm2_weight(0), cm8cm4c6cm6cm16c6cm5cm11c5c0c7c4c5cm8c7cm2_weight(1));
    PL_STEP_0_for_cm1cm2c5c1cm4c18cm8c5cm13cm8c3cm6c3cm7c1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm2c5c1cm4c18cm8c5cm13cm8c3cm6c3cm7c1c1_weight(0), cm1cm2c5c1cm4c18cm8c5cm13cm8c3cm6c3cm7c1c1_weight(1));
    PL_STEP_0_for_cm72c7c0c42c3cm14cm3cm33c4c1c3c5cm11cm5cm1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm72c7c0c42c3cm14cm3cm33c4c1c3c5cm11cm5cm1c3_weight(0), cm72c7c0c42c3cm14cm3cm33c4c1c3c5cm11cm5cm1c3_weight(1));
    PL_STEP_0_for_c3c0c39cm5c4c6cm4c4c10cm12cm3c8c3cm1c3cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0c39cm5c4c6cm4c4c10cm12cm3c8c3cm1c3cm7_weight(0), c3c0c39cm5c4c6cm4c4c10cm12cm3c8c3cm1c3cm7_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm5c1cm19c0cm11c7cm1cm17c3c3cm6c8c14c82c3c9_c6c2c4c3c7cm1c3c3cm3cm3c1c2c2c2c3c2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm5c1cm19c0cm11c7cm1cm17c3c3cm6c8c14c82c3c9_weight(1)(8-1 downto 0),
			B	=> c6c2c4c3c7cm1c3c3cm3cm3c1c2c2c2c3c2_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5c1cm19c0cm11c7cm1cm17c3c3cm6c8c14c82c3c9,
			CxB => R_c6c2c4c3c7cm1c3c3cm3cm3c1c2c2c2c3c2
		);

    cm2cm6c1cm4cm2c2c5c0cm1cm4cm3c127c1cm2c2cm11_cm8cm4c6cm6cm16c6cm5cm11c5c0c7c4c5cm8c7cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm6c1cm4cm2c2c5c0cm1cm4cm3c127c1cm2c2cm11_weight(1)(8-1 downto 0),
			B	=> cm8cm4c6cm6cm16c6cm5cm11c5c0c7c4c5cm8c7cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm6c1cm4cm2c2c5c0cm1cm4cm3c127c1cm2c2cm11,
			CxB => R_cm8cm4c6cm6cm16c6cm5cm11c5c0c7c4c5cm8c7cm2
		);

    cm72c7c0c42c3cm14cm3cm33c4c1c3c5cm11cm5cm1c3_cm4cm2c1c0cm11c6cm4c1c1cm2c7c9c1c0c11cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm72c7c0c42c3cm14cm3cm33c4c1c3c5cm11cm5cm1c3_weight(1)(8-1 downto 0),
			B	=> cm4cm2c1c0cm11c6cm4c1c1cm2c7c9c1c0c11cm4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm72c7c0c42c3cm14cm3cm33c4c1c3c5cm11cm5cm1c3,
			CxB => R_cm4cm2c1c0cm11c6cm4c1c1cm2c7c9c1c0c11cm4
		);

    cm9cm10cm7cm12c3cm10c40c9cm1c1cm8c0c10c1c1c11_c0c3cm1cm2cm6cm13c4c7c6cm2cm13cm7c1c10c2cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9cm10cm7cm12c3cm10c40c9cm1c1cm8c0c10c1c1c11_weight(1)(7-1 downto 0),
			B	=> c0c3cm1cm2cm6cm13c4c7c6cm2cm13cm7c1c10c2cm7_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9cm10cm7cm12c3cm10c40c9cm1c1cm8c0c10c1c1c11,
			CxB => R_c0c3cm1cm2cm6cm13c4c7c6cm2cm13cm7c1c10c2cm7
		);

    c6c3c2c1c36c5cm1cm17c6c8c2c4cm7c1c1c10_c1cm7c3cm2c3cm16c2cm4cm4cm5c2cm3c5c2c0cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6c3c2c1c36c5cm1cm17c6c8c2c4cm7c1c1c10_weight(1)(7-1 downto 0),
			B	=> c1cm7c3cm2c3cm16c2cm4cm4cm5c2cm3c5c2c0cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6c3c2c1c36c5cm1cm17c6c8c2c4cm7c1c1c10,
			CxB => R_c1cm7c3cm2c3cm16c2cm4cm4cm5c2cm3c5c2c0cm2
		);

    c2c22cm2cm4c1cm14c5cm2c59c1c6cm18c5c14cm1c2_cm5cm4c0c2cm16cm7cm13c11c1cm1cm3c1c11c1cm3c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c22cm2cm4c1cm14c5cm2c59c1c6cm18c5c14cm1c2_weight(1)(7-1 downto 0),
			B	=> cm5cm4c0c2cm16cm7cm13c11c1cm1cm3c1c11c1cm3c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c22cm2cm4c1cm14c5cm2c59c1c6cm18c5c14cm1c2,
			CxB => R_cm5cm4c0c2cm16cm7cm13c11c1cm1cm3c1c11c1cm3c1
		);

    cm7c4cm11cm2cm3c17c4c2cm4c0c1c4cm4cm47cm2cm2_cm1c2c9c1c2c0cm10cm7c2c0cm2c4c1c1c4cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm7c4cm11cm2cm3c17c4c2cm4c0c1c4cm4cm47cm2cm2_weight(1)(7-1 downto 0),
			B	=> cm1c2c9c1c2c0cm10cm7c2c0cm2c4c1c1c4cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7c4cm11cm2cm3c17c4c2cm4c0c1c4cm4cm47cm2cm2,
			CxB => R_cm1c2c9c1c2c0cm10cm7c2c0cm2c4c1c1c4cm2
		);

    c1c8cm2cm2c17c16c0c3c9cm4c0c6c41c13c4c0_c0c0cm2cm1cm3c0c0c6cm3c3cm9c12c0cm1cm6c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c8cm2cm2c17c16c0c3c9cm4c0c6c41c13c4c0_weight(1)(7-1 downto 0),
			B	=> c0c0cm2cm1cm3c0c0c6cm3c3cm9c12c0cm1cm6c6_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c8cm2cm2c17c16c0c3c9cm4c0c6c41c13c4c0,
			CxB => R_c0c0cm2cm1cm3c0c0c6cm3c3cm9c12c0cm1cm6c6
		);

    c10cm1cm5c14cm3c43c5c21cm5c0cm4c2c3cm4cm3c4_cm1cm2c5c1cm4c18cm8c5cm13cm8c3cm6c3cm7c1c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c10cm1cm5c14cm3c43c5c21cm5c0cm4c2c3cm4cm3c4_weight(1)(7-1 downto 0),
			B	=> cm1cm2c5c1cm4c18cm8c5cm13cm8c3cm6c3cm7c1c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c10cm1cm5c14cm3c43c5c21cm5c0cm4c2c3cm4cm3c4,
			CxB => R_cm1cm2c5c1cm4c18cm8c5cm13cm8c3cm6c3cm7c1c1
		);

    c24cm1c2c23c40cm18c0c56c0c10cm10c1cm13cm2cm2cm4_c11c7cm4c1c26c7cm9cm1cm1cm1c3cm4c8c5cm15c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c24cm1c2c23c40cm18c0c56c0c10cm10c1cm13cm2cm2cm4_weight(1)(7-1 downto 0),
			B	=> c11c7cm4c1c26c7cm9cm1cm1cm1c3cm4c8c5cm15c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c24cm1c2c23c40cm18c0c56c0c10cm10c1cm13cm2cm2cm4,
			CxB => R_c11c7cm4c1c26c7cm9cm1cm1cm1c3cm4c8c5cm15c3
		);

    c4c3c9cm3c14cm1c10c3c8cm4c1cm4cm36cm5c1cm2_c8cm1cm4c0c16cm4c2c2c15c0c1cm20c7c0c1c15_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c3c9cm3c14cm1c10c3c8cm4c1cm4cm36cm5c1cm2_weight(1)(7-1 downto 0),
			B	=> c8cm1cm4c0c16cm4c2c2c15c0c1cm20c7c0c1c15_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c3c9cm3c14cm1c10c3c8cm4c1cm4cm36cm5c1cm2,
			CxB => R_c8cm1cm4c0c16cm4c2c2c15c0c1cm20c7c0c1c15
		);

    c5c58cm27cm7cm11c19cm5cm12cm2c3c3cm2c3c2c4cm2_cm1c24cm2c4cm10c1c4c3cm3c4c4cm9c0cm8c1c12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5c58cm27cm7cm11c19cm5cm12cm2c3c3cm2c3c2c4cm2_weight(1)(7-1 downto 0),
			B	=> cm1c24cm2c4cm10c1c4c3cm3c4c4cm9c0cm8c1c12_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c58cm27cm7cm11c19cm5cm12cm2c3c3cm2c3c2c4cm2,
			CxB => R_cm1c24cm2c4cm10c1c4c3cm3c4c4cm9c0cm8c1c12
		);

    c3c0c39cm5c4c6cm4c4c10cm12cm3c8c3cm1c3cm7_cm6c1c3c0c19c0c0c1cm6cm7c0c31cm5c2c4c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c0c39cm5c4c6cm4c4c10cm12cm3c8c3cm1c3cm7_weight(1)(7-1 downto 0),
			B	=> cm6c1c3c0c19c0c0c1cm6cm7c0c31cm5c2c4c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c0c39cm5c4c6cm4c4c10cm12cm3c8c3cm1c3cm7,
			CxB => R_cm6c1c3c0c19c0c0c1cm6cm7c0c31cm5c2c4c4
		);

    cm9c0cm9c4cm16c1c23c7c1c6cm4c15c2c19c3cm3_c7c6c1cm7c17c9c5c1c3cm3c11c6cm1cm23cm3cm12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9c0cm9c4cm16c1c23c7c1c6cm4c15c2c19c3cm3_weight(1)(6-1 downto 0),
			B	=> c7c6c1cm7c17c9c5c1c3cm3c11c6cm1cm23cm3cm12_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9c0cm9c4cm16c1c23c7c1c6cm4c15c2c19c3cm3,
			CxB => R_c7c6c1cm7c17c9c5c1c3cm3c11c6cm1cm23cm3cm12
		);

    cm15c5c2cm4c6c3cm19c5c2c8c0c2cm3c3cm4c0_cm3cm11cm2cm1c1cm22c7cm2cm2c2c1cm12cm28cm21cm4cm14_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm15c5c2cm4c6c3cm19c5c2c8c0c2cm3c3cm4c0_weight(1)(6-1 downto 0),
			B	=> cm3cm11cm2cm1c1cm22c7cm2cm2c2c1cm12cm28cm21cm4cm14_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm15c5c2cm4c6c3cm19c5c2c8c0c2cm3c3cm4c0,
			CxB => R_cm3cm11cm2cm1c1cm22c7cm2cm2c2c1cm12cm28cm21cm4cm14
		);

    c0c1cm2c1cm7c0cm8cm2cm1c1cm5c1c1cm1c24c8_cm9c1cm1c4cm15c2c2c4cm3c3cm2cm3cm20c0c9c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c1cm2c1cm7c0cm8cm2cm1c1cm5c1c1cm1c24c8_weight(1)(6-1 downto 0),
			B	=> cm9c1cm1c4cm15c2c2c4cm3c3cm2cm3cm20c0c9c7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c1cm2c1cm7c0cm8cm2cm1c1cm5c1c1cm1c24c8,
			CxB => R_cm9c1cm1c4cm15c2c2c4cm3c3cm2cm3cm20c0c9c7
		);




end architecture;
