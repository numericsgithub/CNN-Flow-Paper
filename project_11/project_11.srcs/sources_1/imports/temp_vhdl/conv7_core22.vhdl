LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core22 is
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
    
        yo_1  : out std_logic_vector(11-1 downto 0);  --	sfix(1, -10)
        yo_2  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_3  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_13  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_16  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_19  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(3, -10)
    );
end conv7_core22;

architecture structural of conv7_core22 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c1c0c2c0cm3c2c3cm7cm1c4cm5c7c1c4c5c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)
    signal  x_c1cm12cm11cm8c16cm16c2c2cm1c5c8cm3c13c29cm20c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm8c3c8cm1c16c0c1cm3c4cm25cm8c2cm1cm11cm3cm9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm11c1cm42cm1c6c7c1c1c10c2c8cm2c15c2cm15c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm7cm16cm7cm18c0cm6c14cm1c5c6c6cm2c2c22c5c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2c2cm17cm13c10c7c8c18c0c4cm1c17c0c17c18c33_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c17c4c2cm16cm5c4cm6cm9cm9cm11c0cm12c15c4cm3c4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm11cm1c2cm27c7cm22cm14c6c4c29c7cm2c5c21c2cm7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c37cm6c16c38cm6c14c8cm12cm8cm3cm57c15c7cm3cm12cm11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2c1c20c13cm14cm4cm1cm6c5cm4c59c5cm3cm4c12c11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1c3cm31c1c0c1c7c1cm9cm1cm2c29cm18c0cm19cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c3c0c11c9cm28cm5c15cm5c1c2cm2cm3c7c4c9cm12_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c76cm6c0c6c11c12c6cm10cm20c2c4cm5c7c7cm6cm7_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm13cm3cm5c3cm20c2c4cm2cm13cm1cm1c0cm27c4c4cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm13c7c0c14cm11c8c5cm17c17cm17c0c9c1cm9c7cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1cm16cm6c2cm12c2c1cm10c0cm1cm1cm6c7c3cm4c8_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c2cm4cm1cm29cm1c9cm15c8cm10c2cm17cm8c3c26cm31c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2c2c3cm12c19c1c2c2cm5c0c3c29cm6cm2c9c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0cm5cm3cm1cm2cm8c7c7c0cm15c1c0c0c1c4c12_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c0c1c2c2c13cm9c4cm48c1cm3cm17c6c1c8cm22cm5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3c30c2cm4cm1c7cm15c0c1c6c2cm11cm1c28c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0cm33c40cm17cm1c2c12cm3cm5cm7cm4cm10c8cm7c17cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2c3cm21c11c7c2cm1c14cm6c5c7c26cm12c18cm4c6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm24cm22cm43cm2c1c23c10c0c9cm2c14cm4c12cm9cm6c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c7cm2c2c22cm7cm4cm3c4cm1c1c3c5cm4c0c5c11_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm13c2cm9cm4cm6c1cm2c6cm13c3cm14c6c11c3cm21c9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c4c4c4c8c9cm14c2cm42cm2c1c0c1c14cm6c5cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c12cm7cm8c1c0c10cm8c9c1cm11c9cm4c2cm9c18cm14_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm4cm1cm1c10cm1cm1cm6cm4cm10c0cm4c1cm4c10cm17cm16_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c11c7cm5cm4cm3cm3cm8c8c5c9cm6c9c5cm2c7c12_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c6c9c6cm5c13cm5cm11c34c6c2cm3cm3cm10c21cm3c14_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm21c5cm6c11c4c4cm19cm10c3c0cm6c3c5cm9c7c18_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core22_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c1c0c2c0cm3c2c3cm7cm1c4cm5c7c1c4c5c0 => x_c1c0c2c0cm3c2c3cm7cm1c4cm5c7c1c4c5c0_signal, 
                R_c1cm12cm11cm8c16cm16c2c2cm1c5c8cm3c13c29cm20c2 => x_c1cm12cm11cm8c16cm16c2c2cm1c5c8cm3c13c29cm20c2_signal, 
                R_cm8c3c8cm1c16c0c1cm3c4cm25cm8c2cm1cm11cm3cm9 => x_cm8c3c8cm1c16c0c1cm3c4cm25cm8c2cm1cm11cm3cm9_signal, 
                R_cm11c1cm42cm1c6c7c1c1c10c2c8cm2c15c2cm15c1 => x_cm11c1cm42cm1c6c7c1c1c10c2c8cm2c15c2cm15c1_signal, 
                R_cm7cm16cm7cm18c0cm6c14cm1c5c6c6cm2c2c22c5c0 => x_cm7cm16cm7cm18c0cm6c14cm1c5c6c6cm2c2c22c5c0_signal, 
                R_c2c2cm17cm13c10c7c8c18c0c4cm1c17c0c17c18c33 => x_c2c2cm17cm13c10c7c8c18c0c4cm1c17c0c17c18c33_signal, 
                R_c17c4c2cm16cm5c4cm6cm9cm9cm11c0cm12c15c4cm3c4 => x_c17c4c2cm16cm5c4cm6cm9cm9cm11c0cm12c15c4cm3c4_signal, 
                R_cm11cm1c2cm27c7cm22cm14c6c4c29c7cm2c5c21c2cm7 => x_cm11cm1c2cm27c7cm22cm14c6c4c29c7cm2c5c21c2cm7_signal, 
                R_c37cm6c16c38cm6c14c8cm12cm8cm3cm57c15c7cm3cm12cm11 => x_c37cm6c16c38cm6c14c8cm12cm8cm3cm57c15c7cm3cm12cm11_signal, 
                R_cm2c1c20c13cm14cm4cm1cm6c5cm4c59c5cm3cm4c12c11 => x_cm2c1c20c13cm14cm4cm1cm6c5cm4c59c5cm3cm4c12c11_signal, 
                R_cm1c3cm31c1c0c1c7c1cm9cm1cm2c29cm18c0cm19cm5 => x_cm1c3cm31c1c0c1c7c1cm9cm1cm2c29cm18c0cm19cm5_signal, 
                R_c3c0c11c9cm28cm5c15cm5c1c2cm2cm3c7c4c9cm12 => x_c3c0c11c9cm28cm5c15cm5c1c2cm2cm3c7c4c9cm12_signal, 
                R_c76cm6c0c6c11c12c6cm10cm20c2c4cm5c7c7cm6cm7 => x_c76cm6c0c6c11c12c6cm10cm20c2c4cm5c7c7cm6cm7_signal, 
                R_cm13cm3cm5c3cm20c2c4cm2cm13cm1cm1c0cm27c4c4cm2 => x_cm13cm3cm5c3cm20c2c4cm2cm13cm1cm1c0cm27c4c4cm2_signal, 
                R_cm13c7c0c14cm11c8c5cm17c17cm17c0c9c1cm9c7cm3 => x_cm13c7c0c14cm11c8c5cm17c17cm17c0c9c1cm9c7cm3_signal, 
                R_cm1cm16cm6c2cm12c2c1cm10c0cm1cm1cm6c7c3cm4c8 => x_cm1cm16cm6c2cm12c2c1cm10c0cm1cm1cm6c7c3cm4c8_signal, 
                R_c2cm4cm1cm29cm1c9cm15c8cm10c2cm17cm8c3c26cm31c3 => x_c2cm4cm1cm29cm1c9cm15c8cm10c2cm17cm8c3c26cm31c3_signal, 
                R_c2c2c3cm12c19c1c2c2cm5c0c3c29cm6cm2c9c1 => x_c2c2c3cm12c19c1c2c2cm5c0c3c29cm6cm2c9c1_signal, 
                R_c0cm5cm3cm1cm2cm8c7c7c0cm15c1c0c0c1c4c12 => x_c0cm5cm3cm1cm2cm8c7c7c0cm15c1c0c0c1c4c12_signal, 
                R_c0c1c2c2c13cm9c4cm48c1cm3cm17c6c1c8cm22cm5 => x_c0c1c2c2c13cm9c4cm48c1cm3cm17c6c1c8cm22cm5_signal, 
                R_c3c30c2cm4cm1c7cm15c0c1c6c2cm11cm1c28c0c0 => x_c3c30c2cm4cm1c7cm15c0c1c6c2cm11cm1c28c0c0_signal, 
                R_c0cm33c40cm17cm1c2c12cm3cm5cm7cm4cm10c8cm7c17cm4 => x_c0cm33c40cm17cm1c2c12cm3cm5cm7cm4cm10c8cm7c17cm4_signal, 
                R_c2c3cm21c11c7c2cm1c14cm6c5c7c26cm12c18cm4c6 => x_c2c3cm21c11c7c2cm1c14cm6c5c7c26cm12c18cm4c6_signal, 
                R_cm24cm22cm43cm2c1c23c10c0c9cm2c14cm4c12cm9cm6c1 => x_cm24cm22cm43cm2c1c23c10c0c9cm2c14cm4c12cm9cm6c1_signal, 
                R_c7cm2c2c22cm7cm4cm3c4cm1c1c3c5cm4c0c5c11 => x_c7cm2c2c22cm7cm4cm3c4cm1c1c3c5cm4c0c5c11_signal, 
                R_cm13c2cm9cm4cm6c1cm2c6cm13c3cm14c6c11c3cm21c9 => x_cm13c2cm9cm4cm6c1cm2c6cm13c3cm14c6c11c3cm21c9_signal, 
                R_c4c4c4c8c9cm14c2cm42cm2c1c0c1c14cm6c5cm2 => x_c4c4c4c8c9cm14c2cm42cm2c1c0c1c14cm6c5cm2_signal, 
                R_c12cm7cm8c1c0c10cm8c9c1cm11c9cm4c2cm9c18cm14 => x_c12cm7cm8c1c0c10cm8c9c1cm11c9cm4c2cm9c18cm14_signal, 
                R_cm4cm1cm1c10cm1cm1cm6cm4cm10c0cm4c1cm4c10cm17cm16 => x_cm4cm1cm1c10cm1cm1cm6cm4cm10c0cm4c1cm4c10cm17cm16_signal, 
                R_c11c7cm5cm4cm3cm3cm8c8c5c9cm6c9c5cm2c7c12 => x_c11c7cm5cm4cm3cm3cm8c8c5c9cm6c9c5cm2c7c12_signal, 
                R_c6c9c6cm5c13cm5cm11c34c6c2cm3cm3cm10c21cm3c14 => x_c6c9c6cm5c13cm5cm11c34c6c2cm3cm3cm10c21cm3c14_signal, 
                R_cm21c5cm6c11c4c4cm19cm10c3c0cm6c3c5cm9c7c18 => x_cm21c5cm6c11c4c4cm19cm10c3c0cm6c3c5cm9c7c18_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c1c0c2c0cm3c2c3cm7cm1c4cm5c7c1c4c5c0_signal;
    yo_2 <= x_c1cm12cm11cm8c16cm16c2c2cm1c5c8cm3c13c29cm20c2_signal;
    yo_3 <= x_cm8c3c8cm1c16c0c1cm3c4cm25cm8c2cm1cm11cm3cm9_signal;
    yo_4 <= x_cm11c1cm42cm1c6c7c1c1c10c2c8cm2c15c2cm15c1_signal;
    yo_5 <= x_cm7cm16cm7cm18c0cm6c14cm1c5c6c6cm2c2c22c5c0_signal;
    yo_6 <= x_c2c2cm17cm13c10c7c8c18c0c4cm1c17c0c17c18c33_signal;
    yo_7 <= x_c17c4c2cm16cm5c4cm6cm9cm9cm11c0cm12c15c4cm3c4_signal;
    yo_8 <= x_cm11cm1c2cm27c7cm22cm14c6c4c29c7cm2c5c21c2cm7_signal;
    yo_9 <= x_c37cm6c16c38cm6c14c8cm12cm8cm3cm57c15c7cm3cm12cm11_signal;
    yo_10 <= x_cm2c1c20c13cm14cm4cm1cm6c5cm4c59c5cm3cm4c12c11_signal;
    yo_11 <= x_cm1c3cm31c1c0c1c7c1cm9cm1cm2c29cm18c0cm19cm5_signal;
    yo_12 <= x_c3c0c11c9cm28cm5c15cm5c1c2cm2cm3c7c4c9cm12_signal;
    yo_13 <= x_c76cm6c0c6c11c12c6cm10cm20c2c4cm5c7c7cm6cm7_signal;
    yo_14 <= x_cm13cm3cm5c3cm20c2c4cm2cm13cm1cm1c0cm27c4c4cm2_signal;
    yo_15 <= x_cm13c7c0c14cm11c8c5cm17c17cm17c0c9c1cm9c7cm3_signal;
    yo_16 <= x_cm1cm16cm6c2cm12c2c1cm10c0cm1cm1cm6c7c3cm4c8_signal;
    yo_17 <= x_c2cm4cm1cm29cm1c9cm15c8cm10c2cm17cm8c3c26cm31c3_signal;
    yo_18 <= x_c2c2c3cm12c19c1c2c2cm5c0c3c29cm6cm2c9c1_signal;
    yo_19 <= x_c0cm5cm3cm1cm2cm8c7c7c0cm15c1c0c0c1c4c12_signal;
    yo_20 <= x_c0c1c2c2c13cm9c4cm48c1cm3cm17c6c1c8cm22cm5_signal;
    yo_21 <= x_c3c30c2cm4cm1c7cm15c0c1c6c2cm11cm1c28c0c0_signal;
    yo_22 <= x_c0cm33c40cm17cm1c2c12cm3cm5cm7cm4cm10c8cm7c17cm4_signal;
    yo_23 <= x_c2c3cm21c11c7c2cm1c14cm6c5c7c26cm12c18cm4c6_signal;
    yo_24 <= x_cm24cm22cm43cm2c1c23c10c0c9cm2c14cm4c12cm9cm6c1_signal;
    yo_25 <= x_c7cm2c2c22cm7cm4cm3c4cm1c1c3c5cm4c0c5c11_signal;
    yo_26 <= x_cm13c2cm9cm4cm6c1cm2c6cm13c3cm14c6c11c3cm21c9_signal;
    yo_27 <= x_c4c4c4c8c9cm14c2cm42cm2c1c0c1c14cm6c5cm2_signal;
    yo_28 <= x_c12cm7cm8c1c0c10cm8c9c1cm11c9cm4c2cm9c18cm14_signal;
    yo_29 <= x_cm4cm1cm1c10cm1cm1cm6cm4cm10c0cm4c1cm4c10cm17cm16_signal;
    yo_30 <= x_c11c7cm5cm4cm3cm3cm8c8c5c9cm6c9c5cm2c7c12_signal;
    yo_31 <= x_c6c9c6cm5c13cm5cm11c34c6c2cm3cm3cm10c21cm3c14_signal;
    yo_32 <= x_cm21c5cm6c11c4c4cm19cm10c3c0cm6c3c5cm9c7c18_signal;



end structural;