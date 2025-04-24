LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core17 is
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
        yo_2  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_4  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_7  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_9  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_10  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_14  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_16  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_18  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_26  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core17;

architecture structural of conv7_core17 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm2c5cm5c7cm29c11c2c1c5cm3cm104c3c10c13c19c9_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c3cm10c2cm15cm7c7c26cm3cm7c2cm7cm4c8cm45cm2cm12_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0cm20cm4cm3cm6c7cm1cm3c7c4c5c10c4cm40c7c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c6cm1cm11c1c4c79cm4c6c4cm7cm19cm72cm23c4cm33cm3_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm16c7c5cm3c0c2c32cm9cm4cm8cm36cm2cm20cm5cm3cm9_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1c0c28cm15c40cm2c16cm9cm4c5c6c16c4c11c10c21_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2c11c1cm6c56c8c4cm6cm16c12cm1cm5cm3c14c0cm6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c13c4c2cm10cm16cm3c17cm8c3c3c5cm2c10cm6c46cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm5cm3c1c7cm6cm18c6cm3c2cm10c6cm19cm1c10c13cm16_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1cm1cm2c11c64cm1cm5c0c1c1c6cm11cm4cm7cm6c19_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm6c0c12c15c20c10cm1c0cm3c10cm10c1c1cm6c10c39_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2c0c4cm2c1cm12c4cm2cm12c5c7cm4cm4c1cm2cm11_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm13cm7c2c3cm5c5cm1cm3c6cm9c21cm1c4c0c1cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm7c4c2cm3c8c0cm5c2cm3c6c5cm3cm4c3c1c1_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm2cm13c1cm6c12cm21c13c7cm8cm7c1c2cm3c22c16c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1c121c1cm3cm9c3cm4c1c37c5c7c10cm1cm21c8c6_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm18cm22c4cm3cm2cm2c4cm4c8cm2cm5c15c42c11cm28c6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm5c0cm2cm13cm29c0c55c0c12c0c14cm3c4cm8cm1c7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1cm1c2c3cm13c22cm2cm2c21cm13c6cm10cm13c12c5c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1cm5c3cm10c5cm5c5cm11cm21cm6c4c127cm2cm14cm9c4_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c1cm5cm5c54cm23cm4cm13cm2cm2cm1c3c4c2cm1cm1cm12_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0cm4cm12cm8cm3c13cm10cm14cm5c2cm7c3c5cm35c4cm41_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3c6c4c0c4cm10c11c2c9cm28c8c6c7cm1c6c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm6cm11cm7c11c7cm6c0cm2cm7cm8c2cm1c7c19c8c49_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm4c2c3cm1c10cm39c2c1cm12cm2c4cm3cm20cm5c9c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c17cm6cm12cm6c9c0c16c2c3c75c0c2c0c23cm43c5_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm3cm1c2c1cm1cm4c8cm16c5c25cm44cm22c2c1cm3c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm16cm7c15c1c0cm16c1c15cm9cm3c12c0c8cm29c6cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm5c7c4cm5c2cm3cm3c1c19c4cm3cm5cm5cm8cm2cm9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm3cm3cm2c3cm23c13cm28cm6c9c3c0c1cm11c7c3c14_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1c8c2c1c8cm31c1c4cm15c4c2c34c9c14c0c8_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm14c0c1c9c12cm18cm4c13c10c22c46c9c7cm52c3c10_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core17_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm2c5cm5c7cm29c11c2c1c5cm3cm104c3c10c13c19c9 => x_cm2c5cm5c7cm29c11c2c1c5cm3cm104c3c10c13c19c9_signal, 
                R_c3cm10c2cm15cm7c7c26cm3cm7c2cm7cm4c8cm45cm2cm12 => x_c3cm10c2cm15cm7c7c26cm3cm7c2cm7cm4c8cm45cm2cm12_signal, 
                R_c0cm20cm4cm3cm6c7cm1cm3c7c4c5c10c4cm40c7c1 => x_c0cm20cm4cm3cm6c7cm1cm3c7c4c5c10c4cm40c7c1_signal, 
                R_c6cm1cm11c1c4c79cm4c6c4cm7cm19cm72cm23c4cm33cm3 => x_c6cm1cm11c1c4c79cm4c6c4cm7cm19cm72cm23c4cm33cm3_signal, 
                R_cm16c7c5cm3c0c2c32cm9cm4cm8cm36cm2cm20cm5cm3cm9 => x_cm16c7c5cm3c0c2c32cm9cm4cm8cm36cm2cm20cm5cm3cm9_signal, 
                R_cm1c0c28cm15c40cm2c16cm9cm4c5c6c16c4c11c10c21 => x_cm1c0c28cm15c40cm2c16cm9cm4c5c6c16c4c11c10c21_signal, 
                R_cm2c11c1cm6c56c8c4cm6cm16c12cm1cm5cm3c14c0cm6 => x_cm2c11c1cm6c56c8c4cm6cm16c12cm1cm5cm3c14c0cm6_signal, 
                R_c13c4c2cm10cm16cm3c17cm8c3c3c5cm2c10cm6c46cm3 => x_c13c4c2cm10cm16cm3c17cm8c3c3c5cm2c10cm6c46cm3_signal, 
                R_cm5cm3c1c7cm6cm18c6cm3c2cm10c6cm19cm1c10c13cm16 => x_cm5cm3c1c7cm6cm18c6cm3c2cm10c6cm19cm1c10c13cm16_signal, 
                R_c1cm1cm2c11c64cm1cm5c0c1c1c6cm11cm4cm7cm6c19 => x_c1cm1cm2c11c64cm1cm5c0c1c1c6cm11cm4cm7cm6c19_signal, 
                R_cm6c0c12c15c20c10cm1c0cm3c10cm10c1c1cm6c10c39 => x_cm6c0c12c15c20c10cm1c0cm3c10cm10c1c1cm6c10c39_signal, 
                R_c2c0c4cm2c1cm12c4cm2cm12c5c7cm4cm4c1cm2cm11 => x_c2c0c4cm2c1cm12c4cm2cm12c5c7cm4cm4c1cm2cm11_signal, 
                R_cm13cm7c2c3cm5c5cm1cm3c6cm9c21cm1c4c0c1cm1 => x_cm13cm7c2c3cm5c5cm1cm3c6cm9c21cm1c4c0c1cm1_signal, 
                R_cm7c4c2cm3c8c0cm5c2cm3c6c5cm3cm4c3c1c1 => x_cm7c4c2cm3c8c0cm5c2cm3c6c5cm3cm4c3c1c1_signal, 
                R_cm2cm13c1cm6c12cm21c13c7cm8cm7c1c2cm3c22c16c0 => x_cm2cm13c1cm6c12cm21c13c7cm8cm7c1c2cm3c22c16c0_signal, 
                R_cm1c121c1cm3cm9c3cm4c1c37c5c7c10cm1cm21c8c6 => x_cm1c121c1cm3cm9c3cm4c1c37c5c7c10cm1cm21c8c6_signal, 
                R_cm18cm22c4cm3cm2cm2c4cm4c8cm2cm5c15c42c11cm28c6 => x_cm18cm22c4cm3cm2cm2c4cm4c8cm2cm5c15c42c11cm28c6_signal, 
                R_cm5c0cm2cm13cm29c0c55c0c12c0c14cm3c4cm8cm1c7 => x_cm5c0cm2cm13cm29c0c55c0c12c0c14cm3c4cm8cm1c7_signal, 
                R_cm1cm1c2c3cm13c22cm2cm2c21cm13c6cm10cm13c12c5c2 => x_cm1cm1c2c3cm13c22cm2cm2c21cm13c6cm10cm13c12c5c2_signal, 
                R_c1cm5c3cm10c5cm5c5cm11cm21cm6c4c127cm2cm14cm9c4 => x_c1cm5c3cm10c5cm5c5cm11cm21cm6c4c127cm2cm14cm9c4_signal, 
                R_c1cm5cm5c54cm23cm4cm13cm2cm2cm1c3c4c2cm1cm1cm12 => x_c1cm5cm5c54cm23cm4cm13cm2cm2cm1c3c4c2cm1cm1cm12_signal, 
                R_c0cm4cm12cm8cm3c13cm10cm14cm5c2cm7c3c5cm35c4cm41 => x_c0cm4cm12cm8cm3c13cm10cm14cm5c2cm7c3c5cm35c4cm41_signal, 
                R_cm3c6c4c0c4cm10c11c2c9cm28c8c6c7cm1c6c2 => x_cm3c6c4c0c4cm10c11c2c9cm28c8c6c7cm1c6c2_signal, 
                R_cm6cm11cm7c11c7cm6c0cm2cm7cm8c2cm1c7c19c8c49 => x_cm6cm11cm7c11c7cm6c0cm2cm7cm8c2cm1c7c19c8c49_signal, 
                R_cm4c2c3cm1c10cm39c2c1cm12cm2c4cm3cm20cm5c9c0 => x_cm4c2c3cm1c10cm39c2c1cm12cm2c4cm3cm20cm5c9c0_signal, 
                R_c17cm6cm12cm6c9c0c16c2c3c75c0c2c0c23cm43c5 => x_c17cm6cm12cm6c9c0c16c2c3c75c0c2c0c23cm43c5_signal, 
                R_cm3cm1c2c1cm1cm4c8cm16c5c25cm44cm22c2c1cm3c0 => x_cm3cm1c2c1cm1cm4c8cm16c5c25cm44cm22c2c1cm3c0_signal, 
                R_cm16cm7c15c1c0cm16c1c15cm9cm3c12c0c8cm29c6cm1 => x_cm16cm7c15c1c0cm16c1c15cm9cm3c12c0c8cm29c6cm1_signal, 
                R_cm5c7c4cm5c2cm3cm3c1c19c4cm3cm5cm5cm8cm2cm9 => x_cm5c7c4cm5c2cm3cm3c1c19c4cm3cm5cm5cm8cm2cm9_signal, 
                R_cm3cm3cm2c3cm23c13cm28cm6c9c3c0c1cm11c7c3c14 => x_cm3cm3cm2c3cm23c13cm28cm6c9c3c0c1cm11c7c3c14_signal, 
                R_c1c8c2c1c8cm31c1c4cm15c4c2c34c9c14c0c8 => x_c1c8c2c1c8cm31c1c4cm15c4c2c34c9c14c0c8_signal, 
                R_cm14c0c1c9c12cm18cm4c13c10c22c46c9c7cm52c3c10 => x_cm14c0c1c9c12cm18cm4c13c10c22c46c9c7cm52c3c10_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm2c5cm5c7cm29c11c2c1c5cm3cm104c3c10c13c19c9_signal;
    yo_2 <= x_c3cm10c2cm15cm7c7c26cm3cm7c2cm7cm4c8cm45cm2cm12_signal;
    yo_3 <= x_c0cm20cm4cm3cm6c7cm1cm3c7c4c5c10c4cm40c7c1_signal;
    yo_4 <= x_c6cm1cm11c1c4c79cm4c6c4cm7cm19cm72cm23c4cm33cm3_signal;
    yo_5 <= x_cm16c7c5cm3c0c2c32cm9cm4cm8cm36cm2cm20cm5cm3cm9_signal;
    yo_6 <= x_cm1c0c28cm15c40cm2c16cm9cm4c5c6c16c4c11c10c21_signal;
    yo_7 <= x_cm2c11c1cm6c56c8c4cm6cm16c12cm1cm5cm3c14c0cm6_signal;
    yo_8 <= x_c13c4c2cm10cm16cm3c17cm8c3c3c5cm2c10cm6c46cm3_signal;
    yo_9 <= x_cm5cm3c1c7cm6cm18c6cm3c2cm10c6cm19cm1c10c13cm16_signal;
    yo_10 <= x_c1cm1cm2c11c64cm1cm5c0c1c1c6cm11cm4cm7cm6c19_signal;
    yo_11 <= x_cm6c0c12c15c20c10cm1c0cm3c10cm10c1c1cm6c10c39_signal;
    yo_12 <= x_c2c0c4cm2c1cm12c4cm2cm12c5c7cm4cm4c1cm2cm11_signal;
    yo_13 <= x_cm13cm7c2c3cm5c5cm1cm3c6cm9c21cm1c4c0c1cm1_signal;
    yo_14 <= x_cm7c4c2cm3c8c0cm5c2cm3c6c5cm3cm4c3c1c1_signal;
    yo_15 <= x_cm2cm13c1cm6c12cm21c13c7cm8cm7c1c2cm3c22c16c0_signal;
    yo_16 <= x_cm1c121c1cm3cm9c3cm4c1c37c5c7c10cm1cm21c8c6_signal;
    yo_17 <= x_cm18cm22c4cm3cm2cm2c4cm4c8cm2cm5c15c42c11cm28c6_signal;
    yo_18 <= x_cm5c0cm2cm13cm29c0c55c0c12c0c14cm3c4cm8cm1c7_signal;
    yo_19 <= x_cm1cm1c2c3cm13c22cm2cm2c21cm13c6cm10cm13c12c5c2_signal;
    yo_20 <= x_c1cm5c3cm10c5cm5c5cm11cm21cm6c4c127cm2cm14cm9c4_signal;
    yo_21 <= x_c1cm5cm5c54cm23cm4cm13cm2cm2cm1c3c4c2cm1cm1cm12_signal;
    yo_22 <= x_c0cm4cm12cm8cm3c13cm10cm14cm5c2cm7c3c5cm35c4cm41_signal;
    yo_23 <= x_cm3c6c4c0c4cm10c11c2c9cm28c8c6c7cm1c6c2_signal;
    yo_24 <= x_cm6cm11cm7c11c7cm6c0cm2cm7cm8c2cm1c7c19c8c49_signal;
    yo_25 <= x_cm4c2c3cm1c10cm39c2c1cm12cm2c4cm3cm20cm5c9c0_signal;
    yo_26 <= x_c17cm6cm12cm6c9c0c16c2c3c75c0c2c0c23cm43c5_signal;
    yo_27 <= x_cm3cm1c2c1cm1cm4c8cm16c5c25cm44cm22c2c1cm3c0_signal;
    yo_28 <= x_cm16cm7c15c1c0cm16c1c15cm9cm3c12c0c8cm29c6cm1_signal;
    yo_29 <= x_cm5c7c4cm5c2cm3cm3c1c19c4cm3cm5cm5cm8cm2cm9_signal;
    yo_30 <= x_cm3cm3cm2c3cm23c13cm28cm6c9c3c0c1cm11c7c3c14_signal;
    yo_31 <= x_c1c8c2c1c8cm31c1c4cm15c4c2c34c9c14c0c8_signal;
    yo_32 <= x_cm14c0c1c9c12cm18cm4c13c10c22c46c9c7cm52c3c10_signal;



end structural;