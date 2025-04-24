LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core29 is
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
    
        yo_1  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_2  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_3  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_7  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_14  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_17  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_18  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_26  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_27  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_29  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core29;

architecture structural of conv7_core29 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c3cm5c2c0cm12c4c1c4cm4cm7c4c5cm9c7c2c3_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c10c2cm15c11c5c13cm24c8cm10c10c3c9c2cm2cm55cm17_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c6c10c0c0c2c16c6cm3cm6c5c3c3cm10c13c4cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm15c0c13c21cm4c0cm35c35c7cm1c1c4cm16cm12cm3c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm26cm15cm1c18c16c8cm36c2cm6cm5cm3c19cm25cm1cm4cm26_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c4cm2cm7cm16c11cm2cm7cm20cm3c7cm17c12c2cm4cm25cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c27c4c8cm2c24cm20c2c10c31cm6c5cm30c52cm8c1c7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm27cm3cm8c17cm18cm18c5c4cm20c5cm6cm9cm4cm4cm1c9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm6cm17c6c20cm8c5c8c35cm4cm30cm1c15cm23cm42c15c25_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3c2c19c5cm9cm1c5c2cm1c1c9c13cm10cm4cm3cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c10cm21c9c2c13c3cm9cm2c4cm10cm42c4c28c25cm3cm10_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2c1cm27c7c19cm3c43c8c2c0c17c2c23c3cm45c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm20cm7cm4c5cm9cm27cm7cm1c1cm10cm8c3cm15c13cm7cm10_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm15cm4cm6c6c4c6c5cm1cm34c3cm2c4cm14c1c1cm7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm5cm18c17c14c37c3cm55c6cm2cm6c12c24c29c7c38cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm4cm24cm1cm3c1cm8cm11cm11cm3c3c2c7cm18cm17cm11c5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c4cm14c3c6c1cm9c15cm69c7cm13c4cm21cm19c10c11c36_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm17cm3c9cm4c58cm9c4c9cm10c1cm3cm4cm128cm2c0c10_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm3cm11cm5c4c8c1cm5cm1cm5c28c1cm8cm11c0cm13cm26_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm23cm6cm2cm7c2cm10c3cm32cm2c18c1cm8cm6cm4cm2cm49_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3c25c0c0c1cm19c6c1cm1c4cm3c5cm1c11c6c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm26c4c56cm21cm8cm30c11c5c4c9c27cm7cm1c31cm32c26_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0cm30cm32c11c13cm6c22cm5cm32cm8c1c4cm14c0cm29cm10_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm28c22cm31cm4c19cm62cm3cm2cm9c9cm9cm2c1c7c7cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm20cm1c0c24cm10cm5cm26cm1cm1cm2c6c2c17c0cm18c21_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm4c5c3cm2cm6c2cm6cm6c1c8cm3c3cm2c2cm2cm10_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm9c0cm1cm3cm2cm7cm4c13c7cm5cm4c2cm6c4c0cm9_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c13cm8cm3c1c1c18c1c13cm2cm15cm16cm6cm3c48cm14cm17_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm38c2c22c2c5c0cm12c8cm3cm1cm1c6cm6c2c9c11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6cm6c0cm6cm8cm7c5c2cm6c19cm16c3cm10c5cm11c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm14cm1c3c13c8c0cm1cm22cm3c3c4c2c4c2c4c21_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c3cm2c9cm52cm43cm13c9cm61cm1cm3c3cm7c24cm29cm10cm27_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core29_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c3cm5c2c0cm12c4c1c4cm4cm7c4c5cm9c7c2c3 => x_c3cm5c2c0cm12c4c1c4cm4cm7c4c5cm9c7c2c3_signal, 
                R_c10c2cm15c11c5c13cm24c8cm10c10c3c9c2cm2cm55cm17 => x_c10c2cm15c11c5c13cm24c8cm10c10c3c9c2cm2cm55cm17_signal, 
                R_c6c10c0c0c2c16c6cm3cm6c5c3c3cm10c13c4cm2 => x_c6c10c0c0c2c16c6cm3cm6c5c3c3cm10c13c4cm2_signal, 
                R_cm15c0c13c21cm4c0cm35c35c7cm1c1c4cm16cm12cm3c0 => x_cm15c0c13c21cm4c0cm35c35c7cm1c1c4cm16cm12cm3c0_signal, 
                R_cm26cm15cm1c18c16c8cm36c2cm6cm5cm3c19cm25cm1cm4cm26 => x_cm26cm15cm1c18c16c8cm36c2cm6cm5cm3c19cm25cm1cm4cm26_signal, 
                R_c4cm2cm7cm16c11cm2cm7cm20cm3c7cm17c12c2cm4cm25cm6 => x_c4cm2cm7cm16c11cm2cm7cm20cm3c7cm17c12c2cm4cm25cm6_signal, 
                R_c27c4c8cm2c24cm20c2c10c31cm6c5cm30c52cm8c1c7 => x_c27c4c8cm2c24cm20c2c10c31cm6c5cm30c52cm8c1c7_signal, 
                R_cm27cm3cm8c17cm18cm18c5c4cm20c5cm6cm9cm4cm4cm1c9 => x_cm27cm3cm8c17cm18cm18c5c4cm20c5cm6cm9cm4cm4cm1c9_signal, 
                R_cm6cm17c6c20cm8c5c8c35cm4cm30cm1c15cm23cm42c15c25 => x_cm6cm17c6c20cm8c5c8c35cm4cm30cm1c15cm23cm42c15c25_signal, 
                R_cm3c2c19c5cm9cm1c5c2cm1c1c9c13cm10cm4cm3cm6 => x_cm3c2c19c5cm9cm1c5c2cm1c1c9c13cm10cm4cm3cm6_signal, 
                R_c10cm21c9c2c13c3cm9cm2c4cm10cm42c4c28c25cm3cm10 => x_c10cm21c9c2c13c3cm9cm2c4cm10cm42c4c28c25cm3cm10_signal, 
                R_cm2c1cm27c7c19cm3c43c8c2c0c17c2c23c3cm45c2 => x_cm2c1cm27c7c19cm3c43c8c2c0c17c2c23c3cm45c2_signal, 
                R_cm20cm7cm4c5cm9cm27cm7cm1c1cm10cm8c3cm15c13cm7cm10 => x_cm20cm7cm4c5cm9cm27cm7cm1c1cm10cm8c3cm15c13cm7cm10_signal, 
                R_cm15cm4cm6c6c4c6c5cm1cm34c3cm2c4cm14c1c1cm7 => x_cm15cm4cm6c6c4c6c5cm1cm34c3cm2c4cm14c1c1cm7_signal, 
                R_cm5cm18c17c14c37c3cm55c6cm2cm6c12c24c29c7c38cm2 => x_cm5cm18c17c14c37c3cm55c6cm2cm6c12c24c29c7c38cm2_signal, 
                R_cm4cm24cm1cm3c1cm8cm11cm11cm3c3c2c7cm18cm17cm11c5 => x_cm4cm24cm1cm3c1cm8cm11cm11cm3c3c2c7cm18cm17cm11c5_signal, 
                R_c4cm14c3c6c1cm9c15cm69c7cm13c4cm21cm19c10c11c36 => x_c4cm14c3c6c1cm9c15cm69c7cm13c4cm21cm19c10c11c36_signal, 
                R_cm17cm3c9cm4c58cm9c4c9cm10c1cm3cm4cm128cm2c0c10 => x_cm17cm3c9cm4c58cm9c4c9cm10c1cm3cm4cm128cm2c0c10_signal, 
                R_cm3cm11cm5c4c8c1cm5cm1cm5c28c1cm8cm11c0cm13cm26 => x_cm3cm11cm5c4c8c1cm5cm1cm5c28c1cm8cm11c0cm13cm26_signal, 
                R_cm23cm6cm2cm7c2cm10c3cm32cm2c18c1cm8cm6cm4cm2cm49 => x_cm23cm6cm2cm7c2cm10c3cm32cm2c18c1cm8cm6cm4cm2cm49_signal, 
                R_c3c25c0c0c1cm19c6c1cm1c4cm3c5cm1c11c6c2 => x_c3c25c0c0c1cm19c6c1cm1c4cm3c5cm1c11c6c2_signal, 
                R_cm26c4c56cm21cm8cm30c11c5c4c9c27cm7cm1c31cm32c26 => x_cm26c4c56cm21cm8cm30c11c5c4c9c27cm7cm1c31cm32c26_signal, 
                R_c0cm30cm32c11c13cm6c22cm5cm32cm8c1c4cm14c0cm29cm10 => x_c0cm30cm32c11c13cm6c22cm5cm32cm8c1c4cm14c0cm29cm10_signal, 
                R_cm28c22cm31cm4c19cm62cm3cm2cm9c9cm9cm2c1c7c7cm4 => x_cm28c22cm31cm4c19cm62cm3cm2cm9c9cm9cm2c1c7c7cm4_signal, 
                R_cm20cm1c0c24cm10cm5cm26cm1cm1cm2c6c2c17c0cm18c21 => x_cm20cm1c0c24cm10cm5cm26cm1cm1cm2c6c2c17c0cm18c21_signal, 
                R_cm4c5c3cm2cm6c2cm6cm6c1c8cm3c3cm2c2cm2cm10 => x_cm4c5c3cm2cm6c2cm6cm6c1c8cm3c3cm2c2cm2cm10_signal, 
                R_cm9c0cm1cm3cm2cm7cm4c13c7cm5cm4c2cm6c4c0cm9 => x_cm9c0cm1cm3cm2cm7cm4c13c7cm5cm4c2cm6c4c0cm9_signal, 
                R_c13cm8cm3c1c1c18c1c13cm2cm15cm16cm6cm3c48cm14cm17 => x_c13cm8cm3c1c1c18c1c13cm2cm15cm16cm6cm3c48cm14cm17_signal, 
                R_cm38c2c22c2c5c0cm12c8cm3cm1cm1c6cm6c2c9c11 => x_cm38c2c22c2c5c0cm12c8cm3cm1cm1c6cm6c2c9c11_signal, 
                R_cm6cm6c0cm6cm8cm7c5c2cm6c19cm16c3cm10c5cm11c2 => x_cm6cm6c0cm6cm8cm7c5c2cm6c19cm16c3cm10c5cm11c2_signal, 
                R_cm14cm1c3c13c8c0cm1cm22cm3c3c4c2c4c2c4c21 => x_cm14cm1c3c13c8c0cm1cm22cm3c3c4c2c4c2c4c21_signal, 
                R_c3cm2c9cm52cm43cm13c9cm61cm1cm3c3cm7c24cm29cm10cm27 => x_c3cm2c9cm52cm43cm13c9cm61cm1cm3c3cm7c24cm29cm10cm27_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c3cm5c2c0cm12c4c1c4cm4cm7c4c5cm9c7c2c3_signal;
    yo_2 <= x_c10c2cm15c11c5c13cm24c8cm10c10c3c9c2cm2cm55cm17_signal;
    yo_3 <= x_c6c10c0c0c2c16c6cm3cm6c5c3c3cm10c13c4cm2_signal;
    yo_4 <= x_cm15c0c13c21cm4c0cm35c35c7cm1c1c4cm16cm12cm3c0_signal;
    yo_5 <= x_cm26cm15cm1c18c16c8cm36c2cm6cm5cm3c19cm25cm1cm4cm26_signal;
    yo_6 <= x_c4cm2cm7cm16c11cm2cm7cm20cm3c7cm17c12c2cm4cm25cm6_signal;
    yo_7 <= x_c27c4c8cm2c24cm20c2c10c31cm6c5cm30c52cm8c1c7_signal;
    yo_8 <= x_cm27cm3cm8c17cm18cm18c5c4cm20c5cm6cm9cm4cm4cm1c9_signal;
    yo_9 <= x_cm6cm17c6c20cm8c5c8c35cm4cm30cm1c15cm23cm42c15c25_signal;
    yo_10 <= x_cm3c2c19c5cm9cm1c5c2cm1c1c9c13cm10cm4cm3cm6_signal;
    yo_11 <= x_c10cm21c9c2c13c3cm9cm2c4cm10cm42c4c28c25cm3cm10_signal;
    yo_12 <= x_cm2c1cm27c7c19cm3c43c8c2c0c17c2c23c3cm45c2_signal;
    yo_13 <= x_cm20cm7cm4c5cm9cm27cm7cm1c1cm10cm8c3cm15c13cm7cm10_signal;
    yo_14 <= x_cm15cm4cm6c6c4c6c5cm1cm34c3cm2c4cm14c1c1cm7_signal;
    yo_15 <= x_cm5cm18c17c14c37c3cm55c6cm2cm6c12c24c29c7c38cm2_signal;
    yo_16 <= x_cm4cm24cm1cm3c1cm8cm11cm11cm3c3c2c7cm18cm17cm11c5_signal;
    yo_17 <= x_c4cm14c3c6c1cm9c15cm69c7cm13c4cm21cm19c10c11c36_signal;
    yo_18 <= x_cm17cm3c9cm4c58cm9c4c9cm10c1cm3cm4cm128cm2c0c10_signal;
    yo_19 <= x_cm3cm11cm5c4c8c1cm5cm1cm5c28c1cm8cm11c0cm13cm26_signal;
    yo_20 <= x_cm23cm6cm2cm7c2cm10c3cm32cm2c18c1cm8cm6cm4cm2cm49_signal;
    yo_21 <= x_c3c25c0c0c1cm19c6c1cm1c4cm3c5cm1c11c6c2_signal;
    yo_22 <= x_cm26c4c56cm21cm8cm30c11c5c4c9c27cm7cm1c31cm32c26_signal;
    yo_23 <= x_c0cm30cm32c11c13cm6c22cm5cm32cm8c1c4cm14c0cm29cm10_signal;
    yo_24 <= x_cm28c22cm31cm4c19cm62cm3cm2cm9c9cm9cm2c1c7c7cm4_signal;
    yo_25 <= x_cm20cm1c0c24cm10cm5cm26cm1cm1cm2c6c2c17c0cm18c21_signal;
    yo_26 <= x_cm4c5c3cm2cm6c2cm6cm6c1c8cm3c3cm2c2cm2cm10_signal;
    yo_27 <= x_cm9c0cm1cm3cm2cm7cm4c13c7cm5cm4c2cm6c4c0cm9_signal;
    yo_28 <= x_c13cm8cm3c1c1c18c1c13cm2cm15cm16cm6cm3c48cm14cm17_signal;
    yo_29 <= x_cm38c2c22c2c5c0cm12c8cm3cm1cm1c6cm6c2c9c11_signal;
    yo_30 <= x_cm6cm6c0cm6cm8cm7c5c2cm6c19cm16c3cm10c5cm11c2_signal;
    yo_31 <= x_cm14cm1c3c13c8c0cm1cm22cm3c3c4c2c4c2c4c21_signal;
    yo_32 <= x_c3cm2c9cm52cm43cm13c9cm61cm1cm3c3cm7c24cm29cm10cm27_signal;



end structural;