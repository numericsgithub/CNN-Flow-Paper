LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core4 is
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
        yo_3  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_4  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_14  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_15  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_18  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_22  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_29  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_30  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core4;

architecture structural of conv7_core4 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c0c4cm1c2cm6cm1c2cm1c2c7c4c8c4c7c3c6_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm1cm11cm6cm8cm4cm11cm1c3cm3c4cm12c4cm12c2cm38c6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c7cm19cm2cm2c1cm4c3cm9c86c7c3c28cm7c7cm4c2_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c84c3cm14cm2cm4c5cm9c4cm5c3c12cm4cm11c1c52cm34_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c9c32c2c8cm9c7c3cm26cm2c0c7cm3cm29cm7cm22cm8_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2cm4cm11cm25c0cm4c2cm1cm2c3cm3c11cm6c0cm15c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c7c4c0c0c13c4cm2c9c8c1cm1cm4c28c9c0cm12_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm9c6c6cm2c7cm8c2c16cm7c3c2cm1cm23c6cm3cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm11cm9cm2c3cm14cm5cm4cm5cm9c12c3cm14c2c39c1c6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3cm1cm9c3c4c0cm1cm14cm1cm4c7c6c4cm4cm6c6_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm7c1c4c27cm5cm9c31cm1cm2cm7cm3cm2c0c16cm17cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c4c0c1cm6cm1c1c0c2cm4c0c1cm6c17c4c15cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm6c28c2cm1c31c3c0cm1c4c7c24c0cm6cm1cm2c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1cm3cm1c3cm4cm5c4c8cm16c1cm1c5cm1cm8cm11c5_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c1cm13c3cm6c4cm3cm2c4cm6cm3cm2cm2c4cm2c3c7_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c4c19c1cm19c1cm1c2c5cm9cm2c4c0c21c11c3cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm10c37c15cm4c0c13c1c6cm2c11cm7c0c9c29c0cm33_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm5cm1c1cm13cm8cm3cm2c3c4c2c11cm4cm43cm5cm2c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3cm6cm3c3c3c3cm1cm4c1cm3cm8c2cm4c18cm20cm31_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0cm7c9cm2cm6cm21cm2c6c0cm9c8c8cm26cm19cm2c30_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0cm7cm3c38cm2cm37cm2c0cm8c7c15c4cm2c11c8cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c12cm13cm10cm4c6c4cm9c18cm13cm1c4cm4cm11c1cm7cm12_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c5c2cm1c0c22cm1c22c7c9cm14cm8c2cm9c20c3c4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1cm2cm2c10c6cm2c20c0c3cm6c6cm9cm4cm28cm4c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1c3c1cm2cm9c3cm1cm9c6c0c0cm3c30cm2cm14cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm25c0cm21c1c5c2c11c3cm11cm9cm4cm1cm14cm25cm1cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1c2c2cm2c3cm2c4cm2c1cm23cm21cm9cm3c7c22c29_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c9cm1cm5c2c4c16c5c2c6cm18cm7cm3c34cm1cm32cm9_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6c7c1cm6c12c3cm9cm6cm5c10c1cm6c5c6c8cm14_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c0cm5cm2c2c1c9cm8c6cm3c2cm8c8cm14c5c4c2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm4cm5c0c0cm5c0cm3c0c24c5c0cm6c14c17c2c7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c11c4cm1cm3c8c3c10cm17cm2cm3cm2cm9c5cm10c51cm19_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core4_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c0c4cm1c2cm6cm1c2cm1c2c7c4c8c4c7c3c6 => x_c0c4cm1c2cm6cm1c2cm1c2c7c4c8c4c7c3c6_signal, 
                R_cm1cm11cm6cm8cm4cm11cm1c3cm3c4cm12c4cm12c2cm38c6 => x_cm1cm11cm6cm8cm4cm11cm1c3cm3c4cm12c4cm12c2cm38c6_signal, 
                R_c7cm19cm2cm2c1cm4c3cm9c86c7c3c28cm7c7cm4c2 => x_c7cm19cm2cm2c1cm4c3cm9c86c7c3c28cm7c7cm4c2_signal, 
                R_c84c3cm14cm2cm4c5cm9c4cm5c3c12cm4cm11c1c52cm34 => x_c84c3cm14cm2cm4c5cm9c4cm5c3c12cm4cm11c1c52cm34_signal, 
                R_c9c32c2c8cm9c7c3cm26cm2c0c7cm3cm29cm7cm22cm8 => x_c9c32c2c8cm9c7c3cm26cm2c0c7cm3cm29cm7cm22cm8_signal, 
                R_cm2cm4cm11cm25c0cm4c2cm1cm2c3cm3c11cm6c0cm15c0 => x_cm2cm4cm11cm25c0cm4c2cm1cm2c3cm3c11cm6c0cm15c0_signal, 
                R_c7c4c0c0c13c4cm2c9c8c1cm1cm4c28c9c0cm12 => x_c7c4c0c0c13c4cm2c9c8c1cm1cm4c28c9c0cm12_signal, 
                R_cm9c6c6cm2c7cm8c2c16cm7c3c2cm1cm23c6cm3cm3 => x_cm9c6c6cm2c7cm8c2c16cm7c3c2cm1cm23c6cm3cm3_signal, 
                R_cm11cm9cm2c3cm14cm5cm4cm5cm9c12c3cm14c2c39c1c6 => x_cm11cm9cm2c3cm14cm5cm4cm5cm9c12c3cm14c2c39c1c6_signal, 
                R_c3cm1cm9c3c4c0cm1cm14cm1cm4c7c6c4cm4cm6c6 => x_c3cm1cm9c3c4c0cm1cm14cm1cm4c7c6c4cm4cm6c6_signal, 
                R_cm7c1c4c27cm5cm9c31cm1cm2cm7cm3cm2c0c16cm17cm3 => x_cm7c1c4c27cm5cm9c31cm1cm2cm7cm3cm2c0c16cm17cm3_signal, 
                R_c4c0c1cm6cm1c1c0c2cm4c0c1cm6c17c4c15cm3 => x_c4c0c1cm6cm1c1c0c2cm4c0c1cm6c17c4c15cm3_signal, 
                R_cm6c28c2cm1c31c3c0cm1c4c7c24c0cm6cm1cm2c0 => x_cm6c28c2cm1c31c3c0cm1c4c7c24c0cm6cm1cm2c0_signal, 
                R_c1cm3cm1c3cm4cm5c4c8cm16c1cm1c5cm1cm8cm11c5 => x_c1cm3cm1c3cm4cm5c4c8cm16c1cm1c5cm1cm8cm11c5_signal, 
                R_c1cm13c3cm6c4cm3cm2c4cm6cm3cm2cm2c4cm2c3c7 => x_c1cm13c3cm6c4cm3cm2c4cm6cm3cm2cm2c4cm2c3c7_signal, 
                R_c4c19c1cm19c1cm1c2c5cm9cm2c4c0c21c11c3cm2 => x_c4c19c1cm19c1cm1c2c5cm9cm2c4c0c21c11c3cm2_signal, 
                R_cm10c37c15cm4c0c13c1c6cm2c11cm7c0c9c29c0cm33 => x_cm10c37c15cm4c0c13c1c6cm2c11cm7c0c9c29c0cm33_signal, 
                R_cm5cm1c1cm13cm8cm3cm2c3c4c2c11cm4cm43cm5cm2c4 => x_cm5cm1c1cm13cm8cm3cm2c3c4c2c11cm4cm43cm5cm2c4_signal, 
                R_c3cm6cm3c3c3c3cm1cm4c1cm3cm8c2cm4c18cm20cm31 => x_c3cm6cm3c3c3c3cm1cm4c1cm3cm8c2cm4c18cm20cm31_signal, 
                R_c0cm7c9cm2cm6cm21cm2c6c0cm9c8c8cm26cm19cm2c30 => x_c0cm7c9cm2cm6cm21cm2c6c0cm9c8c8cm26cm19cm2c30_signal, 
                R_c0cm7cm3c38cm2cm37cm2c0cm8c7c15c4cm2c11c8cm1 => x_c0cm7cm3c38cm2cm37cm2c0cm8c7c15c4cm2c11c8cm1_signal, 
                R_c12cm13cm10cm4c6c4cm9c18cm13cm1c4cm4cm11c1cm7cm12 => x_c12cm13cm10cm4c6c4cm9c18cm13cm1c4cm4cm11c1cm7cm12_signal, 
                R_c5c2cm1c0c22cm1c22c7c9cm14cm8c2cm9c20c3c4 => x_c5c2cm1c0c22cm1c22c7c9cm14cm8c2cm9c20c3c4_signal, 
                R_c1cm2cm2c10c6cm2c20c0c3cm6c6cm9cm4cm28cm4c0 => x_c1cm2cm2c10c6cm2c20c0c3cm6c6cm9cm4cm28cm4c0_signal, 
                R_cm1c3c1cm2cm9c3cm1cm9c6c0c0cm3c30cm2cm14cm6 => x_cm1c3c1cm2cm9c3cm1cm9c6c0c0cm3c30cm2cm14cm6_signal, 
                R_cm25c0cm21c1c5c2c11c3cm11cm9cm4cm1cm14cm25cm1cm6 => x_cm25c0cm21c1c5c2c11c3cm11cm9cm4cm1cm14cm25cm1cm6_signal, 
                R_c1c2c2cm2c3cm2c4cm2c1cm23cm21cm9cm3c7c22c29 => x_c1c2c2cm2c3cm2c4cm2c1cm23cm21cm9cm3c7c22c29_signal, 
                R_c9cm1cm5c2c4c16c5c2c6cm18cm7cm3c34cm1cm32cm9 => x_c9cm1cm5c2c4c16c5c2c6cm18cm7cm3c34cm1cm32cm9_signal, 
                R_cm6c7c1cm6c12c3cm9cm6cm5c10c1cm6c5c6c8cm14 => x_cm6c7c1cm6c12c3cm9cm6cm5c10c1cm6c5c6c8cm14_signal, 
                R_c0cm5cm2c2c1c9cm8c6cm3c2cm8c8cm14c5c4c2 => x_c0cm5cm2c2c1c9cm8c6cm3c2cm8c8cm14c5c4c2_signal, 
                R_cm4cm5c0c0cm5c0cm3c0c24c5c0cm6c14c17c2c7 => x_cm4cm5c0c0cm5c0cm3c0c24c5c0cm6c14c17c2c7_signal, 
                R_c11c4cm1cm3c8c3c10cm17cm2cm3cm2cm9c5cm10c51cm19 => x_c11c4cm1cm3c8c3c10cm17cm2cm3cm2cm9c5cm10c51cm19_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c0c4cm1c2cm6cm1c2cm1c2c7c4c8c4c7c3c6_signal;
    yo_2 <= x_cm1cm11cm6cm8cm4cm11cm1c3cm3c4cm12c4cm12c2cm38c6_signal;
    yo_3 <= x_c7cm19cm2cm2c1cm4c3cm9c86c7c3c28cm7c7cm4c2_signal;
    yo_4 <= x_c84c3cm14cm2cm4c5cm9c4cm5c3c12cm4cm11c1c52cm34_signal;
    yo_5 <= x_c9c32c2c8cm9c7c3cm26cm2c0c7cm3cm29cm7cm22cm8_signal;
    yo_6 <= x_cm2cm4cm11cm25c0cm4c2cm1cm2c3cm3c11cm6c0cm15c0_signal;
    yo_7 <= x_c7c4c0c0c13c4cm2c9c8c1cm1cm4c28c9c0cm12_signal;
    yo_8 <= x_cm9c6c6cm2c7cm8c2c16cm7c3c2cm1cm23c6cm3cm3_signal;
    yo_9 <= x_cm11cm9cm2c3cm14cm5cm4cm5cm9c12c3cm14c2c39c1c6_signal;
    yo_10 <= x_c3cm1cm9c3c4c0cm1cm14cm1cm4c7c6c4cm4cm6c6_signal;
    yo_11 <= x_cm7c1c4c27cm5cm9c31cm1cm2cm7cm3cm2c0c16cm17cm3_signal;
    yo_12 <= x_c4c0c1cm6cm1c1c0c2cm4c0c1cm6c17c4c15cm3_signal;
    yo_13 <= x_cm6c28c2cm1c31c3c0cm1c4c7c24c0cm6cm1cm2c0_signal;
    yo_14 <= x_c1cm3cm1c3cm4cm5c4c8cm16c1cm1c5cm1cm8cm11c5_signal;
    yo_15 <= x_c1cm13c3cm6c4cm3cm2c4cm6cm3cm2cm2c4cm2c3c7_signal;
    yo_16 <= x_c4c19c1cm19c1cm1c2c5cm9cm2c4c0c21c11c3cm2_signal;
    yo_17 <= x_cm10c37c15cm4c0c13c1c6cm2c11cm7c0c9c29c0cm33_signal;
    yo_18 <= x_cm5cm1c1cm13cm8cm3cm2c3c4c2c11cm4cm43cm5cm2c4_signal;
    yo_19 <= x_c3cm6cm3c3c3c3cm1cm4c1cm3cm8c2cm4c18cm20cm31_signal;
    yo_20 <= x_c0cm7c9cm2cm6cm21cm2c6c0cm9c8c8cm26cm19cm2c30_signal;
    yo_21 <= x_c0cm7cm3c38cm2cm37cm2c0cm8c7c15c4cm2c11c8cm1_signal;
    yo_22 <= x_c12cm13cm10cm4c6c4cm9c18cm13cm1c4cm4cm11c1cm7cm12_signal;
    yo_23 <= x_c5c2cm1c0c22cm1c22c7c9cm14cm8c2cm9c20c3c4_signal;
    yo_24 <= x_c1cm2cm2c10c6cm2c20c0c3cm6c6cm9cm4cm28cm4c0_signal;
    yo_25 <= x_cm1c3c1cm2cm9c3cm1cm9c6c0c0cm3c30cm2cm14cm6_signal;
    yo_26 <= x_cm25c0cm21c1c5c2c11c3cm11cm9cm4cm1cm14cm25cm1cm6_signal;
    yo_27 <= x_c1c2c2cm2c3cm2c4cm2c1cm23cm21cm9cm3c7c22c29_signal;
    yo_28 <= x_c9cm1cm5c2c4c16c5c2c6cm18cm7cm3c34cm1cm32cm9_signal;
    yo_29 <= x_cm6c7c1cm6c12c3cm9cm6cm5c10c1cm6c5c6c8cm14_signal;
    yo_30 <= x_c0cm5cm2c2c1c9cm8c6cm3c2cm8c8cm14c5c4c2_signal;
    yo_31 <= x_cm4cm5c0c0cm5c0cm3c0c24c5c0cm6c14c17c2c7_signal;
    yo_32 <= x_c11c4cm1cm3c8c3c10cm17cm2cm3cm2cm9c5cm10c51cm19_signal;



end structural;