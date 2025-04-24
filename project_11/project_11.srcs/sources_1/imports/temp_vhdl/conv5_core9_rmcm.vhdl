library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core9_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm5cm7c57c0cm2cm1cm1c1cm14cm2cm4c3cm8cm2c26c0 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c15c2c4c4c2c0c1cm75cm11c7c2cm1c27c6c14c20 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c2c8c2c1c15c2c9c53cm2c2c5c1cm2c14c21cm6 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0cm41cm1c2c0c6cm90c16c9c2c4c0cm7c13c3cm3 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm3c0cm6cm1c0c3c36c0cm35cm1cm2cm4cm5c4cm17c4 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c3c4cm1cm9cm2cm1cm9c4cm10cm9c0cm12c1c9c5c8 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm2c0c2cm2c1cm1c0c1cm2c27c2c2c23c4c4c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c2cm12cm5cm2c11c1c5cm4c2c3c0cm7cm7cm18cm36cm17 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm1c0cm1cm4cm6cm2c3c0c1cm3c11cm2cm2c0cm4cm3 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm8cm1c6c0cm1cm3c6c8c9c1c15c0cm19c4cm10cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c2cm14c2cm1cm1c5cm2cm4c2c5cm1cm5cm3cm27c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2c4c0c16c1cm1c2c0c8cm3cm16cm5c1c26c1c3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2cm3c7c2c1c0cm7cm7c27cm14cm16cm1c0cm2c10c3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c2c1cm1c1c1c0c3cm3c4cm1c11cm3cm2c0cm9cm12 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm1cm1c10c1c1cm5c0c0c0cm2cm1c34cm13cm3cm5c8 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c6c0c3c1cm2cm1c15c1c9c0cm1cm4c2c8c5c2 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c11c2c1cm2c1c1cm3c1cm8c1cm2c11c15c22c2cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm5cm2c3cm1cm1c5c0cm1c0c3cm13c9c5cm4cm3cm18 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c4c1c10c6cm1c1cm1c2c13c20cm8cm5c10cm3c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1cm1c9cm31c1cm2cm1cm2c5cm2cm8c6c19c2c11cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1c0cm1cm2c1c0c4c8cm1c0cm6cm2cm2c0cm47cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm10c0c2cm2c2cm10c2cm4c2c2c56cm28c1cm3c0c8 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm1cm1c3c3c13c0c19cm3cm4cm8c0c2c29cm34c6cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c4c2c6c3c2cm3cm1cm1cm4c0c5c3c13cm22c7cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm6c1c1c7c1cm2c0c6c8cm5c4cm6cm2cm26c6c8 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c1c0cm2c3cm1c0c2c0c4c2c0c0c18cm2c9 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c2c1c9cm2c37cm1cm1cm5c0cm1c5cm4c13c6c2c6 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm1c0c6cm3cm4cm4cm1cm11c9cm9cm6cm3c29c0cm3c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3cm1c13c1cm1cm2cm9cm3c3cm2cm9cm4c7c3c2c5 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c12cm3c2c2c0c2c0cm2cm4cm11cm3c7c9cm16c5cm14 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1c0cm74cm1c50cm1c2c1c2cm4c21cm3c2c2cm16cm3 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c0c6c5c0c7cm7c5c1c0cm5c0cm5c0cm7cm4cm6 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core9_rmcm;

