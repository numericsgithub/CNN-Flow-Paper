library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core24_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm5c4cm4c5c0c2cm1c5c6c1c36c0c7c4c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3c29cm5cm5c8cm12c1c44c12cm15cm15cm3c2c1cm6cm14 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3cm25cm5cm3cm1cm1cm18cm6c7cm5c2cm4cm6c1cm3c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c68c1cm3c4c116c2c7cm9cm5cm5c27cm27cm18cm6cm38cm19 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c11cm12c4c4cm12c22cm14cm24c47c6c8cm23cm54c1c5c19 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3cm1cm1cm20cm1cm14cm25cm15c10cm2c35cm6cm2cm3c0c5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm5c2c1cm1c13c15cm1cm20c0cm7cm1cm10cm5cm2cm1cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm4c7cm5c6c2cm3cm6cm1cm45c7cm35cm35c16cm6cm30c26 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm13c5cm6c5c8c0c4cm30cm5cm6c7c15cm3c34c0cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0cm8c9c5cm2c2c15cm2cm1c0cm7c5cm2cm10c0 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm5c4c9c24cm5cm3cm6cm16cm12c7c3cm11c27c8c0cm11 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2cm1c2cm4cm5c1c6cm5cm9cm1c7cm2cm8cm1cm1cm7 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm7c13c1c1cm8c14c1c2c20c4cm2c2cm11c24c0cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm6c1cm1c0cm17cm5cm11c12cm15c9c8cm3cm13cm2cm5c4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c3cm9c0cm7c8cm15cm13cm4c5cm37c3cm1c3cm37c0cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3c33cm3cm9cm3c0c4c9cm5c0cm3cm41cm6c5c0cm14 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6c35c2cm4c13c11c23cm4cm6cm9c5cm6cm71c6c7cm2 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm5c7cm1cm15c6cm7c2cm2c3cm4c3c1c2cm1cm3c4 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c9cm5c0c1c0cm4cm10c5cm17cm9c10cm1cm9cm2cm1cm11 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c4c4c8cm3cm5cm19cm2c2cm7c14c0c0c20cm20cm2cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2cm2cm1c57cm1c13cm3cm32c5c6c2cm9c2cm19cm3cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3cm2cm5cm13c21cm36cm18cm16cm18c8c6c5c80cm4cm11c0 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c4c9c1cm1cm1c8cm3c5c3c12c3cm8c7c6c6c9 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm2c1cm3c4cm15c11cm23c2cm11cm12cm8cm1c21c26c1c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1c2c3cm8c42c2c6c34cm40cm3c3cm3c42cm2c2c17 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3cm2cm14cm2cm44c3cm23cm4c5c27cm13c7cm6c5cm2cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c7c2c5c0c15c1cm2c0cm3c5cm1c4c12cm7cm10c9 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c6c1c8cm2c5cm13cm7cm1cm16c3c8c13c14c14cm11cm4 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm5c1c4cm2cm7c7c4cm13c44cm44cm4c0cm12cm9c2cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2cm16c8c1cm4cm3c5c0c9c0cm2cm2c11c7c7c3 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c5c5c2c0c2cm3c1cm9c8c15c3cm7c27c4c0cm16 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2c4cm7c0cm4c0cm6c17c3c10cm22c11c2cm10cm30c9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core24_rmcm;

