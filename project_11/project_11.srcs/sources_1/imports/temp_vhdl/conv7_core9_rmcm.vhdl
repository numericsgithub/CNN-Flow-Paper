library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core9_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c12cm15cm41cm9c0c0c4c0cm4c15c5c5c9cm5c9c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c14c14c20c12cm1cm36c0cm4c13c14cm2cm17c3c5cm2c14 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2c6c18c14cm2c5c7c0c17cm12c0cm7cm2c11c1cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1cm2c31c21c4c1c6cm11cm3c7c24c6cm2c6c7c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm2cm5cm39cm2c39cm11c4cm4cm12c1c16c5cm8cm14c11cm12 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3c0cm9cm2c0cm1c18cm2c5c13cm9c36c2cm3cm10cm22 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm19cm3c0c11cm3c5c1cm8cm42c10cm8c13c16cm3c1cm16 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm11c4c13c4cm11c2cm17cm12c5cm6cm5cm8cm22cm13c0cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6c14cm2c19cm3cm7c4cm2cm6c1cm3cm23c2cm23c13c34 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm12c5c3cm11c2cm1c1cm3cm1cm8c1cm1cm1c4c16c7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c4c7cm9cm1cm6c8c6cm3cm17c7cm6cm7c11c11cm37c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm9cm4cm5c14cm2c1cm5cm2cm2cm1c10cm13cm7cm1cm49c12 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3cm12cm1cm3c8cm18c0c2c22c4c2cm9c68cm12c2c4 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c13cm16cm3c6c6c2c4cm1cm8c18c19cm8c2cm6cm8c7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm5cm13c1c6cm2cm5c1c0c13c17cm6cm8cm9cm7c27c18 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c4c4c12c15c0c37c4cm115cm3cm5cm3c1c4cm21c0cm7 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c2c8c8c39c3c8c4c2cm8c2cm20cm14c8cm3c7c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c18c1c21cm7c1cm7cm1cm3c4c1c8cm3cm22cm3c2cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c21c1cm11c18c0c0c3cm4cm11cm30c19c8cm21cm11cm8c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c5cm19c4c5c2cm6c2c12cm3c19c6c8c16cm8cm1cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm3cm4cm17c2c1cm21cm2cm14c2cm49c0cm1c1cm40cm1cm12 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2c4cm5cm2c3c1c2c6cm3cm1c4c3c14c6c72cm22 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c6c7c1c6c8c12cm12c3cm3cm1c3c2cm40cm10cm50c12 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2cm52cm9c2c10cm5c1c4c28cm6c16cm9c9c25cm26cm7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c18cm5c6cm5c5cm1cm2cm5cm2c3cm17c20c8cm3cm1cm37 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1c25c9c1c0c7c2c2c2cm3cm5cm5cm7cm3cm19cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm3cm6cm6cm38c1c2cm7c5c1c2c2c2c0c4cm4cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c8c1cm7cm8cm2c7cm17c3cm13c8c10cm2c22c11cm15cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2cm1cm4c0c48cm14c2c0c8cm3cm12cm17c1c1c0c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c13cm1cm3cm3c8c10cm3c0cm1cm5c4c24cm7c7c18cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c14cm7cm1cm42c6cm5c1cm3cm8c16cm4c6cm5c8c4c13 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c13c17cm29c16c6c5cm6c0cm14cm4cm3cm7c6cm18c3cm10 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core9_rmcm;

