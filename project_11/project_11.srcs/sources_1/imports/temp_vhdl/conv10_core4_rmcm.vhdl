library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv10_core4_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(64-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        R_cm4cm3cm3c11cm1cm1cm3cm7cm2cm5cm1c0cm10cm2cm3c3c3cm1c0cm7c12c12cm1c0c0c5cm3cm6cm4cm3c7c0cm2cm1cm1cm7cm4cm13cm2cm2c5c0c4cm3cm9cm3cm3c8cm1cm7cm8cm1c2c11c16cm2cm2cm1cm1cm2c12cm9cm4c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c6cm6cm19cm2c0c10cm3c0cm15cm6c3c11cm8cm2c11cm8cm10cm20cm2c62cm15c4c4c8c26cm14cm20c0cm6cm3cm4cm8cm1cm15cm5cm11cm13c1cm1c24c1c4cm6c4cm6c2cm12c3cm15cm2c2c15cm19c50cm6c0c7c1cm10c24cm6cm10cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm3cm5cm6c2c0cm6cm7c8cm3c2c2cm1c0cm1c2c0c7c6cm1cm6c6c3cm2cm5c2c9cm3c7cm3cm1cm7c0cm1cm1c6c9cm3c6cm2cm2c7c0c1cm4c9cm2cm8c2cm3cm4c1cm1c0c3c8c0cm2cm2cm2c4c2cm2cm6c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c3c6cm6cm7c0cm16cm9cm29c1cm14cm8c4cm11cm12cm20cm10c10c83c22cm3cm14c22c5c6cm16c7cm8cm19c0cm5c25cm12cm9cm12cm17cm18c7cm7cm1cm2cm9c1c5cm6c9cm4c2c13c2c8cm6c8cm3c18cm10cm7c0c3c2cm16cm8c0cm7cm7 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c23c14cm4cm39c27c60c24c4cm10c55cm5c10c32cm14c13cm28cm26cm84cm15c40cm40cm33c15c16cm52cm6c74cm12c1cm12cm3c29c22cm6cm41cm7c24c37cm7cm6cm5c18c19c2cm2cm14c42cm17c36c11cm8c11cm13cm25cm38cm4cm12c35c28cm16cm14c20c43cm33 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm4c2cm5c6cm5cm12cm15c27c1cm22cm6cm2cm20cm4c10cm6c14c1cm13cm8cm10c11c2c1cm9cm9cm22c29cm1cm2cm18cm10c4c2cm3c25c2cm5c1cm1c2cm2cm1cm5cm5cm2c1c6cm5cm1cm6c1c5c11cm11cm5cm1cm3cm4c10cm4c3cm4c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm4cm3cm11c0c0cm5cm1cm3cm3c1cm1cm1c5c2cm1c6c4c3c14cm6cm2c0cm2cm4c11cm2cm7cm4cm5cm2c6c1cm2cm2c7cm9cm5c3cm1cm1cm4cm1c2cm4cm1cm4cm7c1cm2c2c4cm2cm1c3cm3cm1cm2cm1cm2c8cm2c0cm3c2 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm6c2cm6c2cm8c1c4cm2c4cm20cm3cm1cm5cm3cm2c18cm5c0c12cm10cm18cm7c1cm2c26cm16cm13c10cm1cm4cm1cm7c4cm6cm6c0cm4cm7c0cm1cm16cm2c2cm5cm1cm3cm3cm3cm7c5cm2c1cm4cm11cm15cm5c0cm4cm4c4cm11c4cm10c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm3cm3cm1c3c1cm1cm2c5cm2cm1c2c0cm2c1c1c9c2cm3cm1cm6c1c6cm2cm1c3cm10c3c12cm3c0cm6c2c2cm2c1c11cm2cm10cm1cm1cm4c0c2cm3c0cm2cm4cm2cm1c2c0cm2cm1c3c2c0cm2cm2cm1cm2c0cm1cm1c1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv10_core4_rmcm;

architecture arch of conv10_core4_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM3CM3C11CM1CM1CM3CM7CM2CM5CM1C0CM10CM2CM3C3C3CM1C0CM7C12C12CM1C0C0C5CM3CM6CM4CM3C7C0CM2CM1CM1CM7CM4CM13CM2CM2C5C0C4CM3CM9CM3CM3C8CM1CM7CM8CM1C2C11C16CM2CM2CM1CM1CM2C12CM9CM4C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C6CM6CM19CM2C0C10CM3C0CM15CM6C3C11CM8CM2C11CM8CM10CM20CM2C62CM15C4C4C8C26CM14CM20C0CM6CM3CM4CM8CM1CM15CM5CM11CM13C1CM1C24C1C4CM6C4CM6C2CM12C3CM15CM2C2C15CM19C50CM6C0C7C1CM10C24CM6CM10CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM5CM6C2C0CM6CM7C8CM3C2C2CM1C0CM1C2C0C7C6CM1CM6C6C3CM2CM5C2C9CM3C7CM3CM1CM7C0CM1CM1C6C9CM3C6CM2CM2C7C0C1CM4C9CM2CM8C2CM3CM4C1CM1C0C3C8C0CM2CM2CM2C4C2CM2CM6C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C6CM6CM7C0CM16CM9CM29C1CM14CM8C4CM11CM12CM20CM10C10C83C22CM3CM14C22C5C6CM16C7CM8CM19C0CM5C25CM12CM9CM12CM17CM18C7CM7CM1CM2CM9C1C5CM6C9CM4C2C13C2C8CM6C8CM3C18CM10CM7C0C3C2CM16CM8C0CM7CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C23C14CM4CM39C27C60C24C4CM10C55CM5C10C32CM14C13CM28CM26CM84CM15C40CM40CM33C15C16CM52CM6C74CM12C1CM12CM3C29C22CM6CM41CM7C24C37CM7CM6CM5C18C19C2CM2CM14C42CM17C36C11CM8C11CM13CM25CM38CM4CM12C35C28CM16CM14C20C43CM33_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C2CM5C6CM5CM12CM15C27C1CM22CM6CM2CM20CM4C10CM6C14C1CM13CM8CM10C11C2C1CM9CM9CM22C29CM1CM2CM18CM10C4C2CM3C25C2CM5C1CM1C2CM2CM1CM5CM5CM2C1C6CM5CM1CM6C1C5C11CM11CM5CM1CM3CM4C10CM4C3CM4C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM3CM11C0C0CM5CM1CM3CM3C1CM1CM1C5C2CM1C6C4C3C14CM6CM2C0CM2CM4C11CM2CM7CM4CM5CM2C6C1CM2CM2C7CM9CM5C3CM1CM1CM4CM1C2CM4CM1CM4CM7C1CM2C2C4CM2CM1C3CM3CM1CM2CM1CM2C8CM2C0CM3C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C2CM6C2CM8C1C4CM2C4CM20CM3CM1CM5CM3CM2C18CM5C0C12CM10CM18CM7C1CM2C26CM16CM13C10CM1CM4CM1CM7C4CM6CM6C0CM4CM7C0CM1CM16CM2C2CM5CM1CM3CM3CM3CM7C5CM2C1CM4CM11CM15CM5C0CM4CM4C4CM11C4CM10C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM3CM1C3C1CM1CM2C5CM2CM1C2C0CM2C1C1C9C2CM3CM1CM6C1C6CM2CM1C3CM10C3C12CM3C0CM6C2C2CM2C1C11CM2CM10CM1CM1CM4C0C2CM3C0CM2CM4CM2CM1C2C0CM2CM1C3C2C0CM2CM2CM1CM2C0CM1CM1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(3, -4)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(4, -4)
    signal cm4cm3cm3c11cm1cm1cm3cm7cm2cm5cm1c0cm10cm2cm3c3c3cm1c0cm7c12c12cm1c0c0c5cm3cm6cm4cm3c7c0cm2cm1cm1cm7cm4cm13cm2cm2c5c0c4cm3cm9cm3cm3c8cm1cm7cm8cm1c2c11c16cm2cm2cm1cm1cm2c12cm9cm4c1_weight : PIPELINE_TYPE_FOR_CM4CM3CM3C11CM1CM1CM3CM7CM2CM5CM1C0CM10CM2CM3C3C3CM1C0CM7C12C12CM1C0C0C5CM3CM6CM4CM3C7C0CM2CM1CM1CM7CM4CM13CM2CM2C5C0C4CM3CM9CM3CM3C8CM1CM7CM8CM1C2C11C16CM2CM2CM1CM1CM2C12CM9CM4C1_WEIGHT;
    -- sfix(4, -4)
    signal c0c6cm6cm19cm2c0c10cm3c0cm15cm6c3c11cm8cm2c11cm8cm10cm20cm2c62cm15c4c4c8c26cm14cm20c0cm6cm3cm4cm8cm1cm15cm5cm11cm13c1cm1c24c1c4cm6c4cm6c2cm12c3cm15cm2c2c15cm19c50cm6c0c7c1cm10c24cm6cm10cm4_weight : PIPELINE_TYPE_FOR_C0C6CM6CM19CM2C0C10CM3C0CM15CM6C3C11CM8CM2C11CM8CM10CM20CM2C62CM15C4C4C8C26CM14CM20C0CM6CM3CM4CM8CM1CM15CM5CM11CM13C1CM1C24C1C4CM6C4CM6C2CM12C3CM15CM2C2C15CM19C50CM6C0C7C1CM10C24CM6CM10CM4_WEIGHT;
    -- sfix(4, -4)
    signal cm3cm5cm6c2c0cm6cm7c8cm3c2c2cm1c0cm1c2c0c7c6cm1cm6c6c3cm2cm5c2c9cm3c7cm3cm1cm7c0cm1cm1c6c9cm3c6cm2cm2c7c0c1cm4c9cm2cm8c2cm3cm4c1cm1c0c3c8c0cm2cm2cm2c4c2cm2cm6c0_weight : PIPELINE_TYPE_FOR_CM3CM5CM6C2C0CM6CM7C8CM3C2C2CM1C0CM1C2C0C7C6CM1CM6C6C3CM2CM5C2C9CM3C7CM3CM1CM7C0CM1CM1C6C9CM3C6CM2CM2C7C0C1CM4C9CM2CM8C2CM3CM4C1CM1C0C3C8C0CM2CM2CM2C4C2CM2CM6C0_WEIGHT;
    -- sfix(4, -4)
    signal c3c6cm6cm7c0cm16cm9cm29c1cm14cm8c4cm11cm12cm20cm10c10c83c22cm3cm14c22c5c6cm16c7cm8cm19c0cm5c25cm12cm9cm12cm17cm18c7cm7cm1cm2cm9c1c5cm6c9cm4c2c13c2c8cm6c8cm3c18cm10cm7c0c3c2cm16cm8c0cm7cm7_weight : PIPELINE_TYPE_FOR_C3C6CM6CM7C0CM16CM9CM29C1CM14CM8C4CM11CM12CM20CM10C10C83C22CM3CM14C22C5C6CM16C7CM8CM19C0CM5C25CM12CM9CM12CM17CM18C7CM7CM1CM2CM9C1C5CM6C9CM4C2C13C2C8CM6C8CM3C18CM10CM7C0C3C2CM16CM8C0CM7CM7_WEIGHT;
    -- sfix(4, -4)
    signal c23c14cm4cm39c27c60c24c4cm10c55cm5c10c32cm14c13cm28cm26cm84cm15c40cm40cm33c15c16cm52cm6c74cm12c1cm12cm3c29c22cm6cm41cm7c24c37cm7cm6cm5c18c19c2cm2cm14c42cm17c36c11cm8c11cm13cm25cm38cm4cm12c35c28cm16cm14c20c43cm33_weight : PIPELINE_TYPE_FOR_C23C14CM4CM39C27C60C24C4CM10C55CM5C10C32CM14C13CM28CM26CM84CM15C40CM40CM33C15C16CM52CM6C74CM12C1CM12CM3C29C22CM6CM41CM7C24C37CM7CM6CM5C18C19C2CM2CM14C42CM17C36C11CM8C11CM13CM25CM38CM4CM12C35C28CM16CM14C20C43CM33_WEIGHT;
    -- sfix(4, -4)
    signal cm4c2cm5c6cm5cm12cm15c27c1cm22cm6cm2cm20cm4c10cm6c14c1cm13cm8cm10c11c2c1cm9cm9cm22c29cm1cm2cm18cm10c4c2cm3c25c2cm5c1cm1c2cm2cm1cm5cm5cm2c1c6cm5cm1cm6c1c5c11cm11cm5cm1cm3cm4c10cm4c3cm4c2_weight : PIPELINE_TYPE_FOR_CM4C2CM5C6CM5CM12CM15C27C1CM22CM6CM2CM20CM4C10CM6C14C1CM13CM8CM10C11C2C1CM9CM9CM22C29CM1CM2CM18CM10C4C2CM3C25C2CM5C1CM1C2CM2CM1CM5CM5CM2C1C6CM5CM1CM6C1C5C11CM11CM5CM1CM3CM4C10CM4C3CM4C2_WEIGHT;
    -- sfix(4, -4)
    signal cm4cm3cm11c0c0cm5cm1cm3cm3c1cm1cm1c5c2cm1c6c4c3c14cm6cm2c0cm2cm4c11cm2cm7cm4cm5cm2c6c1cm2cm2c7cm9cm5c3cm1cm1cm4cm1c2cm4cm1cm4cm7c1cm2c2c4cm2cm1c3cm3cm1cm2cm1cm2c8cm2c0cm3c2_weight : PIPELINE_TYPE_FOR_CM4CM3CM11C0C0CM5CM1CM3CM3C1CM1CM1C5C2CM1C6C4C3C14CM6CM2C0CM2CM4C11CM2CM7CM4CM5CM2C6C1CM2CM2C7CM9CM5C3CM1CM1CM4CM1C2CM4CM1CM4CM7C1CM2C2C4CM2CM1C3CM3CM1CM2CM1CM2C8CM2C0CM3C2_WEIGHT;
    -- sfix(4, -4)
    signal cm6c2cm6c2cm8c1c4cm2c4cm20cm3cm1cm5cm3cm2c18cm5c0c12cm10cm18cm7c1cm2c26cm16cm13c10cm1cm4cm1cm7c4cm6cm6c0cm4cm7c0cm1cm16cm2c2cm5cm1cm3cm3cm3cm7c5cm2c1cm4cm11cm15cm5c0cm4cm4c4cm11c4cm10c2_weight : PIPELINE_TYPE_FOR_CM6C2CM6C2CM8C1C4CM2C4CM20CM3CM1CM5CM3CM2C18CM5C0C12CM10CM18CM7C1CM2C26CM16CM13C10CM1CM4CM1CM7C4CM6CM6C0CM4CM7C0CM1CM16CM2C2CM5CM1CM3CM3CM3CM7C5CM2C1CM4CM11CM15CM5C0CM4CM4C4CM11C4CM10C2_WEIGHT;
    -- sfix(4, -4)
    signal cm3cm3cm1c3c1cm1cm2c5cm2cm1c2c0cm2c1c1c9c2cm3cm1cm6c1c6cm2cm1c3cm10c3c12cm3c0cm6c2c2cm2c1c11cm2cm10cm1cm1cm4c0c2cm3c0cm2cm4cm2cm1c2c0cm2cm1c3c2c0cm2cm2cm1cm2c0cm1cm1c1_weight : PIPELINE_TYPE_FOR_CM3CM3CM1C3C1CM1CM2C5CM2CM1C2C0CM2C1C1C9C2CM3CM1CM6C1C6CM2CM1C3CM10C3C12CM3C0CM6C2C2CM2C1C11CM2CM10CM1CM1CM4C0C2CM3C0CM2CM4CM2CM1C2C0CM2CM1C3C2C0CM2CM2CM1CM2C0CM1CM1C1_WEIGHT;
    -- sfix(4, -4)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_cm4c2cm5c6cm5cm12cm15c27c1cm22cm6cm2cm20cm4c10cm6c14c1cm13cm8cm10c11c2c1cm9cm9cm22c29cm1cm2cm18cm10c4c2cm3c25c2cm5c1cm1c2cm2cm1cm5cm5cm2c1c6cm5cm1cm6c1c5c11cm11cm5cm1cm3cm4c10cm4c3cm4c2_undelayed : std_logic_vector(13-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv10_core4_rmcm_weightsconstant_memory
        generic map
        (
            XI_WIDTH        	          => 8, 
            ARRAY_SIZE                    => 64,
            WORDS_PER_ADDR                => 9
        )
        port map
        (
            clk => clk,
            data_index => unsigned(SEL),
        
            dout1   => cm4cm3cm3c11cm1cm1cm3cm7cm2cm5cm1c0cm10cm2cm3c3c3cm1c0cm7c12c12cm1c0c0c5cm3cm6cm4cm3c7c0cm2cm1cm1cm7cm4cm13cm2cm2c5c0c4cm3cm9cm3cm3c8cm1cm7cm8cm1c2c11c16cm2cm2cm1cm1cm2c12cm9cm4c1_weight(0), 
            dout2   => c0c6cm6cm19cm2c0c10cm3c0cm15cm6c3c11cm8cm2c11cm8cm10cm20cm2c62cm15c4c4c8c26cm14cm20c0cm6cm3cm4cm8cm1cm15cm5cm11cm13c1cm1c24c1c4cm6c4cm6c2cm12c3cm15cm2c2c15cm19c50cm6c0c7c1cm10c24cm6cm10cm4_weight(0), 
            dout3   => cm3cm5cm6c2c0cm6cm7c8cm3c2c2cm1c0cm1c2c0c7c6cm1cm6c6c3cm2cm5c2c9cm3c7cm3cm1cm7c0cm1cm1c6c9cm3c6cm2cm2c7c0c1cm4c9cm2cm8c2cm3cm4c1cm1c0c3c8c0cm2cm2cm2c4c2cm2cm6c0_weight(0), 
            dout4   => c3c6cm6cm7c0cm16cm9cm29c1cm14cm8c4cm11cm12cm20cm10c10c83c22cm3cm14c22c5c6cm16c7cm8cm19c0cm5c25cm12cm9cm12cm17cm18c7cm7cm1cm2cm9c1c5cm6c9cm4c2c13c2c8cm6c8cm3c18cm10cm7c0c3c2cm16cm8c0cm7cm7_weight(0), 
            dout5   => c23c14cm4cm39c27c60c24c4cm10c55cm5c10c32cm14c13cm28cm26cm84cm15c40cm40cm33c15c16cm52cm6c74cm12c1cm12cm3c29c22cm6cm41cm7c24c37cm7cm6cm5c18c19c2cm2cm14c42cm17c36c11cm8c11cm13cm25cm38cm4cm12c35c28cm16cm14c20c43cm33_weight(0), 
            dout6   => cm4c2cm5c6cm5cm12cm15c27c1cm22cm6cm2cm20cm4c10cm6c14c1cm13cm8cm10c11c2c1cm9cm9cm22c29cm1cm2cm18cm10c4c2cm3c25c2cm5c1cm1c2cm2cm1cm5cm5cm2c1c6cm5cm1cm6c1c5c11cm11cm5cm1cm3cm4c10cm4c3cm4c2_weight(0), 
            dout7   => cm4cm3cm11c0c0cm5cm1cm3cm3c1cm1cm1c5c2cm1c6c4c3c14cm6cm2c0cm2cm4c11cm2cm7cm4cm5cm2c6c1cm2cm2c7cm9cm5c3cm1cm1cm4cm1c2cm4cm1cm4cm7c1cm2c2c4cm2cm1c3cm3cm1cm2cm1cm2c8cm2c0cm3c2_weight(0), 
            dout8   => cm6c2cm6c2cm8c1c4cm2c4cm20cm3cm1cm5cm3cm2c18cm5c0c12cm10cm18cm7c1cm2c26cm16cm13c10cm1cm4cm1cm7c4cm6cm6c0cm4cm7c0cm1cm16cm2c2cm5cm1cm3cm3cm3cm7c5cm2c1cm4cm11cm15cm5c0cm4cm4c4cm11c4cm10c2_weight(0), 
            dout9   => cm3cm3cm1c3c1cm1cm2c5cm2cm1c2c0cm2c1c1c9c2cm3cm1cm6c1c6cm2cm1c3cm10c3c12cm3c0cm6c2c2cm2c1c11cm2cm10cm1cm1cm4c0c2cm3c0cm2cm4cm2cm1c2c0cm2cm1c3c2c0cm2cm2cm1cm2c0cm1cm1c1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm4cm3cm3c11cm1cm1cm3cm7cm2cm5cm1c0cm10cm2cm3c3c3cm1c0cm7c12c12cm1c0c0c5cm3cm6cm4cm3c7c0cm2cm1cm1cm7cm4cm13cm2cm2c5c0c4cm3cm9cm3cm3c8cm1cm7cm8cm1c2c11c16cm2cm2cm1cm1cm2c12cm9cm4c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm3cm3c11cm1cm1cm3cm7cm2cm5cm1c0cm10cm2cm3c3c3cm1c0cm7c12c12cm1c0c0c5cm3cm6cm4cm3c7c0cm2cm1cm1cm7cm4cm13cm2cm2c5c0c4cm3cm9cm3cm3c8cm1cm7cm8cm1c2c11c16cm2cm2cm1cm1cm2c12cm9cm4c1_weight(0), cm4cm3cm3c11cm1cm1cm3cm7cm2cm5cm1c0cm10cm2cm3c3c3cm1c0cm7c12c12cm1c0c0c5cm3cm6cm4cm3c7c0cm2cm1cm1cm7cm4cm13cm2cm2c5c0c4cm3cm9cm3cm3c8cm1cm7cm8cm1c2c11c16cm2cm2cm1cm1cm2c12cm9cm4c1_weight(1));
    PL_STEP_0_for_c0c6cm6cm19cm2c0c10cm3c0cm15cm6c3c11cm8cm2c11cm8cm10cm20cm2c62cm15c4c4c8c26cm14cm20c0cm6cm3cm4cm8cm1cm15cm5cm11cm13c1cm1c24c1c4cm6c4cm6c2cm12c3cm15cm2c2c15cm19c50cm6c0c7c1cm10c24cm6cm10cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c6cm6cm19cm2c0c10cm3c0cm15cm6c3c11cm8cm2c11cm8cm10cm20cm2c62cm15c4c4c8c26cm14cm20c0cm6cm3cm4cm8cm1cm15cm5cm11cm13c1cm1c24c1c4cm6c4cm6c2cm12c3cm15cm2c2c15cm19c50cm6c0c7c1cm10c24cm6cm10cm4_weight(0), c0c6cm6cm19cm2c0c10cm3c0cm15cm6c3c11cm8cm2c11cm8cm10cm20cm2c62cm15c4c4c8c26cm14cm20c0cm6cm3cm4cm8cm1cm15cm5cm11cm13c1cm1c24c1c4cm6c4cm6c2cm12c3cm15cm2c2c15cm19c50cm6c0c7c1cm10c24cm6cm10cm4_weight(1));
    PL_STEP_0_for_cm3cm5cm6c2c0cm6cm7c8cm3c2c2cm1c0cm1c2c0c7c6cm1cm6c6c3cm2cm5c2c9cm3c7cm3cm1cm7c0cm1cm1c6c9cm3c6cm2cm2c7c0c1cm4c9cm2cm8c2cm3cm4c1cm1c0c3c8c0cm2cm2cm2c4c2cm2cm6c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm5cm6c2c0cm6cm7c8cm3c2c2cm1c0cm1c2c0c7c6cm1cm6c6c3cm2cm5c2c9cm3c7cm3cm1cm7c0cm1cm1c6c9cm3c6cm2cm2c7c0c1cm4c9cm2cm8c2cm3cm4c1cm1c0c3c8c0cm2cm2cm2c4c2cm2cm6c0_weight(0), cm3cm5cm6c2c0cm6cm7c8cm3c2c2cm1c0cm1c2c0c7c6cm1cm6c6c3cm2cm5c2c9cm3c7cm3cm1cm7c0cm1cm1c6c9cm3c6cm2cm2c7c0c1cm4c9cm2cm8c2cm3cm4c1cm1c0c3c8c0cm2cm2cm2c4c2cm2cm6c0_weight(1));
    PL_STEP_0_for_c3c6cm6cm7c0cm16cm9cm29c1cm14cm8c4cm11cm12cm20cm10c10c83c22cm3cm14c22c5c6cm16c7cm8cm19c0cm5c25cm12cm9cm12cm17cm18c7cm7cm1cm2cm9c1c5cm6c9cm4c2c13c2c8cm6c8cm3c18cm10cm7c0c3c2cm16cm8c0cm7cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c6cm6cm7c0cm16cm9cm29c1cm14cm8c4cm11cm12cm20cm10c10c83c22cm3cm14c22c5c6cm16c7cm8cm19c0cm5c25cm12cm9cm12cm17cm18c7cm7cm1cm2cm9c1c5cm6c9cm4c2c13c2c8cm6c8cm3c18cm10cm7c0c3c2cm16cm8c0cm7cm7_weight(0), c3c6cm6cm7c0cm16cm9cm29c1cm14cm8c4cm11cm12cm20cm10c10c83c22cm3cm14c22c5c6cm16c7cm8cm19c0cm5c25cm12cm9cm12cm17cm18c7cm7cm1cm2cm9c1c5cm6c9cm4c2c13c2c8cm6c8cm3c18cm10cm7c0c3c2cm16cm8c0cm7cm7_weight(1));
    PL_STEP_0_for_c23c14cm4cm39c27c60c24c4cm10c55cm5c10c32cm14c13cm28cm26cm84cm15c40cm40cm33c15c16cm52cm6c74cm12c1cm12cm3c29c22cm6cm41cm7c24c37cm7cm6cm5c18c19c2cm2cm14c42cm17c36c11cm8c11cm13cm25cm38cm4cm12c35c28cm16cm14c20c43cm33_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c23c14cm4cm39c27c60c24c4cm10c55cm5c10c32cm14c13cm28cm26cm84cm15c40cm40cm33c15c16cm52cm6c74cm12c1cm12cm3c29c22cm6cm41cm7c24c37cm7cm6cm5c18c19c2cm2cm14c42cm17c36c11cm8c11cm13cm25cm38cm4cm12c35c28cm16cm14c20c43cm33_weight(0), c23c14cm4cm39c27c60c24c4cm10c55cm5c10c32cm14c13cm28cm26cm84cm15c40cm40cm33c15c16cm52cm6c74cm12c1cm12cm3c29c22cm6cm41cm7c24c37cm7cm6cm5c18c19c2cm2cm14c42cm17c36c11cm8c11cm13cm25cm38cm4cm12c35c28cm16cm14c20c43cm33_weight(1));
    PL_STEP_0_for_cm4c2cm5c6cm5cm12cm15c27c1cm22cm6cm2cm20cm4c10cm6c14c1cm13cm8cm10c11c2c1cm9cm9cm22c29cm1cm2cm18cm10c4c2cm3c25c2cm5c1cm1c2cm2cm1cm5cm5cm2c1c6cm5cm1cm6c1c5c11cm11cm5cm1cm3cm4c10cm4c3cm4c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c2cm5c6cm5cm12cm15c27c1cm22cm6cm2cm20cm4c10cm6c14c1cm13cm8cm10c11c2c1cm9cm9cm22c29cm1cm2cm18cm10c4c2cm3c25c2cm5c1cm1c2cm2cm1cm5cm5cm2c1c6cm5cm1cm6c1c5c11cm11cm5cm1cm3cm4c10cm4c3cm4c2_weight(0), cm4c2cm5c6cm5cm12cm15c27c1cm22cm6cm2cm20cm4c10cm6c14c1cm13cm8cm10c11c2c1cm9cm9cm22c29cm1cm2cm18cm10c4c2cm3c25c2cm5c1cm1c2cm2cm1cm5cm5cm2c1c6cm5cm1cm6c1c5c11cm11cm5cm1cm3cm4c10cm4c3cm4c2_weight(1));
    PL_STEP_0_for_cm4cm3cm11c0c0cm5cm1cm3cm3c1cm1cm1c5c2cm1c6c4c3c14cm6cm2c0cm2cm4c11cm2cm7cm4cm5cm2c6c1cm2cm2c7cm9cm5c3cm1cm1cm4cm1c2cm4cm1cm4cm7c1cm2c2c4cm2cm1c3cm3cm1cm2cm1cm2c8cm2c0cm3c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm3cm11c0c0cm5cm1cm3cm3c1cm1cm1c5c2cm1c6c4c3c14cm6cm2c0cm2cm4c11cm2cm7cm4cm5cm2c6c1cm2cm2c7cm9cm5c3cm1cm1cm4cm1c2cm4cm1cm4cm7c1cm2c2c4cm2cm1c3cm3cm1cm2cm1cm2c8cm2c0cm3c2_weight(0), cm4cm3cm11c0c0cm5cm1cm3cm3c1cm1cm1c5c2cm1c6c4c3c14cm6cm2c0cm2cm4c11cm2cm7cm4cm5cm2c6c1cm2cm2c7cm9cm5c3cm1cm1cm4cm1c2cm4cm1cm4cm7c1cm2c2c4cm2cm1c3cm3cm1cm2cm1cm2c8cm2c0cm3c2_weight(1));
    PL_STEP_0_for_cm6c2cm6c2cm8c1c4cm2c4cm20cm3cm1cm5cm3cm2c18cm5c0c12cm10cm18cm7c1cm2c26cm16cm13c10cm1cm4cm1cm7c4cm6cm6c0cm4cm7c0cm1cm16cm2c2cm5cm1cm3cm3cm3cm7c5cm2c1cm4cm11cm15cm5c0cm4cm4c4cm11c4cm10c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c2cm6c2cm8c1c4cm2c4cm20cm3cm1cm5cm3cm2c18cm5c0c12cm10cm18cm7c1cm2c26cm16cm13c10cm1cm4cm1cm7c4cm6cm6c0cm4cm7c0cm1cm16cm2c2cm5cm1cm3cm3cm3cm7c5cm2c1cm4cm11cm15cm5c0cm4cm4c4cm11c4cm10c2_weight(0), cm6c2cm6c2cm8c1c4cm2c4cm20cm3cm1cm5cm3cm2c18cm5c0c12cm10cm18cm7c1cm2c26cm16cm13c10cm1cm4cm1cm7c4cm6cm6c0cm4cm7c0cm1cm16cm2c2cm5cm1cm3cm3cm3cm7c5cm2c1cm4cm11cm15cm5c0cm4cm4c4cm11c4cm10c2_weight(1));
    PL_STEP_0_for_cm3cm3cm1c3c1cm1cm2c5cm2cm1c2c0cm2c1c1c9c2cm3cm1cm6c1c6cm2cm1c3cm10c3c12cm3c0cm6c2c2cm2c1c11cm2cm10cm1cm1cm4c0c2cm3c0cm2cm4cm2cm1c2c0cm2cm1c3c2c0cm2cm2cm1cm2c0cm1cm1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm3cm1c3c1cm1cm2c5cm2cm1c2c0cm2c1c1c9c2cm3cm1cm6c1c6cm2cm1c3cm10c3c12cm3c0cm6c2c2cm2c1c11cm2cm10cm1cm1cm4c0c2cm3c0cm2cm4cm2cm1c2c0cm2cm1c3c2c0cm2cm2cm1cm2c0cm1cm1c1_weight(0), cm3cm3cm1c3c1cm1cm2c5cm2cm1c2c0cm2c1c1c9c2cm3cm1cm6c1c6cm2cm1c3cm10c3c12cm3c0cm6c2c2cm2c1c11cm2cm10cm1cm1cm4c0c2cm3c0cm2cm4cm2cm1c2c0cm2cm1c3c2c0cm2cm2cm1cm2c0cm1cm1c1_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c3c6cm6cm7c0cm16cm9cm29c1cm14cm8c4cm11cm12cm20cm10c10c83c22cm3cm14c22c5c6cm16c7cm8cm19c0cm5c25cm12cm9cm12cm17cm18c7cm7cm1cm2cm9c1c5cm6c9cm4c2c13c2c8cm6c8cm3c18cm10cm7c0c3c2cm16cm8c0cm7cm7_cm3cm3cm1c3c1cm1cm2c5cm2cm1c2c0cm2c1c1c9c2cm3cm1cm6c1c6cm2cm1c3cm10c3c12cm3c0cm6c2c2cm2c1c11cm2cm10cm1cm1cm4c0c2cm3c0cm2cm4cm2cm1c2c0cm2cm1c3c2c0cm2cm2cm1cm2c0cm1cm1c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(3, -4)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c3c6cm6cm7c0cm16cm9cm29c1cm14cm8c4cm11cm12cm20cm10c10c83c22cm3cm14c22c5c6cm16c7cm8cm19c0cm5c25cm12cm9cm12cm17cm18c7cm7cm1cm2cm9c1c5cm6c9cm4c2c13c2c8cm6c8cm3c18cm10cm7c0c3c2cm16cm8c0cm7cm7_weight(1)(8-1 downto 0),
			B	=> cm3cm3cm1c3c1cm1cm2c5cm2cm1c2c0cm2c1c1c9c2cm3cm1cm6c1c6cm2cm1c3cm10c3c12cm3c0cm6c2c2cm2c1c11cm2cm10cm1cm1cm4c0c2cm3c0cm2cm4cm2cm1c2c0cm2cm1c3c2c0cm2cm2cm1cm2c0cm1cm1c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c6cm6cm7c0cm16cm9cm29c1cm14cm8c4cm11cm12cm20cm10c10c83c22cm3cm14c22c5c6cm16c7cm8cm19c0cm5c25cm12cm9cm12cm17cm18c7cm7cm1cm2cm9c1c5cm6c9cm4c2c13c2c8cm6c8cm3c18cm10cm7c0c3c2cm16cm8c0cm7cm7,
			CxB => R_cm3cm3cm1c3c1cm1cm2c5cm2cm1c2c0cm2c1c1c9c2cm3cm1cm6c1c6cm2cm1c3cm10c3c12cm3c0cm6c2c2cm2c1c11cm2cm10cm1cm1cm4c0c2cm3c0cm2cm4cm2cm1c2c0cm2cm1c3c2c0cm2cm2cm1cm2c0cm1cm1c1
		);

    c23c14cm4cm39c27c60c24c4cm10c55cm5c10c32cm14c13cm28cm26cm84cm15c40cm40cm33c15c16cm52cm6c74cm12c1cm12cm3c29c22cm6cm41cm7c24c37cm7cm6cm5c18c19c2cm2cm14c42cm17c36c11cm8c11cm13cm25cm38cm4cm12c35c28cm16cm14c20c43cm33_cm4cm3cm11c0c0cm5cm1cm3cm3c1cm1cm1c5c2cm1c6c4c3c14cm6cm2c0cm2cm4c11cm2cm7cm4cm5cm2c6c1cm2cm2c7cm9cm5c3cm1cm1cm4cm1c2cm4cm1cm4cm7c1cm2c2c4cm2cm1c3cm3cm1cm2cm1cm2c8cm2c0cm3c2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(3, -4)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c23c14cm4cm39c27c60c24c4cm10c55cm5c10c32cm14c13cm28cm26cm84cm15c40cm40cm33c15c16cm52cm6c74cm12c1cm12cm3c29c22cm6cm41cm7c24c37cm7cm6cm5c18c19c2cm2cm14c42cm17c36c11cm8c11cm13cm25cm38cm4cm12c35c28cm16cm14c20c43cm33_weight(1)(8-1 downto 0),
			B	=> cm4cm3cm11c0c0cm5cm1cm3cm3c1cm1cm1c5c2cm1c6c4c3c14cm6cm2c0cm2cm4c11cm2cm7cm4cm5cm2c6c1cm2cm2c7cm9cm5c3cm1cm1cm4cm1c2cm4cm1cm4cm7c1cm2c2c4cm2cm1c3cm3cm1cm2cm1cm2c8cm2c0cm3c2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c23c14cm4cm39c27c60c24c4cm10c55cm5c10c32cm14c13cm28cm26cm84cm15c40cm40cm33c15c16cm52cm6c74cm12c1cm12cm3c29c22cm6cm41cm7c24c37cm7cm6cm5c18c19c2cm2cm14c42cm17c36c11cm8c11cm13cm25cm38cm4cm12c35c28cm16cm14c20c43cm33,
			CxB => R_cm4cm3cm11c0c0cm5cm1cm3cm3c1cm1cm1c5c2cm1c6c4c3c14cm6cm2c0cm2cm4c11cm2cm7cm4cm5cm2c6c1cm2cm2c7cm9cm5c3cm1cm1cm4cm1c2cm4cm1cm4cm7c1cm2c2c4cm2cm1c3cm3cm1cm2cm1cm2c8cm2c0cm3c2
		);

    c0c6cm6cm19cm2c0c10cm3c0cm15cm6c3c11cm8cm2c11cm8cm10cm20cm2c62cm15c4c4c8c26cm14cm20c0cm6cm3cm4cm8cm1cm15cm5cm11cm13c1cm1c24c1c4cm6c4cm6c2cm12c3cm15cm2c2c15cm19c50cm6c0c7c1cm10c24cm6cm10cm4_cm3cm5cm6c2c0cm6cm7c8cm3c2c2cm1c0cm1c2c0c7c6cm1cm6c6c3cm2cm5c2c9cm3c7cm3cm1cm7c0cm1cm1c6c9cm3c6cm2cm2c7c0c1cm4c9cm2cm8c2cm3cm4c1cm1c0c3c8c0cm2cm2cm2c4c2cm2cm6c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(3, -4)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c6cm6cm19cm2c0c10cm3c0cm15cm6c3c11cm8cm2c11cm8cm10cm20cm2c62cm15c4c4c8c26cm14cm20c0cm6cm3cm4cm8cm1cm15cm5cm11cm13c1cm1c24c1c4cm6c4cm6c2cm12c3cm15cm2c2c15cm19c50cm6c0c7c1cm10c24cm6cm10cm4_weight(1)(7-1 downto 0),
			B	=> cm3cm5cm6c2c0cm6cm7c8cm3c2c2cm1c0cm1c2c0c7c6cm1cm6c6c3cm2cm5c2c9cm3c7cm3cm1cm7c0cm1cm1c6c9cm3c6cm2cm2c7c0c1cm4c9cm2cm8c2cm3cm4c1cm1c0c3c8c0cm2cm2cm2c4c2cm2cm6c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c6cm6cm19cm2c0c10cm3c0cm15cm6c3c11cm8cm2c11cm8cm10cm20cm2c62cm15c4c4c8c26cm14cm20c0cm6cm3cm4cm8cm1cm15cm5cm11cm13c1cm1c24c1c4cm6c4cm6c2cm12c3cm15cm2c2c15cm19c50cm6c0c7c1cm10c24cm6cm10cm4,
			CxB => R_cm3cm5cm6c2c0cm6cm7c8cm3c2c2cm1c0cm1c2c0c7c6cm1cm6c6c3cm2cm5c2c9cm3c7cm3cm1cm7c0cm1cm1c6c9cm3c6cm2cm2c7c0c1cm4c9cm2cm8c2cm3cm4c1cm1c0c3c8c0cm2cm2cm2c4c2cm2cm6c0
		);

    cm4cm3cm3c11cm1cm1cm3cm7cm2cm5cm1c0cm10cm2cm3c3c3cm1c0cm7c12c12cm1c0c0c5cm3cm6cm4cm3c7c0cm2cm1cm1cm7cm4cm13cm2cm2c5c0c4cm3cm9cm3cm3c8cm1cm7cm8cm1c2c11c16cm2cm2cm1cm1cm2c12cm9cm4c1_cm6c2cm6c2cm8c1c4cm2c4cm20cm3cm1cm5cm3cm2c18cm5c0c12cm10cm18cm7c1cm2c26cm16cm13c10cm1cm4cm1cm7c4cm6cm6c0cm4cm7c0cm1cm16cm2c2cm5cm1cm3cm3cm3cm7c5cm2c1cm4cm11cm15cm5c0cm4cm4c4cm11c4cm10c2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(3, -4)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm4cm3cm3c11cm1cm1cm3cm7cm2cm5cm1c0cm10cm2cm3c3c3cm1c0cm7c12c12cm1c0c0c5cm3cm6cm4cm3c7c0cm2cm1cm1cm7cm4cm13cm2cm2c5c0c4cm3cm9cm3cm3c8cm1cm7cm8cm1c2c11c16cm2cm2cm1cm1cm2c12cm9cm4c1_weight(1)(6-1 downto 0),
			B	=> cm6c2cm6c2cm8c1c4cm2c4cm20cm3cm1cm5cm3cm2c18cm5c0c12cm10cm18cm7c1cm2c26cm16cm13c10cm1cm4cm1cm7c4cm6cm6c0cm4cm7c0cm1cm16cm2c2cm5cm1cm3cm3cm3cm7c5cm2c1cm4cm11cm15cm5c0cm4cm4c4cm11c4cm10c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm3cm3c11cm1cm1cm3cm7cm2cm5cm1c0cm10cm2cm3c3c3cm1c0cm7c12c12cm1c0c0c5cm3cm6cm4cm3c7c0cm2cm1cm1cm7cm4cm13cm2cm2c5c0c4cm3cm9cm3cm3c8cm1cm7cm8cm1c2c11c16cm2cm2cm1cm1cm2c12cm9cm4c1,
			CxB => R_cm6c2cm6c2cm8c1c4cm2c4cm20cm3cm1cm5cm3cm2c18cm5c0c12cm10cm18cm7c1cm2c26cm16cm13c10cm1cm4cm1cm7c4cm6cm6c0cm4cm7c0cm1cm16cm2c2cm5cm1cm3cm3cm3cm7c5cm2c1cm4cm11cm15cm5c0cm4cm4c4cm11c4cm10c2
		);




    cm4c2cm5c6cm5cm12cm15c27c1cm22cm6cm2cm20cm4c10cm6c14c1cm13cm8cm10c11c2c1cm9cm9cm22c29cm1cm2cm18cm10c4c2cm3c25c2cm5c1cm1c2cm2cm1cm5cm5cm2c1c6cm5cm1cm6c1c5c11cm11cm5cm1cm3cm4c10cm4c3cm4c2_MULT: entity work.TruncatedSingleMult
	generic map
		(
            A_WIDTH           => 8, --	sfix(4, -4)
            A_TRUNCATED_WIDTH => 6, -- This would be the MSB position of the weight
            B_WIDTH           => 7, --	ufix(3, -4)
            AxB_WIDTH         => 13, --	sfix(5, -8)
            AxB_FRAC_TRUNCATION => 0,
            B_IS_SIGNED       => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm4c2cm5c6cm5cm12cm15c27c1cm22cm6cm2cm20cm4c10cm6c14c1cm13cm8cm10c11c2c1cm9cm9cm22c29cm1cm2cm18cm10c4c2cm3c25c2cm5c1cm1c2cm2cm1cm5cm5cm2c1c6cm5cm1cm6c1c5c11cm11cm5cm1cm3cm4c10cm4c3cm4c2_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_cm4c2cm5c6cm5cm12cm15c27c1cm22cm6cm2cm20cm4c10cm6c14c1cm13cm8cm10c11c2c1cm9cm9cm22c29cm1cm2cm18cm10c4c2cm3c25c2cm5c1cm1c2cm2cm1cm5cm5cm2c1c6cm5cm1cm6c1c5c11cm11cm5cm1cm3cm4c10cm4c3cm4c2
		);

end architecture;
