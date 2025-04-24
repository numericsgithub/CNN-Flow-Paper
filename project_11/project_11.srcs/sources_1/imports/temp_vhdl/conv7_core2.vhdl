LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core2 is
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
        yo_10  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_13  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_16  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_19  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_20  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_21  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_22  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_29  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core2;

architecture structural of conv7_core2 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c17c4cm7c6cm13c1cm21c1c12cm5c8cm2cm2cm3cm2c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm16c3c1c26c17c10c8cm6c11c7c4c0c32c0cm38c6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6c0c25c5c5c1cm3c1c12c5cm7c1c80c3cm9cm2_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c22c7cm33cm7c6c6cm43c19cm5c27cm24cm3cm3c2c11c11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2c4c6c7cm61c2c9c50c1c5cm21cm1c0c7cm10cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm9cm4c15c2c7c0cm41cm6c0cm1c3cm7cm19cm4cm3cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c9cm22c1cm7c0cm9c0c21cm17cm4cm3c3c10c1c1cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c7c16cm6c3c30c2c9c39c5cm3cm5c0cm3c5c7c5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c29c22cm16cm3cm5c31c1c4c3cm36c12c8c2c1c6c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2cm6cm1c46cm3c1c2c1c3c2c4cm6cm4c3cm2c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c21c0c2c4c28cm11cm2cm1c6cm13c9c1cm2c5cm2c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c5c0c9c0cm6cm1cm11cm2cm14cm1cm6c7c0c8c4c0_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm18c1c2c9cm24c34cm4c3c12cm10c13c6c1cm7c29c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c7c0c0c0cm29c7c6cm1c10c13c1cm2cm7cm2c0cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm33cm1c4c4c7c12cm7c2c4cm2cm9c0c6c6cm7c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2c12c3cm4c3c0c0c49cm12c6c7cm9c7c5cm5cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c8c17cm6c10cm40cm10c2c3c2cm2c2c19c10c2c1cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3cm1c0cm4c10c1c3c1c30c4cm18c0cm2cm1c6c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm5cm29cm3c8cm1c13c6c16c12cm18c11cm22c3c1cm8cm52_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c8c17c14c7cm7cm21c2cm9cm9c14c0c10c11cm1c3cm17_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm3c15c0c24c2cm25c2cm1c0cm4c5c4c10cm2c1c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2c28c1c5c20c0c13cm6c3c4cm5c22cm9cm5c13cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c28cm10cm2cm1cm29cm10cm5cm6c5c6c4cm3c0cm40cm4c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c18cm18c12cm2cm1c2cm4c0cm4c13c12c4cm2c2cm4c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c22c2c15c25c22cm3cm2cm9cm7c7c7cm3cm2cm8c0c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c20cm6cm4c0c5cm23c8c2c7cm16c6cm2c3cm3c8c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6c1c7cm10cm9cm3c2cm13c15cm2c2cm1c9cm43cm23c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c5c2c11c14cm4cm20c14c5cm16c10c0c0cm6cm4c1c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6cm1cm4c1cm59c35c1cm1c23cm3cm10c1c1cm2c7c3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm9c16c11cm7c14c10cm6c0c11c9c8cm2c0cm1c1cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm7c16c7c24c9c1c5c10cm3cm2c7cm5c58cm3c2c19_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c12cm19c0cm31c6c4c27cm18c8c17cm36c11cm4c0c7c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core2_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c17c4cm7c6cm13c1cm21c1c12cm5c8cm2cm2cm3cm2c3 => x_c17c4cm7c6cm13c1cm21c1c12cm5c8cm2cm2cm3cm2c3_signal, 
                R_cm16c3c1c26c17c10c8cm6c11c7c4c0c32c0cm38c6 => x_cm16c3c1c26c17c10c8cm6c11c7c4c0c32c0cm38c6_signal, 
                R_cm6c0c25c5c5c1cm3c1c12c5cm7c1c80c3cm9cm2 => x_cm6c0c25c5c5c1cm3c1c12c5cm7c1c80c3cm9cm2_signal, 
                R_c22c7cm33cm7c6c6cm43c19cm5c27cm24cm3cm3c2c11c11 => x_c22c7cm33cm7c6c6cm43c19cm5c27cm24cm3cm3c2c11c11_signal, 
                R_c2c4c6c7cm61c2c9c50c1c5cm21cm1c0c7cm10cm1 => x_c2c4c6c7cm61c2c9c50c1c5cm21cm1c0c7cm10cm1_signal, 
                R_cm9cm4c15c2c7c0cm41cm6c0cm1c3cm7cm19cm4cm3cm2 => x_cm9cm4c15c2c7c0cm41cm6c0cm1c3cm7cm19cm4cm3cm2_signal, 
                R_c9cm22c1cm7c0cm9c0c21cm17cm4cm3c3c10c1c1cm3 => x_c9cm22c1cm7c0cm9c0c21cm17cm4cm3c3c10c1c1cm3_signal, 
                R_c7c16cm6c3c30c2c9c39c5cm3cm5c0cm3c5c7c5 => x_c7c16cm6c3c30c2c9c39c5cm3cm5c0cm3c5c7c5_signal, 
                R_c29c22cm16cm3cm5c31c1c4c3cm36c12c8c2c1c6c1 => x_c29c22cm16cm3cm5c31c1c4c3cm36c12c8c2c1c6c1_signal, 
                R_cm2cm6cm1c46cm3c1c2c1c3c2c4cm6cm4c3cm2c0 => x_cm2cm6cm1c46cm3c1c2c1c3c2c4cm6cm4c3cm2c0_signal, 
                R_c21c0c2c4c28cm11cm2cm1c6cm13c9c1cm2c5cm2c1 => x_c21c0c2c4c28cm11cm2cm1c6cm13c9c1cm2c5cm2c1_signal, 
                R_c5c0c9c0cm6cm1cm11cm2cm14cm1cm6c7c0c8c4c0 => x_c5c0c9c0cm6cm1cm11cm2cm14cm1cm6c7c0c8c4c0_signal, 
                R_cm18c1c2c9cm24c34cm4c3c12cm10c13c6c1cm7c29c2 => x_cm18c1c2c9cm24c34cm4c3c12cm10c13c6c1cm7c29c2_signal, 
                R_c7c0c0c0cm29c7c6cm1c10c13c1cm2cm7cm2c0cm1 => x_c7c0c0c0cm29c7c6cm1c10c13c1cm2cm7cm2c0cm1_signal, 
                R_cm33cm1c4c4c7c12cm7c2c4cm2cm9c0c6c6cm7c1 => x_cm33cm1c4c4c7c12cm7c2c4cm2cm9c0c6c6cm7c1_signal, 
                R_cm2c12c3cm4c3c0c0c49cm12c6c7cm9c7c5cm5cm2 => x_cm2c12c3cm4c3c0c0c49cm12c6c7cm9c7c5cm5cm2_signal, 
                R_c8c17cm6c10cm40cm10c2c3c2cm2c2c19c10c2c1cm2 => x_c8c17cm6c10cm40cm10c2c3c2cm2c2c19c10c2c1cm2_signal, 
                R_cm3cm1c0cm4c10c1c3c1c30c4cm18c0cm2cm1c6c3 => x_cm3cm1c0cm4c10c1c3c1c30c4cm18c0cm2cm1c6c3_signal, 
                R_cm5cm29cm3c8cm1c13c6c16c12cm18c11cm22c3c1cm8cm52 => x_cm5cm29cm3c8cm1c13c6c16c12cm18c11cm22c3c1cm8cm52_signal, 
                R_c8c17c14c7cm7cm21c2cm9cm9c14c0c10c11cm1c3cm17 => x_c8c17c14c7cm7cm21c2cm9cm9c14c0c10c11cm1c3cm17_signal, 
                R_cm3c15c0c24c2cm25c2cm1c0cm4c5c4c10cm2c1c2 => x_cm3c15c0c24c2cm25c2cm1c0cm4c5c4c10cm2c1c2_signal, 
                R_c2c28c1c5c20c0c13cm6c3c4cm5c22cm9cm5c13cm2 => x_c2c28c1c5c20c0c13cm6c3c4cm5c22cm9cm5c13cm2_signal, 
                R_c28cm10cm2cm1cm29cm10cm5cm6c5c6c4cm3c0cm40cm4c0 => x_c28cm10cm2cm1cm29cm10cm5cm6c5c6c4cm3c0cm40cm4c0_signal, 
                R_c18cm18c12cm2cm1c2cm4c0cm4c13c12c4cm2c2cm4c2 => x_c18cm18c12cm2cm1c2cm4c0cm4c13c12c4cm2c2cm4c2_signal, 
                R_c22c2c15c25c22cm3cm2cm9cm7c7c7cm3cm2cm8c0c1 => x_c22c2c15c25c22cm3cm2cm9cm7c7c7cm3cm2cm8c0c1_signal, 
                R_c20cm6cm4c0c5cm23c8c2c7cm16c6cm2c3cm3c8c0 => x_c20cm6cm4c0c5cm23c8c2c7cm16c6cm2c3cm3c8c0_signal, 
                R_c6c1c7cm10cm9cm3c2cm13c15cm2c2cm1c9cm43cm23c1 => x_c6c1c7cm10cm9cm3c2cm13c15cm2c2cm1c9cm43cm23c1_signal, 
                R_c5c2c11c14cm4cm20c14c5cm16c10c0c0cm6cm4c1c0 => x_c5c2c11c14cm4cm20c14c5cm16c10c0c0cm6cm4c1c0_signal, 
                R_c6cm1cm4c1cm59c35c1cm1c23cm3cm10c1c1cm2c7c3 => x_c6cm1cm4c1cm59c35c1cm1c23cm3cm10c1c1cm2c7c3_signal, 
                R_cm9c16c11cm7c14c10cm6c0c11c9c8cm2c0cm1c1cm3 => x_cm9c16c11cm7c14c10cm6c0c11c9c8cm2c0cm1c1cm3_signal, 
                R_cm7c16c7c24c9c1c5c10cm3cm2c7cm5c58cm3c2c19 => x_cm7c16c7c24c9c1c5c10cm3cm2c7cm5c58cm3c2c19_signal, 
                R_c12cm19c0cm31c6c4c27cm18c8c17cm36c11cm4c0c7c1 => x_c12cm19c0cm31c6c4c27cm18c8c17cm36c11cm4c0c7c1_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c17c4cm7c6cm13c1cm21c1c12cm5c8cm2cm2cm3cm2c3_signal;
    yo_2 <= x_cm16c3c1c26c17c10c8cm6c11c7c4c0c32c0cm38c6_signal;
    yo_3 <= x_cm6c0c25c5c5c1cm3c1c12c5cm7c1c80c3cm9cm2_signal;
    yo_4 <= x_c22c7cm33cm7c6c6cm43c19cm5c27cm24cm3cm3c2c11c11_signal;
    yo_5 <= x_c2c4c6c7cm61c2c9c50c1c5cm21cm1c0c7cm10cm1_signal;
    yo_6 <= x_cm9cm4c15c2c7c0cm41cm6c0cm1c3cm7cm19cm4cm3cm2_signal;
    yo_7 <= x_c9cm22c1cm7c0cm9c0c21cm17cm4cm3c3c10c1c1cm3_signal;
    yo_8 <= x_c7c16cm6c3c30c2c9c39c5cm3cm5c0cm3c5c7c5_signal;
    yo_9 <= x_c29c22cm16cm3cm5c31c1c4c3cm36c12c8c2c1c6c1_signal;
    yo_10 <= x_cm2cm6cm1c46cm3c1c2c1c3c2c4cm6cm4c3cm2c0_signal;
    yo_11 <= x_c21c0c2c4c28cm11cm2cm1c6cm13c9c1cm2c5cm2c1_signal;
    yo_12 <= x_c5c0c9c0cm6cm1cm11cm2cm14cm1cm6c7c0c8c4c0_signal;
    yo_13 <= x_cm18c1c2c9cm24c34cm4c3c12cm10c13c6c1cm7c29c2_signal;
    yo_14 <= x_c7c0c0c0cm29c7c6cm1c10c13c1cm2cm7cm2c0cm1_signal;
    yo_15 <= x_cm33cm1c4c4c7c12cm7c2c4cm2cm9c0c6c6cm7c1_signal;
    yo_16 <= x_cm2c12c3cm4c3c0c0c49cm12c6c7cm9c7c5cm5cm2_signal;
    yo_17 <= x_c8c17cm6c10cm40cm10c2c3c2cm2c2c19c10c2c1cm2_signal;
    yo_18 <= x_cm3cm1c0cm4c10c1c3c1c30c4cm18c0cm2cm1c6c3_signal;
    yo_19 <= x_cm5cm29cm3c8cm1c13c6c16c12cm18c11cm22c3c1cm8cm52_signal;
    yo_20 <= x_c8c17c14c7cm7cm21c2cm9cm9c14c0c10c11cm1c3cm17_signal;
    yo_21 <= x_cm3c15c0c24c2cm25c2cm1c0cm4c5c4c10cm2c1c2_signal;
    yo_22 <= x_c2c28c1c5c20c0c13cm6c3c4cm5c22cm9cm5c13cm2_signal;
    yo_23 <= x_c28cm10cm2cm1cm29cm10cm5cm6c5c6c4cm3c0cm40cm4c0_signal;
    yo_24 <= x_c18cm18c12cm2cm1c2cm4c0cm4c13c12c4cm2c2cm4c2_signal;
    yo_25 <= x_c22c2c15c25c22cm3cm2cm9cm7c7c7cm3cm2cm8c0c1_signal;
    yo_26 <= x_c20cm6cm4c0c5cm23c8c2c7cm16c6cm2c3cm3c8c0_signal;
    yo_27 <= x_c6c1c7cm10cm9cm3c2cm13c15cm2c2cm1c9cm43cm23c1_signal;
    yo_28 <= x_c5c2c11c14cm4cm20c14c5cm16c10c0c0cm6cm4c1c0_signal;
    yo_29 <= x_c6cm1cm4c1cm59c35c1cm1c23cm3cm10c1c1cm2c7c3_signal;
    yo_30 <= x_cm9c16c11cm7c14c10cm6c0c11c9c8cm2c0cm1c1cm3_signal;
    yo_31 <= x_cm7c16c7c24c9c1c5c10cm3cm2c7cm5c58cm3c2c19_signal;
    yo_32 <= x_c12cm19c0cm31c6c4c27cm18c8c17cm36c11cm4c0c7c1_signal;



end structural;