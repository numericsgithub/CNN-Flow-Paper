library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core1_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm9c0c3c21c0cm4cm2cm1cm6cm5cm4c0cm26cm32c12cm14 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c29cm10cm8cm26cm1c8cm3cm5c0c2c3c2c36c1c23c39 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1cm3cm25cm8c5c7c3c3cm1c4c5c2cm2c60c4c3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm27c5c4c6c27c2cm8c2cm3c10c4cm3c0c11c32c5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm16cm10cm15c35cm9cm8c3c27cm16c0cm4c4cm2c8cm3c21 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c17cm23c13cm57c2c3cm11cm3cm1c2cm6cm2c28cm8cm2c40 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm14c72cm1cm26c7cm5c2c0c5cm5c10c19cm10c9c7c52 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm3c22c16cm26cm4c2c0c4cm20c11c4cm1c0c18cm12cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6cm27cm30c11c7cm5c8cm9c30cm1c7c5cm13c20c27c91 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm6c8cm23cm12c0c1cm1cm4c0c2c11c4c26c10cm7cm27 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c32c19cm45c17cm13c7cm5c4cm16cm5c3c4c20c3cm17c3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2c1c21c26c2c0cm4c6c0c1cm12c8cm11c8c3c39 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c4cm66c2c13c4cm2c2c2c32c3c2c6cm14c4c7c3 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm5c5c10cm10cm6cm2cm2c3c0cm4cm1c1c17cm7cm16cm11 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm46cm19c15c6c3c3c11c2cm14c8c1c13c15c7cm2c11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm7c44cm14cm14c4cm10c3c7cm3cm1cm1c6c43cm34c2cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c6cm111c18cm14cm13cm3c1cm1c12cm8c1cm2cm8c8c5c41 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm5c5c14c17c4cm1cm3c8c2cm2c9cm5c31c2cm5c21 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm36c23c11c10cm1cm3cm6cm3c15cm2cm3cm5c71cm19cm19c31 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm5c51c24cm4cm3cm8cm5cm1cm1cm1cm2c6cm25c25cm15c28 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c10cm14cm11c42c0cm65cm2c6c1cm27cm1c2c10c12c17cm27 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm13c10c20cm29c12c0cm12c5cm8cm23c22cm30cm8c18cm3c59 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm43c9c0c1cm15c0c11cm4cm3c0cm22c6c15c14c31c5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm21cm30cm67c0c61c4cm15cm3c40c8cm37c1c20c0c26c6 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm22cm5cm2cm4c21cm2cm4c60c16c1c4cm31c3cm5c11cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c63cm5cm1cm15cm6cm1cm13c1cm5c0cm2c2c10c9c24c14 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm18cm1c9c8cm2c0c1c0c3cm1cm3c8c27c13c38c15 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm55cm21c26c1c2c6c8c1cm2cm18cm9c0c48c49c0cm11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm11cm2c2c28cm22c8c2c1cm26c0c22c11c4cm1cm4c42 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c6c2c17cm23cm6c8cm2cm2c2cm1cm26cm4c18cm14c81cm4 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c8cm1c13c28c4c0c2c9c8c6c4c1c20c21cm4c12 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm24cm15cm1c4cm2cm5c5cm6cm14c12cm18c26c11c59c14cm24 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core1_rmcm;

