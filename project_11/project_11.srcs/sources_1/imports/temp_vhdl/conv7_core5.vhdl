LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core5 is
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
        yo_2  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_7  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_8  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_22  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_24  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_26  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_29  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_30  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core5;

architecture structural of conv7_core5 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm9c7cm7c9cm5cm11c7cm6c0cm7c5cm3c2c0c66c8_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c0c0cm2cm14cm10cm2cm82c2c15cm6cm38cm4c29cm5c30cm1_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c1cm45cm7c4cm15c7c9c5cm18c1c27c10cm51c6cm9c16_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2c1c8c2c0cm6cm7c3c5c13cm2cm3c4cm4cm12c49_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c13cm22c11cm1c1cm10cm10cm15cm8cm6c4cm9cm8cm8cm19cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm3c16cm7c31c40c2cm7c1c6c5c2c12cm4c9c2c21_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2cm7c1cm12cm42cm8cm6c5cm29c3cm3c10c6c15cm1cm9_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c6c14c11c1cm2cm16cm12c1cm1cm1cm2c7c3c8c2c1_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm12cm3cm42c16cm3cm7cm1cm9cm1c5c2cm12cm5c0c0cm18_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c5cm5c29c7cm2c3c3cm14c4c0cm3cm9c3c0c1cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm14c1c1c42c6c2c1cm1c5cm10c0cm6cm6cm13cm3c5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1cm1c2cm6cm23cm27c9c7cm6cm27cm20c1cm2c2c0cm7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm3cm1c1cm2cm7cm4cm13c0c15cm14cm21cm1c9c3cm22cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm5c1cm3c1c17cm16cm4c3cm11cm4c14c0cm17c1c6c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm3cm11c6c2c1cm1cm3cm3cm3c10c2cm3cm13cm6c5cm4_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c1c6c1cm2cm25cm5c31c1c24c7cm14c2cm3c5cm3cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm3c2cm28c3cm2cm3cm1c0c6c4cm5cm2c2c1cm9c9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c10c13c0cm2cm4c5cm5cm3c18cm7cm11c5c26c1cm2cm7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1cm8c5c3c6cm3c20c29c5cm16cm2cm28cm2cm6c3cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm2cm7cm12cm4c7cm23cm5cm3c2cm13cm3c14c20cm12c4cm76_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c2c7cm7cm8cm47c5c11cm1c4c8cm8c0c3c1c16c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm10cm3cm9cm23cm7cm4cm7cm2c8cm1c19c0c2cm2c6c5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c9c4c5cm27cm3c0c1c0cm4cm28c5c5c7cm4c1c8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2cm3c9c2cm3cm1c2cm2cm4c7cm9cm2cm3cm8c3c0_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c7cm2c2c1c1c19cm20cm7cm10c7c1cm2cm6cm3c5c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm14cm5cm6cm6c1cm3c1c0cm3cm4c0c2cm1cm77cm4c2_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm3cm4c2cm2cm20c11c25cm23c9c7cm8c10c0cm28c43c7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm13c3c2cm12c1c14cm20c12c11c4cm12cm7c3cm1c3c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm5c5cm2cm9cm7cm1cm5cm7c5c9cm6cm3cm5c3cm1cm7_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c2cm3c5c14c9cm3cm11c11cm2cm6c9c8cm3c7cm6c6_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c3c6cm2cm2cm25cm21cm4cm22c39c5c0c10c12c2cm1cm44_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm7c3cm1cm1cm1c7c0cm10c6c6cm13c19c4c4cm61c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core5_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm9c7cm7c9cm5cm11c7cm6c0cm7c5cm3c2c0c66c8 => x_cm9c7cm7c9cm5cm11c7cm6c0cm7c5cm3c2c0c66c8_signal, 
                R_c0c0cm2cm14cm10cm2cm82c2c15cm6cm38cm4c29cm5c30cm1 => x_c0c0cm2cm14cm10cm2cm82c2c15cm6cm38cm4c29cm5c30cm1_signal, 
                R_c1cm45cm7c4cm15c7c9c5cm18c1c27c10cm51c6cm9c16 => x_c1cm45cm7c4cm15c7c9c5cm18c1c27c10cm51c6cm9c16_signal, 
                R_c2c1c8c2c0cm6cm7c3c5c13cm2cm3c4cm4cm12c49 => x_c2c1c8c2c0cm6cm7c3c5c13cm2cm3c4cm4cm12c49_signal, 
                R_c13cm22c11cm1c1cm10cm10cm15cm8cm6c4cm9cm8cm8cm19cm8 => x_c13cm22c11cm1c1cm10cm10cm15cm8cm6c4cm9cm8cm8cm19cm8_signal, 
                R_cm3c16cm7c31c40c2cm7c1c6c5c2c12cm4c9c2c21 => x_cm3c16cm7c31c40c2cm7c1c6c5c2c12cm4c9c2c21_signal, 
                R_cm2cm7c1cm12cm42cm8cm6c5cm29c3cm3c10c6c15cm1cm9 => x_cm2cm7c1cm12cm42cm8cm6c5cm29c3cm3c10c6c15cm1cm9_signal, 
                R_c6c14c11c1cm2cm16cm12c1cm1cm1cm2c7c3c8c2c1 => x_c6c14c11c1cm2cm16cm12c1cm1cm1cm2c7c3c8c2c1_signal, 
                R_cm12cm3cm42c16cm3cm7cm1cm9cm1c5c2cm12cm5c0c0cm18 => x_cm12cm3cm42c16cm3cm7cm1cm9cm1c5c2cm12cm5c0c0cm18_signal, 
                R_c5cm5c29c7cm2c3c3cm14c4c0cm3cm9c3c0c1cm3 => x_c5cm5c29c7cm2c3c3cm14c4c0cm3cm9c3c0c1cm3_signal, 
                R_cm14c1c1c42c6c2c1cm1c5cm10c0cm6cm6cm13cm3c5 => x_cm14c1c1c42c6c2c1cm1c5cm10c0cm6cm6cm13cm3c5_signal, 
                R_cm1cm1c2cm6cm23cm27c9c7cm6cm27cm20c1cm2c2c0cm7 => x_cm1cm1c2cm6cm23cm27c9c7cm6cm27cm20c1cm2c2c0cm7_signal, 
                R_cm3cm1c1cm2cm7cm4cm13c0c15cm14cm21cm1c9c3cm22cm3 => x_cm3cm1c1cm2cm7cm4cm13c0c15cm14cm21cm1c9c3cm22cm3_signal, 
                R_cm5c1cm3c1c17cm16cm4c3cm11cm4c14c0cm17c1c6c2 => x_cm5c1cm3c1c17cm16cm4c3cm11cm4c14c0cm17c1c6c2_signal, 
                R_cm3cm11c6c2c1cm1cm3cm3cm3c10c2cm3cm13cm6c5cm4 => x_cm3cm11c6c2c1cm1cm3cm3cm3c10c2cm3cm13cm6c5cm4_signal, 
                R_c1c6c1cm2cm25cm5c31c1c24c7cm14c2cm3c5cm3cm1 => x_c1c6c1cm2cm25cm5c31c1c24c7cm14c2cm3c5cm3cm1_signal, 
                R_cm3c2cm28c3cm2cm3cm1c0c6c4cm5cm2c2c1cm9c9 => x_cm3c2cm28c3cm2cm3cm1c0c6c4cm5cm2c2c1cm9c9_signal, 
                R_c10c13c0cm2cm4c5cm5cm3c18cm7cm11c5c26c1cm2cm7 => x_c10c13c0cm2cm4c5cm5cm3c18cm7cm11c5c26c1cm2cm7_signal, 
                R_c1cm8c5c3c6cm3c20c29c5cm16cm2cm28cm2cm6c3cm1 => x_c1cm8c5c3c6cm3c20c29c5cm16cm2cm28cm2cm6c3cm1_signal, 
                R_cm2cm7cm12cm4c7cm23cm5cm3c2cm13cm3c14c20cm12c4cm76 => x_cm2cm7cm12cm4c7cm23cm5cm3c2cm13cm3c14c20cm12c4cm76_signal, 
                R_c2c7cm7cm8cm47c5c11cm1c4c8cm8c0c3c1c16c4 => x_c2c7cm7cm8cm47c5c11cm1c4c8cm8c0c3c1c16c4_signal, 
                R_cm10cm3cm9cm23cm7cm4cm7cm2c8cm1c19c0c2cm2c6c5 => x_cm10cm3cm9cm23cm7cm4cm7cm2c8cm1c19c0c2cm2c6c5_signal, 
                R_c9c4c5cm27cm3c0c1c0cm4cm28c5c5c7cm4c1c8 => x_c9c4c5cm27cm3c0c1c0cm4cm28c5c5c7cm4c1c8_signal, 
                R_c2cm3c9c2cm3cm1c2cm2cm4c7cm9cm2cm3cm8c3c0 => x_c2cm3c9c2cm3cm1c2cm2cm4c7cm9cm2cm3cm8c3c0_signal, 
                R_c7cm2c2c1c1c19cm20cm7cm10c7c1cm2cm6cm3c5c2 => x_c7cm2c2c1c1c19cm20cm7cm10c7c1cm2cm6cm3c5c2_signal, 
                R_cm14cm5cm6cm6c1cm3c1c0cm3cm4c0c2cm1cm77cm4c2 => x_cm14cm5cm6cm6c1cm3c1c0cm3cm4c0c2cm1cm77cm4c2_signal, 
                R_cm3cm4c2cm2cm20c11c25cm23c9c7cm8c10c0cm28c43c7 => x_cm3cm4c2cm2cm20c11c25cm23c9c7cm8c10c0cm28c43c7_signal, 
                R_cm13c3c2cm12c1c14cm20c12c11c4cm12cm7c3cm1c3c2 => x_cm13c3c2cm12c1c14cm20c12c11c4cm12cm7c3cm1c3c2_signal, 
                R_cm5c5cm2cm9cm7cm1cm5cm7c5c9cm6cm3cm5c3cm1cm7 => x_cm5c5cm2cm9cm7cm1cm5cm7c5c9cm6cm3cm5c3cm1cm7_signal, 
                R_c2cm3c5c14c9cm3cm11c11cm2cm6c9c8cm3c7cm6c6 => x_c2cm3c5c14c9cm3cm11c11cm2cm6c9c8cm3c7cm6c6_signal, 
                R_c3c6cm2cm2cm25cm21cm4cm22c39c5c0c10c12c2cm1cm44 => x_c3c6cm2cm2cm25cm21cm4cm22c39c5c0c10c12c2cm1cm44_signal, 
                R_cm7c3cm1cm1cm1c7c0cm10c6c6cm13c19c4c4cm61c0 => x_cm7c3cm1cm1cm1c7c0cm10c6c6cm13c19c4c4cm61c0_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm9c7cm7c9cm5cm11c7cm6c0cm7c5cm3c2c0c66c8_signal;
    yo_2 <= x_c0c0cm2cm14cm10cm2cm82c2c15cm6cm38cm4c29cm5c30cm1_signal;
    yo_3 <= x_c1cm45cm7c4cm15c7c9c5cm18c1c27c10cm51c6cm9c16_signal;
    yo_4 <= x_c2c1c8c2c0cm6cm7c3c5c13cm2cm3c4cm4cm12c49_signal;
    yo_5 <= x_c13cm22c11cm1c1cm10cm10cm15cm8cm6c4cm9cm8cm8cm19cm8_signal;
    yo_6 <= x_cm3c16cm7c31c40c2cm7c1c6c5c2c12cm4c9c2c21_signal;
    yo_7 <= x_cm2cm7c1cm12cm42cm8cm6c5cm29c3cm3c10c6c15cm1cm9_signal;
    yo_8 <= x_c6c14c11c1cm2cm16cm12c1cm1cm1cm2c7c3c8c2c1_signal;
    yo_9 <= x_cm12cm3cm42c16cm3cm7cm1cm9cm1c5c2cm12cm5c0c0cm18_signal;
    yo_10 <= x_c5cm5c29c7cm2c3c3cm14c4c0cm3cm9c3c0c1cm3_signal;
    yo_11 <= x_cm14c1c1c42c6c2c1cm1c5cm10c0cm6cm6cm13cm3c5_signal;
    yo_12 <= x_cm1cm1c2cm6cm23cm27c9c7cm6cm27cm20c1cm2c2c0cm7_signal;
    yo_13 <= x_cm3cm1c1cm2cm7cm4cm13c0c15cm14cm21cm1c9c3cm22cm3_signal;
    yo_14 <= x_cm5c1cm3c1c17cm16cm4c3cm11cm4c14c0cm17c1c6c2_signal;
    yo_15 <= x_cm3cm11c6c2c1cm1cm3cm3cm3c10c2cm3cm13cm6c5cm4_signal;
    yo_16 <= x_c1c6c1cm2cm25cm5c31c1c24c7cm14c2cm3c5cm3cm1_signal;
    yo_17 <= x_cm3c2cm28c3cm2cm3cm1c0c6c4cm5cm2c2c1cm9c9_signal;
    yo_18 <= x_c10c13c0cm2cm4c5cm5cm3c18cm7cm11c5c26c1cm2cm7_signal;
    yo_19 <= x_c1cm8c5c3c6cm3c20c29c5cm16cm2cm28cm2cm6c3cm1_signal;
    yo_20 <= x_cm2cm7cm12cm4c7cm23cm5cm3c2cm13cm3c14c20cm12c4cm76_signal;
    yo_21 <= x_c2c7cm7cm8cm47c5c11cm1c4c8cm8c0c3c1c16c4_signal;
    yo_22 <= x_cm10cm3cm9cm23cm7cm4cm7cm2c8cm1c19c0c2cm2c6c5_signal;
    yo_23 <= x_c9c4c5cm27cm3c0c1c0cm4cm28c5c5c7cm4c1c8_signal;
    yo_24 <= x_c2cm3c9c2cm3cm1c2cm2cm4c7cm9cm2cm3cm8c3c0_signal;
    yo_25 <= x_c7cm2c2c1c1c19cm20cm7cm10c7c1cm2cm6cm3c5c2_signal;
    yo_26 <= x_cm14cm5cm6cm6c1cm3c1c0cm3cm4c0c2cm1cm77cm4c2_signal;
    yo_27 <= x_cm3cm4c2cm2cm20c11c25cm23c9c7cm8c10c0cm28c43c7_signal;
    yo_28 <= x_cm13c3c2cm12c1c14cm20c12c11c4cm12cm7c3cm1c3c2_signal;
    yo_29 <= x_cm5c5cm2cm9cm7cm1cm5cm7c5c9cm6cm3cm5c3cm1cm7_signal;
    yo_30 <= x_c2cm3c5c14c9cm3cm11c11cm2cm6c9c8cm3c7cm6c6_signal;
    yo_31 <= x_c3c6cm2cm2cm25cm21cm4cm22c39c5c0c10c12c2cm1cm44_signal;
    yo_32 <= x_cm7c3cm1cm1cm1c7c0cm10c6c6cm13c19c4c4cm61c0_signal;



end structural;