LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core6 is
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
        yo_2  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_3  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_7  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_9  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_14  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_16  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_18  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_24  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_26  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core6;

architecture structural of conv7_core6 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c7cm4cm15cm5c2cm2c9c1c6cm8c9c3c0c5cm14c7_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c8c1c4cm15cm2cm12c15c16c9c2cm10c1c3cm1c6cm26_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1cm5cm12c0cm8c4cm3cm2c28cm1c23c8c3cm16cm9cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm15cm4c13cm8cm8c20c41c30cm8c0cm13cm16cm8c6cm12c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2c6cm10c6c51cm15cm5c2cm12cm11cm13c8cm4c4c6c15_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm7c4c34c9c7c4c28cm1c2c3c3cm11c2cm13cm6cm16_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c8c12cm3c3cm2cm9c3c5c0c5c3c13cm10c13c1c0_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c23c0cm5c6cm61c4cm13c2cm3c9cm2cm2c8cm9c6cm5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c4c2c19cm5cm9cm30c0c8c7cm8c2c23cm9c2c5cm11_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c10cm2cm16cm8c0c2cm13c11cm2c5c11cm7cm1cm1c16c15_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c7cm1c9cm23cm24cm36c7cm2c6cm49c4cm6c4cm6c6cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3cm3c0c2cm1c1cm13c2cm4c2cm9c13cm3c1cm3cm1_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm6c6cm2cm2cm10cm16cm7c1cm2cm11cm5c18c6cm7c0c9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c16cm12cm10c10cm59cm6cm7c8c11cm4cm4c0cm6c11c10cm9_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm23cm15cm2cm12c1cm10c1c9cm6cm4cm4c26cm14c0c4c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm16cm42c4cm22c0c17c0cm25cm3cm7c8cm5c3c127c11c44_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c3c3c1c14c33c18c8c15cm2cm16c4cm3cm17cm29c24c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c14c5cm1cm33cm6c4c9c0cm9c3c5c0cm4cm17c3cm5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3cm7cm19c2cm7cm10cm3c6cm4cm4cm4cm27c10c2c12c10_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1c2cm2c15cm38cm4c2cm7c27c7cm5c8c1c12c1cm6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3c7cm8cm2cm2cm15c0c5cm3c3c2c16c0cm5cm8cm40_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm14c8cm5cm1cm18c20c51cm19cm6c2c27c6cm1c1cm13cm15_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c1c7c2cm43cm23cm28cm40c1c12cm8cm3c2cm27cm5cm3c6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c1cm15c7c4cm5cm5cm9c3cm6cm1cm13cm1cm3cm4cm11c11_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm12c3c13cm5cm24cm1c3cm14cm4cm5c0c1cm25c0c6cm12_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm6cm21cm1cm6c2c8cm1cm8cm1cm14c0cm1c29cm14cm36c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm7c3cm1c5c5cm21cm3cm5c5cm25c5cm3cm5c5c3cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm12cm7c14cm5c32cm34cm5cm6c11cm22cm19c2cm35cm13c23c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm5c0cm2cm4c5cm28c1c2cm7cm11c0c11cm18c0c4cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c15c21c7cm11cm5c3c0c2c6cm3c8cm5cm4c9c1cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm9cm4c1c16cm36c14c0c8cm13c1c11c19c0c14c8c15_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c8cm9c5c15cm6c35c4cm5c1cm1c17cm18cm6cm1cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core6_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c7cm4cm15cm5c2cm2c9c1c6cm8c9c3c0c5cm14c7 => x_c7cm4cm15cm5c2cm2c9c1c6cm8c9c3c0c5cm14c7_signal, 
                R_c8c1c4cm15cm2cm12c15c16c9c2cm10c1c3cm1c6cm26 => x_c8c1c4cm15cm2cm12c15c16c9c2cm10c1c3cm1c6cm26_signal, 
                R_c1cm5cm12c0cm8c4cm3cm2c28cm1c23c8c3cm16cm9cm8 => x_c1cm5cm12c0cm8c4cm3cm2c28cm1c23c8c3cm16cm9cm8_signal, 
                R_cm15cm4c13cm8cm8c20c41c30cm8c0cm13cm16cm8c6cm12c2 => x_cm15cm4c13cm8cm8c20c41c30cm8c0cm13cm16cm8c6cm12c2_signal, 
                R_cm2c6cm10c6c51cm15cm5c2cm12cm11cm13c8cm4c4c6c15 => x_cm2c6cm10c6c51cm15cm5c2cm12cm11cm13c8cm4c4c6c15_signal, 
                R_cm7c4c34c9c7c4c28cm1c2c3c3cm11c2cm13cm6cm16 => x_cm7c4c34c9c7c4c28cm1c2c3c3cm11c2cm13cm6cm16_signal, 
                R_c8c12cm3c3cm2cm9c3c5c0c5c3c13cm10c13c1c0 => x_c8c12cm3c3cm2cm9c3c5c0c5c3c13cm10c13c1c0_signal, 
                R_c23c0cm5c6cm61c4cm13c2cm3c9cm2cm2c8cm9c6cm5 => x_c23c0cm5c6cm61c4cm13c2cm3c9cm2cm2c8cm9c6cm5_signal, 
                R_c4c2c19cm5cm9cm30c0c8c7cm8c2c23cm9c2c5cm11 => x_c4c2c19cm5cm9cm30c0c8c7cm8c2c23cm9c2c5cm11_signal, 
                R_c10cm2cm16cm8c0c2cm13c11cm2c5c11cm7cm1cm1c16c15 => x_c10cm2cm16cm8c0c2cm13c11cm2c5c11cm7cm1cm1c16c15_signal, 
                R_c7cm1c9cm23cm24cm36c7cm2c6cm49c4cm6c4cm6c6cm4 => x_c7cm1c9cm23cm24cm36c7cm2c6cm49c4cm6c4cm6c6cm4_signal, 
                R_cm3cm3c0c2cm1c1cm13c2cm4c2cm9c13cm3c1cm3cm1 => x_cm3cm3c0c2cm1c1cm13c2cm4c2cm9c13cm3c1cm3cm1_signal, 
                R_cm6c6cm2cm2cm10cm16cm7c1cm2cm11cm5c18c6cm7c0c9 => x_cm6c6cm2cm2cm10cm16cm7c1cm2cm11cm5c18c6cm7c0c9_signal, 
                R_c16cm12cm10c10cm59cm6cm7c8c11cm4cm4c0cm6c11c10cm9 => x_c16cm12cm10c10cm59cm6cm7c8c11cm4cm4c0cm6c11c10cm9_signal, 
                R_cm23cm15cm2cm12c1cm10c1c9cm6cm4cm4c26cm14c0c4c0 => x_cm23cm15cm2cm12c1cm10c1c9cm6cm4cm4c26cm14c0c4c0_signal, 
                R_cm16cm42c4cm22c0c17c0cm25cm3cm7c8cm5c3c127c11c44 => x_cm16cm42c4cm22c0c17c0cm25cm3cm7c8cm5c3c127c11c44_signal, 
                R_c3c3c1c14c33c18c8c15cm2cm16c4cm3cm17cm29c24c4 => x_c3c3c1c14c33c18c8c15cm2cm16c4cm3cm17cm29c24c4_signal, 
                R_c14c5cm1cm33cm6c4c9c0cm9c3c5c0cm4cm17c3cm5 => x_c14c5cm1cm33cm6c4c9c0cm9c3c5c0cm4cm17c3cm5_signal, 
                R_c3cm7cm19c2cm7cm10cm3c6cm4cm4cm4cm27c10c2c12c10 => x_c3cm7cm19c2cm7cm10cm3c6cm4cm4cm4cm27c10c2c12c10_signal, 
                R_c1c2cm2c15cm38cm4c2cm7c27c7cm5c8c1c12c1cm6 => x_c1c2cm2c15cm38cm4c2cm7c27c7cm5c8c1c12c1cm6_signal, 
                R_c3c7cm8cm2cm2cm15c0c5cm3c3c2c16c0cm5cm8cm40 => x_c3c7cm8cm2cm2cm15c0c5cm3c3c2c16c0cm5cm8cm40_signal, 
                R_cm14c8cm5cm1cm18c20c51cm19cm6c2c27c6cm1c1cm13cm15 => x_cm14c8cm5cm1cm18c20c51cm19cm6c2c27c6cm1c1cm13cm15_signal, 
                R_c1c7c2cm43cm23cm28cm40c1c12cm8cm3c2cm27cm5cm3c6 => x_c1c7c2cm43cm23cm28cm40c1c12cm8cm3c2cm27cm5cm3c6_signal, 
                R_c1cm15c7c4cm5cm5cm9c3cm6cm1cm13cm1cm3cm4cm11c11 => x_c1cm15c7c4cm5cm5cm9c3cm6cm1cm13cm1cm3cm4cm11c11_signal, 
                R_cm12c3c13cm5cm24cm1c3cm14cm4cm5c0c1cm25c0c6cm12 => x_cm12c3c13cm5cm24cm1c3cm14cm4cm5c0c1cm25c0c6cm12_signal, 
                R_cm6cm21cm1cm6c2c8cm1cm8cm1cm14c0cm1c29cm14cm36c2 => x_cm6cm21cm1cm6c2c8cm1cm8cm1cm14c0cm1c29cm14cm36c2_signal, 
                R_cm7c3cm1c5c5cm21cm3cm5c5cm25c5cm3cm5c5c3cm1 => x_cm7c3cm1c5c5cm21cm3cm5c5cm25c5cm3cm5c5c3cm1_signal, 
                R_cm12cm7c14cm5c32cm34cm5cm6c11cm22cm19c2cm35cm13c23c2 => x_cm12cm7c14cm5c32cm34cm5cm6c11cm22cm19c2cm35cm13c23c2_signal, 
                R_cm5c0cm2cm4c5cm28c1c2cm7cm11c0c11cm18c0c4cm2 => x_cm5c0cm2cm4c5cm28c1c2cm7cm11c0c11cm18c0c4cm2_signal, 
                R_c15c21c7cm11cm5c3c0c2c6cm3c8cm5cm4c9c1cm8 => x_c15c21c7cm11cm5c3c0c2c6cm3c8cm5cm4c9c1cm8_signal, 
                R_cm9cm4c1c16cm36c14c0c8cm13c1c11c19c0c14c8c15 => x_cm9cm4c1c16cm36c14c0c8cm13c1c11c19c0c14c8c15_signal, 
                R_c0c8cm9c5c15cm6c35c4cm5c1cm1c17cm18cm6cm1cm3 => x_c0c8cm9c5c15cm6c35c4cm5c1cm1c17cm18cm6cm1cm3_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c7cm4cm15cm5c2cm2c9c1c6cm8c9c3c0c5cm14c7_signal;
    yo_2 <= x_c8c1c4cm15cm2cm12c15c16c9c2cm10c1c3cm1c6cm26_signal;
    yo_3 <= x_c1cm5cm12c0cm8c4cm3cm2c28cm1c23c8c3cm16cm9cm8_signal;
    yo_4 <= x_cm15cm4c13cm8cm8c20c41c30cm8c0cm13cm16cm8c6cm12c2_signal;
    yo_5 <= x_cm2c6cm10c6c51cm15cm5c2cm12cm11cm13c8cm4c4c6c15_signal;
    yo_6 <= x_cm7c4c34c9c7c4c28cm1c2c3c3cm11c2cm13cm6cm16_signal;
    yo_7 <= x_c8c12cm3c3cm2cm9c3c5c0c5c3c13cm10c13c1c0_signal;
    yo_8 <= x_c23c0cm5c6cm61c4cm13c2cm3c9cm2cm2c8cm9c6cm5_signal;
    yo_9 <= x_c4c2c19cm5cm9cm30c0c8c7cm8c2c23cm9c2c5cm11_signal;
    yo_10 <= x_c10cm2cm16cm8c0c2cm13c11cm2c5c11cm7cm1cm1c16c15_signal;
    yo_11 <= x_c7cm1c9cm23cm24cm36c7cm2c6cm49c4cm6c4cm6c6cm4_signal;
    yo_12 <= x_cm3cm3c0c2cm1c1cm13c2cm4c2cm9c13cm3c1cm3cm1_signal;
    yo_13 <= x_cm6c6cm2cm2cm10cm16cm7c1cm2cm11cm5c18c6cm7c0c9_signal;
    yo_14 <= x_c16cm12cm10c10cm59cm6cm7c8c11cm4cm4c0cm6c11c10cm9_signal;
    yo_15 <= x_cm23cm15cm2cm12c1cm10c1c9cm6cm4cm4c26cm14c0c4c0_signal;
    yo_16 <= x_cm16cm42c4cm22c0c17c0cm25cm3cm7c8cm5c3c127c11c44_signal;
    yo_17 <= x_c3c3c1c14c33c18c8c15cm2cm16c4cm3cm17cm29c24c4_signal;
    yo_18 <= x_c14c5cm1cm33cm6c4c9c0cm9c3c5c0cm4cm17c3cm5_signal;
    yo_19 <= x_c3cm7cm19c2cm7cm10cm3c6cm4cm4cm4cm27c10c2c12c10_signal;
    yo_20 <= x_c1c2cm2c15cm38cm4c2cm7c27c7cm5c8c1c12c1cm6_signal;
    yo_21 <= x_c3c7cm8cm2cm2cm15c0c5cm3c3c2c16c0cm5cm8cm40_signal;
    yo_22 <= x_cm14c8cm5cm1cm18c20c51cm19cm6c2c27c6cm1c1cm13cm15_signal;
    yo_23 <= x_c1c7c2cm43cm23cm28cm40c1c12cm8cm3c2cm27cm5cm3c6_signal;
    yo_24 <= x_c1cm15c7c4cm5cm5cm9c3cm6cm1cm13cm1cm3cm4cm11c11_signal;
    yo_25 <= x_cm12c3c13cm5cm24cm1c3cm14cm4cm5c0c1cm25c0c6cm12_signal;
    yo_26 <= x_cm6cm21cm1cm6c2c8cm1cm8cm1cm14c0cm1c29cm14cm36c2_signal;
    yo_27 <= x_cm7c3cm1c5c5cm21cm3cm5c5cm25c5cm3cm5c5c3cm1_signal;
    yo_28 <= x_cm12cm7c14cm5c32cm34cm5cm6c11cm22cm19c2cm35cm13c23c2_signal;
    yo_29 <= x_cm5c0cm2cm4c5cm28c1c2cm7cm11c0c11cm18c0c4cm2_signal;
    yo_30 <= x_c15c21c7cm11cm5c3c0c2c6cm3c8cm5cm4c9c1cm8_signal;
    yo_31 <= x_cm9cm4c1c16cm36c14c0c8cm13c1c11c19c0c14c8c15_signal;
    yo_32 <= x_c0c8cm9c5c15cm6c35c4cm5c1cm1c17cm18cm6cm1cm3_signal;



end structural;