architecture arch of conv5_core9_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM7C57C0CM2CM1CM1C1CM14CM2CM4C3CM8CM2C26C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C15C2C4C4C2C0C1CM75CM11C7C2CM1C27C6C14C20_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C8C2C1C15C2C9C53CM2C2C5C1CM2C14C21CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM41CM1C2C0C6CM90C16C9C2C4C0CM7C13C3CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C0CM6CM1C0C3C36C0CM35CM1CM2CM4CM5C4CM17C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C4CM1CM9CM2CM1CM9C4CM10CM9C0CM12C1C9C5C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C0C2CM2C1CM1C0C1CM2C27C2C2C23C4C4C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM12CM5CM2C11C1C5CM4C2C3C0CM7CM7CM18CM36CM17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0CM1CM4CM6CM2C3C0C1CM3C11CM2CM2C0CM4CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8CM1C6C0CM1CM3C6C8C9C1C15C0CM19C4CM10CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C2CM14C2CM1CM1C5CM2CM4C2C5CM1CM5CM3CM27C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C4C0C16C1CM1C2C0C8CM3CM16CM5C1C26C1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM3C7C2C1C0CM7CM7C27CM14CM16CM1C0CM2C10C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1CM1C1C1C0C3CM3C4CM1C11CM3CM2C0CM9CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C10C1C1CM5C0C0C0CM2CM1C34CM13CM3CM5C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C0C3C1CM2CM1C15C1C9C0CM1CM4C2C8C5C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C2C1CM2C1C1CM3C1CM8C1CM2C11C15C22C2CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM2C3CM1CM1C5C0CM1C0C3CM13C9C5CM4CM3CM18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C4C1C10C6CM1C1CM1C2C13C20CM8CM5C10CM3C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM1C9CM31C1CM2CM1CM2C5CM2CM8C6C19C2C11CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0CM1CM2C1C0C4C8CM1C0CM6CM2CM2C0CM47CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C0C2CM2C2CM10C2CM4C2C2C56CM28C1CM3C0C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C3C3C13C0C19CM3CM4CM8C0C2C29CM34C6CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C2C6C3C2CM3CM1CM1CM4C0C5C3C13CM22C7CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C1C1C7C1CM2C0C6C8CM5C4CM6CM2CM26C6C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1C0CM2C3CM1C0C2C0C4C2C0C0C18CM2C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1C9CM2C37CM1CM1CM5C0CM1C5CM4C13C6C2C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0C6CM3CM4CM4CM1CM11C9CM9CM6CM3C29C0CM3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM1C13C1CM1CM2CM9CM3C3CM2CM9CM4C7C3C2C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12CM3C2C2C0C2C0CM2CM4CM11CM3C7C9CM16C5CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0CM74CM1C50CM1C2C1C2CM4C21CM3C2C2CM16CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C6C5C0C7CM7C5C1C0CM5C0CM5C0CM7CM4CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal cm5cm7c57c0cm2cm1cm1c1cm14cm2cm4c3cm8cm2c26c0_weight : PIPELINE_TYPE_FOR_CM5CM7C57C0CM2CM1CM1C1CM14CM2CM4C3CM8CM2C26C0_WEIGHT;
    -- sfix(2, -6)
    signal c15c2c4c4c2c0c1cm75cm11c7c2cm1c27c6c14c20_weight : PIPELINE_TYPE_FOR_C15C2C4C4C2C0C1CM75CM11C7C2CM1C27C6C14C20_WEIGHT;
    -- sfix(2, -6)
    signal c2c8c2c1c15c2c9c53cm2c2c5c1cm2c14c21cm6_weight : PIPELINE_TYPE_FOR_C2C8C2C1C15C2C9C53CM2C2C5C1CM2C14C21CM6_WEIGHT;
    -- sfix(2, -6)
    signal c0cm41cm1c2c0c6cm90c16c9c2c4c0cm7c13c3cm3_weight : PIPELINE_TYPE_FOR_C0CM41CM1C2C0C6CM90C16C9C2C4C0CM7C13C3CM3_WEIGHT;
    -- sfix(2, -6)
    signal cm3c0cm6cm1c0c3c36c0cm35cm1cm2cm4cm5c4cm17c4_weight : PIPELINE_TYPE_FOR_CM3C0CM6CM1C0C3C36C0CM35CM1CM2CM4CM5C4CM17C4_WEIGHT;
    -- sfix(2, -6)
    signal c3c4cm1cm9cm2cm1cm9c4cm10cm9c0cm12c1c9c5c8_weight : PIPELINE_TYPE_FOR_C3C4CM1CM9CM2CM1CM9C4CM10CM9C0CM12C1C9C5C8_WEIGHT;
    -- sfix(2, -6)
    signal cm2c0c2cm2c1cm1c0c1cm2c27c2c2c23c4c4c0_weight : PIPELINE_TYPE_FOR_CM2C0C2CM2C1CM1C0C1CM2C27C2C2C23C4C4C0_WEIGHT;
    -- sfix(2, -6)
    signal c2cm12cm5cm2c11c1c5cm4c2c3c0cm7cm7cm18cm36cm17_weight : PIPELINE_TYPE_FOR_C2CM12CM5CM2C11C1C5CM4C2C3C0CM7CM7CM18CM36CM17_WEIGHT;
    -- sfix(2, -6)
    signal cm1c0cm1cm4cm6cm2c3c0c1cm3c11cm2cm2c0cm4cm3_weight : PIPELINE_TYPE_FOR_CM1C0CM1CM4CM6CM2C3C0C1CM3C11CM2CM2C0CM4CM3_WEIGHT;
    -- sfix(2, -6)
    signal cm8cm1c6c0cm1cm3c6c8c9c1c15c0cm19c4cm10cm5_weight : PIPELINE_TYPE_FOR_CM8CM1C6C0CM1CM3C6C8C9C1C15C0CM19C4CM10CM5_WEIGHT;
    -- sfix(2, -6)
    signal c0c2cm14c2cm1cm1c5cm2cm4c2c5cm1cm5cm3cm27c0_weight : PIPELINE_TYPE_FOR_C0C2CM14C2CM1CM1C5CM2CM4C2C5CM1CM5CM3CM27C0_WEIGHT;
    -- sfix(2, -6)
    signal cm2c4c0c16c1cm1c2c0c8cm3cm16cm5c1c26c1c3_weight : PIPELINE_TYPE_FOR_CM2C4C0C16C1CM1C2C0C8CM3CM16CM5C1C26C1C3_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm3c7c2c1c0cm7cm7c27cm14cm16cm1c0cm2c10c3_weight : PIPELINE_TYPE_FOR_CM2CM3C7C2C1C0CM7CM7C27CM14CM16CM1C0CM2C10C3_WEIGHT;
    -- sfix(2, -6)
    signal c2c1cm1c1c1c0c3cm3c4cm1c11cm3cm2c0cm9cm12_weight : PIPELINE_TYPE_FOR_C2C1CM1C1C1C0C3CM3C4CM1C11CM3CM2C0CM9CM12_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm1c10c1c1cm5c0c0c0cm2cm1c34cm13cm3cm5c8_weight : PIPELINE_TYPE_FOR_CM1CM1C10C1C1CM5C0C0C0CM2CM1C34CM13CM3CM5C8_WEIGHT;
    -- sfix(2, -6)
    signal c6c0c3c1cm2cm1c15c1c9c0cm1cm4c2c8c5c2_weight : PIPELINE_TYPE_FOR_C6C0C3C1CM2CM1C15C1C9C0CM1CM4C2C8C5C2_WEIGHT;
    -- sfix(2, -6)
    signal c11c2c1cm2c1c1cm3c1cm8c1cm2c11c15c22c2cm3_weight : PIPELINE_TYPE_FOR_C11C2C1CM2C1C1CM3C1CM8C1CM2C11C15C22C2CM3_WEIGHT;
    -- sfix(2, -6)
    signal cm5cm2c3cm1cm1c5c0cm1c0c3cm13c9c5cm4cm3cm18_weight : PIPELINE_TYPE_FOR_CM5CM2C3CM1CM1C5C0CM1C0C3CM13C9C5CM4CM3CM18_WEIGHT;
    -- sfix(2, -6)
    signal c0c4c1c10c6cm1c1cm1c2c13c20cm8cm5c10cm3c2_weight : PIPELINE_TYPE_FOR_C0C4C1C10C6CM1C1CM1C2C13C20CM8CM5C10CM3C2_WEIGHT;
    -- sfix(2, -6)
    signal c1cm1c9cm31c1cm2cm1cm2c5cm2cm8c6c19c2c11cm1_weight : PIPELINE_TYPE_FOR_C1CM1C9CM31C1CM2CM1CM2C5CM2CM8C6C19C2C11CM1_WEIGHT;
    -- sfix(2, -6)
    signal c1c0cm1cm2c1c0c4c8cm1c0cm6cm2cm2c0cm47cm3_weight : PIPELINE_TYPE_FOR_C1C0CM1CM2C1C0C4C8CM1C0CM6CM2CM2C0CM47CM3_WEIGHT;
    -- sfix(2, -6)
    signal cm10c0c2cm2c2cm10c2cm4c2c2c56cm28c1cm3c0c8_weight : PIPELINE_TYPE_FOR_CM10C0C2CM2C2CM10C2CM4C2C2C56CM28C1CM3C0C8_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm1c3c3c13c0c19cm3cm4cm8c0c2c29cm34c6cm3_weight : PIPELINE_TYPE_FOR_CM1CM1C3C3C13C0C19CM3CM4CM8C0C2C29CM34C6CM3_WEIGHT;
    -- sfix(2, -6)
    signal c4c2c6c3c2cm3cm1cm1cm4c0c5c3c13cm22c7cm3_weight : PIPELINE_TYPE_FOR_C4C2C6C3C2CM3CM1CM1CM4C0C5C3C13CM22C7CM3_WEIGHT;
    -- sfix(2, -6)
    signal cm6c1c1c7c1cm2c0c6c8cm5c4cm6cm2cm26c6c8_weight : PIPELINE_TYPE_FOR_CM6C1C1C7C1CM2C0C6C8CM5C4CM6CM2CM26C6C8_WEIGHT;
    -- sfix(2, -6)
    signal c0c1c0cm2c3cm1c0c2c0c4c2c0c0c18cm2c9_weight : PIPELINE_TYPE_FOR_C0C1C0CM2C3CM1C0C2C0C4C2C0C0C18CM2C9_WEIGHT;
    -- sfix(2, -6)
    signal c2c1c9cm2c37cm1cm1cm5c0cm1c5cm4c13c6c2c6_weight : PIPELINE_TYPE_FOR_C2C1C9CM2C37CM1CM1CM5C0CM1C5CM4C13C6C2C6_WEIGHT;
    -- sfix(2, -6)
    signal cm1c0c6cm3cm4cm4cm1cm11c9cm9cm6cm3c29c0cm3c0_weight : PIPELINE_TYPE_FOR_CM1C0C6CM3CM4CM4CM1CM11C9CM9CM6CM3C29C0CM3C0_WEIGHT;
    -- sfix(2, -6)
    signal c3cm1c13c1cm1cm2cm9cm3c3cm2cm9cm4c7c3c2c5_weight : PIPELINE_TYPE_FOR_C3CM1C13C1CM1CM2CM9CM3C3CM2CM9CM4C7C3C2C5_WEIGHT;
    -- sfix(2, -6)
    signal c12cm3c2c2c0c2c0cm2cm4cm11cm3c7c9cm16c5cm14_weight : PIPELINE_TYPE_FOR_C12CM3C2C2C0C2C0CM2CM4CM11CM3C7C9CM16C5CM14_WEIGHT;
    -- sfix(2, -6)
    signal c1c0cm74cm1c50cm1c2c1c2cm4c21cm3c2c2cm16cm3_weight : PIPELINE_TYPE_FOR_C1C0CM74CM1C50CM1C2C1C2CM4C21CM3C2C2CM16CM3_WEIGHT;
    -- sfix(2, -6)
    signal c0c6c5c0c7cm7c5c1c0cm5c0cm5c0cm7cm4cm6_weight : PIPELINE_TYPE_FOR_C0C6C5C0C7CM7C5C1C0CM5C0CM5C0CM7CM4CM6_WEIGHT;
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



    WEIGHT_ROM: entity work.conv5_core9_rmcm_weightsconstant_memory
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
        
            dout1   => cm5cm7c57c0cm2cm1cm1c1cm14cm2cm4c3cm8cm2c26c0_weight(0), 
            dout2   => c15c2c4c4c2c0c1cm75cm11c7c2cm1c27c6c14c20_weight(0), 
            dout3   => c2c8c2c1c15c2c9c53cm2c2c5c1cm2c14c21cm6_weight(0), 
            dout4   => c0cm41cm1c2c0c6cm90c16c9c2c4c0cm7c13c3cm3_weight(0), 
            dout5   => cm3c0cm6cm1c0c3c36c0cm35cm1cm2cm4cm5c4cm17c4_weight(0), 
            dout6   => c3c4cm1cm9cm2cm1cm9c4cm10cm9c0cm12c1c9c5c8_weight(0), 
            dout7   => cm2c0c2cm2c1cm1c0c1cm2c27c2c2c23c4c4c0_weight(0), 
            dout8   => c2cm12cm5cm2c11c1c5cm4c2c3c0cm7cm7cm18cm36cm17_weight(0), 
            dout9   => cm1c0cm1cm4cm6cm2c3c0c1cm3c11cm2cm2c0cm4cm3_weight(0), 
            dout10   => cm8cm1c6c0cm1cm3c6c8c9c1c15c0cm19c4cm10cm5_weight(0), 
            dout11   => c0c2cm14c2cm1cm1c5cm2cm4c2c5cm1cm5cm3cm27c0_weight(0), 
            dout12   => cm2c4c0c16c1cm1c2c0c8cm3cm16cm5c1c26c1c3_weight(0), 
            dout13   => cm2cm3c7c2c1c0cm7cm7c27cm14cm16cm1c0cm2c10c3_weight(0), 
            dout14   => c2c1cm1c1c1c0c3cm3c4cm1c11cm3cm2c0cm9cm12_weight(0), 
            dout15   => cm1cm1c10c1c1cm5c0c0c0cm2cm1c34cm13cm3cm5c8_weight(0), 
            dout16   => c6c0c3c1cm2cm1c15c1c9c0cm1cm4c2c8c5c2_weight(0), 
            dout17   => c11c2c1cm2c1c1cm3c1cm8c1cm2c11c15c22c2cm3_weight(0), 
            dout18   => cm5cm2c3cm1cm1c5c0cm1c0c3cm13c9c5cm4cm3cm18_weight(0), 
            dout19   => c0c4c1c10c6cm1c1cm1c2c13c20cm8cm5c10cm3c2_weight(0), 
            dout20   => c1cm1c9cm31c1cm2cm1cm2c5cm2cm8c6c19c2c11cm1_weight(0), 
            dout21   => c1c0cm1cm2c1c0c4c8cm1c0cm6cm2cm2c0cm47cm3_weight(0), 
            dout22   => cm10c0c2cm2c2cm10c2cm4c2c2c56cm28c1cm3c0c8_weight(0), 
            dout23   => cm1cm1c3c3c13c0c19cm3cm4cm8c0c2c29cm34c6cm3_weight(0), 
            dout24   => c4c2c6c3c2cm3cm1cm1cm4c0c5c3c13cm22c7cm3_weight(0), 
            dout25   => cm6c1c1c7c1cm2c0c6c8cm5c4cm6cm2cm26c6c8_weight(0), 
            dout26   => c0c1c0cm2c3cm1c0c2c0c4c2c0c0c18cm2c9_weight(0), 
            dout27   => c2c1c9cm2c37cm1cm1cm5c0cm1c5cm4c13c6c2c6_weight(0), 
            dout28   => cm1c0c6cm3cm4cm4cm1cm11c9cm9cm6cm3c29c0cm3c0_weight(0), 
            dout29   => c3cm1c13c1cm1cm2cm9cm3c3cm2cm9cm4c7c3c2c5_weight(0), 
            dout30   => c12cm3c2c2c0c2c0cm2cm4cm11cm3c7c9cm16c5cm14_weight(0), 
            dout31   => c1c0cm74cm1c50cm1c2c1c2cm4c21cm3c2c2cm16cm3_weight(0), 
            dout32   => c0c6c5c0c7cm7c5c1c0cm5c0cm5c0cm7cm4cm6_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm5cm7c57c0cm2cm1cm1c1cm14cm2cm4c3cm8cm2c26c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm7c57c0cm2cm1cm1c1cm14cm2cm4c3cm8cm2c26c0_weight(0), cm5cm7c57c0cm2cm1cm1c1cm14cm2cm4c3cm8cm2c26c0_weight(1));
    PL_STEP_0_for_c15c2c4c4c2c0c1cm75cm11c7c2cm1c27c6c14c20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c15c2c4c4c2c0c1cm75cm11c7c2cm1c27c6c14c20_weight(0), c15c2c4c4c2c0c1cm75cm11c7c2cm1c27c6c14c20_weight(1));
    PL_STEP_0_for_c2c8c2c1c15c2c9c53cm2c2c5c1cm2c14c21cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c8c2c1c15c2c9c53cm2c2c5c1cm2c14c21cm6_weight(0), c2c8c2c1c15c2c9c53cm2c2c5c1cm2c14c21cm6_weight(1));
    PL_STEP_0_for_c0cm41cm1c2c0c6cm90c16c9c2c4c0cm7c13c3cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm41cm1c2c0c6cm90c16c9c2c4c0cm7c13c3cm3_weight(0), c0cm41cm1c2c0c6cm90c16c9c2c4c0cm7c13c3cm3_weight(1));
    PL_STEP_0_for_cm3c0cm6cm1c0c3c36c0cm35cm1cm2cm4cm5c4cm17c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c0cm6cm1c0c3c36c0cm35cm1cm2cm4cm5c4cm17c4_weight(0), cm3c0cm6cm1c0c3c36c0cm35cm1cm2cm4cm5c4cm17c4_weight(1));
    PL_STEP_0_for_c3c4cm1cm9cm2cm1cm9c4cm10cm9c0cm12c1c9c5c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c4cm1cm9cm2cm1cm9c4cm10cm9c0cm12c1c9c5c8_weight(0), c3c4cm1cm9cm2cm1cm9c4cm10cm9c0cm12c1c9c5c8_weight(1));
    PL_STEP_0_for_cm2c0c2cm2c1cm1c0c1cm2c27c2c2c23c4c4c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c0c2cm2c1cm1c0c1cm2c27c2c2c23c4c4c0_weight(0), cm2c0c2cm2c1cm1c0c1cm2c27c2c2c23c4c4c0_weight(1));
    PL_STEP_0_for_c2cm12cm5cm2c11c1c5cm4c2c3c0cm7cm7cm18cm36cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm12cm5cm2c11c1c5cm4c2c3c0cm7cm7cm18cm36cm17_weight(0), c2cm12cm5cm2c11c1c5cm4c2c3c0cm7cm7cm18cm36cm17_weight(1));
    PL_STEP_0_for_cm1c0cm1cm4cm6cm2c3c0c1cm3c11cm2cm2c0cm4cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0cm1cm4cm6cm2c3c0c1cm3c11cm2cm2c0cm4cm3_weight(0), cm1c0cm1cm4cm6cm2c3c0c1cm3c11cm2cm2c0cm4cm3_weight(1));
    PL_STEP_0_for_cm8cm1c6c0cm1cm3c6c8c9c1c15c0cm19c4cm10cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8cm1c6c0cm1cm3c6c8c9c1c15c0cm19c4cm10cm5_weight(0), cm8cm1c6c0cm1cm3c6c8c9c1c15c0cm19c4cm10cm5_weight(1));
    PL_STEP_0_for_c0c2cm14c2cm1cm1c5cm2cm4c2c5cm1cm5cm3cm27c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c2cm14c2cm1cm1c5cm2cm4c2c5cm1cm5cm3cm27c0_weight(0), c0c2cm14c2cm1cm1c5cm2cm4c2c5cm1cm5cm3cm27c0_weight(1));
    PL_STEP_0_for_cm2c4c0c16c1cm1c2c0c8cm3cm16cm5c1c26c1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c4c0c16c1cm1c2c0c8cm3cm16cm5c1c26c1c3_weight(0), cm2c4c0c16c1cm1c2c0c8cm3cm16cm5c1c26c1c3_weight(1));
    PL_STEP_0_for_cm2cm3c7c2c1c0cm7cm7c27cm14cm16cm1c0cm2c10c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm3c7c2c1c0cm7cm7c27cm14cm16cm1c0cm2c10c3_weight(0), cm2cm3c7c2c1c0cm7cm7c27cm14cm16cm1c0cm2c10c3_weight(1));
    PL_STEP_0_for_c2c1cm1c1c1c0c3cm3c4cm1c11cm3cm2c0cm9cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1cm1c1c1c0c3cm3c4cm1c11cm3cm2c0cm9cm12_weight(0), c2c1cm1c1c1c0c3cm3c4cm1c11cm3cm2c0cm9cm12_weight(1));
    PL_STEP_0_for_cm1cm1c10c1c1cm5c0c0c0cm2cm1c34cm13cm3cm5c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c10c1c1cm5c0c0c0cm2cm1c34cm13cm3cm5c8_weight(0), cm1cm1c10c1c1cm5c0c0c0cm2cm1c34cm13cm3cm5c8_weight(1));
    PL_STEP_0_for_c6c0c3c1cm2cm1c15c1c9c0cm1cm4c2c8c5c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c0c3c1cm2cm1c15c1c9c0cm1cm4c2c8c5c2_weight(0), c6c0c3c1cm2cm1c15c1c9c0cm1cm4c2c8c5c2_weight(1));
    PL_STEP_0_for_c11c2c1cm2c1c1cm3c1cm8c1cm2c11c15c22c2cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c2c1cm2c1c1cm3c1cm8c1cm2c11c15c22c2cm3_weight(0), c11c2c1cm2c1c1cm3c1cm8c1cm2c11c15c22c2cm3_weight(1));
    PL_STEP_0_for_cm5cm2c3cm1cm1c5c0cm1c0c3cm13c9c5cm4cm3cm18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm2c3cm1cm1c5c0cm1c0c3cm13c9c5cm4cm3cm18_weight(0), cm5cm2c3cm1cm1c5c0cm1c0c3cm13c9c5cm4cm3cm18_weight(1));
    PL_STEP_0_for_c0c4c1c10c6cm1c1cm1c2c13c20cm8cm5c10cm3c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c4c1c10c6cm1c1cm1c2c13c20cm8cm5c10cm3c2_weight(0), c0c4c1c10c6cm1c1cm1c2c13c20cm8cm5c10cm3c2_weight(1));
    PL_STEP_0_for_c1cm1c9cm31c1cm2cm1cm2c5cm2cm8c6c19c2c11cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm1c9cm31c1cm2cm1cm2c5cm2cm8c6c19c2c11cm1_weight(0), c1cm1c9cm31c1cm2cm1cm2c5cm2cm8c6c19c2c11cm1_weight(1));
    PL_STEP_0_for_c1c0cm1cm2c1c0c4c8cm1c0cm6cm2cm2c0cm47cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0cm1cm2c1c0c4c8cm1c0cm6cm2cm2c0cm47cm3_weight(0), c1c0cm1cm2c1c0c4c8cm1c0cm6cm2cm2c0cm47cm3_weight(1));
    PL_STEP_0_for_cm10c0c2cm2c2cm10c2cm4c2c2c56cm28c1cm3c0c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c0c2cm2c2cm10c2cm4c2c2c56cm28c1cm3c0c8_weight(0), cm10c0c2cm2c2cm10c2cm4c2c2c56cm28c1cm3c0c8_weight(1));
    PL_STEP_0_for_cm1cm1c3c3c13c0c19cm3cm4cm8c0c2c29cm34c6cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c3c3c13c0c19cm3cm4cm8c0c2c29cm34c6cm3_weight(0), cm1cm1c3c3c13c0c19cm3cm4cm8c0c2c29cm34c6cm3_weight(1));
    PL_STEP_0_for_c4c2c6c3c2cm3cm1cm1cm4c0c5c3c13cm22c7cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c2c6c3c2cm3cm1cm1cm4c0c5c3c13cm22c7cm3_weight(0), c4c2c6c3c2cm3cm1cm1cm4c0c5c3c13cm22c7cm3_weight(1));
    PL_STEP_0_for_cm6c1c1c7c1cm2c0c6c8cm5c4cm6cm2cm26c6c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c1c1c7c1cm2c0c6c8cm5c4cm6cm2cm26c6c8_weight(0), cm6c1c1c7c1cm2c0c6c8cm5c4cm6cm2cm26c6c8_weight(1));
    PL_STEP_0_for_c0c1c0cm2c3cm1c0c2c0c4c2c0c0c18cm2c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1c0cm2c3cm1c0c2c0c4c2c0c0c18cm2c9_weight(0), c0c1c0cm2c3cm1c0c2c0c4c2c0c0c18cm2c9_weight(1));
    PL_STEP_0_for_c2c1c9cm2c37cm1cm1cm5c0cm1c5cm4c13c6c2c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1c9cm2c37cm1cm1cm5c0cm1c5cm4c13c6c2c6_weight(0), c2c1c9cm2c37cm1cm1cm5c0cm1c5cm4c13c6c2c6_weight(1));
    PL_STEP_0_for_cm1c0c6cm3cm4cm4cm1cm11c9cm9cm6cm3c29c0cm3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0c6cm3cm4cm4cm1cm11c9cm9cm6cm3c29c0cm3c0_weight(0), cm1c0c6cm3cm4cm4cm1cm11c9cm9cm6cm3c29c0cm3c0_weight(1));
    PL_STEP_0_for_c3cm1c13c1cm1cm2cm9cm3c3cm2cm9cm4c7c3c2c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm1c13c1cm1cm2cm9cm3c3cm2cm9cm4c7c3c2c5_weight(0), c3cm1c13c1cm1cm2cm9cm3c3cm2cm9cm4c7c3c2c5_weight(1));
    PL_STEP_0_for_c12cm3c2c2c0c2c0cm2cm4cm11cm3c7c9cm16c5cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12cm3c2c2c0c2c0cm2cm4cm11cm3c7c9cm16c5cm14_weight(0), c12cm3c2c2c0c2c0cm2cm4cm11cm3c7c9cm16c5cm14_weight(1));
    PL_STEP_0_for_c1c0cm74cm1c50cm1c2c1c2cm4c21cm3c2c2cm16cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0cm74cm1c50cm1c2c1c2cm4c21cm3c2c2cm16cm3_weight(0), c1c0cm74cm1c50cm1c2c1c2cm4c21cm3c2c2cm16cm3_weight(1));
    PL_STEP_0_for_c0c6c5c0c7cm7c5c1c0cm5c0cm5c0cm7cm4cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c6c5c0c7cm7c5c1c0cm5c0cm5c0cm7cm4cm6_weight(0), c0c6c5c0c7cm7c5c1c0cm5c0cm5c0cm7cm4cm6_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c15c2c4c4c2c0c1cm75cm11c7c2cm1c27c6c14c20_c0c6c5c0c7cm7c5c1c0cm5c0cm5c0cm7cm4cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c15c2c4c4c2c0c1cm75cm11c7c2cm1c27c6c14c20_weight(1)(8-1 downto 0),
			B	=> c0c6c5c0c7cm7c5c1c0cm5c0cm5c0cm7cm4cm6_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c15c2c4c4c2c0c1cm75cm11c7c2cm1c27c6c14c20,
			CxB => R_c0c6c5c0c7cm7c5c1c0cm5c0cm5c0cm7cm4cm6
		);

    c0cm41cm1c2c0c6cm90c16c9c2c4c0cm7c13c3cm3_c12cm3c2c2c0c2c0cm2cm4cm11cm3c7c9cm16c5cm14_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0cm41cm1c2c0c6cm90c16c9c2c4c0cm7c13c3cm3_weight(1)(8-1 downto 0),
			B	=> c12cm3c2c2c0c2c0cm2cm4cm11cm3c7c9cm16c5cm14_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm41cm1c2c0c6cm90c16c9c2c4c0cm7c13c3cm3,
			CxB => R_c12cm3c2c2c0c2c0cm2cm4cm11cm3c7c9cm16c5cm14
		);

    c1c0cm74cm1c50cm1c2c1c2cm4c21cm3c2c2cm16cm3_c3cm1c13c1cm1cm2cm9cm3c3cm2cm9cm4c7c3c2c5_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c0cm74cm1c50cm1c2c1c2cm4c21cm3c2c2cm16cm3_weight(1)(8-1 downto 0),
			B	=> c3cm1c13c1cm1cm2cm9cm3c3cm2cm9cm4c7c3c2c5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c0cm74cm1c50cm1c2c1c2cm4c21cm3c2c2cm16cm3,
			CxB => R_c3cm1c13c1cm1cm2cm9cm3c3cm2cm9cm4c7c3c2c5
		);

    cm5cm7c57c0cm2cm1cm1c1cm14cm2cm4c3cm8cm2c26c0_c6c0c3c1cm2cm1c15c1c9c0cm1cm4c2c8c5c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5cm7c57c0cm2cm1cm1c1cm14cm2cm4c3cm8cm2c26c0_weight(1)(7-1 downto 0),
			B	=> c6c0c3c1cm2cm1c15c1c9c0cm1cm4c2c8c5c2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5cm7c57c0cm2cm1cm1c1cm14cm2cm4c3cm8cm2c26c0,
			CxB => R_c6c0c3c1cm2cm1c15c1c9c0cm1cm4c2c8c5c2
		);

    c2c8c2c1c15c2c9c53cm2c2c5c1cm2c14c21cm6_c2c1cm1c1c1c0c3cm3c4cm1c11cm3cm2c0cm9cm12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c8c2c1c15c2c9c53cm2c2c5c1cm2c14c21cm6_weight(1)(7-1 downto 0),
			B	=> c2c1cm1c1c1c0c3cm3c4cm1c11cm3cm2c0cm9cm12_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c8c2c1c15c2c9c53cm2c2c5c1cm2c14c21cm6,
			CxB => R_c2c1cm1c1c1c0c3cm3c4cm1c11cm3cm2c0cm9cm12
		);

    cm3c0cm6cm1c0c3c36c0cm35cm1cm2cm4cm5c4cm17c4_cm1c0cm1cm4cm6cm2c3c0c1cm3c11cm2cm2c0cm4cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c0cm6cm1c0c3c36c0cm35cm1cm2cm4cm5c4cm17c4_weight(1)(7-1 downto 0),
			B	=> cm1c0cm1cm4cm6cm2c3c0c1cm3c11cm2cm2c0cm4cm3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c0cm6cm1c0c3c36c0cm35cm1cm2cm4cm5c4cm17c4,
			CxB => R_cm1c0cm1cm4cm6cm2c3c0c1cm3c11cm2cm2c0cm4cm3
		);

    c2cm12cm5cm2c11c1c5cm4c2c3c0cm7cm7cm18cm36cm17_c3c4cm1cm9cm2cm1cm9c4cm10cm9c0cm12c1c9c5c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2cm12cm5cm2c11c1c5cm4c2c3c0cm7cm7cm18cm36cm17_weight(1)(7-1 downto 0),
			B	=> c3c4cm1cm9cm2cm1cm9c4cm10cm9c0cm12c1c9c5c8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm12cm5cm2c11c1c5cm4c2c3c0cm7cm7cm18cm36cm17,
			CxB => R_c3c4cm1cm9cm2cm1cm9c4cm10cm9c0cm12c1c9c5c8
		);

    cm1cm1c10c1c1cm5c0c0c0cm2cm1c34cm13cm3cm5c8_cm1c0c6cm3cm4cm4cm1cm11c9cm9cm6cm3c29c0cm3c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm1c10c1c1cm5c0c0c0cm2cm1c34cm13cm3cm5c8_weight(1)(7-1 downto 0),
			B	=> cm1c0c6cm3cm4cm4cm1cm11c9cm9cm6cm3c29c0cm3c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm1c10c1c1cm5c0c0c0cm2cm1c34cm13cm3cm5c8,
			CxB => R_cm1c0c6cm3cm4cm4cm1cm11c9cm9cm6cm3c29c0cm3c0
		);

    c1c0cm1cm2c1c0c4c8cm1c0cm6cm2cm2c0cm47cm3_c0c1c0cm2c3cm1c0c2c0c4c2c0c0c18cm2c9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c0cm1cm2c1c0c4c8cm1c0cm6cm2cm2c0cm47cm3_weight(1)(7-1 downto 0),
			B	=> c0c1c0cm2c3cm1c0c2c0c4c2c0c0c18cm2c9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c0cm1cm2c1c0c4c8cm1c0cm6cm2cm2c0cm47cm3,
			CxB => R_c0c1c0cm2c3cm1c0c2c0c4c2c0c0c18cm2c9
		);

    cm10c0c2cm2c2cm10c2cm4c2c2c56cm28c1cm3c0c8_cm6c1c1c7c1cm2c0c6c8cm5c4cm6cm2cm26c6c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm10c0c2cm2c2cm10c2cm4c2c2c56cm28c1cm3c0c8_weight(1)(7-1 downto 0),
			B	=> cm6c1c1c7c1cm2c0c6c8cm5c4cm6cm2cm26c6c8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10c0c2cm2c2cm10c2cm4c2c2c56cm28c1cm3c0c8,
			CxB => R_cm6c1c1c7c1cm2c0c6c8cm5c4cm6cm2cm26c6c8
		);

    cm1cm1c3c3c13c0c19cm3cm4cm8c0c2c29cm34c6cm3_c4c2c6c3c2cm3cm1cm1cm4c0c5c3c13cm22c7cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm1c3c3c13c0c19cm3cm4cm8c0c2c29cm34c6cm3_weight(1)(7-1 downto 0),
			B	=> c4c2c6c3c2cm3cm1cm1cm4c0c5c3c13cm22c7cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm1c3c3c13c0c19cm3cm4cm8c0c2c29cm34c6cm3,
			CxB => R_c4c2c6c3c2cm3cm1cm1cm4c0c5c3c13cm22c7cm3
		);

    c2c1c9cm2c37cm1cm1cm5c0cm1c5cm4c13c6c2c6_c1cm1c9cm31c1cm2cm1cm2c5cm2cm8c6c19c2c11cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c1c9cm2c37cm1cm1cm5c0cm1c5cm4c13c6c2c6_weight(1)(7-1 downto 0),
			B	=> c1cm1c9cm31c1cm2cm1cm2c5cm2cm8c6c19c2c11cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c1c9cm2c37cm1cm1cm5c0cm1c5cm4c13c6c2c6,
			CxB => R_c1cm1c9cm31c1cm2cm1cm2c5cm2cm8c6c19c2c11cm1
		);

    cm2c0c2cm2c1cm1c0c1cm2c27c2c2c23c4c4c0_c0c4c1c10c6cm1c1cm1c2c13c20cm8cm5c10cm3c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c0c2cm2c1cm1c0c1cm2c27c2c2c23c4c4c0_weight(1)(6-1 downto 0),
			B	=> c0c4c1c10c6cm1c1cm1c2c13c20cm8cm5c10cm3c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c0c2cm2c1cm1c0c1cm2c27c2c2c23c4c4c0,
			CxB => R_c0c4c1c10c6cm1c1cm1c2c13c20cm8cm5c10cm3c2
		);

    cm8cm1c6c0cm1cm3c6c8c9c1c15c0cm19c4cm10cm5_cm5cm2c3cm1cm1c5c0cm1c0c3cm13c9c5cm4cm3cm18_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm8cm1c6c0cm1cm3c6c8c9c1c15c0cm19c4cm10cm5_weight(1)(6-1 downto 0),
			B	=> cm5cm2c3cm1cm1c5c0cm1c0c3cm13c9c5cm4cm3cm18_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm8cm1c6c0cm1cm3c6c8c9c1c15c0cm19c4cm10cm5,
			CxB => R_cm5cm2c3cm1cm1c5c0cm1c0c3cm13c9c5cm4cm3cm18
		);

    c0c2cm14c2cm1cm1c5cm2cm4c2c5cm1cm5cm3cm27c0_c11c2c1cm2c1c1cm3c1cm8c1cm2c11c15c22c2cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c2cm14c2cm1cm1c5cm2cm4c2c5cm1cm5cm3cm27c0_weight(1)(6-1 downto 0),
			B	=> c11c2c1cm2c1c1cm3c1cm8c1cm2c11c15c22c2cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c2cm14c2cm1cm1c5cm2cm4c2c5cm1cm5cm3cm27c0,
			CxB => R_c11c2c1cm2c1c1cm3c1cm8c1cm2c11c15c22c2cm3
		);

    cm2c4c0c16c1cm1c2c0c8cm3cm16cm5c1c26c1c3_cm2cm3c7c2c1c0cm7cm7c27cm14cm16cm1c0cm2c10c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c4c0c16c1cm1c2c0c8cm3cm16cm5c1c26c1c3_weight(1)(6-1 downto 0),
			B	=> cm2cm3c7c2c1c0cm7cm7c27cm14cm16cm1c0cm2c10c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c4c0c16c1cm1c2c0c8cm3cm16cm5c1c26c1c3,
			CxB => R_cm2cm3c7c2c1c0cm7cm7c27cm14cm16cm1c0cm2c10c3
		);




end architecture;