architecture arch of conv7_core24_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C4CM4C5C0C2CM1C5C6C1C36C0C7C4C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C29CM5CM5C8CM12C1C44C12CM15CM15CM3C2C1CM6CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM25CM5CM3CM1CM1CM18CM6C7CM5C2CM4CM6C1CM3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C68C1CM3C4C116C2C7CM9CM5CM5C27CM27CM18CM6CM38CM19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11CM12C4C4CM12C22CM14CM24C47C6C8CM23CM54C1C5C19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM1CM1CM20CM1CM14CM25CM15C10CM2C35CM6CM2CM3C0C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C2C1CM1C13C15CM1CM20C0CM7CM1CM10CM5CM2CM1CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C7CM5C6C2CM3CM6CM1CM45C7CM35CM35C16CM6CM30C26_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C5CM6C5C8C0C4CM30CM5CM6C7C15CM3C34C0CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM8C9C5CM2C2C15CM2CM1C0CM7C5CM2CM10C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C4C9C24CM5CM3CM6CM16CM12C7C3CM11C27C8C0CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM1C2CM4CM5C1C6CM5CM9CM1C7CM2CM8CM1CM1CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C13C1C1CM8C14C1C2C20C4CM2C2CM11C24C0CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C1CM1C0CM17CM5CM11C12CM15C9C8CM3CM13CM2CM5C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM9C0CM7C8CM15CM13CM4C5CM37C3CM1C3CM37C0CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C33CM3CM9CM3C0C4C9CM5C0CM3CM41CM6C5C0CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C35C2CM4C13C11C23CM4CM6CM9C5CM6CM71C6C7CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C7CM1CM15C6CM7C2CM2C3CM4C3C1C2CM1CM3C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9CM5C0C1C0CM4CM10C5CM17CM9C10CM1CM9CM2CM1CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C4C8CM3CM5CM19CM2C2CM7C14C0C0C20CM20CM2CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM2CM1C57CM1C13CM3CM32C5C6C2CM9C2CM19CM3CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM2CM5CM13C21CM36CM18CM16CM18C8C6C5C80CM4CM11C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C9C1CM1CM1C8CM3C5C3C12C3CM8C7C6C6C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1CM3C4CM15C11CM23C2CM11CM12CM8CM1C21C26C1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C2C3CM8C42C2C6C34CM40CM3C3CM3C42CM2C2C17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM2CM14CM2CM44C3CM23CM4C5C27CM13C7CM6C5CM2CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C2C5C0C15C1CM2C0CM3C5CM1C4C12CM7CM10C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C1C8CM2C5CM13CM7CM1CM16C3C8C13C14C14CM11CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C1C4CM2CM7C7C4CM13C44CM44CM4C0CM12CM9C2CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM16C8C1CM4CM3C5C0C9C0CM2CM2C11C7C7C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C5C2C0C2CM3C1CM9C8C15C3CM7C27C4C0CM16_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C4CM7C0CM4C0CM6C17C3C10CM22C11C2CM10CM30C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm5c4cm4c5c0c2cm1c5c6c1c36c0c7c4c0c0_weight : PIPELINE_TYPE_FOR_CM5C4CM4C5C0C2CM1C5C6C1C36C0C7C4C0C0_WEIGHT;
    -- sfix(1, -7)
    signal c3c29cm5cm5c8cm12c1c44c12cm15cm15cm3c2c1cm6cm14_weight : PIPELINE_TYPE_FOR_C3C29CM5CM5C8CM12C1C44C12CM15CM15CM3C2C1CM6CM14_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm25cm5cm3cm1cm1cm18cm6c7cm5c2cm4cm6c1cm3c0_weight : PIPELINE_TYPE_FOR_CM3CM25CM5CM3CM1CM1CM18CM6C7CM5C2CM4CM6C1CM3C0_WEIGHT;
    -- sfix(1, -7)
    signal c68c1cm3c4c116c2c7cm9cm5cm5c27cm27cm18cm6cm38cm19_weight : PIPELINE_TYPE_FOR_C68C1CM3C4C116C2C7CM9CM5CM5C27CM27CM18CM6CM38CM19_WEIGHT;
    -- sfix(1, -7)
    signal c11cm12c4c4cm12c22cm14cm24c47c6c8cm23cm54c1c5c19_weight : PIPELINE_TYPE_FOR_C11CM12C4C4CM12C22CM14CM24C47C6C8CM23CM54C1C5C19_WEIGHT;
    -- sfix(1, -7)
    signal c3cm1cm1cm20cm1cm14cm25cm15c10cm2c35cm6cm2cm3c0c5_weight : PIPELINE_TYPE_FOR_C3CM1CM1CM20CM1CM14CM25CM15C10CM2C35CM6CM2CM3C0C5_WEIGHT;
    -- sfix(1, -7)
    signal cm5c2c1cm1c13c15cm1cm20c0cm7cm1cm10cm5cm2cm1cm4_weight : PIPELINE_TYPE_FOR_CM5C2C1CM1C13C15CM1CM20C0CM7CM1CM10CM5CM2CM1CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm4c7cm5c6c2cm3cm6cm1cm45c7cm35cm35c16cm6cm30c26_weight : PIPELINE_TYPE_FOR_CM4C7CM5C6C2CM3CM6CM1CM45C7CM35CM35C16CM6CM30C26_WEIGHT;
    -- sfix(1, -7)
    signal cm13c5cm6c5c8c0c4cm30cm5cm6c7c15cm3c34c0cm3_weight : PIPELINE_TYPE_FOR_CM13C5CM6C5C8C0C4CM30CM5CM6C7C15CM3C34C0CM3_WEIGHT;
    -- sfix(1, -7)
    signal c0c0cm8c9c5cm2c2c15cm2cm1c0cm7c5cm2cm10c0_weight : PIPELINE_TYPE_FOR_C0C0CM8C9C5CM2C2C15CM2CM1C0CM7C5CM2CM10C0_WEIGHT;
    -- sfix(1, -7)
    signal cm5c4c9c24cm5cm3cm6cm16cm12c7c3cm11c27c8c0cm11_weight : PIPELINE_TYPE_FOR_CM5C4C9C24CM5CM3CM6CM16CM12C7C3CM11C27C8C0CM11_WEIGHT;
    -- sfix(1, -7)
    signal c2cm1c2cm4cm5c1c6cm5cm9cm1c7cm2cm8cm1cm1cm7_weight : PIPELINE_TYPE_FOR_C2CM1C2CM4CM5C1C6CM5CM9CM1C7CM2CM8CM1CM1CM7_WEIGHT;
    -- sfix(1, -7)
    signal cm7c13c1c1cm8c14c1c2c20c4cm2c2cm11c24c0cm2_weight : PIPELINE_TYPE_FOR_CM7C13C1C1CM8C14C1C2C20C4CM2C2CM11C24C0CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm6c1cm1c0cm17cm5cm11c12cm15c9c8cm3cm13cm2cm5c4_weight : PIPELINE_TYPE_FOR_CM6C1CM1C0CM17CM5CM11C12CM15C9C8CM3CM13CM2CM5C4_WEIGHT;
    -- sfix(1, -7)
    signal c3cm9c0cm7c8cm15cm13cm4c5cm37c3cm1c3cm37c0cm2_weight : PIPELINE_TYPE_FOR_C3CM9C0CM7C8CM15CM13CM4C5CM37C3CM1C3CM37C0CM2_WEIGHT;
    -- sfix(1, -7)
    signal c3c33cm3cm9cm3c0c4c9cm5c0cm3cm41cm6c5c0cm14_weight : PIPELINE_TYPE_FOR_C3C33CM3CM9CM3C0C4C9CM5C0CM3CM41CM6C5C0CM14_WEIGHT;
    -- sfix(1, -7)
    signal cm6c35c2cm4c13c11c23cm4cm6cm9c5cm6cm71c6c7cm2_weight : PIPELINE_TYPE_FOR_CM6C35C2CM4C13C11C23CM4CM6CM9C5CM6CM71C6C7CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm5c7cm1cm15c6cm7c2cm2c3cm4c3c1c2cm1cm3c4_weight : PIPELINE_TYPE_FOR_CM5C7CM1CM15C6CM7C2CM2C3CM4C3C1C2CM1CM3C4_WEIGHT;
    -- sfix(1, -7)
    signal c9cm5c0c1c0cm4cm10c5cm17cm9c10cm1cm9cm2cm1cm11_weight : PIPELINE_TYPE_FOR_C9CM5C0C1C0CM4CM10C5CM17CM9C10CM1CM9CM2CM1CM11_WEIGHT;
    -- sfix(1, -7)
    signal c4c4c8cm3cm5cm19cm2c2cm7c14c0c0c20cm20cm2cm2_weight : PIPELINE_TYPE_FOR_C4C4C8CM3CM5CM19CM2C2CM7C14C0C0C20CM20CM2CM2_WEIGHT;
    -- sfix(1, -7)
    signal c2cm2cm1c57cm1c13cm3cm32c5c6c2cm9c2cm19cm3cm3_weight : PIPELINE_TYPE_FOR_C2CM2CM1C57CM1C13CM3CM32C5C6C2CM9C2CM19CM3CM3_WEIGHT;
    -- sfix(1, -7)
    signal c3cm2cm5cm13c21cm36cm18cm16cm18c8c6c5c80cm4cm11c0_weight : PIPELINE_TYPE_FOR_C3CM2CM5CM13C21CM36CM18CM16CM18C8C6C5C80CM4CM11C0_WEIGHT;
    -- sfix(1, -7)
    signal c4c9c1cm1cm1c8cm3c5c3c12c3cm8c7c6c6c9_weight : PIPELINE_TYPE_FOR_C4C9C1CM1CM1C8CM3C5C3C12C3CM8C7C6C6C9_WEIGHT;
    -- sfix(1, -7)
    signal cm2c1cm3c4cm15c11cm23c2cm11cm12cm8cm1c21c26c1c0_weight : PIPELINE_TYPE_FOR_CM2C1CM3C4CM15C11CM23C2CM11CM12CM8CM1C21C26C1C0_WEIGHT;
    -- sfix(1, -7)
    signal cm1c2c3cm8c42c2c6c34cm40cm3c3cm3c42cm2c2c17_weight : PIPELINE_TYPE_FOR_CM1C2C3CM8C42C2C6C34CM40CM3C3CM3C42CM2C2C17_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm2cm14cm2cm44c3cm23cm4c5c27cm13c7cm6c5cm2cm3_weight : PIPELINE_TYPE_FOR_CM3CM2CM14CM2CM44C3CM23CM4C5C27CM13C7CM6C5CM2CM3_WEIGHT;
    -- sfix(1, -7)
    signal c7c2c5c0c15c1cm2c0cm3c5cm1c4c12cm7cm10c9_weight : PIPELINE_TYPE_FOR_C7C2C5C0C15C1CM2C0CM3C5CM1C4C12CM7CM10C9_WEIGHT;
    -- sfix(1, -7)
    signal c6c1c8cm2c5cm13cm7cm1cm16c3c8c13c14c14cm11cm4_weight : PIPELINE_TYPE_FOR_C6C1C8CM2C5CM13CM7CM1CM16C3C8C13C14C14CM11CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm5c1c4cm2cm7c7c4cm13c44cm44cm4c0cm12cm9c2cm5_weight : PIPELINE_TYPE_FOR_CM5C1C4CM2CM7C7C4CM13C44CM44CM4C0CM12CM9C2CM5_WEIGHT;
    -- sfix(1, -7)
    signal c2cm16c8c1cm4cm3c5c0c9c0cm2cm2c11c7c7c3_weight : PIPELINE_TYPE_FOR_C2CM16C8C1CM4CM3C5C0C9C0CM2CM2C11C7C7C3_WEIGHT;
    -- sfix(1, -7)
    signal c5c5c2c0c2cm3c1cm9c8c15c3cm7c27c4c0cm16_weight : PIPELINE_TYPE_FOR_C5C5C2C0C2CM3C1CM9C8C15C3CM7C27C4C0CM16_WEIGHT;
    -- sfix(1, -7)
    signal c2c4cm7c0cm4c0cm6c17c3c10cm22c11c2cm10cm30c9_weight : PIPELINE_TYPE_FOR_C2C4CM7C0CM4C0CM6C17C3C10CM22C11C2CM10CM30C9_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core24_rmcm_weightsconstant_memory
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
        
            dout1   => cm5c4cm4c5c0c2cm1c5c6c1c36c0c7c4c0c0_weight(0), 
            dout2   => c3c29cm5cm5c8cm12c1c44c12cm15cm15cm3c2c1cm6cm14_weight(0), 
            dout3   => cm3cm25cm5cm3cm1cm1cm18cm6c7cm5c2cm4cm6c1cm3c0_weight(0), 
            dout4   => c68c1cm3c4c116c2c7cm9cm5cm5c27cm27cm18cm6cm38cm19_weight(0), 
            dout5   => c11cm12c4c4cm12c22cm14cm24c47c6c8cm23cm54c1c5c19_weight(0), 
            dout6   => c3cm1cm1cm20cm1cm14cm25cm15c10cm2c35cm6cm2cm3c0c5_weight(0), 
            dout7   => cm5c2c1cm1c13c15cm1cm20c0cm7cm1cm10cm5cm2cm1cm4_weight(0), 
            dout8   => cm4c7cm5c6c2cm3cm6cm1cm45c7cm35cm35c16cm6cm30c26_weight(0), 
            dout9   => cm13c5cm6c5c8c0c4cm30cm5cm6c7c15cm3c34c0cm3_weight(0), 
            dout10   => c0c0cm8c9c5cm2c2c15cm2cm1c0cm7c5cm2cm10c0_weight(0), 
            dout11   => cm5c4c9c24cm5cm3cm6cm16cm12c7c3cm11c27c8c0cm11_weight(0), 
            dout12   => c2cm1c2cm4cm5c1c6cm5cm9cm1c7cm2cm8cm1cm1cm7_weight(0), 
            dout13   => cm7c13c1c1cm8c14c1c2c20c4cm2c2cm11c24c0cm2_weight(0), 
            dout14   => cm6c1cm1c0cm17cm5cm11c12cm15c9c8cm3cm13cm2cm5c4_weight(0), 
            dout15   => c3cm9c0cm7c8cm15cm13cm4c5cm37c3cm1c3cm37c0cm2_weight(0), 
            dout16   => c3c33cm3cm9cm3c0c4c9cm5c0cm3cm41cm6c5c0cm14_weight(0), 
            dout17   => cm6c35c2cm4c13c11c23cm4cm6cm9c5cm6cm71c6c7cm2_weight(0), 
            dout18   => cm5c7cm1cm15c6cm7c2cm2c3cm4c3c1c2cm1cm3c4_weight(0), 
            dout19   => c9cm5c0c1c0cm4cm10c5cm17cm9c10cm1cm9cm2cm1cm11_weight(0), 
            dout20   => c4c4c8cm3cm5cm19cm2c2cm7c14c0c0c20cm20cm2cm2_weight(0), 
            dout21   => c2cm2cm1c57cm1c13cm3cm32c5c6c2cm9c2cm19cm3cm3_weight(0), 
            dout22   => c3cm2cm5cm13c21cm36cm18cm16cm18c8c6c5c80cm4cm11c0_weight(0), 
            dout23   => c4c9c1cm1cm1c8cm3c5c3c12c3cm8c7c6c6c9_weight(0), 
            dout24   => cm2c1cm3c4cm15c11cm23c2cm11cm12cm8cm1c21c26c1c0_weight(0), 
            dout25   => cm1c2c3cm8c42c2c6c34cm40cm3c3cm3c42cm2c2c17_weight(0), 
            dout26   => cm3cm2cm14cm2cm44c3cm23cm4c5c27cm13c7cm6c5cm2cm3_weight(0), 
            dout27   => c7c2c5c0c15c1cm2c0cm3c5cm1c4c12cm7cm10c9_weight(0), 
            dout28   => c6c1c8cm2c5cm13cm7cm1cm16c3c8c13c14c14cm11cm4_weight(0), 
            dout29   => cm5c1c4cm2cm7c7c4cm13c44cm44cm4c0cm12cm9c2cm5_weight(0), 
            dout30   => c2cm16c8c1cm4cm3c5c0c9c0cm2cm2c11c7c7c3_weight(0), 
            dout31   => c5c5c2c0c2cm3c1cm9c8c15c3cm7c27c4c0cm16_weight(0), 
            dout32   => c2c4cm7c0cm4c0cm6c17c3c10cm22c11c2cm10cm30c9_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm5c4cm4c5c0c2cm1c5c6c1c36c0c7c4c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c4cm4c5c0c2cm1c5c6c1c36c0c7c4c0c0_weight(0), cm5c4cm4c5c0c2cm1c5c6c1c36c0c7c4c0c0_weight(1));
    PL_STEP_0_for_c3c29cm5cm5c8cm12c1c44c12cm15cm15cm3c2c1cm6cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c29cm5cm5c8cm12c1c44c12cm15cm15cm3c2c1cm6cm14_weight(0), c3c29cm5cm5c8cm12c1c44c12cm15cm15cm3c2c1cm6cm14_weight(1));
    PL_STEP_0_for_cm3cm25cm5cm3cm1cm1cm18cm6c7cm5c2cm4cm6c1cm3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm25cm5cm3cm1cm1cm18cm6c7cm5c2cm4cm6c1cm3c0_weight(0), cm3cm25cm5cm3cm1cm1cm18cm6c7cm5c2cm4cm6c1cm3c0_weight(1));
    PL_STEP_0_for_c68c1cm3c4c116c2c7cm9cm5cm5c27cm27cm18cm6cm38cm19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c68c1cm3c4c116c2c7cm9cm5cm5c27cm27cm18cm6cm38cm19_weight(0), c68c1cm3c4c116c2c7cm9cm5cm5c27cm27cm18cm6cm38cm19_weight(1));
    PL_STEP_0_for_c11cm12c4c4cm12c22cm14cm24c47c6c8cm23cm54c1c5c19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11cm12c4c4cm12c22cm14cm24c47c6c8cm23cm54c1c5c19_weight(0), c11cm12c4c4cm12c22cm14cm24c47c6c8cm23cm54c1c5c19_weight(1));
    PL_STEP_0_for_c3cm1cm1cm20cm1cm14cm25cm15c10cm2c35cm6cm2cm3c0c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm1cm1cm20cm1cm14cm25cm15c10cm2c35cm6cm2cm3c0c5_weight(0), c3cm1cm1cm20cm1cm14cm25cm15c10cm2c35cm6cm2cm3c0c5_weight(1));
    PL_STEP_0_for_cm5c2c1cm1c13c15cm1cm20c0cm7cm1cm10cm5cm2cm1cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c2c1cm1c13c15cm1cm20c0cm7cm1cm10cm5cm2cm1cm4_weight(0), cm5c2c1cm1c13c15cm1cm20c0cm7cm1cm10cm5cm2cm1cm4_weight(1));
    PL_STEP_0_for_cm4c7cm5c6c2cm3cm6cm1cm45c7cm35cm35c16cm6cm30c26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c7cm5c6c2cm3cm6cm1cm45c7cm35cm35c16cm6cm30c26_weight(0), cm4c7cm5c6c2cm3cm6cm1cm45c7cm35cm35c16cm6cm30c26_weight(1));
    PL_STEP_0_for_cm13c5cm6c5c8c0c4cm30cm5cm6c7c15cm3c34c0cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c5cm6c5c8c0c4cm30cm5cm6c7c15cm3c34c0cm3_weight(0), cm13c5cm6c5c8c0c4cm30cm5cm6c7c15cm3c34c0cm3_weight(1));
    PL_STEP_0_for_c0c0cm8c9c5cm2c2c15cm2cm1c0cm7c5cm2cm10c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm8c9c5cm2c2c15cm2cm1c0cm7c5cm2cm10c0_weight(0), c0c0cm8c9c5cm2c2c15cm2cm1c0cm7c5cm2cm10c0_weight(1));
    PL_STEP_0_for_cm5c4c9c24cm5cm3cm6cm16cm12c7c3cm11c27c8c0cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c4c9c24cm5cm3cm6cm16cm12c7c3cm11c27c8c0cm11_weight(0), cm5c4c9c24cm5cm3cm6cm16cm12c7c3cm11c27c8c0cm11_weight(1));
    PL_STEP_0_for_c2cm1c2cm4cm5c1c6cm5cm9cm1c7cm2cm8cm1cm1cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm1c2cm4cm5c1c6cm5cm9cm1c7cm2cm8cm1cm1cm7_weight(0), c2cm1c2cm4cm5c1c6cm5cm9cm1c7cm2cm8cm1cm1cm7_weight(1));
    PL_STEP_0_for_cm7c13c1c1cm8c14c1c2c20c4cm2c2cm11c24c0cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c13c1c1cm8c14c1c2c20c4cm2c2cm11c24c0cm2_weight(0), cm7c13c1c1cm8c14c1c2c20c4cm2c2cm11c24c0cm2_weight(1));
    PL_STEP_0_for_cm6c1cm1c0cm17cm5cm11c12cm15c9c8cm3cm13cm2cm5c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c1cm1c0cm17cm5cm11c12cm15c9c8cm3cm13cm2cm5c4_weight(0), cm6c1cm1c0cm17cm5cm11c12cm15c9c8cm3cm13cm2cm5c4_weight(1));
    PL_STEP_0_for_c3cm9c0cm7c8cm15cm13cm4c5cm37c3cm1c3cm37c0cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm9c0cm7c8cm15cm13cm4c5cm37c3cm1c3cm37c0cm2_weight(0), c3cm9c0cm7c8cm15cm13cm4c5cm37c3cm1c3cm37c0cm2_weight(1));
    PL_STEP_0_for_c3c33cm3cm9cm3c0c4c9cm5c0cm3cm41cm6c5c0cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c33cm3cm9cm3c0c4c9cm5c0cm3cm41cm6c5c0cm14_weight(0), c3c33cm3cm9cm3c0c4c9cm5c0cm3cm41cm6c5c0cm14_weight(1));
    PL_STEP_0_for_cm6c35c2cm4c13c11c23cm4cm6cm9c5cm6cm71c6c7cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c35c2cm4c13c11c23cm4cm6cm9c5cm6cm71c6c7cm2_weight(0), cm6c35c2cm4c13c11c23cm4cm6cm9c5cm6cm71c6c7cm2_weight(1));
    PL_STEP_0_for_cm5c7cm1cm15c6cm7c2cm2c3cm4c3c1c2cm1cm3c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c7cm1cm15c6cm7c2cm2c3cm4c3c1c2cm1cm3c4_weight(0), cm5c7cm1cm15c6cm7c2cm2c3cm4c3c1c2cm1cm3c4_weight(1));
    PL_STEP_0_for_c9cm5c0c1c0cm4cm10c5cm17cm9c10cm1cm9cm2cm1cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9cm5c0c1c0cm4cm10c5cm17cm9c10cm1cm9cm2cm1cm11_weight(0), c9cm5c0c1c0cm4cm10c5cm17cm9c10cm1cm9cm2cm1cm11_weight(1));
    PL_STEP_0_for_c4c4c8cm3cm5cm19cm2c2cm7c14c0c0c20cm20cm2cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c4c8cm3cm5cm19cm2c2cm7c14c0c0c20cm20cm2cm2_weight(0), c4c4c8cm3cm5cm19cm2c2cm7c14c0c0c20cm20cm2cm2_weight(1));
    PL_STEP_0_for_c2cm2cm1c57cm1c13cm3cm32c5c6c2cm9c2cm19cm3cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm2cm1c57cm1c13cm3cm32c5c6c2cm9c2cm19cm3cm3_weight(0), c2cm2cm1c57cm1c13cm3cm32c5c6c2cm9c2cm19cm3cm3_weight(1));
    PL_STEP_0_for_c3cm2cm5cm13c21cm36cm18cm16cm18c8c6c5c80cm4cm11c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm2cm5cm13c21cm36cm18cm16cm18c8c6c5c80cm4cm11c0_weight(0), c3cm2cm5cm13c21cm36cm18cm16cm18c8c6c5c80cm4cm11c0_weight(1));
    PL_STEP_0_for_c4c9c1cm1cm1c8cm3c5c3c12c3cm8c7c6c6c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c9c1cm1cm1c8cm3c5c3c12c3cm8c7c6c6c9_weight(0), c4c9c1cm1cm1c8cm3c5c3c12c3cm8c7c6c6c9_weight(1));
    PL_STEP_0_for_cm2c1cm3c4cm15c11cm23c2cm11cm12cm8cm1c21c26c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1cm3c4cm15c11cm23c2cm11cm12cm8cm1c21c26c1c0_weight(0), cm2c1cm3c4cm15c11cm23c2cm11cm12cm8cm1c21c26c1c0_weight(1));
    PL_STEP_0_for_cm1c2c3cm8c42c2c6c34cm40cm3c3cm3c42cm2c2c17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c2c3cm8c42c2c6c34cm40cm3c3cm3c42cm2c2c17_weight(0), cm1c2c3cm8c42c2c6c34cm40cm3c3cm3c42cm2c2c17_weight(1));
    PL_STEP_0_for_cm3cm2cm14cm2cm44c3cm23cm4c5c27cm13c7cm6c5cm2cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm2cm14cm2cm44c3cm23cm4c5c27cm13c7cm6c5cm2cm3_weight(0), cm3cm2cm14cm2cm44c3cm23cm4c5c27cm13c7cm6c5cm2cm3_weight(1));
    PL_STEP_0_for_c7c2c5c0c15c1cm2c0cm3c5cm1c4c12cm7cm10c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c2c5c0c15c1cm2c0cm3c5cm1c4c12cm7cm10c9_weight(0), c7c2c5c0c15c1cm2c0cm3c5cm1c4c12cm7cm10c9_weight(1));
    PL_STEP_0_for_c6c1c8cm2c5cm13cm7cm1cm16c3c8c13c14c14cm11cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c1c8cm2c5cm13cm7cm1cm16c3c8c13c14c14cm11cm4_weight(0), c6c1c8cm2c5cm13cm7cm1cm16c3c8c13c14c14cm11cm4_weight(1));
    PL_STEP_0_for_cm5c1c4cm2cm7c7c4cm13c44cm44cm4c0cm12cm9c2cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c1c4cm2cm7c7c4cm13c44cm44cm4c0cm12cm9c2cm5_weight(0), cm5c1c4cm2cm7c7c4cm13c44cm44cm4c0cm12cm9c2cm5_weight(1));
    PL_STEP_0_for_c2cm16c8c1cm4cm3c5c0c9c0cm2cm2c11c7c7c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm16c8c1cm4cm3c5c0c9c0cm2cm2c11c7c7c3_weight(0), c2cm16c8c1cm4cm3c5c0c9c0cm2cm2c11c7c7c3_weight(1));
    PL_STEP_0_for_c5c5c2c0c2cm3c1cm9c8c15c3cm7c27c4c0cm16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c5c2c0c2cm3c1cm9c8c15c3cm7c27c4c0cm16_weight(0), c5c5c2c0c2cm3c1cm9c8c15c3cm7c27c4c0cm16_weight(1));
    PL_STEP_0_for_c2c4cm7c0cm4c0cm6c17c3c10cm22c11c2cm10cm30c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c4cm7c0cm4c0cm6c17c3c10cm22c11c2cm10cm30c9_weight(0), c2c4cm7c0cm4c0cm6c17c3c10cm22c11c2cm10cm30c9_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c68c1cm3c4c116c2c7cm9cm5cm5c27cm27cm18cm6cm38cm19_c2cm16c8c1cm4cm3c5c0c9c0cm2cm2c11c7c7c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c68c1cm3c4c116c2c7cm9cm5cm5c27cm27cm18cm6cm38cm19_weight(1)(8-1 downto 0),
			B	=> c2cm16c8c1cm4cm3c5c0c9c0cm2cm2c11c7c7c3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c68c1cm3c4c116c2c7cm9cm5cm5c27cm27cm18cm6cm38cm19,
			CxB => R_c2cm16c8c1cm4cm3c5c0c9c0cm2cm2c11c7c7c3
		);

    cm6c35c2cm4c13c11c23cm4cm6cm9c5cm6cm71c6c7cm2_c6c1c8cm2c5cm13cm7cm1cm16c3c8c13c14c14cm11cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6c35c2cm4c13c11c23cm4cm6cm9c5cm6cm71c6c7cm2_weight(1)(8-1 downto 0),
			B	=> c6c1c8cm2c5cm13cm7cm1cm16c3c8c13c14c14cm11cm4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c35c2cm4c13c11c23cm4cm6cm9c5cm6cm71c6c7cm2,
			CxB => R_c6c1c8cm2c5cm13cm7cm1cm16c3c8c13c14c14cm11cm4
		);

    c3cm2cm5cm13c21cm36cm18cm16cm18c8c6c5c80cm4cm11c0_c7c2c5c0c15c1cm2c0cm3c5cm1c4c12cm7cm10c9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3cm2cm5cm13c21cm36cm18cm16cm18c8c6c5c80cm4cm11c0_weight(1)(8-1 downto 0),
			B	=> c7c2c5c0c15c1cm2c0cm3c5cm1c4c12cm7cm10c9_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm2cm5cm13c21cm36cm18cm16cm18c8c6c5c80cm4cm11c0,
			CxB => R_c7c2c5c0c15c1cm2c0cm3c5cm1c4c12cm7cm10c9
		);

    cm5c4cm4c5c0c2cm1c5c6c1c36c0c7c4c0c0_c4c9c1cm1cm1c8cm3c5c3c12c3cm8c7c6c6c9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5c4cm4c5c0c2cm1c5c6c1c36c0c7c4c0c0_weight(1)(7-1 downto 0),
			B	=> c4c9c1cm1cm1c8cm3c5c3c12c3cm8c7c6c6c9_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5c4cm4c5c0c2cm1c5c6c1c36c0c7c4c0c0,
			CxB => R_c4c9c1cm1cm1c8cm3c5c3c12c3cm8c7c6c6c9
		);

    c3c29cm5cm5c8cm12c1c44c12cm15cm15cm3c2c1cm6cm14_cm5c7cm1cm15c6cm7c2cm2c3cm4c3c1c2cm1cm3c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c29cm5cm5c8cm12c1c44c12cm15cm15cm3c2c1cm6cm14_weight(1)(7-1 downto 0),
			B	=> cm5c7cm1cm15c6cm7c2cm2c3cm4c3c1c2cm1cm3c4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c29cm5cm5c8cm12c1c44c12cm15cm15cm3c2c1cm6cm14,
			CxB => R_cm5c7cm1cm15c6cm7c2cm2c3cm4c3c1c2cm1cm3c4
		);

    c11cm12c4c4cm12c22cm14cm24c47c6c8cm23cm54c1c5c19_c2cm1c2cm4cm5c1c6cm5cm9cm1c7cm2cm8cm1cm1cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c11cm12c4c4cm12c22cm14cm24c47c6c8cm23cm54c1c5c19_weight(1)(7-1 downto 0),
			B	=> c2cm1c2cm4cm5c1c6cm5cm9cm1c7cm2cm8cm1cm1cm7_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c11cm12c4c4cm12c22cm14cm24c47c6c8cm23cm54c1c5c19,
			CxB => R_c2cm1c2cm4cm5c1c6cm5cm9cm1c7cm2cm8cm1cm1cm7
		);

    c3cm1cm1cm20cm1cm14cm25cm15c10cm2c35cm6cm2cm3c0c5_c0c0cm8c9c5cm2c2c15cm2cm1c0cm7c5cm2cm10c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3cm1cm1cm20cm1cm14cm25cm15c10cm2c35cm6cm2cm3c0c5_weight(1)(7-1 downto 0),
			B	=> c0c0cm8c9c5cm2c2c15cm2cm1c0cm7c5cm2cm10c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm1cm1cm20cm1cm14cm25cm15c10cm2c35cm6cm2cm3c0c5,
			CxB => R_c0c0cm8c9c5cm2c2c15cm2cm1c0cm7c5cm2cm10c0
		);

    cm4c7cm5c6c2cm3cm6cm1cm45c7cm35cm35c16cm6cm30c26_c2c4cm7c0cm4c0cm6c17c3c10cm22c11c2cm10cm30c9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4c7cm5c6c2cm3cm6cm1cm45c7cm35cm35c16cm6cm30c26_weight(1)(7-1 downto 0),
			B	=> c2c4cm7c0cm4c0cm6c17c3c10cm22c11c2cm10cm30c9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4c7cm5c6c2cm3cm6cm1cm45c7cm35cm35c16cm6cm30c26,
			CxB => R_c2c4cm7c0cm4c0cm6c17c3c10cm22c11c2cm10cm30c9
		);

    cm13c5cm6c5c8c0c4cm30cm5cm6c7c15cm3c34c0cm3_c5c5c2c0c2cm3c1cm9c8c15c3cm7c27c4c0cm16_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm13c5cm6c5c8c0c4cm30cm5cm6c7c15cm3c34c0cm3_weight(1)(7-1 downto 0),
			B	=> c5c5c2c0c2cm3c1cm9c8c15c3cm7c27c4c0cm16_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm13c5cm6c5c8c0c4cm30cm5cm6c7c15cm3c34c0cm3,
			CxB => R_c5c5c2c0c2cm3c1cm9c8c15c3cm7c27c4c0cm16
		);

    c3cm9c0cm7c8cm15cm13cm4c5cm37c3cm1c3cm37c0cm2_cm2c1cm3c4cm15c11cm23c2cm11cm12cm8cm1c21c26c1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3cm9c0cm7c8cm15cm13cm4c5cm37c3cm1c3cm37c0cm2_weight(1)(7-1 downto 0),
			B	=> cm2c1cm3c4cm15c11cm23c2cm11cm12cm8cm1c21c26c1c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm9c0cm7c8cm15cm13cm4c5cm37c3cm1c3cm37c0cm2,
			CxB => R_cm2c1cm3c4cm15c11cm23c2cm11cm12cm8cm1c21c26c1c0
		);

    c3c33cm3cm9cm3c0c4c9cm5c0cm3cm41cm6c5c0cm14_c4c4c8cm3cm5cm19cm2c2cm7c14c0c0c20cm20cm2cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c33cm3cm9cm3c0c4c9cm5c0cm3cm41cm6c5c0cm14_weight(1)(7-1 downto 0),
			B	=> c4c4c8cm3cm5cm19cm2c2cm7c14c0c0c20cm20cm2cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c33cm3cm9cm3c0c4c9cm5c0cm3cm41cm6c5c0cm14,
			CxB => R_c4c4c8cm3cm5cm19cm2c2cm7c14c0c0c20cm20cm2cm2
		);

    c2cm2cm1c57cm1c13cm3cm32c5c6c2cm9c2cm19cm3cm3_c9cm5c0c1c0cm4cm10c5cm17cm9c10cm1cm9cm2cm1cm11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2cm2cm1c57cm1c13cm3cm32c5c6c2cm9c2cm19cm3cm3_weight(1)(7-1 downto 0),
			B	=> c9cm5c0c1c0cm4cm10c5cm17cm9c10cm1cm9cm2cm1cm11_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm2cm1c57cm1c13cm3cm32c5c6c2cm9c2cm19cm3cm3,
			CxB => R_c9cm5c0c1c0cm4cm10c5cm17cm9c10cm1cm9cm2cm1cm11
		);

    cm1c2c3cm8c42c2c6c34cm40cm3c3cm3c42cm2c2c17_cm6c1cm1c0cm17cm5cm11c12cm15c9c8cm3cm13cm2cm5c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c2c3cm8c42c2c6c34cm40cm3c3cm3c42cm2c2c17_weight(1)(7-1 downto 0),
			B	=> cm6c1cm1c0cm17cm5cm11c12cm15c9c8cm3cm13cm2cm5c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c2c3cm8c42c2c6c34cm40cm3c3cm3c42cm2c2c17,
			CxB => R_cm6c1cm1c0cm17cm5cm11c12cm15c9c8cm3cm13cm2cm5c4
		);

    cm3cm2cm14cm2cm44c3cm23cm4c5c27cm13c7cm6c5cm2cm3_cm7c13c1c1cm8c14c1c2c20c4cm2c2cm11c24c0cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3cm2cm14cm2cm44c3cm23cm4c5c27cm13c7cm6c5cm2cm3_weight(1)(7-1 downto 0),
			B	=> cm7c13c1c1cm8c14c1c2c20c4cm2c2cm11c24c0cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3cm2cm14cm2cm44c3cm23cm4c5c27cm13c7cm6c5cm2cm3,
			CxB => R_cm7c13c1c1cm8c14c1c2c20c4cm2c2cm11c24c0cm2
		);

    cm5c1c4cm2cm7c7c4cm13c44cm44cm4c0cm12cm9c2cm5_cm5c4c9c24cm5cm3cm6cm16cm12c7c3cm11c27c8c0cm11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5c1c4cm2cm7c7c4cm13c44cm44cm4c0cm12cm9c2cm5_weight(1)(7-1 downto 0),
			B	=> cm5c4c9c24cm5cm3cm6cm16cm12c7c3cm11c27c8c0cm11_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5c1c4cm2cm7c7c4cm13c44cm44cm4c0cm12cm9c2cm5,
			CxB => R_cm5c4c9c24cm5cm3cm6cm16cm12c7c3cm11c27c8c0cm11
		);

    cm3cm25cm5cm3cm1cm1cm18cm6c7cm5c2cm4cm6c1cm3c0_cm5c2c1cm1c13c15cm1cm20c0cm7cm1cm10cm5cm2cm1cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3cm25cm5cm3cm1cm1cm18cm6c7cm5c2cm4cm6c1cm3c0_weight(1)(6-1 downto 0),
			B	=> cm5c2c1cm1c13c15cm1cm20c0cm7cm1cm10cm5cm2cm1cm4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3cm25cm5cm3cm1cm1cm18cm6c7cm5c2cm4cm6c1cm3c0,
			CxB => R_cm5c2c1cm1c13c15cm1cm20c0cm7cm1cm10cm5cm2cm1cm4
		);




end architecture;