architecture arch of conv7_core9_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C12CM15CM41CM9C0C0C4C0CM4C15C5C5C9CM5C9C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14C14C20C12CM1CM36C0CM4C13C14CM2CM17C3C5CM2C14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C6C18C14CM2C5C7C0C17CM12C0CM7CM2C11C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM2C31C21C4C1C6CM11CM3C7C24C6CM2C6C7C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM5CM39CM2C39CM11C4CM4CM12C1C16C5CM8CM14C11CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C0CM9CM2C0CM1C18CM2C5C13CM9C36C2CM3CM10CM22_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM19CM3C0C11CM3C5C1CM8CM42C10CM8C13C16CM3C1CM16_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11C4C13C4CM11C2CM17CM12C5CM6CM5CM8CM22CM13C0CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C14CM2C19CM3CM7C4CM2CM6C1CM3CM23C2CM23C13C34_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12C5C3CM11C2CM1C1CM3CM1CM8C1CM1CM1C4C16C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C7CM9CM1CM6C8C6CM3CM17C7CM6CM7C11C11CM37C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9CM4CM5C14CM2C1CM5CM2CM2CM1C10CM13CM7CM1CM49C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM12CM1CM3C8CM18C0C2C22C4C2CM9C68CM12C2C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13CM16CM3C6C6C2C4CM1CM8C18C19CM8C2CM6CM8C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM13C1C6CM2CM5C1C0C13C17CM6CM8CM9CM7C27C18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C4C12C15C0C37C4CM115CM3CM5CM3C1C4CM21C0CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C8C8C39C3C8C4C2CM8C2CM20CM14C8CM3C7C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C18C1C21CM7C1CM7CM1CM3C4C1C8CM3CM22CM3C2CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C21C1CM11C18C0C0C3CM4CM11CM30C19C8CM21CM11CM8C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM19C4C5C2CM6C2C12CM3C19C6C8C16CM8CM1CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM4CM17C2C1CM21CM2CM14C2CM49C0CM1C1CM40CM1CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C4CM5CM2C3C1C2C6CM3CM1C4C3C14C6C72CM22_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C7C1C6C8C12CM12C3CM3CM1C3C2CM40CM10CM50C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM52CM9C2C10CM5C1C4C28CM6C16CM9C9C25CM26CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C18CM5C6CM5C5CM1CM2CM5CM2C3CM17C20C8CM3CM1CM37_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C25C9C1C0C7C2C2C2CM3CM5CM5CM7CM3CM19CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM6CM6CM38C1C2CM7C5C1C2C2C2C0C4CM4CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C1CM7CM8CM2C7CM17C3CM13C8C10CM2C22C11CM15CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM1CM4C0C48CM14C2C0C8CM3CM12CM17C1C1C0C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13CM1CM3CM3C8C10CM3C0CM1CM5C4C24CM7C7C18CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14CM7CM1CM42C6CM5C1CM3CM8C16CM4C6CM5C8C4C13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13C17CM29C16C6C5CM6C0CM14CM4CM3CM7C6CM18C3CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c12cm15cm41cm9c0c0c4c0cm4c15c5c5c9cm5c9c1_weight : PIPELINE_TYPE_FOR_C12CM15CM41CM9C0C0C4C0CM4C15C5C5C9CM5C9C1_WEIGHT;
    -- sfix(1, -7)
    signal c14c14c20c12cm1cm36c0cm4c13c14cm2cm17c3c5cm2c14_weight : PIPELINE_TYPE_FOR_C14C14C20C12CM1CM36C0CM4C13C14CM2CM17C3C5CM2C14_WEIGHT;
    -- sfix(1, -7)
    signal cm2c6c18c14cm2c5c7c0c17cm12c0cm7cm2c11c1cm1_weight : PIPELINE_TYPE_FOR_CM2C6C18C14CM2C5C7C0C17CM12C0CM7CM2C11C1CM1_WEIGHT;
    -- sfix(1, -7)
    signal c1cm2c31c21c4c1c6cm11cm3c7c24c6cm2c6c7c2_weight : PIPELINE_TYPE_FOR_C1CM2C31C21C4C1C6CM11CM3C7C24C6CM2C6C7C2_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm5cm39cm2c39cm11c4cm4cm12c1c16c5cm8cm14c11cm12_weight : PIPELINE_TYPE_FOR_CM2CM5CM39CM2C39CM11C4CM4CM12C1C16C5CM8CM14C11CM12_WEIGHT;
    -- sfix(1, -7)
    signal cm3c0cm9cm2c0cm1c18cm2c5c13cm9c36c2cm3cm10cm22_weight : PIPELINE_TYPE_FOR_CM3C0CM9CM2C0CM1C18CM2C5C13CM9C36C2CM3CM10CM22_WEIGHT;
    -- sfix(1, -7)
    signal cm19cm3c0c11cm3c5c1cm8cm42c10cm8c13c16cm3c1cm16_weight : PIPELINE_TYPE_FOR_CM19CM3C0C11CM3C5C1CM8CM42C10CM8C13C16CM3C1CM16_WEIGHT;
    -- sfix(1, -7)
    signal cm11c4c13c4cm11c2cm17cm12c5cm6cm5cm8cm22cm13c0cm1_weight : PIPELINE_TYPE_FOR_CM11C4C13C4CM11C2CM17CM12C5CM6CM5CM8CM22CM13C0CM1_WEIGHT;
    -- sfix(1, -7)
    signal c6c14cm2c19cm3cm7c4cm2cm6c1cm3cm23c2cm23c13c34_weight : PIPELINE_TYPE_FOR_C6C14CM2C19CM3CM7C4CM2CM6C1CM3CM23C2CM23C13C34_WEIGHT;
    -- sfix(1, -7)
    signal cm12c5c3cm11c2cm1c1cm3cm1cm8c1cm1cm1c4c16c7_weight : PIPELINE_TYPE_FOR_CM12C5C3CM11C2CM1C1CM3CM1CM8C1CM1CM1C4C16C7_WEIGHT;
    -- sfix(1, -7)
    signal c4c7cm9cm1cm6c8c6cm3cm17c7cm6cm7c11c11cm37c2_weight : PIPELINE_TYPE_FOR_C4C7CM9CM1CM6C8C6CM3CM17C7CM6CM7C11C11CM37C2_WEIGHT;
    -- sfix(1, -7)
    signal cm9cm4cm5c14cm2c1cm5cm2cm2cm1c10cm13cm7cm1cm49c12_weight : PIPELINE_TYPE_FOR_CM9CM4CM5C14CM2C1CM5CM2CM2CM1C10CM13CM7CM1CM49C12_WEIGHT;
    -- sfix(1, -7)
    signal c3cm12cm1cm3c8cm18c0c2c22c4c2cm9c68cm12c2c4_weight : PIPELINE_TYPE_FOR_C3CM12CM1CM3C8CM18C0C2C22C4C2CM9C68CM12C2C4_WEIGHT;
    -- sfix(1, -7)
    signal c13cm16cm3c6c6c2c4cm1cm8c18c19cm8c2cm6cm8c7_weight : PIPELINE_TYPE_FOR_C13CM16CM3C6C6C2C4CM1CM8C18C19CM8C2CM6CM8C7_WEIGHT;
    -- sfix(1, -7)
    signal cm5cm13c1c6cm2cm5c1c0c13c17cm6cm8cm9cm7c27c18_weight : PIPELINE_TYPE_FOR_CM5CM13C1C6CM2CM5C1C0C13C17CM6CM8CM9CM7C27C18_WEIGHT;
    -- sfix(1, -7)
    signal c4c4c12c15c0c37c4cm115cm3cm5cm3c1c4cm21c0cm7_weight : PIPELINE_TYPE_FOR_C4C4C12C15C0C37C4CM115CM3CM5CM3C1C4CM21C0CM7_WEIGHT;
    -- sfix(1, -7)
    signal c2c8c8c39c3c8c4c2cm8c2cm20cm14c8cm3c7c0_weight : PIPELINE_TYPE_FOR_C2C8C8C39C3C8C4C2CM8C2CM20CM14C8CM3C7C0_WEIGHT;
    -- sfix(1, -7)
    signal c18c1c21cm7c1cm7cm1cm3c4c1c8cm3cm22cm3c2cm3_weight : PIPELINE_TYPE_FOR_C18C1C21CM7C1CM7CM1CM3C4C1C8CM3CM22CM3C2CM3_WEIGHT;
    -- sfix(1, -7)
    signal c21c1cm11c18c0c0c3cm4cm11cm30c19c8cm21cm11cm8c3_weight : PIPELINE_TYPE_FOR_C21C1CM11C18C0C0C3CM4CM11CM30C19C8CM21CM11CM8C3_WEIGHT;
    -- sfix(1, -7)
    signal c5cm19c4c5c2cm6c2c12cm3c19c6c8c16cm8cm1cm7_weight : PIPELINE_TYPE_FOR_C5CM19C4C5C2CM6C2C12CM3C19C6C8C16CM8CM1CM7_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm4cm17c2c1cm21cm2cm14c2cm49c0cm1c1cm40cm1cm12_weight : PIPELINE_TYPE_FOR_CM3CM4CM17C2C1CM21CM2CM14C2CM49C0CM1C1CM40CM1CM12_WEIGHT;
    -- sfix(1, -7)
    signal cm2c4cm5cm2c3c1c2c6cm3cm1c4c3c14c6c72cm22_weight : PIPELINE_TYPE_FOR_CM2C4CM5CM2C3C1C2C6CM3CM1C4C3C14C6C72CM22_WEIGHT;
    -- sfix(1, -7)
    signal c6c7c1c6c8c12cm12c3cm3cm1c3c2cm40cm10cm50c12_weight : PIPELINE_TYPE_FOR_C6C7C1C6C8C12CM12C3CM3CM1C3C2CM40CM10CM50C12_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm52cm9c2c10cm5c1c4c28cm6c16cm9c9c25cm26cm7_weight : PIPELINE_TYPE_FOR_CM2CM52CM9C2C10CM5C1C4C28CM6C16CM9C9C25CM26CM7_WEIGHT;
    -- sfix(1, -7)
    signal c18cm5c6cm5c5cm1cm2cm5cm2c3cm17c20c8cm3cm1cm37_weight : PIPELINE_TYPE_FOR_C18CM5C6CM5C5CM1CM2CM5CM2C3CM17C20C8CM3CM1CM37_WEIGHT;
    -- sfix(1, -7)
    signal cm1c25c9c1c0c7c2c2c2cm3cm5cm5cm7cm3cm19cm7_weight : PIPELINE_TYPE_FOR_CM1C25C9C1C0C7C2C2C2CM3CM5CM5CM7CM3CM19CM7_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm6cm6cm38c1c2cm7c5c1c2c2c2c0c4cm4cm1_weight : PIPELINE_TYPE_FOR_CM3CM6CM6CM38C1C2CM7C5C1C2C2C2C0C4CM4CM1_WEIGHT;
    -- sfix(1, -7)
    signal c8c1cm7cm8cm2c7cm17c3cm13c8c10cm2c22c11cm15cm3_weight : PIPELINE_TYPE_FOR_C8C1CM7CM8CM2C7CM17C3CM13C8C10CM2C22C11CM15CM3_WEIGHT;
    -- sfix(1, -7)
    signal c2cm1cm4c0c48cm14c2c0c8cm3cm12cm17c1c1c0c2_weight : PIPELINE_TYPE_FOR_C2CM1CM4C0C48CM14C2C0C8CM3CM12CM17C1C1C0C2_WEIGHT;
    -- sfix(1, -7)
    signal c13cm1cm3cm3c8c10cm3c0cm1cm5c4c24cm7c7c18cm4_weight : PIPELINE_TYPE_FOR_C13CM1CM3CM3C8C10CM3C0CM1CM5C4C24CM7C7C18CM4_WEIGHT;
    -- sfix(1, -7)
    signal c14cm7cm1cm42c6cm5c1cm3cm8c16cm4c6cm5c8c4c13_weight : PIPELINE_TYPE_FOR_C14CM7CM1CM42C6CM5C1CM3CM8C16CM4C6CM5C8C4C13_WEIGHT;
    -- sfix(1, -7)
    signal c13c17cm29c16c6c5cm6c0cm14cm4cm3cm7c6cm18c3cm10_weight : PIPELINE_TYPE_FOR_C13C17CM29C16C6C5CM6C0CM14CM4CM3CM7C6CM18C3CM10_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core9_rmcm_weightsconstant_memory
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
        
            dout1   => c12cm15cm41cm9c0c0c4c0cm4c15c5c5c9cm5c9c1_weight(0), 
            dout2   => c14c14c20c12cm1cm36c0cm4c13c14cm2cm17c3c5cm2c14_weight(0), 
            dout3   => cm2c6c18c14cm2c5c7c0c17cm12c0cm7cm2c11c1cm1_weight(0), 
            dout4   => c1cm2c31c21c4c1c6cm11cm3c7c24c6cm2c6c7c2_weight(0), 
            dout5   => cm2cm5cm39cm2c39cm11c4cm4cm12c1c16c5cm8cm14c11cm12_weight(0), 
            dout6   => cm3c0cm9cm2c0cm1c18cm2c5c13cm9c36c2cm3cm10cm22_weight(0), 
            dout7   => cm19cm3c0c11cm3c5c1cm8cm42c10cm8c13c16cm3c1cm16_weight(0), 
            dout8   => cm11c4c13c4cm11c2cm17cm12c5cm6cm5cm8cm22cm13c0cm1_weight(0), 
            dout9   => c6c14cm2c19cm3cm7c4cm2cm6c1cm3cm23c2cm23c13c34_weight(0), 
            dout10   => cm12c5c3cm11c2cm1c1cm3cm1cm8c1cm1cm1c4c16c7_weight(0), 
            dout11   => c4c7cm9cm1cm6c8c6cm3cm17c7cm6cm7c11c11cm37c2_weight(0), 
            dout12   => cm9cm4cm5c14cm2c1cm5cm2cm2cm1c10cm13cm7cm1cm49c12_weight(0), 
            dout13   => c3cm12cm1cm3c8cm18c0c2c22c4c2cm9c68cm12c2c4_weight(0), 
            dout14   => c13cm16cm3c6c6c2c4cm1cm8c18c19cm8c2cm6cm8c7_weight(0), 
            dout15   => cm5cm13c1c6cm2cm5c1c0c13c17cm6cm8cm9cm7c27c18_weight(0), 
            dout16   => c4c4c12c15c0c37c4cm115cm3cm5cm3c1c4cm21c0cm7_weight(0), 
            dout17   => c2c8c8c39c3c8c4c2cm8c2cm20cm14c8cm3c7c0_weight(0), 
            dout18   => c18c1c21cm7c1cm7cm1cm3c4c1c8cm3cm22cm3c2cm3_weight(0), 
            dout19   => c21c1cm11c18c0c0c3cm4cm11cm30c19c8cm21cm11cm8c3_weight(0), 
            dout20   => c5cm19c4c5c2cm6c2c12cm3c19c6c8c16cm8cm1cm7_weight(0), 
            dout21   => cm3cm4cm17c2c1cm21cm2cm14c2cm49c0cm1c1cm40cm1cm12_weight(0), 
            dout22   => cm2c4cm5cm2c3c1c2c6cm3cm1c4c3c14c6c72cm22_weight(0), 
            dout23   => c6c7c1c6c8c12cm12c3cm3cm1c3c2cm40cm10cm50c12_weight(0), 
            dout24   => cm2cm52cm9c2c10cm5c1c4c28cm6c16cm9c9c25cm26cm7_weight(0), 
            dout25   => c18cm5c6cm5c5cm1cm2cm5cm2c3cm17c20c8cm3cm1cm37_weight(0), 
            dout26   => cm1c25c9c1c0c7c2c2c2cm3cm5cm5cm7cm3cm19cm7_weight(0), 
            dout27   => cm3cm6cm6cm38c1c2cm7c5c1c2c2c2c0c4cm4cm1_weight(0), 
            dout28   => c8c1cm7cm8cm2c7cm17c3cm13c8c10cm2c22c11cm15cm3_weight(0), 
            dout29   => c2cm1cm4c0c48cm14c2c0c8cm3cm12cm17c1c1c0c2_weight(0), 
            dout30   => c13cm1cm3cm3c8c10cm3c0cm1cm5c4c24cm7c7c18cm4_weight(0), 
            dout31   => c14cm7cm1cm42c6cm5c1cm3cm8c16cm4c6cm5c8c4c13_weight(0), 
            dout32   => c13c17cm29c16c6c5cm6c0cm14cm4cm3cm7c6cm18c3cm10_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c12cm15cm41cm9c0c0c4c0cm4c15c5c5c9cm5c9c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12cm15cm41cm9c0c0c4c0cm4c15c5c5c9cm5c9c1_weight(0), c12cm15cm41cm9c0c0c4c0cm4c15c5c5c9cm5c9c1_weight(1));
    PL_STEP_0_for_c14c14c20c12cm1cm36c0cm4c13c14cm2cm17c3c5cm2c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14c14c20c12cm1cm36c0cm4c13c14cm2cm17c3c5cm2c14_weight(0), c14c14c20c12cm1cm36c0cm4c13c14cm2cm17c3c5cm2c14_weight(1));
    PL_STEP_0_for_cm2c6c18c14cm2c5c7c0c17cm12c0cm7cm2c11c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c6c18c14cm2c5c7c0c17cm12c0cm7cm2c11c1cm1_weight(0), cm2c6c18c14cm2c5c7c0c17cm12c0cm7cm2c11c1cm1_weight(1));
    PL_STEP_0_for_c1cm2c31c21c4c1c6cm11cm3c7c24c6cm2c6c7c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm2c31c21c4c1c6cm11cm3c7c24c6cm2c6c7c2_weight(0), c1cm2c31c21c4c1c6cm11cm3c7c24c6cm2c6c7c2_weight(1));
    PL_STEP_0_for_cm2cm5cm39cm2c39cm11c4cm4cm12c1c16c5cm8cm14c11cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm5cm39cm2c39cm11c4cm4cm12c1c16c5cm8cm14c11cm12_weight(0), cm2cm5cm39cm2c39cm11c4cm4cm12c1c16c5cm8cm14c11cm12_weight(1));
    PL_STEP_0_for_cm3c0cm9cm2c0cm1c18cm2c5c13cm9c36c2cm3cm10cm22_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c0cm9cm2c0cm1c18cm2c5c13cm9c36c2cm3cm10cm22_weight(0), cm3c0cm9cm2c0cm1c18cm2c5c13cm9c36c2cm3cm10cm22_weight(1));
    PL_STEP_0_for_cm19cm3c0c11cm3c5c1cm8cm42c10cm8c13c16cm3c1cm16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm19cm3c0c11cm3c5c1cm8cm42c10cm8c13c16cm3c1cm16_weight(0), cm19cm3c0c11cm3c5c1cm8cm42c10cm8c13c16cm3c1cm16_weight(1));
    PL_STEP_0_for_cm11c4c13c4cm11c2cm17cm12c5cm6cm5cm8cm22cm13c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11c4c13c4cm11c2cm17cm12c5cm6cm5cm8cm22cm13c0cm1_weight(0), cm11c4c13c4cm11c2cm17cm12c5cm6cm5cm8cm22cm13c0cm1_weight(1));
    PL_STEP_0_for_c6c14cm2c19cm3cm7c4cm2cm6c1cm3cm23c2cm23c13c34_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c14cm2c19cm3cm7c4cm2cm6c1cm3cm23c2cm23c13c34_weight(0), c6c14cm2c19cm3cm7c4cm2cm6c1cm3cm23c2cm23c13c34_weight(1));
    PL_STEP_0_for_cm12c5c3cm11c2cm1c1cm3cm1cm8c1cm1cm1c4c16c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12c5c3cm11c2cm1c1cm3cm1cm8c1cm1cm1c4c16c7_weight(0), cm12c5c3cm11c2cm1c1cm3cm1cm8c1cm1cm1c4c16c7_weight(1));
    PL_STEP_0_for_c4c7cm9cm1cm6c8c6cm3cm17c7cm6cm7c11c11cm37c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c7cm9cm1cm6c8c6cm3cm17c7cm6cm7c11c11cm37c2_weight(0), c4c7cm9cm1cm6c8c6cm3cm17c7cm6cm7c11c11cm37c2_weight(1));
    PL_STEP_0_for_cm9cm4cm5c14cm2c1cm5cm2cm2cm1c10cm13cm7cm1cm49c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9cm4cm5c14cm2c1cm5cm2cm2cm1c10cm13cm7cm1cm49c12_weight(0), cm9cm4cm5c14cm2c1cm5cm2cm2cm1c10cm13cm7cm1cm49c12_weight(1));
    PL_STEP_0_for_c3cm12cm1cm3c8cm18c0c2c22c4c2cm9c68cm12c2c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm12cm1cm3c8cm18c0c2c22c4c2cm9c68cm12c2c4_weight(0), c3cm12cm1cm3c8cm18c0c2c22c4c2cm9c68cm12c2c4_weight(1));
    PL_STEP_0_for_c13cm16cm3c6c6c2c4cm1cm8c18c19cm8c2cm6cm8c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13cm16cm3c6c6c2c4cm1cm8c18c19cm8c2cm6cm8c7_weight(0), c13cm16cm3c6c6c2c4cm1cm8c18c19cm8c2cm6cm8c7_weight(1));
    PL_STEP_0_for_cm5cm13c1c6cm2cm5c1c0c13c17cm6cm8cm9cm7c27c18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm13c1c6cm2cm5c1c0c13c17cm6cm8cm9cm7c27c18_weight(0), cm5cm13c1c6cm2cm5c1c0c13c17cm6cm8cm9cm7c27c18_weight(1));
    PL_STEP_0_for_c4c4c12c15c0c37c4cm115cm3cm5cm3c1c4cm21c0cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c4c12c15c0c37c4cm115cm3cm5cm3c1c4cm21c0cm7_weight(0), c4c4c12c15c0c37c4cm115cm3cm5cm3c1c4cm21c0cm7_weight(1));
    PL_STEP_0_for_c2c8c8c39c3c8c4c2cm8c2cm20cm14c8cm3c7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c8c8c39c3c8c4c2cm8c2cm20cm14c8cm3c7c0_weight(0), c2c8c8c39c3c8c4c2cm8c2cm20cm14c8cm3c7c0_weight(1));
    PL_STEP_0_for_c18c1c21cm7c1cm7cm1cm3c4c1c8cm3cm22cm3c2cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c18c1c21cm7c1cm7cm1cm3c4c1c8cm3cm22cm3c2cm3_weight(0), c18c1c21cm7c1cm7cm1cm3c4c1c8cm3cm22cm3c2cm3_weight(1));
    PL_STEP_0_for_c21c1cm11c18c0c0c3cm4cm11cm30c19c8cm21cm11cm8c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c21c1cm11c18c0c0c3cm4cm11cm30c19c8cm21cm11cm8c3_weight(0), c21c1cm11c18c0c0c3cm4cm11cm30c19c8cm21cm11cm8c3_weight(1));
    PL_STEP_0_for_c5cm19c4c5c2cm6c2c12cm3c19c6c8c16cm8cm1cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm19c4c5c2cm6c2c12cm3c19c6c8c16cm8cm1cm7_weight(0), c5cm19c4c5c2cm6c2c12cm3c19c6c8c16cm8cm1cm7_weight(1));
    PL_STEP_0_for_cm3cm4cm17c2c1cm21cm2cm14c2cm49c0cm1c1cm40cm1cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm4cm17c2c1cm21cm2cm14c2cm49c0cm1c1cm40cm1cm12_weight(0), cm3cm4cm17c2c1cm21cm2cm14c2cm49c0cm1c1cm40cm1cm12_weight(1));
    PL_STEP_0_for_cm2c4cm5cm2c3c1c2c6cm3cm1c4c3c14c6c72cm22_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c4cm5cm2c3c1c2c6cm3cm1c4c3c14c6c72cm22_weight(0), cm2c4cm5cm2c3c1c2c6cm3cm1c4c3c14c6c72cm22_weight(1));
    PL_STEP_0_for_c6c7c1c6c8c12cm12c3cm3cm1c3c2cm40cm10cm50c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c7c1c6c8c12cm12c3cm3cm1c3c2cm40cm10cm50c12_weight(0), c6c7c1c6c8c12cm12c3cm3cm1c3c2cm40cm10cm50c12_weight(1));
    PL_STEP_0_for_cm2cm52cm9c2c10cm5c1c4c28cm6c16cm9c9c25cm26cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm52cm9c2c10cm5c1c4c28cm6c16cm9c9c25cm26cm7_weight(0), cm2cm52cm9c2c10cm5c1c4c28cm6c16cm9c9c25cm26cm7_weight(1));
    PL_STEP_0_for_c18cm5c6cm5c5cm1cm2cm5cm2c3cm17c20c8cm3cm1cm37_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c18cm5c6cm5c5cm1cm2cm5cm2c3cm17c20c8cm3cm1cm37_weight(0), c18cm5c6cm5c5cm1cm2cm5cm2c3cm17c20c8cm3cm1cm37_weight(1));
    PL_STEP_0_for_cm1c25c9c1c0c7c2c2c2cm3cm5cm5cm7cm3cm19cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c25c9c1c0c7c2c2c2cm3cm5cm5cm7cm3cm19cm7_weight(0), cm1c25c9c1c0c7c2c2c2cm3cm5cm5cm7cm3cm19cm7_weight(1));
    PL_STEP_0_for_cm3cm6cm6cm38c1c2cm7c5c1c2c2c2c0c4cm4cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm6cm6cm38c1c2cm7c5c1c2c2c2c0c4cm4cm1_weight(0), cm3cm6cm6cm38c1c2cm7c5c1c2c2c2c0c4cm4cm1_weight(1));
    PL_STEP_0_for_c8c1cm7cm8cm2c7cm17c3cm13c8c10cm2c22c11cm15cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c1cm7cm8cm2c7cm17c3cm13c8c10cm2c22c11cm15cm3_weight(0), c8c1cm7cm8cm2c7cm17c3cm13c8c10cm2c22c11cm15cm3_weight(1));
    PL_STEP_0_for_c2cm1cm4c0c48cm14c2c0c8cm3cm12cm17c1c1c0c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm1cm4c0c48cm14c2c0c8cm3cm12cm17c1c1c0c2_weight(0), c2cm1cm4c0c48cm14c2c0c8cm3cm12cm17c1c1c0c2_weight(1));
    PL_STEP_0_for_c13cm1cm3cm3c8c10cm3c0cm1cm5c4c24cm7c7c18cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13cm1cm3cm3c8c10cm3c0cm1cm5c4c24cm7c7c18cm4_weight(0), c13cm1cm3cm3c8c10cm3c0cm1cm5c4c24cm7c7c18cm4_weight(1));
    PL_STEP_0_for_c14cm7cm1cm42c6cm5c1cm3cm8c16cm4c6cm5c8c4c13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14cm7cm1cm42c6cm5c1cm3cm8c16cm4c6cm5c8c4c13_weight(0), c14cm7cm1cm42c6cm5c1cm3cm8c16cm4c6cm5c8c4c13_weight(1));
    PL_STEP_0_for_c13c17cm29c16c6c5cm6c0cm14cm4cm3cm7c6cm18c3cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13c17cm29c16c6c5cm6c0cm14cm4cm3cm7c6cm18c3cm10_weight(0), c13c17cm29c16c6c5cm6c0cm14cm4cm3cm7c6cm18c3cm10_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c3cm12cm1cm3c8cm18c0c2c22c4c2cm9c68cm12c2c4_c13c17cm29c16c6c5cm6c0cm14cm4cm3cm7c6cm18c3cm10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3cm12cm1cm3c8cm18c0c2c22c4c2cm9c68cm12c2c4_weight(1)(8-1 downto 0),
			B	=> c13c17cm29c16c6c5cm6c0cm14cm4cm3cm7c6cm18c3cm10_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm12cm1cm3c8cm18c0c2c22c4c2cm9c68cm12c2c4,
			CxB => R_c13c17cm29c16c6c5cm6c0cm14cm4cm3cm7c6cm18c3cm10
		);

    c4c4c12c15c0c37c4cm115cm3cm5cm3c1c4cm21c0cm7_c13cm1cm3cm3c8c10cm3c0cm1cm5c4c24cm7c7c18cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c4c12c15c0c37c4cm115cm3cm5cm3c1c4cm21c0cm7_weight(1)(8-1 downto 0),
			B	=> c13cm1cm3cm3c8c10cm3c0cm1cm5c4c24cm7c7c18cm4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c4c12c15c0c37c4cm115cm3cm5cm3c1c4cm21c0cm7,
			CxB => R_c13cm1cm3cm3c8c10cm3c0cm1cm5c4c24cm7c7c18cm4
		);

    cm2c4cm5cm2c3c1c2c6cm3cm1c4c3c14c6c72cm22_c8c1cm7cm8cm2c7cm17c3cm13c8c10cm2c22c11cm15cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c4cm5cm2c3c1c2c6cm3cm1c4c3c14c6c72cm22_weight(1)(8-1 downto 0),
			B	=> c8c1cm7cm8cm2c7cm17c3cm13c8c10cm2c22c11cm15cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c4cm5cm2c3c1c2c6cm3cm1c4c3c14c6c72cm22,
			CxB => R_c8c1cm7cm8cm2c7cm17c3cm13c8c10cm2c22c11cm15cm3
		);

    c12cm15cm41cm9c0c0c4c0cm4c15c5c5c9cm5c9c1_cm1c25c9c1c0c7c2c2c2cm3cm5cm5cm7cm3cm19cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c12cm15cm41cm9c0c0c4c0cm4c15c5c5c9cm5c9c1_weight(1)(7-1 downto 0),
			B	=> cm1c25c9c1c0c7c2c2c2cm3cm5cm5cm7cm3cm19cm7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c12cm15cm41cm9c0c0c4c0cm4c15c5c5c9cm5c9c1,
			CxB => R_cm1c25c9c1c0c7c2c2c2cm3cm5cm5cm7cm3cm19cm7
		);

    c14c14c20c12cm1cm36c0cm4c13c14cm2cm17c3c5cm2c14_c5cm19c4c5c2cm6c2c12cm3c19c6c8c16cm8cm1cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c14c14c20c12cm1cm36c0cm4c13c14cm2cm17c3c5cm2c14_weight(1)(7-1 downto 0),
			B	=> c5cm19c4c5c2cm6c2c12cm3c19c6c8c16cm8cm1cm7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c14c14c20c12cm1cm36c0cm4c13c14cm2cm17c3c5cm2c14,
			CxB => R_c5cm19c4c5c2cm6c2c12cm3c19c6c8c16cm8cm1cm7
		);

    cm2cm5cm39cm2c39cm11c4cm4cm12c1c16c5cm8cm14c11cm12_c21c1cm11c18c0c0c3cm4cm11cm30c19c8cm21cm11cm8c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm5cm39cm2c39cm11c4cm4cm12c1c16c5cm8cm14c11cm12_weight(1)(7-1 downto 0),
			B	=> c21c1cm11c18c0c0c3cm4cm11cm30c19c8cm21cm11cm8c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm5cm39cm2c39cm11c4cm4cm12c1c16c5cm8cm14c11cm12,
			CxB => R_c21c1cm11c18c0c0c3cm4cm11cm30c19c8cm21cm11cm8c3
		);

    cm3c0cm9cm2c0cm1c18cm2c5c13cm9c36c2cm3cm10cm22_c18c1c21cm7c1cm7cm1cm3c4c1c8cm3cm22cm3c2cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c0cm9cm2c0cm1c18cm2c5c13cm9c36c2cm3cm10cm22_weight(1)(7-1 downto 0),
			B	=> c18c1c21cm7c1cm7cm1cm3c4c1c8cm3cm22cm3c2cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c0cm9cm2c0cm1c18cm2c5c13cm9c36c2cm3cm10cm22,
			CxB => R_c18c1c21cm7c1cm7cm1cm3c4c1c8cm3cm22cm3c2cm3
		);

    cm19cm3c0c11cm3c5c1cm8cm42c10cm8c13c16cm3c1cm16_cm5cm13c1c6cm2cm5c1c0c13c17cm6cm8cm9cm7c27c18_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm19cm3c0c11cm3c5c1cm8cm42c10cm8c13c16cm3c1cm16_weight(1)(7-1 downto 0),
			B	=> cm5cm13c1c6cm2cm5c1c0c13c17cm6cm8cm9cm7c27c18_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm19cm3c0c11cm3c5c1cm8cm42c10cm8c13c16cm3c1cm16,
			CxB => R_cm5cm13c1c6cm2cm5c1c0c13c17cm6cm8cm9cm7c27c18
		);

    c6c14cm2c19cm3cm7c4cm2cm6c1cm3cm23c2cm23c13c34_c13cm16cm3c6c6c2c4cm1cm8c18c19cm8c2cm6cm8c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6c14cm2c19cm3cm7c4cm2cm6c1cm3cm23c2cm23c13c34_weight(1)(7-1 downto 0),
			B	=> c13cm16cm3c6c6c2c4cm1cm8c18c19cm8c2cm6cm8c7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6c14cm2c19cm3cm7c4cm2cm6c1cm3cm23c2cm23c13c34,
			CxB => R_c13cm16cm3c6c6c2c4cm1cm8c18c19cm8c2cm6cm8c7
		);

    c4c7cm9cm1cm6c8c6cm3cm17c7cm6cm7c11c11cm37c2_cm12c5c3cm11c2cm1c1cm3cm1cm8c1cm1cm1c4c16c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c7cm9cm1cm6c8c6cm3cm17c7cm6cm7c11c11cm37c2_weight(1)(7-1 downto 0),
			B	=> cm12c5c3cm11c2cm1c1cm3cm1cm8c1cm1cm1c4c16c7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c7cm9cm1cm6c8c6cm3cm17c7cm6cm7c11c11cm37c2,
			CxB => R_cm12c5c3cm11c2cm1c1cm3cm1cm8c1cm1cm1c4c16c7
		);

    cm9cm4cm5c14cm2c1cm5cm2cm2cm1c10cm13cm7cm1cm49c12_cm11c4c13c4cm11c2cm17cm12c5cm6cm5cm8cm22cm13c0cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9cm4cm5c14cm2c1cm5cm2cm2cm1c10cm13cm7cm1cm49c12_weight(1)(7-1 downto 0),
			B	=> cm11c4c13c4cm11c2cm17cm12c5cm6cm5cm8cm22cm13c0cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9cm4cm5c14cm2c1cm5cm2cm2cm1c10cm13cm7cm1cm49c12,
			CxB => R_cm11c4c13c4cm11c2cm17cm12c5cm6cm5cm8cm22cm13c0cm1
		);

    c2c8c8c39c3c8c4c2cm8c2cm20cm14c8cm3c7c0_c1cm2c31c21c4c1c6cm11cm3c7c24c6cm2c6c7c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c8c8c39c3c8c4c2cm8c2cm20cm14c8cm3c7c0_weight(1)(7-1 downto 0),
			B	=> c1cm2c31c21c4c1c6cm11cm3c7c24c6cm2c6c7c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c8c8c39c3c8c4c2cm8c2cm20cm14c8cm3c7c0,
			CxB => R_c1cm2c31c21c4c1c6cm11cm3c7c24c6cm2c6c7c2
		);

    cm3cm4cm17c2c1cm21cm2cm14c2cm49c0cm1c1cm40cm1cm12_cm2c6c18c14cm2c5c7c0c17cm12c0cm7cm2c11c1cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3cm4cm17c2c1cm21cm2cm14c2cm49c0cm1c1cm40cm1cm12_weight(1)(7-1 downto 0),
			B	=> cm2c6c18c14cm2c5c7c0c17cm12c0cm7cm2c11c1cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3cm4cm17c2c1cm21cm2cm14c2cm49c0cm1c1cm40cm1cm12,
			CxB => R_cm2c6c18c14cm2c5c7c0c17cm12c0cm7cm2c11c1cm1
		);

    c6c7c1c6c8c12cm12c3cm3cm1c3c2cm40cm10cm50c12_c14cm7cm1cm42c6cm5c1cm3cm8c16cm4c6cm5c8c4c13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6c7c1c6c8c12cm12c3cm3cm1c3c2cm40cm10cm50c12_weight(1)(7-1 downto 0),
			B	=> c14cm7cm1cm42c6cm5c1cm3cm8c16cm4c6cm5c8c4c13_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6c7c1c6c8c12cm12c3cm3cm1c3c2cm40cm10cm50c12,
			CxB => R_c14cm7cm1cm42c6cm5c1cm3cm8c16cm4c6cm5c8c4c13
		);

    cm2cm52cm9c2c10cm5c1c4c28cm6c16cm9c9c25cm26cm7_c2cm1cm4c0c48cm14c2c0c8cm3cm12cm17c1c1c0c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm52cm9c2c10cm5c1c4c28cm6c16cm9c9c25cm26cm7_weight(1)(7-1 downto 0),
			B	=> c2cm1cm4c0c48cm14c2c0c8cm3cm12cm17c1c1c0c2_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm52cm9c2c10cm5c1c4c28cm6c16cm9c9c25cm26cm7,
			CxB => R_c2cm1cm4c0c48cm14c2c0c8cm3cm12cm17c1c1c0c2
		);

    c18cm5c6cm5c5cm1cm2cm5cm2c3cm17c20c8cm3cm1cm37_cm3cm6cm6cm38c1c2cm7c5c1c2c2c2c0c4cm4cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c18cm5c6cm5c5cm1cm2cm5cm2c3cm17c20c8cm3cm1cm37_weight(1)(7-1 downto 0),
			B	=> cm3cm6cm6cm38c1c2cm7c5c1c2c2c2c0c4cm4cm1_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c18cm5c6cm5c5cm1cm2cm5cm2c3cm17c20c8cm3cm1cm37,
			CxB => R_cm3cm6cm6cm38c1c2cm7c5c1c2c2c2c0c4cm4cm1
		);




end architecture;