architecture arch of conv7_core1_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C0C3C21C0CM4CM2CM1CM6CM5CM4C0CM26CM32C12CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C29CM10CM8CM26CM1C8CM3CM5C0C2C3C2C36C1C23C39_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM3CM25CM8C5C7C3C3CM1C4C5C2CM2C60C4C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM27C5C4C6C27C2CM8C2CM3C10C4CM3C0C11C32C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM16CM10CM15C35CM9CM8C3C27CM16C0CM4C4CM2C8CM3C21_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C17CM23C13CM57C2C3CM11CM3CM1C2CM6CM2C28CM8CM2C40_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14C72CM1CM26C7CM5C2C0C5CM5C10C19CM10C9C7C52_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C22C16CM26CM4C2C0C4CM20C11C4CM1C0C18CM12CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM27CM30C11C7CM5C8CM9C30CM1C7C5CM13C20C27C91_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C8CM23CM12C0C1CM1CM4C0C2C11C4C26C10CM7CM27_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C32C19CM45C17CM13C7CM5C4CM16CM5C3C4C20C3CM17C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1C21C26C2C0CM4C6C0C1CM12C8CM11C8C3C39_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM66C2C13C4CM2C2C2C32C3C2C6CM14C4C7C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C5C10CM10CM6CM2CM2C3C0CM4CM1C1C17CM7CM16CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM46CM19C15C6C3C3C11C2CM14C8C1C13C15C7CM2C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C44CM14CM14C4CM10C3C7CM3CM1CM1C6C43CM34C2CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM111C18CM14CM13CM3C1CM1C12CM8C1CM2CM8C8C5C41_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C5C14C17C4CM1CM3C8C2CM2C9CM5C31C2CM5C21_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM36C23C11C10CM1CM3CM6CM3C15CM2CM3CM5C71CM19CM19C31_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C51C24CM4CM3CM8CM5CM1CM1CM1CM2C6CM25C25CM15C28_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10CM14CM11C42C0CM65CM2C6C1CM27CM1C2C10C12C17CM27_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C10C20CM29C12C0CM12C5CM8CM23C22CM30CM8C18CM3C59_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM43C9C0C1CM15C0C11CM4CM3C0CM22C6C15C14C31C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM21CM30CM67C0C61C4CM15CM3C40C8CM37C1C20C0C26C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM22CM5CM2CM4C21CM2CM4C60C16C1C4CM31C3CM5C11CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C63CM5CM1CM15CM6CM1CM13C1CM5C0CM2C2C10C9C24C14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM18CM1C9C8CM2C0C1C0C3CM1CM3C8C27C13C38C15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM55CM21C26C1C2C6C8C1CM2CM18CM9C0C48C49C0CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11CM2C2C28CM22C8C2C1CM26C0C22C11C4CM1CM4C42_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C2C17CM23CM6C8CM2CM2C2CM1CM26CM4C18CM14C81CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8CM1C13C28C4C0C2C9C8C6C4C1C20C21CM4C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM24CM15CM1C4CM2CM5C5CM6CM14C12CM18C26C11C59C14CM24_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm9c0c3c21c0cm4cm2cm1cm6cm5cm4c0cm26cm32c12cm14_weight : PIPELINE_TYPE_FOR_CM9C0C3C21C0CM4CM2CM1CM6CM5CM4C0CM26CM32C12CM14_WEIGHT;
    -- sfix(1, -7)
    signal c29cm10cm8cm26cm1c8cm3cm5c0c2c3c2c36c1c23c39_weight : PIPELINE_TYPE_FOR_C29CM10CM8CM26CM1C8CM3CM5C0C2C3C2C36C1C23C39_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm3cm25cm8c5c7c3c3cm1c4c5c2cm2c60c4c3_weight : PIPELINE_TYPE_FOR_CM1CM3CM25CM8C5C7C3C3CM1C4C5C2CM2C60C4C3_WEIGHT;
    -- sfix(1, -7)
    signal cm27c5c4c6c27c2cm8c2cm3c10c4cm3c0c11c32c5_weight : PIPELINE_TYPE_FOR_CM27C5C4C6C27C2CM8C2CM3C10C4CM3C0C11C32C5_WEIGHT;
    -- sfix(1, -7)
    signal cm16cm10cm15c35cm9cm8c3c27cm16c0cm4c4cm2c8cm3c21_weight : PIPELINE_TYPE_FOR_CM16CM10CM15C35CM9CM8C3C27CM16C0CM4C4CM2C8CM3C21_WEIGHT;
    -- sfix(1, -7)
    signal c17cm23c13cm57c2c3cm11cm3cm1c2cm6cm2c28cm8cm2c40_weight : PIPELINE_TYPE_FOR_C17CM23C13CM57C2C3CM11CM3CM1C2CM6CM2C28CM8CM2C40_WEIGHT;
    -- sfix(1, -7)
    signal cm14c72cm1cm26c7cm5c2c0c5cm5c10c19cm10c9c7c52_weight : PIPELINE_TYPE_FOR_CM14C72CM1CM26C7CM5C2C0C5CM5C10C19CM10C9C7C52_WEIGHT;
    -- sfix(1, -7)
    signal cm3c22c16cm26cm4c2c0c4cm20c11c4cm1c0c18cm12cm3_weight : PIPELINE_TYPE_FOR_CM3C22C16CM26CM4C2C0C4CM20C11C4CM1C0C18CM12CM3_WEIGHT;
    -- sfix(1, -7)
    signal c6cm27cm30c11c7cm5c8cm9c30cm1c7c5cm13c20c27c91_weight : PIPELINE_TYPE_FOR_C6CM27CM30C11C7CM5C8CM9C30CM1C7C5CM13C20C27C91_WEIGHT;
    -- sfix(1, -7)
    signal cm6c8cm23cm12c0c1cm1cm4c0c2c11c4c26c10cm7cm27_weight : PIPELINE_TYPE_FOR_CM6C8CM23CM12C0C1CM1CM4C0C2C11C4C26C10CM7CM27_WEIGHT;
    -- sfix(1, -7)
    signal c32c19cm45c17cm13c7cm5c4cm16cm5c3c4c20c3cm17c3_weight : PIPELINE_TYPE_FOR_C32C19CM45C17CM13C7CM5C4CM16CM5C3C4C20C3CM17C3_WEIGHT;
    -- sfix(1, -7)
    signal c2c1c21c26c2c0cm4c6c0c1cm12c8cm11c8c3c39_weight : PIPELINE_TYPE_FOR_C2C1C21C26C2C0CM4C6C0C1CM12C8CM11C8C3C39_WEIGHT;
    -- sfix(1, -7)
    signal c4cm66c2c13c4cm2c2c2c32c3c2c6cm14c4c7c3_weight : PIPELINE_TYPE_FOR_C4CM66C2C13C4CM2C2C2C32C3C2C6CM14C4C7C3_WEIGHT;
    -- sfix(1, -7)
    signal cm5c5c10cm10cm6cm2cm2c3c0cm4cm1c1c17cm7cm16cm11_weight : PIPELINE_TYPE_FOR_CM5C5C10CM10CM6CM2CM2C3C0CM4CM1C1C17CM7CM16CM11_WEIGHT;
    -- sfix(1, -7)
    signal cm46cm19c15c6c3c3c11c2cm14c8c1c13c15c7cm2c11_weight : PIPELINE_TYPE_FOR_CM46CM19C15C6C3C3C11C2CM14C8C1C13C15C7CM2C11_WEIGHT;
    -- sfix(1, -7)
    signal cm7c44cm14cm14c4cm10c3c7cm3cm1cm1c6c43cm34c2cm1_weight : PIPELINE_TYPE_FOR_CM7C44CM14CM14C4CM10C3C7CM3CM1CM1C6C43CM34C2CM1_WEIGHT;
    -- sfix(1, -7)
    signal c6cm111c18cm14cm13cm3c1cm1c12cm8c1cm2cm8c8c5c41_weight : PIPELINE_TYPE_FOR_C6CM111C18CM14CM13CM3C1CM1C12CM8C1CM2CM8C8C5C41_WEIGHT;
    -- sfix(1, -7)
    signal cm5c5c14c17c4cm1cm3c8c2cm2c9cm5c31c2cm5c21_weight : PIPELINE_TYPE_FOR_CM5C5C14C17C4CM1CM3C8C2CM2C9CM5C31C2CM5C21_WEIGHT;
    -- sfix(1, -7)
    signal cm36c23c11c10cm1cm3cm6cm3c15cm2cm3cm5c71cm19cm19c31_weight : PIPELINE_TYPE_FOR_CM36C23C11C10CM1CM3CM6CM3C15CM2CM3CM5C71CM19CM19C31_WEIGHT;
    -- sfix(1, -7)
    signal cm5c51c24cm4cm3cm8cm5cm1cm1cm1cm2c6cm25c25cm15c28_weight : PIPELINE_TYPE_FOR_CM5C51C24CM4CM3CM8CM5CM1CM1CM1CM2C6CM25C25CM15C28_WEIGHT;
    -- sfix(1, -7)
    signal c10cm14cm11c42c0cm65cm2c6c1cm27cm1c2c10c12c17cm27_weight : PIPELINE_TYPE_FOR_C10CM14CM11C42C0CM65CM2C6C1CM27CM1C2C10C12C17CM27_WEIGHT;
    -- sfix(1, -7)
    signal cm13c10c20cm29c12c0cm12c5cm8cm23c22cm30cm8c18cm3c59_weight : PIPELINE_TYPE_FOR_CM13C10C20CM29C12C0CM12C5CM8CM23C22CM30CM8C18CM3C59_WEIGHT;
    -- sfix(1, -7)
    signal cm43c9c0c1cm15c0c11cm4cm3c0cm22c6c15c14c31c5_weight : PIPELINE_TYPE_FOR_CM43C9C0C1CM15C0C11CM4CM3C0CM22C6C15C14C31C5_WEIGHT;
    -- sfix(1, -7)
    signal cm21cm30cm67c0c61c4cm15cm3c40c8cm37c1c20c0c26c6_weight : PIPELINE_TYPE_FOR_CM21CM30CM67C0C61C4CM15CM3C40C8CM37C1C20C0C26C6_WEIGHT;
    -- sfix(1, -7)
    signal cm22cm5cm2cm4c21cm2cm4c60c16c1c4cm31c3cm5c11cm4_weight : PIPELINE_TYPE_FOR_CM22CM5CM2CM4C21CM2CM4C60C16C1C4CM31C3CM5C11CM4_WEIGHT;
    -- sfix(1, -7)
    signal c63cm5cm1cm15cm6cm1cm13c1cm5c0cm2c2c10c9c24c14_weight : PIPELINE_TYPE_FOR_C63CM5CM1CM15CM6CM1CM13C1CM5C0CM2C2C10C9C24C14_WEIGHT;
    -- sfix(1, -7)
    signal cm18cm1c9c8cm2c0c1c0c3cm1cm3c8c27c13c38c15_weight : PIPELINE_TYPE_FOR_CM18CM1C9C8CM2C0C1C0C3CM1CM3C8C27C13C38C15_WEIGHT;
    -- sfix(1, -7)
    signal cm55cm21c26c1c2c6c8c1cm2cm18cm9c0c48c49c0cm11_weight : PIPELINE_TYPE_FOR_CM55CM21C26C1C2C6C8C1CM2CM18CM9C0C48C49C0CM11_WEIGHT;
    -- sfix(1, -7)
    signal cm11cm2c2c28cm22c8c2c1cm26c0c22c11c4cm1cm4c42_weight : PIPELINE_TYPE_FOR_CM11CM2C2C28CM22C8C2C1CM26C0C22C11C4CM1CM4C42_WEIGHT;
    -- sfix(1, -7)
    signal c6c2c17cm23cm6c8cm2cm2c2cm1cm26cm4c18cm14c81cm4_weight : PIPELINE_TYPE_FOR_C6C2C17CM23CM6C8CM2CM2C2CM1CM26CM4C18CM14C81CM4_WEIGHT;
    -- sfix(1, -7)
    signal c8cm1c13c28c4c0c2c9c8c6c4c1c20c21cm4c12_weight : PIPELINE_TYPE_FOR_C8CM1C13C28C4C0C2C9C8C6C4C1C20C21CM4C12_WEIGHT;
    -- sfix(1, -7)
    signal cm24cm15cm1c4cm2cm5c5cm6cm14c12cm18c26c11c59c14cm24_weight : PIPELINE_TYPE_FOR_CM24CM15CM1C4CM2CM5C5CM6CM14C12CM18C26C11C59C14CM24_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core1_rmcm_weightsconstant_memory
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
        
            dout1   => cm9c0c3c21c0cm4cm2cm1cm6cm5cm4c0cm26cm32c12cm14_weight(0), 
            dout2   => c29cm10cm8cm26cm1c8cm3cm5c0c2c3c2c36c1c23c39_weight(0), 
            dout3   => cm1cm3cm25cm8c5c7c3c3cm1c4c5c2cm2c60c4c3_weight(0), 
            dout4   => cm27c5c4c6c27c2cm8c2cm3c10c4cm3c0c11c32c5_weight(0), 
            dout5   => cm16cm10cm15c35cm9cm8c3c27cm16c0cm4c4cm2c8cm3c21_weight(0), 
            dout6   => c17cm23c13cm57c2c3cm11cm3cm1c2cm6cm2c28cm8cm2c40_weight(0), 
            dout7   => cm14c72cm1cm26c7cm5c2c0c5cm5c10c19cm10c9c7c52_weight(0), 
            dout8   => cm3c22c16cm26cm4c2c0c4cm20c11c4cm1c0c18cm12cm3_weight(0), 
            dout9   => c6cm27cm30c11c7cm5c8cm9c30cm1c7c5cm13c20c27c91_weight(0), 
            dout10   => cm6c8cm23cm12c0c1cm1cm4c0c2c11c4c26c10cm7cm27_weight(0), 
            dout11   => c32c19cm45c17cm13c7cm5c4cm16cm5c3c4c20c3cm17c3_weight(0), 
            dout12   => c2c1c21c26c2c0cm4c6c0c1cm12c8cm11c8c3c39_weight(0), 
            dout13   => c4cm66c2c13c4cm2c2c2c32c3c2c6cm14c4c7c3_weight(0), 
            dout14   => cm5c5c10cm10cm6cm2cm2c3c0cm4cm1c1c17cm7cm16cm11_weight(0), 
            dout15   => cm46cm19c15c6c3c3c11c2cm14c8c1c13c15c7cm2c11_weight(0), 
            dout16   => cm7c44cm14cm14c4cm10c3c7cm3cm1cm1c6c43cm34c2cm1_weight(0), 
            dout17   => c6cm111c18cm14cm13cm3c1cm1c12cm8c1cm2cm8c8c5c41_weight(0), 
            dout18   => cm5c5c14c17c4cm1cm3c8c2cm2c9cm5c31c2cm5c21_weight(0), 
            dout19   => cm36c23c11c10cm1cm3cm6cm3c15cm2cm3cm5c71cm19cm19c31_weight(0), 
            dout20   => cm5c51c24cm4cm3cm8cm5cm1cm1cm1cm2c6cm25c25cm15c28_weight(0), 
            dout21   => c10cm14cm11c42c0cm65cm2c6c1cm27cm1c2c10c12c17cm27_weight(0), 
            dout22   => cm13c10c20cm29c12c0cm12c5cm8cm23c22cm30cm8c18cm3c59_weight(0), 
            dout23   => cm43c9c0c1cm15c0c11cm4cm3c0cm22c6c15c14c31c5_weight(0), 
            dout24   => cm21cm30cm67c0c61c4cm15cm3c40c8cm37c1c20c0c26c6_weight(0), 
            dout25   => cm22cm5cm2cm4c21cm2cm4c60c16c1c4cm31c3cm5c11cm4_weight(0), 
            dout26   => c63cm5cm1cm15cm6cm1cm13c1cm5c0cm2c2c10c9c24c14_weight(0), 
            dout27   => cm18cm1c9c8cm2c0c1c0c3cm1cm3c8c27c13c38c15_weight(0), 
            dout28   => cm55cm21c26c1c2c6c8c1cm2cm18cm9c0c48c49c0cm11_weight(0), 
            dout29   => cm11cm2c2c28cm22c8c2c1cm26c0c22c11c4cm1cm4c42_weight(0), 
            dout30   => c6c2c17cm23cm6c8cm2cm2c2cm1cm26cm4c18cm14c81cm4_weight(0), 
            dout31   => c8cm1c13c28c4c0c2c9c8c6c4c1c20c21cm4c12_weight(0), 
            dout32   => cm24cm15cm1c4cm2cm5c5cm6cm14c12cm18c26c11c59c14cm24_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm9c0c3c21c0cm4cm2cm1cm6cm5cm4c0cm26cm32c12cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c0c3c21c0cm4cm2cm1cm6cm5cm4c0cm26cm32c12cm14_weight(0), cm9c0c3c21c0cm4cm2cm1cm6cm5cm4c0cm26cm32c12cm14_weight(1));
    PL_STEP_0_for_c29cm10cm8cm26cm1c8cm3cm5c0c2c3c2c36c1c23c39_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c29cm10cm8cm26cm1c8cm3cm5c0c2c3c2c36c1c23c39_weight(0), c29cm10cm8cm26cm1c8cm3cm5c0c2c3c2c36c1c23c39_weight(1));
    PL_STEP_0_for_cm1cm3cm25cm8c5c7c3c3cm1c4c5c2cm2c60c4c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm3cm25cm8c5c7c3c3cm1c4c5c2cm2c60c4c3_weight(0), cm1cm3cm25cm8c5c7c3c3cm1c4c5c2cm2c60c4c3_weight(1));
    PL_STEP_0_for_cm27c5c4c6c27c2cm8c2cm3c10c4cm3c0c11c32c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm27c5c4c6c27c2cm8c2cm3c10c4cm3c0c11c32c5_weight(0), cm27c5c4c6c27c2cm8c2cm3c10c4cm3c0c11c32c5_weight(1));
    PL_STEP_0_for_cm16cm10cm15c35cm9cm8c3c27cm16c0cm4c4cm2c8cm3c21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm16cm10cm15c35cm9cm8c3c27cm16c0cm4c4cm2c8cm3c21_weight(0), cm16cm10cm15c35cm9cm8c3c27cm16c0cm4c4cm2c8cm3c21_weight(1));
    PL_STEP_0_for_c17cm23c13cm57c2c3cm11cm3cm1c2cm6cm2c28cm8cm2c40_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c17cm23c13cm57c2c3cm11cm3cm1c2cm6cm2c28cm8cm2c40_weight(0), c17cm23c13cm57c2c3cm11cm3cm1c2cm6cm2c28cm8cm2c40_weight(1));
    PL_STEP_0_for_cm14c72cm1cm26c7cm5c2c0c5cm5c10c19cm10c9c7c52_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14c72cm1cm26c7cm5c2c0c5cm5c10c19cm10c9c7c52_weight(0), cm14c72cm1cm26c7cm5c2c0c5cm5c10c19cm10c9c7c52_weight(1));
    PL_STEP_0_for_cm3c22c16cm26cm4c2c0c4cm20c11c4cm1c0c18cm12cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c22c16cm26cm4c2c0c4cm20c11c4cm1c0c18cm12cm3_weight(0), cm3c22c16cm26cm4c2c0c4cm20c11c4cm1c0c18cm12cm3_weight(1));
    PL_STEP_0_for_c6cm27cm30c11c7cm5c8cm9c30cm1c7c5cm13c20c27c91_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm27cm30c11c7cm5c8cm9c30cm1c7c5cm13c20c27c91_weight(0), c6cm27cm30c11c7cm5c8cm9c30cm1c7c5cm13c20c27c91_weight(1));
    PL_STEP_0_for_cm6c8cm23cm12c0c1cm1cm4c0c2c11c4c26c10cm7cm27_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c8cm23cm12c0c1cm1cm4c0c2c11c4c26c10cm7cm27_weight(0), cm6c8cm23cm12c0c1cm1cm4c0c2c11c4c26c10cm7cm27_weight(1));
    PL_STEP_0_for_c32c19cm45c17cm13c7cm5c4cm16cm5c3c4c20c3cm17c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c32c19cm45c17cm13c7cm5c4cm16cm5c3c4c20c3cm17c3_weight(0), c32c19cm45c17cm13c7cm5c4cm16cm5c3c4c20c3cm17c3_weight(1));
    PL_STEP_0_for_c2c1c21c26c2c0cm4c6c0c1cm12c8cm11c8c3c39_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1c21c26c2c0cm4c6c0c1cm12c8cm11c8c3c39_weight(0), c2c1c21c26c2c0cm4c6c0c1cm12c8cm11c8c3c39_weight(1));
    PL_STEP_0_for_c4cm66c2c13c4cm2c2c2c32c3c2c6cm14c4c7c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm66c2c13c4cm2c2c2c32c3c2c6cm14c4c7c3_weight(0), c4cm66c2c13c4cm2c2c2c32c3c2c6cm14c4c7c3_weight(1));
    PL_STEP_0_for_cm5c5c10cm10cm6cm2cm2c3c0cm4cm1c1c17cm7cm16cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c5c10cm10cm6cm2cm2c3c0cm4cm1c1c17cm7cm16cm11_weight(0), cm5c5c10cm10cm6cm2cm2c3c0cm4cm1c1c17cm7cm16cm11_weight(1));
    PL_STEP_0_for_cm46cm19c15c6c3c3c11c2cm14c8c1c13c15c7cm2c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm46cm19c15c6c3c3c11c2cm14c8c1c13c15c7cm2c11_weight(0), cm46cm19c15c6c3c3c11c2cm14c8c1c13c15c7cm2c11_weight(1));
    PL_STEP_0_for_cm7c44cm14cm14c4cm10c3c7cm3cm1cm1c6c43cm34c2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c44cm14cm14c4cm10c3c7cm3cm1cm1c6c43cm34c2cm1_weight(0), cm7c44cm14cm14c4cm10c3c7cm3cm1cm1c6c43cm34c2cm1_weight(1));
    PL_STEP_0_for_c6cm111c18cm14cm13cm3c1cm1c12cm8c1cm2cm8c8c5c41_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm111c18cm14cm13cm3c1cm1c12cm8c1cm2cm8c8c5c41_weight(0), c6cm111c18cm14cm13cm3c1cm1c12cm8c1cm2cm8c8c5c41_weight(1));
    PL_STEP_0_for_cm5c5c14c17c4cm1cm3c8c2cm2c9cm5c31c2cm5c21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c5c14c17c4cm1cm3c8c2cm2c9cm5c31c2cm5c21_weight(0), cm5c5c14c17c4cm1cm3c8c2cm2c9cm5c31c2cm5c21_weight(1));
    PL_STEP_0_for_cm36c23c11c10cm1cm3cm6cm3c15cm2cm3cm5c71cm19cm19c31_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm36c23c11c10cm1cm3cm6cm3c15cm2cm3cm5c71cm19cm19c31_weight(0), cm36c23c11c10cm1cm3cm6cm3c15cm2cm3cm5c71cm19cm19c31_weight(1));
    PL_STEP_0_for_cm5c51c24cm4cm3cm8cm5cm1cm1cm1cm2c6cm25c25cm15c28_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c51c24cm4cm3cm8cm5cm1cm1cm1cm2c6cm25c25cm15c28_weight(0), cm5c51c24cm4cm3cm8cm5cm1cm1cm1cm2c6cm25c25cm15c28_weight(1));
    PL_STEP_0_for_c10cm14cm11c42c0cm65cm2c6c1cm27cm1c2c10c12c17cm27_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10cm14cm11c42c0cm65cm2c6c1cm27cm1c2c10c12c17cm27_weight(0), c10cm14cm11c42c0cm65cm2c6c1cm27cm1c2c10c12c17cm27_weight(1));
    PL_STEP_0_for_cm13c10c20cm29c12c0cm12c5cm8cm23c22cm30cm8c18cm3c59_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c10c20cm29c12c0cm12c5cm8cm23c22cm30cm8c18cm3c59_weight(0), cm13c10c20cm29c12c0cm12c5cm8cm23c22cm30cm8c18cm3c59_weight(1));
    PL_STEP_0_for_cm43c9c0c1cm15c0c11cm4cm3c0cm22c6c15c14c31c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm43c9c0c1cm15c0c11cm4cm3c0cm22c6c15c14c31c5_weight(0), cm43c9c0c1cm15c0c11cm4cm3c0cm22c6c15c14c31c5_weight(1));
    PL_STEP_0_for_cm21cm30cm67c0c61c4cm15cm3c40c8cm37c1c20c0c26c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm21cm30cm67c0c61c4cm15cm3c40c8cm37c1c20c0c26c6_weight(0), cm21cm30cm67c0c61c4cm15cm3c40c8cm37c1c20c0c26c6_weight(1));
    PL_STEP_0_for_cm22cm5cm2cm4c21cm2cm4c60c16c1c4cm31c3cm5c11cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm22cm5cm2cm4c21cm2cm4c60c16c1c4cm31c3cm5c11cm4_weight(0), cm22cm5cm2cm4c21cm2cm4c60c16c1c4cm31c3cm5c11cm4_weight(1));
    PL_STEP_0_for_c63cm5cm1cm15cm6cm1cm13c1cm5c0cm2c2c10c9c24c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c63cm5cm1cm15cm6cm1cm13c1cm5c0cm2c2c10c9c24c14_weight(0), c63cm5cm1cm15cm6cm1cm13c1cm5c0cm2c2c10c9c24c14_weight(1));
    PL_STEP_0_for_cm18cm1c9c8cm2c0c1c0c3cm1cm3c8c27c13c38c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm18cm1c9c8cm2c0c1c0c3cm1cm3c8c27c13c38c15_weight(0), cm18cm1c9c8cm2c0c1c0c3cm1cm3c8c27c13c38c15_weight(1));
    PL_STEP_0_for_cm55cm21c26c1c2c6c8c1cm2cm18cm9c0c48c49c0cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm55cm21c26c1c2c6c8c1cm2cm18cm9c0c48c49c0cm11_weight(0), cm55cm21c26c1c2c6c8c1cm2cm18cm9c0c48c49c0cm11_weight(1));
    PL_STEP_0_for_cm11cm2c2c28cm22c8c2c1cm26c0c22c11c4cm1cm4c42_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11cm2c2c28cm22c8c2c1cm26c0c22c11c4cm1cm4c42_weight(0), cm11cm2c2c28cm22c8c2c1cm26c0c22c11c4cm1cm4c42_weight(1));
    PL_STEP_0_for_c6c2c17cm23cm6c8cm2cm2c2cm1cm26cm4c18cm14c81cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c2c17cm23cm6c8cm2cm2c2cm1cm26cm4c18cm14c81cm4_weight(0), c6c2c17cm23cm6c8cm2cm2c2cm1cm26cm4c18cm14c81cm4_weight(1));
    PL_STEP_0_for_c8cm1c13c28c4c0c2c9c8c6c4c1c20c21cm4c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8cm1c13c28c4c0c2c9c8c6c4c1c20c21cm4c12_weight(0), c8cm1c13c28c4c0c2c9c8c6c4c1c20c21cm4c12_weight(1));
    PL_STEP_0_for_cm24cm15cm1c4cm2cm5c5cm6cm14c12cm18c26c11c59c14cm24_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm24cm15cm1c4cm2cm5c5cm6cm14c12cm18c26c11c59c14cm24_weight(0), cm24cm15cm1c4cm2cm5c5cm6cm14c12cm18c26c11c59c14cm24_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm14c72cm1cm26c7cm5c2c0c5cm5c10c19cm10c9c7c52_c8cm1c13c28c4c0c2c9c8c6c4c1c20c21cm4c12_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm14c72cm1cm26c7cm5c2c0c5cm5c10c19cm10c9c7c52_weight(1)(8-1 downto 0),
			B	=> c8cm1c13c28c4c0c2c9c8c6c4c1c20c21cm4c12_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm14c72cm1cm26c7cm5c2c0c5cm5c10c19cm10c9c7c52,
			CxB => R_c8cm1c13c28c4c0c2c9c8c6c4c1c20c21cm4c12
		);

    c6cm27cm30c11c7cm5c8cm9c30cm1c7c5cm13c20c27c91_cm5c5c14c17c4cm1cm3c8c2cm2c9cm5c31c2cm5c21_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c6cm27cm30c11c7cm5c8cm9c30cm1c7c5cm13c20c27c91_weight(1)(8-1 downto 0),
			B	=> cm5c5c14c17c4cm1cm3c8c2cm2c9cm5c31c2cm5c21_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm27cm30c11c7cm5c8cm9c30cm1c7c5cm13c20c27c91,
			CxB => R_cm5c5c14c17c4cm1cm3c8c2cm2c9cm5c31c2cm5c21
		);

    c4cm66c2c13c4cm2c2c2c32c3c2c6cm14c4c7c3_cm5c5c10cm10cm6cm2cm2c3c0cm4cm1c1c17cm7cm16cm11_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c4cm66c2c13c4cm2c2c2c32c3c2c6cm14c4c7c3_weight(1)(8-1 downto 0),
			B	=> cm5c5c10cm10cm6cm2cm2c3c0cm4cm1c1c17cm7cm16cm11_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4cm66c2c13c4cm2c2c2c32c3c2c6cm14c4c7c3,
			CxB => R_cm5c5c10cm10cm6cm2cm2c3c0cm4cm1c1c17cm7cm16cm11
		);

    c6cm111c18cm14cm13cm3c1cm1c12cm8c1cm2cm8c8c5c41_cm6c8cm23cm12c0c1cm1cm4c0c2c11c4c26c10cm7cm27_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c6cm111c18cm14cm13cm3c1cm1c12cm8c1cm2cm8c8c5c41_weight(1)(8-1 downto 0),
			B	=> cm6c8cm23cm12c0c1cm1cm4c0c2c11c4c26c10cm7cm27_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm111c18cm14cm13cm3c1cm1c12cm8c1cm2cm8c8c5c41,
			CxB => R_cm6c8cm23cm12c0c1cm1cm4c0c2c11c4c26c10cm7cm27
		);

    cm36c23c11c10cm1cm3cm6cm3c15cm2cm3cm5c71cm19cm19c31_cm3c22c16cm26cm4c2c0c4cm20c11c4cm1c0c18cm12cm3_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm36c23c11c10cm1cm3cm6cm3c15cm2cm3cm5c71cm19cm19c31_weight(1)(8-1 downto 0),
			B	=> cm3c22c16cm26cm4c2c0c4cm20c11c4cm1c0c18cm12cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm36c23c11c10cm1cm3cm6cm3c15cm2cm3cm5c71cm19cm19c31,
			CxB => R_cm3c22c16cm26cm4c2c0c4cm20c11c4cm1c0c18cm12cm3
		);

    c10cm14cm11c42c0cm65cm2c6c1cm27cm1c2c10c12c17cm27_cm9c0c3c21c0cm4cm2cm1cm6cm5cm4c0cm26cm32c12cm14_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c10cm14cm11c42c0cm65cm2c6c1cm27cm1c2c10c12c17cm27_weight(1)(8-1 downto 0),
			B	=> cm9c0c3c21c0cm4cm2cm1cm6cm5cm4c0cm26cm32c12cm14_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c10cm14cm11c42c0cm65cm2c6c1cm27cm1c2c10c12c17cm27,
			CxB => R_cm9c0c3c21c0cm4cm2cm1cm6cm5cm4c0cm26cm32c12cm14
		);

    cm21cm30cm67c0c61c4cm15cm3c40c8cm37c1c20c0c26c6_cm24cm15cm1c4cm2cm5c5cm6cm14c12cm18c26c11c59c14cm24_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm21cm30cm67c0c61c4cm15cm3c40c8cm37c1c20c0c26c6_weight(1)(8-1 downto 0),
			B	=> cm24cm15cm1c4cm2cm5c5cm6cm14c12cm18c26c11c59c14cm24_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm21cm30cm67c0c61c4cm15cm3c40c8cm37c1c20c0c26c6,
			CxB => R_cm24cm15cm1c4cm2cm5c5cm6cm14c12cm18c26c11c59c14cm24
		);

    c6c2c17cm23cm6c8cm2cm2c2cm1cm26cm4c18cm14c81cm4_cm11cm2c2c28cm22c8c2c1cm26c0c22c11c4cm1cm4c42_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c6c2c17cm23cm6c8cm2cm2c2cm1cm26cm4c18cm14c81cm4_weight(1)(8-1 downto 0),
			B	=> cm11cm2c2c28cm22c8c2c1cm26c0c22c11c4cm1cm4c42_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6c2c17cm23cm6c8cm2cm2c2cm1cm26cm4c18cm14c81cm4,
			CxB => R_cm11cm2c2c28cm22c8c2c1cm26c0c22c11c4cm1cm4c42
		);

    c29cm10cm8cm26cm1c8cm3cm5c0c2c3c2c36c1c23c39_cm55cm21c26c1c2c6c8c1cm2cm18cm9c0c48c49c0cm11_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c29cm10cm8cm26cm1c8cm3cm5c0c2c3c2c36c1c23c39_weight(1)(7-1 downto 0),
			B	=> cm55cm21c26c1c2c6c8c1cm2cm18cm9c0c48c49c0cm11_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c29cm10cm8cm26cm1c8cm3cm5c0c2c3c2c36c1c23c39,
			CxB => R_cm55cm21c26c1c2c6c8c1cm2cm18cm9c0c48c49c0cm11
		);

    cm1cm3cm25cm8c5c7c3c3cm1c4c5c2cm2c60c4c3_cm18cm1c9c8cm2c0c1c0c3cm1cm3c8c27c13c38c15_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1cm3cm25cm8c5c7c3c3cm1c4c5c2cm2c60c4c3_weight(1)(7-1 downto 0),
			B	=> cm18cm1c9c8cm2c0c1c0c3cm1cm3c8c27c13c38c15_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm3cm25cm8c5c7c3c3cm1c4c5c2cm2c60c4c3,
			CxB => R_cm18cm1c9c8cm2c0c1c0c3cm1cm3c8c27c13c38c15
		);

    cm27c5c4c6c27c2cm8c2cm3c10c4cm3c0c11c32c5_c63cm5cm1cm15cm6cm1cm13c1cm5c0cm2c2c10c9c24c14_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm27c5c4c6c27c2cm8c2cm3c10c4cm3c0c11c32c5_weight(1)(7-1 downto 0),
			B	=> c63cm5cm1cm15cm6cm1cm13c1cm5c0cm2c2c10c9c24c14_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm27c5c4c6c27c2cm8c2cm3c10c4cm3c0c11c32c5,
			CxB => R_c63cm5cm1cm15cm6cm1cm13c1cm5c0cm2c2c10c9c24c14
		);

    cm16cm10cm15c35cm9cm8c3c27cm16c0cm4c4cm2c8cm3c21_cm22cm5cm2cm4c21cm2cm4c60c16c1c4cm31c3cm5c11cm4_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm16cm10cm15c35cm9cm8c3c27cm16c0cm4c4cm2c8cm3c21_weight(1)(7-1 downto 0),
			B	=> cm22cm5cm2cm4c21cm2cm4c60c16c1c4cm31c3cm5c11cm4_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm16cm10cm15c35cm9cm8c3c27cm16c0cm4c4cm2c8cm3c21,
			CxB => R_cm22cm5cm2cm4c21cm2cm4c60c16c1c4cm31c3cm5c11cm4
		);

    c17cm23c13cm57c2c3cm11cm3cm1c2cm6cm2c28cm8cm2c40_cm43c9c0c1cm15c0c11cm4cm3c0cm22c6c15c14c31c5_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c17cm23c13cm57c2c3cm11cm3cm1c2cm6cm2c28cm8cm2c40_weight(1)(7-1 downto 0),
			B	=> cm43c9c0c1cm15c0c11cm4cm3c0cm22c6c15c14c31c5_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c17cm23c13cm57c2c3cm11cm3cm1c2cm6cm2c28cm8cm2c40,
			CxB => R_cm43c9c0c1cm15c0c11cm4cm3c0cm22c6c15c14c31c5
		);

    c32c19cm45c17cm13c7cm5c4cm16cm5c3c4c20c3cm17c3_cm13c10c20cm29c12c0cm12c5cm8cm23c22cm30cm8c18cm3c59_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c32c19cm45c17cm13c7cm5c4cm16cm5c3c4c20c3cm17c3_weight(1)(7-1 downto 0),
			B	=> cm13c10c20cm29c12c0cm12c5cm8cm23c22cm30cm8c18cm3c59_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c32c19cm45c17cm13c7cm5c4cm16cm5c3c4c20c3cm17c3,
			CxB => R_cm13c10c20cm29c12c0cm12c5cm8cm23c22cm30cm8c18cm3c59
		);

    c2c1c21c26c2c0cm4c6c0c1cm12c8cm11c8c3c39_cm5c51c24cm4cm3cm8cm5cm1cm1cm1cm2c6cm25c25cm15c28_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c2c1c21c26c2c0cm4c6c0c1cm12c8cm11c8c3c39_weight(1)(7-1 downto 0),
			B	=> cm5c51c24cm4cm3cm8cm5cm1cm1cm1cm2c6cm25c25cm15c28_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c1c21c26c2c0cm4c6c0c1cm12c8cm11c8c3c39,
			CxB => R_cm5c51c24cm4cm3cm8cm5cm1cm1cm1cm2c6cm25c25cm15c28
		);

    cm46cm19c15c6c3c3c11c2cm14c8c1c13c15c7cm2c11_cm7c44cm14cm14c4cm10c3c7cm3cm1cm1c6c43cm34c2cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm46cm19c15c6c3c3c11c2cm14c8c1c13c15c7cm2c11_weight(1)(7-1 downto 0),
			B	=> cm7c44cm14cm14c4cm10c3c7cm3cm1cm1c6c43cm34c2cm1_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm46cm19c15c6c3c3c11c2cm14c8c1c13c15c7cm2c11,
			CxB => R_cm7c44cm14cm14c4cm10c3c7cm3cm1cm1c6c43cm34c2cm1
		);




end architecture;
