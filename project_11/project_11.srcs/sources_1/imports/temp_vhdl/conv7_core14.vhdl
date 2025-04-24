LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core14 is
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
        yo_2  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_9  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_10  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_13  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_18  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_19  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_20  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_22  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_25  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_26  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_31  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core14;

architecture structural of conv7_core14 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c2c17c22c14cm12c20cm6c12cm8cm6cm3cm6cm32cm10c6cm4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c7c24cm5cm8cm5cm15c12cm1cm7cm7c2cm61c17c0cm67c1_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm2cm37c6c1cm35cm9cm16c1c2cm1c19c6cm9cm5cm5c11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm27c1cm8cm16cm5cm27cm17cm2cm8c3cm29cm4cm1c34cm3c24_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm22cm39cm5cm8cm4c0c120cm5cm32c15c18c21cm3c2cm8c5_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c6c10c31c18cm12cm3c13cm7cm9cm4c15c6cm10cm1c5cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm2c12c1cm18c17c6c2cm20cm23cm18c1c0cm8c0cm2c4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm25cm11cm40cm6c9c4cm21c2c33cm9c1cm8c4c7c2c7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1c3c16cm12cm13c3c6cm22c5c11c12cm2c8cm8cm12cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm5cm7cm5c32c13cm7cm3c7cm2cm1c4cm4c3c0cm5cm5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c9cm2c11c31c4cm8c10cm1c17c1c35cm1cm1c24c6cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1c1c2cm17c49c1c0cm19c3c0c1c9cm14cm13c9c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c1c27cm1c3c1c8cm22c1c1cm22cm2cm4c2cm3cm33c3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm18c2c3cm1cm22c15c0cm2cm13cm12cm4c8cm3c3c16cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0cm32c9c1cm6c17c5cm9c16c15c4c8cm3c1cm7cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm5cm11c4cm16c0cm1cm4cm6c5c19c4cm5cm18cm4c8cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c8c3cm23c9cm4cm2c2cm39cm9cm48c10c16c3cm3cm1cm10_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm4cm7cm2c8cm25cm7cm4c7c8cm4c1c9cm22cm4cm36cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm40cm11c7cm12cm29c8cm1cm12c29cm17c4cm7c11cm11c2cm5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm4cm5cm7cm5cm18cm5cm2c72c0c46c0cm11cm1c1c4cm36_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c2cm9c3cm7cm5c8c9cm1cm2cm29c0c3cm37cm2c4c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3cm4c2cm26c2cm6c0c9c3c10cm26c9cm1c6c4c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c10c5cm13cm2cm4c3cm2cm8cm23cm7c19cm14c2c5cm6c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1cm15c5c44c2c52c10c2c8cm15c10c0c6cm3c0c5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm24cm6c4cm2cm5c9cm8c0cm73c1c14c3cm1c10c6c5_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c3c17cm31c3cm5c15c1cm2c60cm3c10c1cm1cm4c0cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c7cm2cm6c4cm5cm22cm9cm5c0cm5c4cm2cm4cm11c18c6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1cm21c4c2cm2c4c1cm1cm6c15c30cm4cm7c6c4cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c9c3c3cm10cm2cm6c7cm17cm30c2cm8cm1cm3c1cm9c4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm15c23cm1c14cm9c0c18c8cm1cm15cm2c1cm5cm14cm23c5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6c12c2c2cm8c11cm2cm67cm4c18cm1cm6cm5c18c0cm10_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm8cm40cm4c21cm5cm25cm6cm34cm12c12cm2c2cm1c2c9c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core14_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c2c17c22c14cm12c20cm6c12cm8cm6cm3cm6cm32cm10c6cm4 => x_c2c17c22c14cm12c20cm6c12cm8cm6cm3cm6cm32cm10c6cm4_signal, 
                R_c7c24cm5cm8cm5cm15c12cm1cm7cm7c2cm61c17c0cm67c1 => x_c7c24cm5cm8cm5cm15c12cm1cm7cm7c2cm61c17c0cm67c1_signal, 
                R_cm2cm37c6c1cm35cm9cm16c1c2cm1c19c6cm9cm5cm5c11 => x_cm2cm37c6c1cm35cm9cm16c1c2cm1c19c6cm9cm5cm5c11_signal, 
                R_cm27c1cm8cm16cm5cm27cm17cm2cm8c3cm29cm4cm1c34cm3c24 => x_cm27c1cm8cm16cm5cm27cm17cm2cm8c3cm29cm4cm1c34cm3c24_signal, 
                R_cm22cm39cm5cm8cm4c0c120cm5cm32c15c18c21cm3c2cm8c5 => x_cm22cm39cm5cm8cm4c0c120cm5cm32c15c18c21cm3c2cm8c5_signal, 
                R_c6c10c31c18cm12cm3c13cm7cm9cm4c15c6cm10cm1c5cm8 => x_c6c10c31c18cm12cm3c13cm7cm9cm4c15c6cm10cm1c5cm8_signal, 
                R_cm2c12c1cm18c17c6c2cm20cm23cm18c1c0cm8c0cm2c4 => x_cm2c12c1cm18c17c6c2cm20cm23cm18c1c0cm8c0cm2c4_signal, 
                R_cm25cm11cm40cm6c9c4cm21c2c33cm9c1cm8c4c7c2c7 => x_cm25cm11cm40cm6c9c4cm21c2c33cm9c1cm8c4c7c2c7_signal, 
                R_cm1c3c16cm12cm13c3c6cm22c5c11c12cm2c8cm8cm12cm5 => x_cm1c3c16cm12cm13c3c6cm22c5c11c12cm2c8cm8cm12cm5_signal, 
                R_cm5cm7cm5c32c13cm7cm3c7cm2cm1c4cm4c3c0cm5cm5 => x_cm5cm7cm5c32c13cm7cm3c7cm2cm1c4cm4c3c0cm5cm5_signal, 
                R_c9cm2c11c31c4cm8c10cm1c17c1c35cm1cm1c24c6cm1 => x_c9cm2c11c31c4cm8c10cm1c17c1c35cm1cm1c24c6cm1_signal, 
                R_cm1c1c2cm17c49c1c0cm19c3c0c1c9cm14cm13c9c1 => x_cm1c1c2cm17c49c1c0cm19c3c0c1c9cm14cm13c9c1_signal, 
                R_c1c27cm1c3c1c8cm22c1c1cm22cm2cm4c2cm3cm33c3 => x_c1c27cm1c3c1c8cm22c1c1cm22cm2cm4c2cm3cm33c3_signal, 
                R_cm18c2c3cm1cm22c15c0cm2cm13cm12cm4c8cm3c3c16cm1 => x_cm18c2c3cm1cm22c15c0cm2cm13cm12cm4c8cm3c3c16cm1_signal, 
                R_c0cm32c9c1cm6c17c5cm9c16c15c4c8cm3c1cm7cm3 => x_c0cm32c9c1cm6c17c5cm9c16c15c4c8cm3c1cm7cm3_signal, 
                R_cm5cm11c4cm16c0cm1cm4cm6c5c19c4cm5cm18cm4c8cm2 => x_cm5cm11c4cm16c0cm1cm4cm6c5c19c4cm5cm18cm4c8cm2_signal, 
                R_c8c3cm23c9cm4cm2c2cm39cm9cm48c10c16c3cm3cm1cm10 => x_c8c3cm23c9cm4cm2c2cm39cm9cm48c10c16c3cm3cm1cm10_signal, 
                R_cm4cm7cm2c8cm25cm7cm4c7c8cm4c1c9cm22cm4cm36cm1 => x_cm4cm7cm2c8cm25cm7cm4c7c8cm4c1c9cm22cm4cm36cm1_signal, 
                R_cm40cm11c7cm12cm29c8cm1cm12c29cm17c4cm7c11cm11c2cm5 => x_cm40cm11c7cm12cm29c8cm1cm12c29cm17c4cm7c11cm11c2cm5_signal, 
                R_cm4cm5cm7cm5cm18cm5cm2c72c0c46c0cm11cm1c1c4cm36 => x_cm4cm5cm7cm5cm18cm5cm2c72c0c46c0cm11cm1c1c4cm36_signal, 
                R_c2cm9c3cm7cm5c8c9cm1cm2cm29c0c3cm37cm2c4c4 => x_c2cm9c3cm7cm5c8c9cm1cm2cm29c0c3cm37cm2c4c4_signal, 
                R_cm3cm4c2cm26c2cm6c0c9c3c10cm26c9cm1c6c4c3 => x_cm3cm4c2cm26c2cm6c0c9c3c10cm26c9cm1c6c4c3_signal, 
                R_c10c5cm13cm2cm4c3cm2cm8cm23cm7c19cm14c2c5cm6c0 => x_c10c5cm13cm2cm4c3cm2cm8cm23cm7c19cm14c2c5cm6c0_signal, 
                R_c1cm15c5c44c2c52c10c2c8cm15c10c0c6cm3c0c5 => x_c1cm15c5c44c2c52c10c2c8cm15c10c0c6cm3c0c5_signal, 
                R_cm24cm6c4cm2cm5c9cm8c0cm73c1c14c3cm1c10c6c5 => x_cm24cm6c4cm2cm5c9cm8c0cm73c1c14c3cm1c10c6c5_signal, 
                R_c3c17cm31c3cm5c15c1cm2c60cm3c10c1cm1cm4c0cm3 => x_c3c17cm31c3cm5c15c1cm2c60cm3c10c1cm1cm4c0cm3_signal, 
                R_c7cm2cm6c4cm5cm22cm9cm5c0cm5c4cm2cm4cm11c18c6 => x_c7cm2cm6c4cm5cm22cm9cm5c0cm5c4cm2cm4cm11c18c6_signal, 
                R_c1cm21c4c2cm2c4c1cm1cm6c15c30cm4cm7c6c4cm6 => x_c1cm21c4c2cm2c4c1cm1cm6c15c30cm4cm7c6c4cm6_signal, 
                R_c9c3c3cm10cm2cm6c7cm17cm30c2cm8cm1cm3c1cm9c4 => x_c9c3c3cm10cm2cm6c7cm17cm30c2cm8cm1cm3c1cm9c4_signal, 
                R_cm15c23cm1c14cm9c0c18c8cm1cm15cm2c1cm5cm14cm23c5 => x_cm15c23cm1c14cm9c0c18c8cm1cm15cm2c1cm5cm14cm23c5_signal, 
                R_c6c12c2c2cm8c11cm2cm67cm4c18cm1cm6cm5c18c0cm10 => x_c6c12c2c2cm8c11cm2cm67cm4c18cm1cm6cm5c18c0cm10_signal, 
                R_cm8cm40cm4c21cm5cm25cm6cm34cm12c12cm2c2cm1c2c9c4 => x_cm8cm40cm4c21cm5cm25cm6cm34cm12c12cm2c2cm1c2c9c4_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c2c17c22c14cm12c20cm6c12cm8cm6cm3cm6cm32cm10c6cm4_signal;
    yo_2 <= x_c7c24cm5cm8cm5cm15c12cm1cm7cm7c2cm61c17c0cm67c1_signal;
    yo_3 <= x_cm2cm37c6c1cm35cm9cm16c1c2cm1c19c6cm9cm5cm5c11_signal;
    yo_4 <= x_cm27c1cm8cm16cm5cm27cm17cm2cm8c3cm29cm4cm1c34cm3c24_signal;
    yo_5 <= x_cm22cm39cm5cm8cm4c0c120cm5cm32c15c18c21cm3c2cm8c5_signal;
    yo_6 <= x_c6c10c31c18cm12cm3c13cm7cm9cm4c15c6cm10cm1c5cm8_signal;
    yo_7 <= x_cm2c12c1cm18c17c6c2cm20cm23cm18c1c0cm8c0cm2c4_signal;
    yo_8 <= x_cm25cm11cm40cm6c9c4cm21c2c33cm9c1cm8c4c7c2c7_signal;
    yo_9 <= x_cm1c3c16cm12cm13c3c6cm22c5c11c12cm2c8cm8cm12cm5_signal;
    yo_10 <= x_cm5cm7cm5c32c13cm7cm3c7cm2cm1c4cm4c3c0cm5cm5_signal;
    yo_11 <= x_c9cm2c11c31c4cm8c10cm1c17c1c35cm1cm1c24c6cm1_signal;
    yo_12 <= x_cm1c1c2cm17c49c1c0cm19c3c0c1c9cm14cm13c9c1_signal;
    yo_13 <= x_c1c27cm1c3c1c8cm22c1c1cm22cm2cm4c2cm3cm33c3_signal;
    yo_14 <= x_cm18c2c3cm1cm22c15c0cm2cm13cm12cm4c8cm3c3c16cm1_signal;
    yo_15 <= x_c0cm32c9c1cm6c17c5cm9c16c15c4c8cm3c1cm7cm3_signal;
    yo_16 <= x_cm5cm11c4cm16c0cm1cm4cm6c5c19c4cm5cm18cm4c8cm2_signal;
    yo_17 <= x_c8c3cm23c9cm4cm2c2cm39cm9cm48c10c16c3cm3cm1cm10_signal;
    yo_18 <= x_cm4cm7cm2c8cm25cm7cm4c7c8cm4c1c9cm22cm4cm36cm1_signal;
    yo_19 <= x_cm40cm11c7cm12cm29c8cm1cm12c29cm17c4cm7c11cm11c2cm5_signal;
    yo_20 <= x_cm4cm5cm7cm5cm18cm5cm2c72c0c46c0cm11cm1c1c4cm36_signal;
    yo_21 <= x_c2cm9c3cm7cm5c8c9cm1cm2cm29c0c3cm37cm2c4c4_signal;
    yo_22 <= x_cm3cm4c2cm26c2cm6c0c9c3c10cm26c9cm1c6c4c3_signal;
    yo_23 <= x_c10c5cm13cm2cm4c3cm2cm8cm23cm7c19cm14c2c5cm6c0_signal;
    yo_24 <= x_c1cm15c5c44c2c52c10c2c8cm15c10c0c6cm3c0c5_signal;
    yo_25 <= x_cm24cm6c4cm2cm5c9cm8c0cm73c1c14c3cm1c10c6c5_signal;
    yo_26 <= x_c3c17cm31c3cm5c15c1cm2c60cm3c10c1cm1cm4c0cm3_signal;
    yo_27 <= x_c7cm2cm6c4cm5cm22cm9cm5c0cm5c4cm2cm4cm11c18c6_signal;
    yo_28 <= x_c1cm21c4c2cm2c4c1cm1cm6c15c30cm4cm7c6c4cm6_signal;
    yo_29 <= x_c9c3c3cm10cm2cm6c7cm17cm30c2cm8cm1cm3c1cm9c4_signal;
    yo_30 <= x_cm15c23cm1c14cm9c0c18c8cm1cm15cm2c1cm5cm14cm23c5_signal;
    yo_31 <= x_c6c12c2c2cm8c11cm2cm67cm4c18cm1cm6cm5c18c0cm10_signal;
    yo_32 <= x_cm8cm40cm4c21cm5cm25cm6cm34cm12c12cm2c2cm1c2c9c4_signal;



end structural;