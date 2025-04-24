LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core16 is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk   : in std_logic;
        rst   : in std_logic;

        xi    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        sel_config: in    std_logic_vector(bits(16-1)-1 downto 0);
    
        yo_1  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_2  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_19  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_22  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_24  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_29  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_30  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core16;

architecture structural of conv7_core16 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm6c11cm22c1c103c7c15c9c4c0c0c2cm4c3cm14c2_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm5cm12cm3cm3cm24cm4cm17c0c12c2cm10cm1c7c17c18cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm2cm11c6c4c4c8c2c11c60c1cm4cm3cm4cm8cm8cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2c1c29c10c7cm2cm40cm35cm7c5c1c10c10c6c10c7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c13c20c0cm17c8c11cm10cm19cm4c1c12cm1c0cm15cm43c10_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3c4cm15cm1cm16cm4c17c11cm15cm2cm1cm6cm7c3c13c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c12cm13cm2c0cm25c20c7cm28cm7cm4c3c2c7c4cm1cm16_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c20c5c43cm15cm11c10c0cm10cm9cm7cm2c1c26c11c29c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0cm19c10cm6cm2c11cm7c8c3cm4c7c8cm2c44c7cm26_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3cm5cm2c9cm30cm4c1c11cm4cm2c3cm15c6cm2cm5cm7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm72c0cm1cm6c29c5c3cm7cm1c7c7cm1cm11c3cm2c0_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm3cm3c6cm14cm2c6c10cm2c3c6cm5c1c8c1cm8cm14_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c11cm23cm9cm1cm1c14c15c0cm8c3c25c2cm2cm4c6cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c23c0c1c0c2c10c3cm4c1cm4cm1c3cm14c3c7cm4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2c9c3c0cm1cm50c23c6c6c5cm4c4c0c16c2cm5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c1c2cm1c9cm31c11c10c3cm3cm2c9cm1c0cm9cm2c10_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c26c13cm4cm3cm8c11c1c3cm9cm4cm3c12c10c10cm4cm18_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm12c0cm2c8c30c7cm12c2c8c3c6cm1c5cm1c2c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm32c3cm1cm6cm20c2cm10cm56c2cm2cm1cm59c11c9c2c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c4c4cm1cm6c26cm1c9cm12cm27cm1c4cm51c4cm12c2c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6c26c8c6cm7cm1cm3c3c0c4c4cm2cm2c3c7cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm21c8cm23cm17c7cm6c1c0cm2c2cm2c7cm3c3c1c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c17cm19cm1cm5c8cm8c7c0c8cm56c6cm2c7c9c13cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c4cm23c9cm3c9c15c1cm3c0cm10c7c2c4c81c4c3_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm2cm2cm2cm2cm6c24c5cm5c2cm10c5cm5c14c4c7c7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm4cm29c12c1c5c29c4c5c2c2c0c0c8cm18c1c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c7cm9cm10cm1c3cm10cm28c33cm12cm12cm13c1cm14c7c0c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3cm28c14c4cm6cm12c4c5c12cm1cm17c3cm1cm8cm2cm29_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2c32cm4c21c12cm1c6c6cm6cm2c1cm1cm7c15c1c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c7cm3c4c15c13c37c6c4cm2cm5c1c68c0c25c0_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm25c7cm1c2c17c3c2c4c22c3c2cm40c3c23cm4cm20_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c27c13cm22c3cm24cm32c48cm1c7cm6c3c8cm45c8cm13_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core16_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm6c11cm22c1c103c7c15c9c4c0c0c2cm4c3cm14c2 => x_cm6c11cm22c1c103c7c15c9c4c0c0c2cm4c3cm14c2_signal, 
                R_cm5cm12cm3cm3cm24cm4cm17c0c12c2cm10cm1c7c17c18cm1 => x_cm5cm12cm3cm3cm24cm4cm17c0c12c2cm10cm1c7c17c18cm1_signal, 
                R_cm2cm11c6c4c4c8c2c11c60c1cm4cm3cm4cm8cm8cm1 => x_cm2cm11c6c4c4c8c2c11c60c1cm4cm3cm4cm8cm8cm1_signal, 
                R_cm2c1c29c10c7cm2cm40cm35cm7c5c1c10c10c6c10c7 => x_cm2c1c29c10c7cm2cm40cm35cm7c5c1c10c10c6c10c7_signal, 
                R_c13c20c0cm17c8c11cm10cm19cm4c1c12cm1c0cm15cm43c10 => x_c13c20c0cm17c8c11cm10cm19cm4c1c12cm1c0cm15cm43c10_signal, 
                R_cm3c4cm15cm1cm16cm4c17c11cm15cm2cm1cm6cm7c3c13c3 => x_cm3c4cm15cm1cm16cm4c17c11cm15cm2cm1cm6cm7c3c13c3_signal, 
                R_c12cm13cm2c0cm25c20c7cm28cm7cm4c3c2c7c4cm1cm16 => x_c12cm13cm2c0cm25c20c7cm28cm7cm4c3c2c7c4cm1cm16_signal, 
                R_c20c5c43cm15cm11c10c0cm10cm9cm7cm2c1c26c11c29c0 => x_c20c5c43cm15cm11c10c0cm10cm9cm7cm2c1c26c11c29c0_signal, 
                R_c0cm19c10cm6cm2c11cm7c8c3cm4c7c8cm2c44c7cm26 => x_c0cm19c10cm6cm2c11cm7c8c3cm4c7c8cm2c44c7cm26_signal, 
                R_cm3cm5cm2c9cm30cm4c1c11cm4cm2c3cm15c6cm2cm5cm7 => x_cm3cm5cm2c9cm30cm4c1c11cm4cm2c3cm15c6cm2cm5cm7_signal, 
                R_cm72c0cm1cm6c29c5c3cm7cm1c7c7cm1cm11c3cm2c0 => x_cm72c0cm1cm6c29c5c3cm7cm1c7c7cm1cm11c3cm2c0_signal, 
                R_cm3cm3c6cm14cm2c6c10cm2c3c6cm5c1c8c1cm8cm14 => x_cm3cm3c6cm14cm2c6c10cm2c3c6cm5c1c8c1cm8cm14_signal, 
                R_c11cm23cm9cm1cm1c14c15c0cm8c3c25c2cm2cm4c6cm3 => x_c11cm23cm9cm1cm1c14c15c0cm8c3c25c2cm2cm4c6cm3_signal, 
                R_c23c0c1c0c2c10c3cm4c1cm4cm1c3cm14c3c7cm4 => x_c23c0c1c0c2c10c3cm4c1cm4cm1c3cm14c3c7cm4_signal, 
                R_c2c9c3c0cm1cm50c23c6c6c5cm4c4c0c16c2cm5 => x_c2c9c3c0cm1cm50c23c6c6c5cm4c4c0c16c2cm5_signal, 
                R_c1c2cm1c9cm31c11c10c3cm3cm2c9cm1c0cm9cm2c10 => x_c1c2cm1c9cm31c11c10c3cm3cm2c9cm1c0cm9cm2c10_signal, 
                R_c26c13cm4cm3cm8c11c1c3cm9cm4cm3c12c10c10cm4cm18 => x_c26c13cm4cm3cm8c11c1c3cm9cm4cm3c12c10c10cm4cm18_signal, 
                R_cm12c0cm2c8c30c7cm12c2c8c3c6cm1c5cm1c2c2 => x_cm12c0cm2c8c30c7cm12c2c8c3c6cm1c5cm1c2c2_signal, 
                R_cm32c3cm1cm6cm20c2cm10cm56c2cm2cm1cm59c11c9c2c1 => x_cm32c3cm1cm6cm20c2cm10cm56c2cm2cm1cm59c11c9c2c1_signal, 
                R_c4c4cm1cm6c26cm1c9cm12cm27cm1c4cm51c4cm12c2c4 => x_c4c4cm1cm6c26cm1c9cm12cm27cm1c4cm51c4cm12c2c4_signal, 
                R_cm6c26c8c6cm7cm1cm3c3c0c4c4cm2cm2c3c7cm2 => x_cm6c26c8c6cm7cm1cm3c3c0c4c4cm2cm2c3c7cm2_signal, 
                R_cm21c8cm23cm17c7cm6c1c0cm2c2cm2c7cm3c3c1c3 => x_cm21c8cm23cm17c7cm6c1c0cm2c2cm2c7cm3c3c1c3_signal, 
                R_c17cm19cm1cm5c8cm8c7c0c8cm56c6cm2c7c9c13cm1 => x_c17cm19cm1cm5c8cm8c7c0c8cm56c6cm2c7c9c13cm1_signal, 
                R_c4cm23c9cm3c9c15c1cm3c0cm10c7c2c4c81c4c3 => x_c4cm23c9cm3c9c15c1cm3c0cm10c7c2c4c81c4c3_signal, 
                R_cm2cm2cm2cm2cm6c24c5cm5c2cm10c5cm5c14c4c7c7 => x_cm2cm2cm2cm2cm6c24c5cm5c2cm10c5cm5c14c4c7c7_signal, 
                R_cm4cm29c12c1c5c29c4c5c2c2c0c0c8cm18c1c2 => x_cm4cm29c12c1c5c29c4c5c2c2c0c0c8cm18c1c2_signal, 
                R_c7cm9cm10cm1c3cm10cm28c33cm12cm12cm13c1cm14c7c0c1 => x_c7cm9cm10cm1c3cm10cm28c33cm12cm12cm13c1cm14c7c0c1_signal, 
                R_cm3cm28c14c4cm6cm12c4c5c12cm1cm17c3cm1cm8cm2cm29 => x_cm3cm28c14c4cm6cm12c4c5c12cm1cm17c3cm1cm8cm2cm29_signal, 
                R_c2c32cm4c21c12cm1c6c6cm6cm2c1cm1cm7c15c1c1 => x_c2c32cm4c21c12cm1c6c6cm6cm2c1cm1cm7c15c1c1_signal, 
                R_c0c7cm3c4c15c13c37c6c4cm2cm5c1c68c0c25c0 => x_c0c7cm3c4c15c13c37c6c4cm2cm5c1c68c0c25c0_signal, 
                R_cm25c7cm1c2c17c3c2c4c22c3c2cm40c3c23cm4cm20 => x_cm25c7cm1c2c17c3c2c4c22c3c2cm40c3c23cm4cm20_signal, 
                R_c0c27c13cm22c3cm24cm32c48cm1c7cm6c3c8cm45c8cm13 => x_c0c27c13cm22c3cm24cm32c48cm1c7cm6c3c8cm45c8cm13_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm6c11cm22c1c103c7c15c9c4c0c0c2cm4c3cm14c2_signal;
    yo_2 <= x_cm5cm12cm3cm3cm24cm4cm17c0c12c2cm10cm1c7c17c18cm1_signal;
    yo_3 <= x_cm2cm11c6c4c4c8c2c11c60c1cm4cm3cm4cm8cm8cm1_signal;
    yo_4 <= x_cm2c1c29c10c7cm2cm40cm35cm7c5c1c10c10c6c10c7_signal;
    yo_5 <= x_c13c20c0cm17c8c11cm10cm19cm4c1c12cm1c0cm15cm43c10_signal;
    yo_6 <= x_cm3c4cm15cm1cm16cm4c17c11cm15cm2cm1cm6cm7c3c13c3_signal;
    yo_7 <= x_c12cm13cm2c0cm25c20c7cm28cm7cm4c3c2c7c4cm1cm16_signal;
    yo_8 <= x_c20c5c43cm15cm11c10c0cm10cm9cm7cm2c1c26c11c29c0_signal;
    yo_9 <= x_c0cm19c10cm6cm2c11cm7c8c3cm4c7c8cm2c44c7cm26_signal;
    yo_10 <= x_cm3cm5cm2c9cm30cm4c1c11cm4cm2c3cm15c6cm2cm5cm7_signal;
    yo_11 <= x_cm72c0cm1cm6c29c5c3cm7cm1c7c7cm1cm11c3cm2c0_signal;
    yo_12 <= x_cm3cm3c6cm14cm2c6c10cm2c3c6cm5c1c8c1cm8cm14_signal;
    yo_13 <= x_c11cm23cm9cm1cm1c14c15c0cm8c3c25c2cm2cm4c6cm3_signal;
    yo_14 <= x_c23c0c1c0c2c10c3cm4c1cm4cm1c3cm14c3c7cm4_signal;
    yo_15 <= x_c2c9c3c0cm1cm50c23c6c6c5cm4c4c0c16c2cm5_signal;
    yo_16 <= x_c1c2cm1c9cm31c11c10c3cm3cm2c9cm1c0cm9cm2c10_signal;
    yo_17 <= x_c26c13cm4cm3cm8c11c1c3cm9cm4cm3c12c10c10cm4cm18_signal;
    yo_18 <= x_cm12c0cm2c8c30c7cm12c2c8c3c6cm1c5cm1c2c2_signal;
    yo_19 <= x_cm32c3cm1cm6cm20c2cm10cm56c2cm2cm1cm59c11c9c2c1_signal;
    yo_20 <= x_c4c4cm1cm6c26cm1c9cm12cm27cm1c4cm51c4cm12c2c4_signal;
    yo_21 <= x_cm6c26c8c6cm7cm1cm3c3c0c4c4cm2cm2c3c7cm2_signal;
    yo_22 <= x_cm21c8cm23cm17c7cm6c1c0cm2c2cm2c7cm3c3c1c3_signal;
    yo_23 <= x_c17cm19cm1cm5c8cm8c7c0c8cm56c6cm2c7c9c13cm1_signal;
    yo_24 <= x_c4cm23c9cm3c9c15c1cm3c0cm10c7c2c4c81c4c3_signal;
    yo_25 <= x_cm2cm2cm2cm2cm6c24c5cm5c2cm10c5cm5c14c4c7c7_signal;
    yo_26 <= x_cm4cm29c12c1c5c29c4c5c2c2c0c0c8cm18c1c2_signal;
    yo_27 <= x_c7cm9cm10cm1c3cm10cm28c33cm12cm12cm13c1cm14c7c0c1_signal;
    yo_28 <= x_cm3cm28c14c4cm6cm12c4c5c12cm1cm17c3cm1cm8cm2cm29_signal;
    yo_29 <= x_c2c32cm4c21c12cm1c6c6cm6cm2c1cm1cm7c15c1c1_signal;
    yo_30 <= x_c0c7cm3c4c15c13c37c6c4cm2cm5c1c68c0c25c0_signal;
    yo_31 <= x_cm25c7cm1c2c17c3c2c4c22c3c2cm40c3c23cm4cm20_signal;
    yo_32 <= x_c0c27c13cm22c3cm24cm32c48cm1c7cm6c3c8cm45c8cm13_signal;



end structural;