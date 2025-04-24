library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core7_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm32c0cm7c3cm1c1c2c3c4c5c14c7c1cm10c4c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm13c4c21c5cm2c0cm1cm4c13c13cm4cm11c4cm2cm11cm21 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm12cm8cm11c1c1cm4cm7c2c1c6cm4c4c0c8c0c3 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm6c17cm10c23c4cm1cm2cm1c12cm4cm33cm16c4c7cm10cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm9c9cm54c1c4c4c2c2c25c10cm40c13cm4cm11c1cm12 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2c3c3c20cm1c1cm2cm5cm6cm6c17cm18c3c5cm11cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm25c4c0c0c0c1c1cm3cm6cm3c4c24c17c13c10cm17 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c14cm8cm6c2cm5c6cm1cm2c8cm2cm1cm6cm13c0c1cm25 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c5c58c21cm20cm3cm2cm8c1c3cm18cm1c2c65cm8c16c43 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c23cm1cm3c8c0cm1c18c4c6c0c4c6cm2c5c21c20 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6cm12c3cm6c1c0cm6c6c10c37cm4c1c15cm1cm36cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c5cm4cm9cm12c1c0cm3cm1c0cm1c9c1cm1c0c10c12 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm7c4cm16cm3cm1c1c0c0cm8cm24c5c13c22cm11c2c11 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm4cm7cm4cm4cm1cm1c0cm1c7c16c9cm5cm12cm6cm14c8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c5c6c4cm4c2cm3cm1cm1c17cm9c19c6cm46cm3c6c14 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c8c8c4c7c1cm7c1c2c8cm8cm5c3cm1cm1cm8cm5 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm4c1c3cm20c2c8cm2cm1cm7cm31c5cm20c0cm9c0cm12 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c15cm2c26cm3cm4cm6c0c14cm35c0cm6c0c2c7c10cm10 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm18cm14c2c6cm2cm2c0c1cm12cm20c12cm6c5cm17cm6cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm10cm2c2c8cm1cm1cm7c0cm14c38c1c33c1c1cm3c3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6c14c2cm9cm1c3c3c114cm3cm14c5c0c4c27c3cm5 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c0cm6c1c8c0cm1c2cm2c1c15c0cm15c6cm19c7cm25 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c3c7c2c7cm5c2c0c11cm30cm4c0cm5cm15c2cm43cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm14c17c2cm11c5c1c0cm3cm6c32cm9cm3cm15c2cm61cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3cm9cm8cm1cm1c0c1cm1cm29c2cm6cm2c8cm3c11c11 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c8c2cm9cm2c3c2cm4c8c5cm28cm13c1cm18c5cm9c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2c3cm10cm14cm5c1cm2cm1c14c6c10c4cm5c4cm1c2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c2cm6c6cm38c4cm5c6c1cm22cm7c47c7c15cm8cm12c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c7cm10cm7c8c0c3c0cm1c27c5c5c19cm10c1c26c17 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c63cm5cm42c7cm2cm7cm1c2cm2c2c2cm8c7cm14cm12cm6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm11c16cm2cm30c1c0c0c2c9c12c12c45c1c10c11c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c9cm1c16cm25cm1cm3cm2c2cm3cm6c65c2cm11c11cm8c14 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core7_rmcm;

