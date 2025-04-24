LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core25 is
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
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_9  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_10  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_11  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_12  : out std_logic_vector(11-1 downto 0);  --	sfix(1, -10)
        yo_13  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_14  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_16  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_19  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_24  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_25  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_26  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_28  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(3, -10)
    );
end conv7_core25;

architecture structural of conv7_core25 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm6c6cm14cm5c10cm1c9c2c1c0c2cm2cm5cm1c10cm3_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c8cm8cm6c2cm21cm1cm14cm3c0c1c1c2cm6c2cm23c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0cm22c4cm1c10cm9cm3c2c4c2c2c0c59c1cm9cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm19cm4c12cm5cm7cm5c0cm3c15c0cm5cm3c0cm6cm8cm47_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c10c27c0cm2c1c3c6cm8c40cm5c2cm21c4cm7c8cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c7cm13c77c24cm26c1c11cm2cm2c4c5c3cm4cm1cm3c1_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c0cm13c6c19c8cm4cm1cm7c3cm1c1c4cm11c4c0c5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c39c35cm19cm16c8cm5c3c2cm4cm2cm2cm14c1cm3c3cm7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6c6cm13cm8c2cm5c4cm2cm1cm10cm4cm1c2cm4c7cm4_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm4cm3c5c8c5cm3c2c7c1c0cm8cm3c1c0c1cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm36cm2cm68cm14c4cm2c5c1cm4cm1cm3c0c7cm16c5c2_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c2c0cm1c6c2c1c1cm5cm1c0c6cm2cm7c6c6c1_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)
    signal  x_cm15c45cm8cm2cm2c17cm9c0c16c6c0cm1c6c1c37cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c3cm9cm4cm1c10c2cm2c11c0cm3c0c8c0c1c2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm19c6c0c1cm3cm2cm6cm3c5c0cm1cm2c5cm3cm7cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6cm38c5cm3cm24c7c6cm3cm3c19cm3cm31c38cm2c2cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3c14c1cm32cm1c10cm5c4c18c0cm4c7cm2c3c7c12_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm25c7c1cm13cm1c1c24cm2cm3c0c1c6c3c1c10c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm17c7cm21cm5cm3c0c4cm31c3c3c0cm1c14cm15cm4cm42_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c6cm1cm12c4cm17cm5c2cm9c5c7cm2cm2c52cm12c2c63_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c1c5c0cm10cm14c7cm3c1cm1cm74c3c1c6cm2cm3c2_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c6cm9c25c25c7c5c3cm4cm34cm5c7c1c1c7cm17c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm17cm9cm15c1c12cm4cm5cm4c11cm2c0c12c0cm47c11cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm15cm16c20cm14cm7cm12c1cm1c70cm6c5c2c9c1c3cm1_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c2cm3cm70cm25cm6c2cm2c1cm28c3cm3c80c7cm3c6cm5_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm10cm11cm1c4c0c1cm1c0cm4c1c1c1c1cm1cm1c3_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c2c3cm3cm3c2cm20cm29cm15cm2c0c2c2c1cm8cm36cm8_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm5cm23c73c8cm7cm11cm17c2c3cm4cm2c3c2c17c11c1_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm11cm5c4c22c8c0cm5cm7c18cm3c4c2c3cm1cm4c6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c8cm7cm6c9c3c0cm16c7cm13cm3cm1cm1cm1cm1c16cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm7cm6cm3cm3cm9c2c0cm26c8c0cm1cm3c2cm6cm1c52_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm5cm24cm3cm29c6c0cm20c3c8c2c1cm2c1c17c28cm7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core25_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm6c6cm14cm5c10cm1c9c2c1c0c2cm2cm5cm1c10cm3 => x_cm6c6cm14cm5c10cm1c9c2c1c0c2cm2cm5cm1c10cm3_signal, 
                R_c8cm8cm6c2cm21cm1cm14cm3c0c1c1c2cm6c2cm23c0 => x_c8cm8cm6c2cm21cm1cm14cm3c0c1c1c2cm6c2cm23c0_signal, 
                R_c0cm22c4cm1c10cm9cm3c2c4c2c2c0c59c1cm9cm4 => x_c0cm22c4cm1c10cm9cm3c2c4c2c2c0c59c1cm9cm4_signal, 
                R_cm19cm4c12cm5cm7cm5c0cm3c15c0cm5cm3c0cm6cm8cm47 => x_cm19cm4c12cm5cm7cm5c0cm3c15c0cm5cm3c0cm6cm8cm47_signal, 
                R_c10c27c0cm2c1c3c6cm8c40cm5c2cm21c4cm7c8cm2 => x_c10c27c0cm2c1c3c6cm8c40cm5c2cm21c4cm7c8cm2_signal, 
                R_c7cm13c77c24cm26c1c11cm2cm2c4c5c3cm4cm1cm3c1 => x_c7cm13c77c24cm26c1c11cm2cm2c4c5c3cm4cm1cm3c1_signal, 
                R_c0cm13c6c19c8cm4cm1cm7c3cm1c1c4cm11c4c0c5 => x_c0cm13c6c19c8cm4cm1cm7c3cm1c1c4cm11c4c0c5_signal, 
                R_c39c35cm19cm16c8cm5c3c2cm4cm2cm2cm14c1cm3c3cm7 => x_c39c35cm19cm16c8cm5c3c2cm4cm2cm2cm14c1cm3c3cm7_signal, 
                R_cm6c6cm13cm8c2cm5c4cm2cm1cm10cm4cm1c2cm4c7cm4 => x_cm6c6cm13cm8c2cm5c4cm2cm1cm10cm4cm1c2cm4c7cm4_signal, 
                R_cm4cm3c5c8c5cm3c2c7c1c0cm8cm3c1c0c1cm2 => x_cm4cm3c5c8c5cm3c2c7c1c0cm8cm3c1c0c1cm2_signal, 
                R_cm36cm2cm68cm14c4cm2c5c1cm4cm1cm3c0c7cm16c5c2 => x_cm36cm2cm68cm14c4cm2c5c1cm4cm1cm3c0c7cm16c5c2_signal, 
                R_c2c0cm1c6c2c1c1cm5cm1c0c6cm2cm7c6c6c1 => x_c2c0cm1c6c2c1c1cm5cm1c0c6cm2cm7c6c6c1_signal, 
                R_cm15c45cm8cm2cm2c17cm9c0c16c6c0cm1c6c1c37cm3 => x_cm15c45cm8cm2cm2c17cm9c0c16c6c0cm1c6c1c37cm3_signal, 
                R_c0c3cm9cm4cm1c10c2cm2c11c0cm3c0c8c0c1c2 => x_c0c3cm9cm4cm1c10c2cm2c11c0cm3c0c8c0c1c2_signal, 
                R_cm19c6c0c1cm3cm2cm6cm3c5c0cm1cm2c5cm3cm7cm5 => x_cm19c6c0c1cm3cm2cm6cm3c5c0cm1cm2c5cm3cm7cm5_signal, 
                R_c6cm38c5cm3cm24c7c6cm3cm3c19cm3cm31c38cm2c2cm1 => x_c6cm38c5cm3cm24c7c6cm3cm3c19cm3cm31c38cm2c2cm1_signal, 
                R_c3c14c1cm32cm1c10cm5c4c18c0cm4c7cm2c3c7c12 => x_c3c14c1cm32cm1c10cm5c4c18c0cm4c7cm2c3c7c12_signal, 
                R_cm25c7c1cm13cm1c1c24cm2cm3c0c1c6c3c1c10c1 => x_cm25c7c1cm13cm1c1c24cm2cm3c0c1c6c3c1c10c1_signal, 
                R_cm17c7cm21cm5cm3c0c4cm31c3c3c0cm1c14cm15cm4cm42 => x_cm17c7cm21cm5cm3c0c4cm31c3c3c0cm1c14cm15cm4cm42_signal, 
                R_c6cm1cm12c4cm17cm5c2cm9c5c7cm2cm2c52cm12c2c63 => x_c6cm1cm12c4cm17cm5c2cm9c5c7cm2cm2c52cm12c2c63_signal, 
                R_c1c5c0cm10cm14c7cm3c1cm1cm74c3c1c6cm2cm3c2 => x_c1c5c0cm10cm14c7cm3c1cm1cm74c3c1c6cm2cm3c2_signal, 
                R_c6cm9c25c25c7c5c3cm4cm34cm5c7c1c1c7cm17c1 => x_c6cm9c25c25c7c5c3cm4cm34cm5c7c1c1c7cm17c1_signal, 
                R_cm17cm9cm15c1c12cm4cm5cm4c11cm2c0c12c0cm47c11cm1 => x_cm17cm9cm15c1c12cm4cm5cm4c11cm2c0c12c0cm47c11cm1_signal, 
                R_cm15cm16c20cm14cm7cm12c1cm1c70cm6c5c2c9c1c3cm1 => x_cm15cm16c20cm14cm7cm12c1cm1c70cm6c5c2c9c1c3cm1_signal, 
                R_c2cm3cm70cm25cm6c2cm2c1cm28c3cm3c80c7cm3c6cm5 => x_c2cm3cm70cm25cm6c2cm2c1cm28c3cm3c80c7cm3c6cm5_signal, 
                R_cm10cm11cm1c4c0c1cm1c0cm4c1c1c1c1cm1cm1c3 => x_cm10cm11cm1c4c0c1cm1c0cm4c1c1c1c1cm1cm1c3_signal, 
                R_c2c3cm3cm3c2cm20cm29cm15cm2c0c2c2c1cm8cm36cm8 => x_c2c3cm3cm3c2cm20cm29cm15cm2c0c2c2c1cm8cm36cm8_signal, 
                R_cm5cm23c73c8cm7cm11cm17c2c3cm4cm2c3c2c17c11c1 => x_cm5cm23c73c8cm7cm11cm17c2c3cm4cm2c3c2c17c11c1_signal, 
                R_cm11cm5c4c22c8c0cm5cm7c18cm3c4c2c3cm1cm4c6 => x_cm11cm5c4c22c8c0cm5cm7c18cm3c4c2c3cm1cm4c6_signal, 
                R_c8cm7cm6c9c3c0cm16c7cm13cm3cm1cm1cm1cm1c16cm1 => x_c8cm7cm6c9c3c0cm16c7cm13cm3cm1cm1cm1cm1c16cm1_signal, 
                R_cm7cm6cm3cm3cm9c2c0cm26c8c0cm1cm3c2cm6cm1c52 => x_cm7cm6cm3cm3cm9c2c0cm26c8c0cm1cm3c2cm6cm1c52_signal, 
                R_cm5cm24cm3cm29c6c0cm20c3c8c2c1cm2c1c17c28cm7 => x_cm5cm24cm3cm29c6c0cm20c3c8c2c1cm2c1c17c28cm7_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm6c6cm14cm5c10cm1c9c2c1c0c2cm2cm5cm1c10cm3_signal;
    yo_2 <= x_c8cm8cm6c2cm21cm1cm14cm3c0c1c1c2cm6c2cm23c0_signal;
    yo_3 <= x_c0cm22c4cm1c10cm9cm3c2c4c2c2c0c59c1cm9cm4_signal;
    yo_4 <= x_cm19cm4c12cm5cm7cm5c0cm3c15c0cm5cm3c0cm6cm8cm47_signal;
    yo_5 <= x_c10c27c0cm2c1c3c6cm8c40cm5c2cm21c4cm7c8cm2_signal;
    yo_6 <= x_c7cm13c77c24cm26c1c11cm2cm2c4c5c3cm4cm1cm3c1_signal;
    yo_7 <= x_c0cm13c6c19c8cm4cm1cm7c3cm1c1c4cm11c4c0c5_signal;
    yo_8 <= x_c39c35cm19cm16c8cm5c3c2cm4cm2cm2cm14c1cm3c3cm7_signal;
    yo_9 <= x_cm6c6cm13cm8c2cm5c4cm2cm1cm10cm4cm1c2cm4c7cm4_signal;
    yo_10 <= x_cm4cm3c5c8c5cm3c2c7c1c0cm8cm3c1c0c1cm2_signal;
    yo_11 <= x_cm36cm2cm68cm14c4cm2c5c1cm4cm1cm3c0c7cm16c5c2_signal;
    yo_12 <= x_c2c0cm1c6c2c1c1cm5cm1c0c6cm2cm7c6c6c1_signal;
    yo_13 <= x_cm15c45cm8cm2cm2c17cm9c0c16c6c0cm1c6c1c37cm3_signal;
    yo_14 <= x_c0c3cm9cm4cm1c10c2cm2c11c0cm3c0c8c0c1c2_signal;
    yo_15 <= x_cm19c6c0c1cm3cm2cm6cm3c5c0cm1cm2c5cm3cm7cm5_signal;
    yo_16 <= x_c6cm38c5cm3cm24c7c6cm3cm3c19cm3cm31c38cm2c2cm1_signal;
    yo_17 <= x_c3c14c1cm32cm1c10cm5c4c18c0cm4c7cm2c3c7c12_signal;
    yo_18 <= x_cm25c7c1cm13cm1c1c24cm2cm3c0c1c6c3c1c10c1_signal;
    yo_19 <= x_cm17c7cm21cm5cm3c0c4cm31c3c3c0cm1c14cm15cm4cm42_signal;
    yo_20 <= x_c6cm1cm12c4cm17cm5c2cm9c5c7cm2cm2c52cm12c2c63_signal;
    yo_21 <= x_c1c5c0cm10cm14c7cm3c1cm1cm74c3c1c6cm2cm3c2_signal;
    yo_22 <= x_c6cm9c25c25c7c5c3cm4cm34cm5c7c1c1c7cm17c1_signal;
    yo_23 <= x_cm17cm9cm15c1c12cm4cm5cm4c11cm2c0c12c0cm47c11cm1_signal;
    yo_24 <= x_cm15cm16c20cm14cm7cm12c1cm1c70cm6c5c2c9c1c3cm1_signal;
    yo_25 <= x_c2cm3cm70cm25cm6c2cm2c1cm28c3cm3c80c7cm3c6cm5_signal;
    yo_26 <= x_cm10cm11cm1c4c0c1cm1c0cm4c1c1c1c1cm1cm1c3_signal;
    yo_27 <= x_c2c3cm3cm3c2cm20cm29cm15cm2c0c2c2c1cm8cm36cm8_signal;
    yo_28 <= x_cm5cm23c73c8cm7cm11cm17c2c3cm4cm2c3c2c17c11c1_signal;
    yo_29 <= x_cm11cm5c4c22c8c0cm5cm7c18cm3c4c2c3cm1cm4c6_signal;
    yo_30 <= x_c8cm7cm6c9c3c0cm16c7cm13cm3cm1cm1cm1cm1c16cm1_signal;
    yo_31 <= x_cm7cm6cm3cm3cm9c2c0cm26c8c0cm1cm3c2cm6cm1c52_signal;
    yo_32 <= x_cm5cm24cm3cm29c6c0cm20c3c8c2c1cm2c1c17c28cm7_signal;



end structural;