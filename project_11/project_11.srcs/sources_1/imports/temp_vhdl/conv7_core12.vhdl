LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core12 is
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
    
        yo_1  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_2  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_3  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_14  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_15  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_16  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_18  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_21  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_29  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_31  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core12;

architecture structural of conv7_core12 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c10c3c18c7c5c2cm12c2cm3c15cm1c15c5cm8c3c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm4cm4cm36c1cm50c2cm1c6c2cm32c0cm14cm6c1cm7cm18_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm12cm8cm5c2c4c7c3cm4cm3cm65c5c3c2c4cm1c0_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm4cm10cm21cm21c5c0c6cm35cm11c1cm6c1c9cm4cm1c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm40c5c21c34c3c11c11c7cm4c24cm3cm8c14c7c6cm24_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2c3c30c1cm3cm4c4cm6c1c27cm6c40cm1c6c1c13_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2cm3cm1c12c8c3c2cm6cm10c13c0cm28c18c19c13cm7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm33cm4cm51c30c3cm1c1c1c9cm2c4c9c10cm15c2cm9_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6c34c22cm9cm6cm12cm6c0cm9cm5cm26cm2c41cm10c3c10_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0cm3c2c2cm1cm5c1c1cm7c19c10c4c4c1c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c21cm5c0cm18cm5cm65c2c3cm42cm5cm1c71c9c0c5cm9_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm3c1c5cm7c6c3c12cm1cm2c0c2cm12c1c0cm12c15_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm23c21cm12c1c17c4c13c1cm1c3c2c0c3cm9cm1c11_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm34c2c3cm2cm9c7c1c1cm5c4c0c3cm6cm5cm8c12_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm5cm63c5cm5c4cm4cm6cm3c0cm23cm4c1cm68cm4cm1c1_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm6cm16cm2cm11c62c5c4c8c2cm31c0c7cm6c21cm3cm12_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm20cm4cm5cm6c2c4c3cm5c10c6cm43c9cm5cm5cm6cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c7c1cm6c5cm4cm3c0c0c11c8c2cm3c5c12cm4c13_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm13c10cm3cm11cm2c5c5cm3cm22cm8c7cm1c0cm3cm7cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm7cm21c5cm18c25c13c2c83cm6cm20cm18c1c1cm16cm16cm16_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c0c20c9c7c0c2cm3c0c1c7cm5cm7c3cm32cm2cm7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c17c5c14cm2c3c2c10c1cm18cm23cm2cm51c7c3cm12c5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1c3c4cm3c11cm4c1c3c7c3cm1cm26cm6c2cm26cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm7c0c2c9c4cm1c4c2cm3cm13c8c27cm27c3cm6cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c18cm2cm4cm5cm3c4cm2c6cm6cm5c6cm5c2cm1c7cm52_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1c22cm20cm1c3c14cm4c1cm24c1cm18cm7cm9c0c3c8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c7c1cm5c1cm2c29cm38cm18cm4c3cm1cm3cm2cm1cm4cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c14c8cm1c0cm5c1c17c3cm3cm15c4cm11c5c9cm4c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm10cm30c1cm17c14c6c4c2cm14c5cm6cm18cm5c1c36c19_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm20c1c2c7cm4cm1c2cm3cm10c10c1c24c0cm16cm9cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c11c12cm1cm10cm12c1cm1c7c5c3cm1cm7c0c7c9c8_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c4cm23cm23c8c1cm2c49cm11cm6cm19cm3c14c0c1cm4cm12_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core12_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c10c3c18c7c5c2cm12c2cm3c15cm1c15c5cm8c3c0 => x_c10c3c18c7c5c2cm12c2cm3c15cm1c15c5cm8c3c0_signal, 
                R_cm4cm4cm36c1cm50c2cm1c6c2cm32c0cm14cm6c1cm7cm18 => x_cm4cm4cm36c1cm50c2cm1c6c2cm32c0cm14cm6c1cm7cm18_signal, 
                R_cm12cm8cm5c2c4c7c3cm4cm3cm65c5c3c2c4cm1c0 => x_cm12cm8cm5c2c4c7c3cm4cm3cm65c5c3c2c4cm1c0_signal, 
                R_cm4cm10cm21cm21c5c0c6cm35cm11c1cm6c1c9cm4cm1c2 => x_cm4cm10cm21cm21c5c0c6cm35cm11c1cm6c1c9cm4cm1c2_signal, 
                R_cm40c5c21c34c3c11c11c7cm4c24cm3cm8c14c7c6cm24 => x_cm40c5c21c34c3c11c11c7cm4c24cm3cm8c14c7c6cm24_signal, 
                R_c2c3c30c1cm3cm4c4cm6c1c27cm6c40cm1c6c1c13 => x_c2c3c30c1cm3cm4c4cm6c1c27cm6c40cm1c6c1c13_signal, 
                R_c2cm3cm1c12c8c3c2cm6cm10c13c0cm28c18c19c13cm7 => x_c2cm3cm1c12c8c3c2cm6cm10c13c0cm28c18c19c13cm7_signal, 
                R_cm33cm4cm51c30c3cm1c1c1c9cm2c4c9c10cm15c2cm9 => x_cm33cm4cm51c30c3cm1c1c1c9cm2c4c9c10cm15c2cm9_signal, 
                R_cm6c34c22cm9cm6cm12cm6c0cm9cm5cm26cm2c41cm10c3c10 => x_cm6c34c22cm9cm6cm12cm6c0cm9cm5cm26cm2c41cm10c3c10_signal, 
                R_c0c0cm3c2c2cm1cm5c1c1cm7c19c10c4c4c1c3 => x_c0c0cm3c2c2cm1cm5c1c1cm7c19c10c4c4c1c3_signal, 
                R_c21cm5c0cm18cm5cm65c2c3cm42cm5cm1c71c9c0c5cm9 => x_c21cm5c0cm18cm5cm65c2c3cm42cm5cm1c71c9c0c5cm9_signal, 
                R_cm3c1c5cm7c6c3c12cm1cm2c0c2cm12c1c0cm12c15 => x_cm3c1c5cm7c6c3c12cm1cm2c0c2cm12c1c0cm12c15_signal, 
                R_cm23c21cm12c1c17c4c13c1cm1c3c2c0c3cm9cm1c11 => x_cm23c21cm12c1c17c4c13c1cm1c3c2c0c3cm9cm1c11_signal, 
                R_cm34c2c3cm2cm9c7c1c1cm5c4c0c3cm6cm5cm8c12 => x_cm34c2c3cm2cm9c7c1c1cm5c4c0c3cm6cm5cm8c12_signal, 
                R_cm5cm63c5cm5c4cm4cm6cm3c0cm23cm4c1cm68cm4cm1c1 => x_cm5cm63c5cm5c4cm4cm6cm3c0cm23cm4c1cm68cm4cm1c1_signal, 
                R_cm6cm16cm2cm11c62c5c4c8c2cm31c0c7cm6c21cm3cm12 => x_cm6cm16cm2cm11c62c5c4c8c2cm31c0c7cm6c21cm3cm12_signal, 
                R_cm20cm4cm5cm6c2c4c3cm5c10c6cm43c9cm5cm5cm6cm4 => x_cm20cm4cm5cm6c2c4c3cm5c10c6cm43c9cm5cm5cm6cm4_signal, 
                R_c7c1cm6c5cm4cm3c0c0c11c8c2cm3c5c12cm4c13 => x_c7c1cm6c5cm4cm3c0c0c11c8c2cm3c5c12cm4c13_signal, 
                R_cm13c10cm3cm11cm2c5c5cm3cm22cm8c7cm1c0cm3cm7cm5 => x_cm13c10cm3cm11cm2c5c5cm3cm22cm8c7cm1c0cm3cm7cm5_signal, 
                R_cm7cm21c5cm18c25c13c2c83cm6cm20cm18c1c1cm16cm16cm16 => x_cm7cm21c5cm18c25c13c2c83cm6cm20cm18c1c1cm16cm16cm16_signal, 
                R_c0c20c9c7c0c2cm3c0c1c7cm5cm7c3cm32cm2cm7 => x_c0c20c9c7c0c2cm3c0c1c7cm5cm7c3cm32cm2cm7_signal, 
                R_c17c5c14cm2c3c2c10c1cm18cm23cm2cm51c7c3cm12c5 => x_c17c5c14cm2c3c2c10c1cm18cm23cm2cm51c7c3cm12c5_signal, 
                R_cm1c3c4cm3c11cm4c1c3c7c3cm1cm26cm6c2cm26cm8 => x_cm1c3c4cm3c11cm4c1c3c7c3cm1cm26cm6c2cm26cm8_signal, 
                R_cm7c0c2c9c4cm1c4c2cm3cm13c8c27cm27c3cm6cm1 => x_cm7c0c2c9c4cm1c4c2cm3cm13c8c27cm27c3cm6cm1_signal, 
                R_c18cm2cm4cm5cm3c4cm2c6cm6cm5c6cm5c2cm1c7cm52 => x_c18cm2cm4cm5cm3c4cm2c6cm6cm5c6cm5c2cm1c7cm52_signal, 
                R_cm1c22cm20cm1c3c14cm4c1cm24c1cm18cm7cm9c0c3c8 => x_cm1c22cm20cm1c3c14cm4c1cm24c1cm18cm7cm9c0c3c8_signal, 
                R_c7c1cm5c1cm2c29cm38cm18cm4c3cm1cm3cm2cm1cm4cm1 => x_c7c1cm5c1cm2c29cm38cm18cm4c3cm1cm3cm2cm1cm4cm1_signal, 
                R_c14c8cm1c0cm5c1c17c3cm3cm15c4cm11c5c9cm4c0 => x_c14c8cm1c0cm5c1c17c3cm3cm15c4cm11c5c9cm4c0_signal, 
                R_cm10cm30c1cm17c14c6c4c2cm14c5cm6cm18cm5c1c36c19 => x_cm10cm30c1cm17c14c6c4c2cm14c5cm6cm18cm5c1c36c19_signal, 
                R_cm20c1c2c7cm4cm1c2cm3cm10c10c1c24c0cm16cm9cm8 => x_cm20c1c2c7cm4cm1c2cm3cm10c10c1c24c0cm16cm9cm8_signal, 
                R_c11c12cm1cm10cm12c1cm1c7c5c3cm1cm7c0c7c9c8 => x_c11c12cm1cm10cm12c1cm1c7c5c3cm1cm7c0c7c9c8_signal, 
                R_c4cm23cm23c8c1cm2c49cm11cm6cm19cm3c14c0c1cm4cm12 => x_c4cm23cm23c8c1cm2c49cm11cm6cm19cm3c14c0c1cm4cm12_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c10c3c18c7c5c2cm12c2cm3c15cm1c15c5cm8c3c0_signal;
    yo_2 <= x_cm4cm4cm36c1cm50c2cm1c6c2cm32c0cm14cm6c1cm7cm18_signal;
    yo_3 <= x_cm12cm8cm5c2c4c7c3cm4cm3cm65c5c3c2c4cm1c0_signal;
    yo_4 <= x_cm4cm10cm21cm21c5c0c6cm35cm11c1cm6c1c9cm4cm1c2_signal;
    yo_5 <= x_cm40c5c21c34c3c11c11c7cm4c24cm3cm8c14c7c6cm24_signal;
    yo_6 <= x_c2c3c30c1cm3cm4c4cm6c1c27cm6c40cm1c6c1c13_signal;
    yo_7 <= x_c2cm3cm1c12c8c3c2cm6cm10c13c0cm28c18c19c13cm7_signal;
    yo_8 <= x_cm33cm4cm51c30c3cm1c1c1c9cm2c4c9c10cm15c2cm9_signal;
    yo_9 <= x_cm6c34c22cm9cm6cm12cm6c0cm9cm5cm26cm2c41cm10c3c10_signal;
    yo_10 <= x_c0c0cm3c2c2cm1cm5c1c1cm7c19c10c4c4c1c3_signal;
    yo_11 <= x_c21cm5c0cm18cm5cm65c2c3cm42cm5cm1c71c9c0c5cm9_signal;
    yo_12 <= x_cm3c1c5cm7c6c3c12cm1cm2c0c2cm12c1c0cm12c15_signal;
    yo_13 <= x_cm23c21cm12c1c17c4c13c1cm1c3c2c0c3cm9cm1c11_signal;
    yo_14 <= x_cm34c2c3cm2cm9c7c1c1cm5c4c0c3cm6cm5cm8c12_signal;
    yo_15 <= x_cm5cm63c5cm5c4cm4cm6cm3c0cm23cm4c1cm68cm4cm1c1_signal;
    yo_16 <= x_cm6cm16cm2cm11c62c5c4c8c2cm31c0c7cm6c21cm3cm12_signal;
    yo_17 <= x_cm20cm4cm5cm6c2c4c3cm5c10c6cm43c9cm5cm5cm6cm4_signal;
    yo_18 <= x_c7c1cm6c5cm4cm3c0c0c11c8c2cm3c5c12cm4c13_signal;
    yo_19 <= x_cm13c10cm3cm11cm2c5c5cm3cm22cm8c7cm1c0cm3cm7cm5_signal;
    yo_20 <= x_cm7cm21c5cm18c25c13c2c83cm6cm20cm18c1c1cm16cm16cm16_signal;
    yo_21 <= x_c0c20c9c7c0c2cm3c0c1c7cm5cm7c3cm32cm2cm7_signal;
    yo_22 <= x_c17c5c14cm2c3c2c10c1cm18cm23cm2cm51c7c3cm12c5_signal;
    yo_23 <= x_cm1c3c4cm3c11cm4c1c3c7c3cm1cm26cm6c2cm26cm8_signal;
    yo_24 <= x_cm7c0c2c9c4cm1c4c2cm3cm13c8c27cm27c3cm6cm1_signal;
    yo_25 <= x_c18cm2cm4cm5cm3c4cm2c6cm6cm5c6cm5c2cm1c7cm52_signal;
    yo_26 <= x_cm1c22cm20cm1c3c14cm4c1cm24c1cm18cm7cm9c0c3c8_signal;
    yo_27 <= x_c7c1cm5c1cm2c29cm38cm18cm4c3cm1cm3cm2cm1cm4cm1_signal;
    yo_28 <= x_c14c8cm1c0cm5c1c17c3cm3cm15c4cm11c5c9cm4c0_signal;
    yo_29 <= x_cm10cm30c1cm17c14c6c4c2cm14c5cm6cm18cm5c1c36c19_signal;
    yo_30 <= x_cm20c1c2c7cm4cm1c2cm3cm10c10c1c24c0cm16cm9cm8_signal;
    yo_31 <= x_c11c12cm1cm10cm12c1cm1c7c5c3cm1cm7c0c7c9c8_signal;
    yo_32 <= x_c4cm23cm23c8c1cm2c49cm11cm6cm19cm3c14c0c1cm4cm12_signal;



end structural;