architecture arch of conv7_core7_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM32C0CM7C3CM1C1C2C3C4C5C14C7C1CM10C4C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C4C21C5CM2C0CM1CM4C13C13CM4CM11C4CM2CM11CM21_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12CM8CM11C1C1CM4CM7C2C1C6CM4C4C0C8C0C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C17CM10C23C4CM1CM2CM1C12CM4CM33CM16C4C7CM10CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C9CM54C1C4C4C2C2C25C10CM40C13CM4CM11C1CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C3C3C20CM1C1CM2CM5CM6CM6C17CM18C3C5CM11CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM25C4C0C0C0C1C1CM3CM6CM3C4C24C17C13C10CM17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14CM8CM6C2CM5C6CM1CM2C8CM2CM1CM6CM13C0C1CM25_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C58C21CM20CM3CM2CM8C1C3CM18CM1C2C65CM8C16C43_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C23CM1CM3C8C0CM1C18C4C6C0C4C6CM2C5C21C20_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM12C3CM6C1C0CM6C6C10C37CM4C1C15CM1CM36CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM4CM9CM12C1C0CM3CM1C0CM1C9C1CM1C0C10C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C4CM16CM3CM1C1C0C0CM8CM24C5C13C22CM11C2C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM7CM4CM4CM1CM1C0CM1C7C16C9CM5CM12CM6CM14C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C6C4CM4C2CM3CM1CM1C17CM9C19C6CM46CM3C6C14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C8C4C7C1CM7C1C2C8CM8CM5C3CM1CM1CM8CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C1C3CM20C2C8CM2CM1CM7CM31C5CM20C0CM9C0CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C15CM2C26CM3CM4CM6C0C14CM35C0CM6C0C2C7C10CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM18CM14C2C6CM2CM2C0C1CM12CM20C12CM6C5CM17CM6CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10CM2C2C8CM1CM1CM7C0CM14C38C1C33C1C1CM3C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C14C2CM9CM1C3C3C114CM3CM14C5C0C4C27C3CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM6C1C8C0CM1C2CM2C1C15C0CM15C6CM19C7CM25_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C7C2C7CM5C2C0C11CM30CM4C0CM5CM15C2CM43CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14C17C2CM11C5C1C0CM3CM6C32CM9CM3CM15C2CM61CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM9CM8CM1CM1C0C1CM1CM29C2CM6CM2C8CM3C11C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C2CM9CM2C3C2CM4C8C5CM28CM13C1CM18C5CM9C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C3CM10CM14CM5C1CM2CM1C14C6C10C4CM5C4CM1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM6C6CM38C4CM5C6C1CM22CM7C47C7C15CM8CM12C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM10CM7C8C0C3C0CM1C27C5C5C19CM10C1C26C17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C63CM5CM42C7CM2CM7CM1C2CM2C2C2CM8C7CM14CM12CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11C16CM2CM30C1C0C0C2C9C12C12C45C1C10C11C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9CM1C16CM25CM1CM3CM2C2CM3CM6C65C2CM11C11CM8C14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm32c0cm7c3cm1c1c2c3c4c5c14c7c1cm10c4c1_weight : PIPELINE_TYPE_FOR_CM32C0CM7C3CM1C1C2C3C4C5C14C7C1CM10C4C1_WEIGHT;
    -- sfix(1, -7)
    signal cm13c4c21c5cm2c0cm1cm4c13c13cm4cm11c4cm2cm11cm21_weight : PIPELINE_TYPE_FOR_CM13C4C21C5CM2C0CM1CM4C13C13CM4CM11C4CM2CM11CM21_WEIGHT;
    -- sfix(1, -7)
    signal cm12cm8cm11c1c1cm4cm7c2c1c6cm4c4c0c8c0c3_weight : PIPELINE_TYPE_FOR_CM12CM8CM11C1C1CM4CM7C2C1C6CM4C4C0C8C0C3_WEIGHT;
    -- sfix(1, -7)
    signal cm6c17cm10c23c4cm1cm2cm1c12cm4cm33cm16c4c7cm10cm1_weight : PIPELINE_TYPE_FOR_CM6C17CM10C23C4CM1CM2CM1C12CM4CM33CM16C4C7CM10CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm9c9cm54c1c4c4c2c2c25c10cm40c13cm4cm11c1cm12_weight : PIPELINE_TYPE_FOR_CM9C9CM54C1C4C4C2C2C25C10CM40C13CM4CM11C1CM12_WEIGHT;
    -- sfix(1, -7)
    signal c2c3c3c20cm1c1cm2cm5cm6cm6c17cm18c3c5cm11cm3_weight : PIPELINE_TYPE_FOR_C2C3C3C20CM1C1CM2CM5CM6CM6C17CM18C3C5CM11CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm25c4c0c0c0c1c1cm3cm6cm3c4c24c17c13c10cm17_weight : PIPELINE_TYPE_FOR_CM25C4C0C0C0C1C1CM3CM6CM3C4C24C17C13C10CM17_WEIGHT;
    -- sfix(1, -7)
    signal c14cm8cm6c2cm5c6cm1cm2c8cm2cm1cm6cm13c0c1cm25_weight : PIPELINE_TYPE_FOR_C14CM8CM6C2CM5C6CM1CM2C8CM2CM1CM6CM13C0C1CM25_WEIGHT;
    -- sfix(1, -7)
    signal c5c58c21cm20cm3cm2cm8c1c3cm18cm1c2c65cm8c16c43_weight : PIPELINE_TYPE_FOR_C5C58C21CM20CM3CM2CM8C1C3CM18CM1C2C65CM8C16C43_WEIGHT;
    -- sfix(1, -7)
    signal c23cm1cm3c8c0cm1c18c4c6c0c4c6cm2c5c21c20_weight : PIPELINE_TYPE_FOR_C23CM1CM3C8C0CM1C18C4C6C0C4C6CM2C5C21C20_WEIGHT;
    -- sfix(1, -7)
    signal c6cm12c3cm6c1c0cm6c6c10c37cm4c1c15cm1cm36cm1_weight : PIPELINE_TYPE_FOR_C6CM12C3CM6C1C0CM6C6C10C37CM4C1C15CM1CM36CM1_WEIGHT;
    -- sfix(1, -7)
    signal c5cm4cm9cm12c1c0cm3cm1c0cm1c9c1cm1c0c10c12_weight : PIPELINE_TYPE_FOR_C5CM4CM9CM12C1C0CM3CM1C0CM1C9C1CM1C0C10C12_WEIGHT;
    -- sfix(1, -7)
    signal cm7c4cm16cm3cm1c1c0c0cm8cm24c5c13c22cm11c2c11_weight : PIPELINE_TYPE_FOR_CM7C4CM16CM3CM1C1C0C0CM8CM24C5C13C22CM11C2C11_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm7cm4cm4cm1cm1c0cm1c7c16c9cm5cm12cm6cm14c8_weight : PIPELINE_TYPE_FOR_CM4CM7CM4CM4CM1CM1C0CM1C7C16C9CM5CM12CM6CM14C8_WEIGHT;
    -- sfix(1, -7)
    signal c5c6c4cm4c2cm3cm1cm1c17cm9c19c6cm46cm3c6c14_weight : PIPELINE_TYPE_FOR_C5C6C4CM4C2CM3CM1CM1C17CM9C19C6CM46CM3C6C14_WEIGHT;
    -- sfix(1, -7)
    signal c8c8c4c7c1cm7c1c2c8cm8cm5c3cm1cm1cm8cm5_weight : PIPELINE_TYPE_FOR_C8C8C4C7C1CM7C1C2C8CM8CM5C3CM1CM1CM8CM5_WEIGHT;
    -- sfix(1, -7)
    signal cm4c1c3cm20c2c8cm2cm1cm7cm31c5cm20c0cm9c0cm12_weight : PIPELINE_TYPE_FOR_CM4C1C3CM20C2C8CM2CM1CM7CM31C5CM20C0CM9C0CM12_WEIGHT;
    -- sfix(1, -7)
    signal c15cm2c26cm3cm4cm6c0c14cm35c0cm6c0c2c7c10cm10_weight : PIPELINE_TYPE_FOR_C15CM2C26CM3CM4CM6C0C14CM35C0CM6C0C2C7C10CM10_WEIGHT;
    -- sfix(1, -7)
    signal cm18cm14c2c6cm2cm2c0c1cm12cm20c12cm6c5cm17cm6cm3_weight : PIPELINE_TYPE_FOR_CM18CM14C2C6CM2CM2C0C1CM12CM20C12CM6C5CM17CM6CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm10cm2c2c8cm1cm1cm7c0cm14c38c1c33c1c1cm3c3_weight : PIPELINE_TYPE_FOR_CM10CM2C2C8CM1CM1CM7C0CM14C38C1C33C1C1CM3C3_WEIGHT;
    -- sfix(1, -7)
    signal cm6c14c2cm9cm1c3c3c114cm3cm14c5c0c4c27c3cm5_weight : PIPELINE_TYPE_FOR_CM6C14C2CM9CM1C3C3C114CM3CM14C5C0C4C27C3CM5_WEIGHT;
    -- sfix(1, -7)
    signal c0cm6c1c8c0cm1c2cm2c1c15c0cm15c6cm19c7cm25_weight : PIPELINE_TYPE_FOR_C0CM6C1C8C0CM1C2CM2C1C15C0CM15C6CM19C7CM25_WEIGHT;
    -- sfix(1, -7)
    signal c3c7c2c7cm5c2c0c11cm30cm4c0cm5cm15c2cm43cm4_weight : PIPELINE_TYPE_FOR_C3C7C2C7CM5C2C0C11CM30CM4C0CM5CM15C2CM43CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm14c17c2cm11c5c1c0cm3cm6c32cm9cm3cm15c2cm61cm3_weight : PIPELINE_TYPE_FOR_CM14C17C2CM11C5C1C0CM3CM6C32CM9CM3CM15C2CM61CM3_WEIGHT;
    -- sfix(1, -7)
    signal c3cm9cm8cm1cm1c0c1cm1cm29c2cm6cm2c8cm3c11c11_weight : PIPELINE_TYPE_FOR_C3CM9CM8CM1CM1C0C1CM1CM29C2CM6CM2C8CM3C11C11_WEIGHT;
    -- sfix(1, -7)
    signal c8c2cm9cm2c3c2cm4c8c5cm28cm13c1cm18c5cm9c1_weight : PIPELINE_TYPE_FOR_C8C2CM9CM2C3C2CM4C8C5CM28CM13C1CM18C5CM9C1_WEIGHT;
    -- sfix(1, -7)
    signal c2c3cm10cm14cm5c1cm2cm1c14c6c10c4cm5c4cm1c2_weight : PIPELINE_TYPE_FOR_C2C3CM10CM14CM5C1CM2CM1C14C6C10C4CM5C4CM1C2_WEIGHT;
    -- sfix(1, -7)
    signal c2cm6c6cm38c4cm5c6c1cm22cm7c47c7c15cm8cm12c0_weight : PIPELINE_TYPE_FOR_C2CM6C6CM38C4CM5C6C1CM22CM7C47C7C15CM8CM12C0_WEIGHT;
    -- sfix(1, -7)
    signal c7cm10cm7c8c0c3c0cm1c27c5c5c19cm10c1c26c17_weight : PIPELINE_TYPE_FOR_C7CM10CM7C8C0C3C0CM1C27C5C5C19CM10C1C26C17_WEIGHT;
    -- sfix(1, -7)
    signal c63cm5cm42c7cm2cm7cm1c2cm2c2c2cm8c7cm14cm12cm6_weight : PIPELINE_TYPE_FOR_C63CM5CM42C7CM2CM7CM1C2CM2C2C2CM8C7CM14CM12CM6_WEIGHT;
    -- sfix(1, -7)
    signal cm11c16cm2cm30c1c0c0c2c9c12c12c45c1c10c11c1_weight : PIPELINE_TYPE_FOR_CM11C16CM2CM30C1C0C0C2C9C12C12C45C1C10C11C1_WEIGHT;
    -- sfix(1, -7)
    signal c9cm1c16cm25cm1cm3cm2c2cm3cm6c65c2cm11c11cm8c14_weight : PIPELINE_TYPE_FOR_C9CM1C16CM25CM1CM3CM2C2CM3CM6C65C2CM11C11CM8C14_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core7_rmcm_weightsconstant_memory
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
        
            dout1   => cm32c0cm7c3cm1c1c2c3c4c5c14c7c1cm10c4c1_weight(0), 
            dout2   => cm13c4c21c5cm2c0cm1cm4c13c13cm4cm11c4cm2cm11cm21_weight(0), 
            dout3   => cm12cm8cm11c1c1cm4cm7c2c1c6cm4c4c0c8c0c3_weight(0), 
            dout4   => cm6c17cm10c23c4cm1cm2cm1c12cm4cm33cm16c4c7cm10cm1_weight(0), 
            dout5   => cm9c9cm54c1c4c4c2c2c25c10cm40c13cm4cm11c1cm12_weight(0), 
            dout6   => c2c3c3c20cm1c1cm2cm5cm6cm6c17cm18c3c5cm11cm3_weight(0), 
            dout7   => cm25c4c0c0c0c1c1cm3cm6cm3c4c24c17c13c10cm17_weight(0), 
            dout8   => c14cm8cm6c2cm5c6cm1cm2c8cm2cm1cm6cm13c0c1cm25_weight(0), 
            dout9   => c5c58c21cm20cm3cm2cm8c1c3cm18cm1c2c65cm8c16c43_weight(0), 
            dout10   => c23cm1cm3c8c0cm1c18c4c6c0c4c6cm2c5c21c20_weight(0), 
            dout11   => c6cm12c3cm6c1c0cm6c6c10c37cm4c1c15cm1cm36cm1_weight(0), 
            dout12   => c5cm4cm9cm12c1c0cm3cm1c0cm1c9c1cm1c0c10c12_weight(0), 
            dout13   => cm7c4cm16cm3cm1c1c0c0cm8cm24c5c13c22cm11c2c11_weight(0), 
            dout14   => cm4cm7cm4cm4cm1cm1c0cm1c7c16c9cm5cm12cm6cm14c8_weight(0), 
            dout15   => c5c6c4cm4c2cm3cm1cm1c17cm9c19c6cm46cm3c6c14_weight(0), 
            dout16   => c8c8c4c7c1cm7c1c2c8cm8cm5c3cm1cm1cm8cm5_weight(0), 
            dout17   => cm4c1c3cm20c2c8cm2cm1cm7cm31c5cm20c0cm9c0cm12_weight(0), 
            dout18   => c15cm2c26cm3cm4cm6c0c14cm35c0cm6c0c2c7c10cm10_weight(0), 
            dout19   => cm18cm14c2c6cm2cm2c0c1cm12cm20c12cm6c5cm17cm6cm3_weight(0), 
            dout20   => cm10cm2c2c8cm1cm1cm7c0cm14c38c1c33c1c1cm3c3_weight(0), 
            dout21   => cm6c14c2cm9cm1c3c3c114cm3cm14c5c0c4c27c3cm5_weight(0), 
            dout22   => c0cm6c1c8c0cm1c2cm2c1c15c0cm15c6cm19c7cm25_weight(0), 
            dout23   => c3c7c2c7cm5c2c0c11cm30cm4c0cm5cm15c2cm43cm4_weight(0), 
            dout24   => cm14c17c2cm11c5c1c0cm3cm6c32cm9cm3cm15c2cm61cm3_weight(0), 
            dout25   => c3cm9cm8cm1cm1c0c1cm1cm29c2cm6cm2c8cm3c11c11_weight(0), 
            dout26   => c8c2cm9cm2c3c2cm4c8c5cm28cm13c1cm18c5cm9c1_weight(0), 
            dout27   => c2c3cm10cm14cm5c1cm2cm1c14c6c10c4cm5c4cm1c2_weight(0), 
            dout28   => c2cm6c6cm38c4cm5c6c1cm22cm7c47c7c15cm8cm12c0_weight(0), 
            dout29   => c7cm10cm7c8c0c3c0cm1c27c5c5c19cm10c1c26c17_weight(0), 
            dout30   => c63cm5cm42c7cm2cm7cm1c2cm2c2c2cm8c7cm14cm12cm6_weight(0), 
            dout31   => cm11c16cm2cm30c1c0c0c2c9c12c12c45c1c10c11c1_weight(0), 
            dout32   => c9cm1c16cm25cm1cm3cm2c2cm3cm6c65c2cm11c11cm8c14_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm32c0cm7c3cm1c1c2c3c4c5c14c7c1cm10c4c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm32c0cm7c3cm1c1c2c3c4c5c14c7c1cm10c4c1_weight(0), cm32c0cm7c3cm1c1c2c3c4c5c14c7c1cm10c4c1_weight(1));
    PL_STEP_0_for_cm13c4c21c5cm2c0cm1cm4c13c13cm4cm11c4cm2cm11cm21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c4c21c5cm2c0cm1cm4c13c13cm4cm11c4cm2cm11cm21_weight(0), cm13c4c21c5cm2c0cm1cm4c13c13cm4cm11c4cm2cm11cm21_weight(1));
    PL_STEP_0_for_cm12cm8cm11c1c1cm4cm7c2c1c6cm4c4c0c8c0c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12cm8cm11c1c1cm4cm7c2c1c6cm4c4c0c8c0c3_weight(0), cm12cm8cm11c1c1cm4cm7c2c1c6cm4c4c0c8c0c3_weight(1));
    PL_STEP_0_for_cm6c17cm10c23c4cm1cm2cm1c12cm4cm33cm16c4c7cm10cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c17cm10c23c4cm1cm2cm1c12cm4cm33cm16c4c7cm10cm1_weight(0), cm6c17cm10c23c4cm1cm2cm1c12cm4cm33cm16c4c7cm10cm1_weight(1));
    PL_STEP_0_for_cm9c9cm54c1c4c4c2c2c25c10cm40c13cm4cm11c1cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c9cm54c1c4c4c2c2c25c10cm40c13cm4cm11c1cm12_weight(0), cm9c9cm54c1c4c4c2c2c25c10cm40c13cm4cm11c1cm12_weight(1));
    PL_STEP_0_for_c2c3c3c20cm1c1cm2cm5cm6cm6c17cm18c3c5cm11cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c3c3c20cm1c1cm2cm5cm6cm6c17cm18c3c5cm11cm3_weight(0), c2c3c3c20cm1c1cm2cm5cm6cm6c17cm18c3c5cm11cm3_weight(1));
    PL_STEP_0_for_cm25c4c0c0c0c1c1cm3cm6cm3c4c24c17c13c10cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm25c4c0c0c0c1c1cm3cm6cm3c4c24c17c13c10cm17_weight(0), cm25c4c0c0c0c1c1cm3cm6cm3c4c24c17c13c10cm17_weight(1));
    PL_STEP_0_for_c14cm8cm6c2cm5c6cm1cm2c8cm2cm1cm6cm13c0c1cm25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14cm8cm6c2cm5c6cm1cm2c8cm2cm1cm6cm13c0c1cm25_weight(0), c14cm8cm6c2cm5c6cm1cm2c8cm2cm1cm6cm13c0c1cm25_weight(1));
    PL_STEP_0_for_c5c58c21cm20cm3cm2cm8c1c3cm18cm1c2c65cm8c16c43_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c58c21cm20cm3cm2cm8c1c3cm18cm1c2c65cm8c16c43_weight(0), c5c58c21cm20cm3cm2cm8c1c3cm18cm1c2c65cm8c16c43_weight(1));
    PL_STEP_0_for_c23cm1cm3c8c0cm1c18c4c6c0c4c6cm2c5c21c20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c23cm1cm3c8c0cm1c18c4c6c0c4c6cm2c5c21c20_weight(0), c23cm1cm3c8c0cm1c18c4c6c0c4c6cm2c5c21c20_weight(1));
    PL_STEP_0_for_c6cm12c3cm6c1c0cm6c6c10c37cm4c1c15cm1cm36cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm12c3cm6c1c0cm6c6c10c37cm4c1c15cm1cm36cm1_weight(0), c6cm12c3cm6c1c0cm6c6c10c37cm4c1c15cm1cm36cm1_weight(1));
    PL_STEP_0_for_c5cm4cm9cm12c1c0cm3cm1c0cm1c9c1cm1c0c10c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm4cm9cm12c1c0cm3cm1c0cm1c9c1cm1c0c10c12_weight(0), c5cm4cm9cm12c1c0cm3cm1c0cm1c9c1cm1c0c10c12_weight(1));
    PL_STEP_0_for_cm7c4cm16cm3cm1c1c0c0cm8cm24c5c13c22cm11c2c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c4cm16cm3cm1c1c0c0cm8cm24c5c13c22cm11c2c11_weight(0), cm7c4cm16cm3cm1c1c0c0cm8cm24c5c13c22cm11c2c11_weight(1));
    PL_STEP_0_for_cm4cm7cm4cm4cm1cm1c0cm1c7c16c9cm5cm12cm6cm14c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm7cm4cm4cm1cm1c0cm1c7c16c9cm5cm12cm6cm14c8_weight(0), cm4cm7cm4cm4cm1cm1c0cm1c7c16c9cm5cm12cm6cm14c8_weight(1));
    PL_STEP_0_for_c5c6c4cm4c2cm3cm1cm1c17cm9c19c6cm46cm3c6c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c6c4cm4c2cm3cm1cm1c17cm9c19c6cm46cm3c6c14_weight(0), c5c6c4cm4c2cm3cm1cm1c17cm9c19c6cm46cm3c6c14_weight(1));
    PL_STEP_0_for_c8c8c4c7c1cm7c1c2c8cm8cm5c3cm1cm1cm8cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c8c4c7c1cm7c1c2c8cm8cm5c3cm1cm1cm8cm5_weight(0), c8c8c4c7c1cm7c1c2c8cm8cm5c3cm1cm1cm8cm5_weight(1));
    PL_STEP_0_for_cm4c1c3cm20c2c8cm2cm1cm7cm31c5cm20c0cm9c0cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c1c3cm20c2c8cm2cm1cm7cm31c5cm20c0cm9c0cm12_weight(0), cm4c1c3cm20c2c8cm2cm1cm7cm31c5cm20c0cm9c0cm12_weight(1));
    PL_STEP_0_for_c15cm2c26cm3cm4cm6c0c14cm35c0cm6c0c2c7c10cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c15cm2c26cm3cm4cm6c0c14cm35c0cm6c0c2c7c10cm10_weight(0), c15cm2c26cm3cm4cm6c0c14cm35c0cm6c0c2c7c10cm10_weight(1));
    PL_STEP_0_for_cm18cm14c2c6cm2cm2c0c1cm12cm20c12cm6c5cm17cm6cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm18cm14c2c6cm2cm2c0c1cm12cm20c12cm6c5cm17cm6cm3_weight(0), cm18cm14c2c6cm2cm2c0c1cm12cm20c12cm6c5cm17cm6cm3_weight(1));
    PL_STEP_0_for_cm10cm2c2c8cm1cm1cm7c0cm14c38c1c33c1c1cm3c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10cm2c2c8cm1cm1cm7c0cm14c38c1c33c1c1cm3c3_weight(0), cm10cm2c2c8cm1cm1cm7c0cm14c38c1c33c1c1cm3c3_weight(1));
    PL_STEP_0_for_cm6c14c2cm9cm1c3c3c114cm3cm14c5c0c4c27c3cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c14c2cm9cm1c3c3c114cm3cm14c5c0c4c27c3cm5_weight(0), cm6c14c2cm9cm1c3c3c114cm3cm14c5c0c4c27c3cm5_weight(1));
    PL_STEP_0_for_c0cm6c1c8c0cm1c2cm2c1c15c0cm15c6cm19c7cm25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm6c1c8c0cm1c2cm2c1c15c0cm15c6cm19c7cm25_weight(0), c0cm6c1c8c0cm1c2cm2c1c15c0cm15c6cm19c7cm25_weight(1));
    PL_STEP_0_for_c3c7c2c7cm5c2c0c11cm30cm4c0cm5cm15c2cm43cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c7c2c7cm5c2c0c11cm30cm4c0cm5cm15c2cm43cm4_weight(0), c3c7c2c7cm5c2c0c11cm30cm4c0cm5cm15c2cm43cm4_weight(1));
    PL_STEP_0_for_cm14c17c2cm11c5c1c0cm3cm6c32cm9cm3cm15c2cm61cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14c17c2cm11c5c1c0cm3cm6c32cm9cm3cm15c2cm61cm3_weight(0), cm14c17c2cm11c5c1c0cm3cm6c32cm9cm3cm15c2cm61cm3_weight(1));
    PL_STEP_0_for_c3cm9cm8cm1cm1c0c1cm1cm29c2cm6cm2c8cm3c11c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm9cm8cm1cm1c0c1cm1cm29c2cm6cm2c8cm3c11c11_weight(0), c3cm9cm8cm1cm1c0c1cm1cm29c2cm6cm2c8cm3c11c11_weight(1));
    PL_STEP_0_for_c8c2cm9cm2c3c2cm4c8c5cm28cm13c1cm18c5cm9c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c2cm9cm2c3c2cm4c8c5cm28cm13c1cm18c5cm9c1_weight(0), c8c2cm9cm2c3c2cm4c8c5cm28cm13c1cm18c5cm9c1_weight(1));
    PL_STEP_0_for_c2c3cm10cm14cm5c1cm2cm1c14c6c10c4cm5c4cm1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c3cm10cm14cm5c1cm2cm1c14c6c10c4cm5c4cm1c2_weight(0), c2c3cm10cm14cm5c1cm2cm1c14c6c10c4cm5c4cm1c2_weight(1));
    PL_STEP_0_for_c2cm6c6cm38c4cm5c6c1cm22cm7c47c7c15cm8cm12c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm6c6cm38c4cm5c6c1cm22cm7c47c7c15cm8cm12c0_weight(0), c2cm6c6cm38c4cm5c6c1cm22cm7c47c7c15cm8cm12c0_weight(1));
    PL_STEP_0_for_c7cm10cm7c8c0c3c0cm1c27c5c5c19cm10c1c26c17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm10cm7c8c0c3c0cm1c27c5c5c19cm10c1c26c17_weight(0), c7cm10cm7c8c0c3c0cm1c27c5c5c19cm10c1c26c17_weight(1));
    PL_STEP_0_for_c63cm5cm42c7cm2cm7cm1c2cm2c2c2cm8c7cm14cm12cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c63cm5cm42c7cm2cm7cm1c2cm2c2c2cm8c7cm14cm12cm6_weight(0), c63cm5cm42c7cm2cm7cm1c2cm2c2c2cm8c7cm14cm12cm6_weight(1));
    PL_STEP_0_for_cm11c16cm2cm30c1c0c0c2c9c12c12c45c1c10c11c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11c16cm2cm30c1c0c0c2c9c12c12c45c1c10c11c1_weight(0), cm11c16cm2cm30c1c0c0c2c9c12c12c45c1c10c11c1_weight(1));
    PL_STEP_0_for_c9cm1c16cm25cm1cm3cm2c2cm3cm6c65c2cm11c11cm8c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9cm1c16cm25cm1cm3cm2c2cm3cm6c65c2cm11c11cm8c14_weight(0), c9cm1c16cm25cm1cm3cm2c2cm3cm6c65c2cm11c11cm8c14_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c5c58c21cm20cm3cm2cm8c1c3cm18cm1c2c65cm8c16c43_c2c3cm10cm14cm5c1cm2cm1c14c6c10c4cm5c4cm1c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5c58c21cm20cm3cm2cm8c1c3cm18cm1c2c65cm8c16c43_weight(1)(8-1 downto 0),
			B	=> c2c3cm10cm14cm5c1cm2cm1c14c6c10c4cm5c4cm1c2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c58c21cm20cm3cm2cm8c1c3cm18cm1c2c65cm8c16c43,
			CxB => R_c2c3cm10cm14cm5c1cm2cm1c14c6c10c4cm5c4cm1c2
		);

    cm6c14c2cm9cm1c3c3c114cm3cm14c5c0c4c27c3cm5_c8c8c4c7c1cm7c1c2c8cm8cm5c3cm1cm1cm8cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6c14c2cm9cm1c3c3c114cm3cm14c5c0c4c27c3cm5_weight(1)(8-1 downto 0),
			B	=> c8c8c4c7c1cm7c1c2c8cm8cm5c3cm1cm1cm8cm5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c14c2cm9cm1c3c3c114cm3cm14c5c0c4c27c3cm5,
			CxB => R_c8c8c4c7c1cm7c1c2c8cm8cm5c3cm1cm1cm8cm5
		);

    c9cm1c16cm25cm1cm3cm2c2cm3cm6c65c2cm11c11cm8c14_c5cm4cm9cm12c1c0cm3cm1c0cm1c9c1cm1c0c10c12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c9cm1c16cm25cm1cm3cm2c2cm3cm6c65c2cm11c11cm8c14_weight(1)(8-1 downto 0),
			B	=> c5cm4cm9cm12c1c0cm3cm1c0cm1c9c1cm1c0c10c12_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9cm1c16cm25cm1cm3cm2c2cm3cm6c65c2cm11c11cm8c14,
			CxB => R_c5cm4cm9cm12c1c0cm3cm1c0cm1c9c1cm1c0c10c12
		);

    cm6c17cm10c23c4cm1cm2cm1c12cm4cm33cm16c4c7cm10cm1_cm12cm8cm11c1c1cm4cm7c2c1c6cm4c4c0c8c0c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6c17cm10c23c4cm1cm2cm1c12cm4cm33cm16c4c7cm10cm1_weight(1)(7-1 downto 0),
			B	=> cm12cm8cm11c1c1cm4cm7c2c1c6cm4c4c0c8c0c3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c17cm10c23c4cm1cm2cm1c12cm4cm33cm16c4c7cm10cm1,
			CxB => R_cm12cm8cm11c1c1cm4cm7c2c1c6cm4c4c0c8c0c3
		);

    cm9c9cm54c1c4c4c2c2c25c10cm40c13cm4cm11c1cm12_c7cm10cm7c8c0c3c0cm1c27c5c5c19cm10c1c26c17_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9c9cm54c1c4c4c2c2c25c10cm40c13cm4cm11c1cm12_weight(1)(7-1 downto 0),
			B	=> c7cm10cm7c8c0c3c0cm1c27c5c5c19cm10c1c26c17_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9c9cm54c1c4c4c2c2c25c10cm40c13cm4cm11c1cm12,
			CxB => R_c7cm10cm7c8c0c3c0cm1c27c5c5c19cm10c1c26c17
		);

    c6cm12c3cm6c1c0cm6c6c10c37cm4c1c15cm1cm36cm1_c8c2cm9cm2c3c2cm4c8c5cm28cm13c1cm18c5cm9c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6cm12c3cm6c1c0cm6c6c10c37cm4c1c15cm1cm36cm1_weight(1)(7-1 downto 0),
			B	=> c8c2cm9cm2c3c2cm4c8c5cm28cm13c1cm18c5cm9c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm12c3cm6c1c0cm6c6c10c37cm4c1c15cm1cm36cm1,
			CxB => R_c8c2cm9cm2c3c2cm4c8c5cm28cm13c1cm18c5cm9c1
		);

    c5c6c4cm4c2cm3cm1cm1c17cm9c19c6cm46cm3c6c14_c3cm9cm8cm1cm1c0c1cm1cm29c2cm6cm2c8cm3c11c11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5c6c4cm4c2cm3cm1cm1c17cm9c19c6cm46cm3c6c14_weight(1)(7-1 downto 0),
			B	=> c3cm9cm8cm1cm1c0c1cm1cm29c2cm6cm2c8cm3c11c11_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c6c4cm4c2cm3cm1cm1c17cm9c19c6cm46cm3c6c14,
			CxB => R_c3cm9cm8cm1cm1c0c1cm1cm29c2cm6cm2c8cm3c11c11
		);

    c15cm2c26cm3cm4cm6c0c14cm35c0cm6c0c2c7c10cm10_c0cm6c1c8c0cm1c2cm2c1c15c0cm15c6cm19c7cm25_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c15cm2c26cm3cm4cm6c0c14cm35c0cm6c0c2c7c10cm10_weight(1)(7-1 downto 0),
			B	=> c0cm6c1c8c0cm1c2cm2c1c15c0cm15c6cm19c7cm25_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c15cm2c26cm3cm4cm6c0c14cm35c0cm6c0c2c7c10cm10,
			CxB => R_c0cm6c1c8c0cm1c2cm2c1c15c0cm15c6cm19c7cm25
		);

    cm10cm2c2c8cm1cm1cm7c0cm14c38c1c33c1c1cm3c3_cm18cm14c2c6cm2cm2c0c1cm12cm20c12cm6c5cm17cm6cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm10cm2c2c8cm1cm1cm7c0cm14c38c1c33c1c1cm3c3_weight(1)(7-1 downto 0),
			B	=> cm18cm14c2c6cm2cm2c0c1cm12cm20c12cm6c5cm17cm6cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10cm2c2c8cm1cm1cm7c0cm14c38c1c33c1c1cm3c3,
			CxB => R_cm18cm14c2c6cm2cm2c0c1cm12cm20c12cm6c5cm17cm6cm3
		);

    c3c7c2c7cm5c2c0c11cm30cm4c0cm5cm15c2cm43cm4_cm4c1c3cm20c2c8cm2cm1cm7cm31c5cm20c0cm9c0cm12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c7c2c7cm5c2c0c11cm30cm4c0cm5cm15c2cm43cm4_weight(1)(7-1 downto 0),
			B	=> cm4c1c3cm20c2c8cm2cm1cm7cm31c5cm20c0cm9c0cm12_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c7c2c7cm5c2c0c11cm30cm4c0cm5cm15c2cm43cm4,
			CxB => R_cm4c1c3cm20c2c8cm2cm1cm7cm31c5cm20c0cm9c0cm12
		);

    cm14c17c2cm11c5c1c0cm3cm6c32cm9cm3cm15c2cm61cm3_cm4cm7cm4cm4cm1cm1c0cm1c7c16c9cm5cm12cm6cm14c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm14c17c2cm11c5c1c0cm3cm6c32cm9cm3cm15c2cm61cm3_weight(1)(7-1 downto 0),
			B	=> cm4cm7cm4cm4cm1cm1c0cm1c7c16c9cm5cm12cm6cm14c8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm14c17c2cm11c5c1c0cm3cm6c32cm9cm3cm15c2cm61cm3,
			CxB => R_cm4cm7cm4cm4cm1cm1c0cm1c7c16c9cm5cm12cm6cm14c8
		);

    c2cm6c6cm38c4cm5c6c1cm22cm7c47c7c15cm8cm12c0_cm7c4cm16cm3cm1c1c0c0cm8cm24c5c13c22cm11c2c11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2cm6c6cm38c4cm5c6c1cm22cm7c47c7c15cm8cm12c0_weight(1)(7-1 downto 0),
			B	=> cm7c4cm16cm3cm1c1c0c0cm8cm24c5c13c22cm11c2c11_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm6c6cm38c4cm5c6c1cm22cm7c47c7c15cm8cm12c0,
			CxB => R_cm7c4cm16cm3cm1c1c0c0cm8cm24c5c13c22cm11c2c11
		);

    c63cm5cm42c7cm2cm7cm1c2cm2c2c2cm8c7cm14cm12cm6_c23cm1cm3c8c0cm1c18c4c6c0c4c6cm2c5c21c20_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c63cm5cm42c7cm2cm7cm1c2cm2c2c2cm8c7cm14cm12cm6_weight(1)(7-1 downto 0),
			B	=> c23cm1cm3c8c0cm1c18c4c6c0c4c6cm2c5c21c20_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c63cm5cm42c7cm2cm7cm1c2cm2c2c2cm8c7cm14cm12cm6,
			CxB => R_c23cm1cm3c8c0cm1c18c4c6c0c4c6cm2c5c21c20
		);

    cm11c16cm2cm30c1c0c0c2c9c12c12c45c1c10c11c1_c14cm8cm6c2cm5c6cm1cm2c8cm2cm1cm6cm13c0c1cm25_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm11c16cm2cm30c1c0c0c2c9c12c12c45c1c10c11c1_weight(1)(7-1 downto 0),
			B	=> c14cm8cm6c2cm5c6cm1cm2c8cm2cm1cm6cm13c0c1cm25_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm11c16cm2cm30c1c0c0c2c9c12c12c45c1c10c11c1,
			CxB => R_c14cm8cm6c2cm5c6cm1cm2c8cm2cm1cm6cm13c0c1cm25
		);

    cm32c0cm7c3cm1c1c2c3c4c5c14c7c1cm10c4c1_cm25c4c0c0c0c1c1cm3cm6cm3c4c24c17c13c10cm17_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm32c0cm7c3cm1c1c2c3c4c5c14c7c1cm10c4c1_weight(1)(6-1 downto 0),
			B	=> cm25c4c0c0c0c1c1cm3cm6cm3c4c24c17c13c10cm17_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm32c0cm7c3cm1c1c2c3c4c5c14c7c1cm10c4c1,
			CxB => R_cm25c4c0c0c0c1c1cm3cm6cm3c4c24c17c13c10cm17
		);

    cm13c4c21c5cm2c0cm1cm4c13c13cm4cm11c4cm2cm11cm21_c2c3c3c20cm1c1cm2cm5cm6cm6c17cm18c3c5cm11cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm13c4c21c5cm2c0cm1cm4c13c13cm4cm11c4cm2cm11cm21_weight(1)(6-1 downto 0),
			B	=> c2c3c3c20cm1c1cm2cm5cm6cm6c17cm18c3c5cm11cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm13c4c21c5cm2c0cm1cm4c13c13cm4cm11c4cm2cm11cm21,
			CxB => R_c2c3c3c20cm1c1cm2cm5cm6cm6c17cm18c3c5cm11cm3
		);




end architecture;
