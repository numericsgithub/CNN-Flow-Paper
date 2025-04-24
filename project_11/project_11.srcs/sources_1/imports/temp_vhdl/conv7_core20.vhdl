LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core20 is
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
    
        yo_1  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_2  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_4  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_13  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_14  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_18  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_19  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_22  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_26  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_27  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core20;

architecture structural of conv7_core20 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm11c8cm64c3c13c22cm7c19cm6c0c15c3c2c0cm2c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c7cm5cm8cm3c1c9c5cm24c6c11c11c24c2c4cm1c42_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c7cm14cm6c3cm4cm60c5c1cm2c4cm5c2c1c8c5c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm13c4cm15c30cm12cm3cm4cm2cm35c8c22c10c81c6c14c4_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c22cm6cm27cm12c3cm24cm13cm6c37cm13cm8cm13cm3cm21cm4cm11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c4c6cm45c9cm3c23c8c35c1cm3c7cm11cm1cm9cm10cm8_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c4c3cm1cm4c6c26c0cm24c8cm8c5c7c11cm5c0cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c21cm15c48cm1cm9cm5c30cm6cm40c4cm12c3cm1cm4c2c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3c15c9cm14cm3cm12cm6cm12cm1c26c3c21c37c4c16cm24_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6cm4cm11cm2c3cm10c7c16c0c1c6c0cm1c0cm7c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm80c11c8cm20cm19cm5cm9c50cm32cm40c0cm3cm13cm2cm2cm9_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm6c2cm2cm8cm2c0cm3cm16cm10cm3c10c2cm4c1c4c0_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm2cm56cm4c0cm5c21c5c2cm14cm4cm6c4cm1cm4c5c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c11c0c2c1cm14c2c3c3cm13cm5cm4c9cm3cm4cm7c6_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c1c55c7cm5cm5cm37cm6c0cm16c6cm3c4c8cm9cm2c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2cm9c2cm7cm5cm15c6c5cm6cm8cm2cm28c6cm5c7c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c41c28cm9cm6c32c12cm29c11c27c5c7cm13c4cm1c8cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c7cm3c6c9c14cm1c6cm3c1c4c7cm7c2cm4c3c0_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c7c20c7c6cm45c4c4cm2c9c8cm15cm1c3c5cm7cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c18c6cm9cm29cm6cm26cm21c5cm33cm18c3cm16cm4cm5c7c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c1cm4c1c4cm1cm6cm4cm5c0cm5cm1cm2c0c0cm5c68_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm14cm12cm17cm14c12cm7cm9cm53cm20cm25c68cm13c8cm7cm2cm7_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c9cm7c6c4c11c4cm12cm18c24cm7c14c4c2c3cm8cm26_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c13c51c7c14cm6cm20c6c38cm26cm4cm11cm8c2c2cm23cm8_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c5cm5cm2c13cm21cm3c11c2cm4c0c1c9c34cm2c2c15_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm10cm57cm1cm2cm24cm4cm20cm5cm3c13c10cm12cm26cm1cm35c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm13cm7cm2cm2cm7c5cm5c0cm6cm5c1cm12c9cm1c2c0_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c22cm39c3cm32c1cm50cm13cm1c26cm23cm16c7cm3cm8c1cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm23c24cm6c2cm12c6cm4cm9cm10cm7c18c2c1cm7c6cm9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c36c2c4c8cm2c16cm15c23c8cm1c1cm5cm1c5c6cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm28c2cm1cm7cm4c6cm1cm8cm8c3c1cm3c3cm4c1cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c13cm36c16cm31cm30cm19cm7c27cm12cm4c8cm7c7c1c1c5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core20_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm11c8cm64c3c13c22cm7c19cm6c0c15c3c2c0cm2c2 => x_cm11c8cm64c3c13c22cm7c19cm6c0c15c3c2c0cm2c2_signal, 
                R_c7cm5cm8cm3c1c9c5cm24c6c11c11c24c2c4cm1c42 => x_c7cm5cm8cm3c1c9c5cm24c6c11c11c24c2c4cm1c42_signal, 
                R_c7cm14cm6c3cm4cm60c5c1cm2c4cm5c2c1c8c5c2 => x_c7cm14cm6c3cm4cm60c5c1cm2c4cm5c2c1c8c5c2_signal, 
                R_cm13c4cm15c30cm12cm3cm4cm2cm35c8c22c10c81c6c14c4 => x_cm13c4cm15c30cm12cm3cm4cm2cm35c8c22c10c81c6c14c4_signal, 
                R_c22cm6cm27cm12c3cm24cm13cm6c37cm13cm8cm13cm3cm21cm4cm11 => x_c22cm6cm27cm12c3cm24cm13cm6c37cm13cm8cm13cm3cm21cm4cm11_signal, 
                R_c4c6cm45c9cm3c23c8c35c1cm3c7cm11cm1cm9cm10cm8 => x_c4c6cm45c9cm3c23c8c35c1cm3c7cm11cm1cm9cm10cm8_signal, 
                R_c4c3cm1cm4c6c26c0cm24c8cm8c5c7c11cm5c0cm1 => x_c4c3cm1cm4c6c26c0cm24c8cm8c5c7c11cm5c0cm1_signal, 
                R_c21cm15c48cm1cm9cm5c30cm6cm40c4cm12c3cm1cm4c2c0 => x_c21cm15c48cm1cm9cm5c30cm6cm40c4cm12c3cm1cm4c2c0_signal, 
                R_cm3c15c9cm14cm3cm12cm6cm12cm1c26c3c21c37c4c16cm24 => x_cm3c15c9cm14cm3cm12cm6cm12cm1c26c3c21c37c4c16cm24_signal, 
                R_cm6cm4cm11cm2c3cm10c7c16c0c1c6c0cm1c0cm7c3 => x_cm6cm4cm11cm2c3cm10c7c16c0c1c6c0cm1c0cm7c3_signal, 
                R_cm80c11c8cm20cm19cm5cm9c50cm32cm40c0cm3cm13cm2cm2cm9 => x_cm80c11c8cm20cm19cm5cm9c50cm32cm40c0cm3cm13cm2cm2cm9_signal, 
                R_cm6c2cm2cm8cm2c0cm3cm16cm10cm3c10c2cm4c1c4c0 => x_cm6c2cm2cm8cm2c0cm3cm16cm10cm3c10c2cm4c1c4c0_signal, 
                R_cm2cm56cm4c0cm5c21c5c2cm14cm4cm6c4cm1cm4c5c0 => x_cm2cm56cm4c0cm5c21c5c2cm14cm4cm6c4cm1cm4c5c0_signal, 
                R_c11c0c2c1cm14c2c3c3cm13cm5cm4c9cm3cm4cm7c6 => x_c11c0c2c1cm14c2c3c3cm13cm5cm4c9cm3cm4cm7c6_signal, 
                R_c1c55c7cm5cm5cm37cm6c0cm16c6cm3c4c8cm9cm2c0 => x_c1c55c7cm5cm5cm37cm6c0cm16c6cm3c4c8cm9cm2c0_signal, 
                R_c2cm9c2cm7cm5cm15c6c5cm6cm8cm2cm28c6cm5c7c0 => x_c2cm9c2cm7cm5cm15c6c5cm6cm8cm2cm28c6cm5c7c0_signal, 
                R_c41c28cm9cm6c32c12cm29c11c27c5c7cm13c4cm1c8cm1 => x_c41c28cm9cm6c32c12cm29c11c27c5c7cm13c4cm1c8cm1_signal, 
                R_c7cm3c6c9c14cm1c6cm3c1c4c7cm7c2cm4c3c0 => x_c7cm3c6c9c14cm1c6cm3c1c4c7cm7c2cm4c3c0_signal, 
                R_c7c20c7c6cm45c4c4cm2c9c8cm15cm1c3c5cm7cm3 => x_c7c20c7c6cm45c4c4cm2c9c8cm15cm1c3c5cm7cm3_signal, 
                R_c18c6cm9cm29cm6cm26cm21c5cm33cm18c3cm16cm4cm5c7c0 => x_c18c6cm9cm29cm6cm26cm21c5cm33cm18c3cm16cm4cm5c7c0_signal, 
                R_c1cm4c1c4cm1cm6cm4cm5c0cm5cm1cm2c0c0cm5c68 => x_c1cm4c1c4cm1cm6cm4cm5c0cm5cm1cm2c0c0cm5c68_signal, 
                R_cm14cm12cm17cm14c12cm7cm9cm53cm20cm25c68cm13c8cm7cm2cm7 => x_cm14cm12cm17cm14c12cm7cm9cm53cm20cm25c68cm13c8cm7cm2cm7_signal, 
                R_c9cm7c6c4c11c4cm12cm18c24cm7c14c4c2c3cm8cm26 => x_c9cm7c6c4c11c4cm12cm18c24cm7c14c4c2c3cm8cm26_signal, 
                R_c13c51c7c14cm6cm20c6c38cm26cm4cm11cm8c2c2cm23cm8 => x_c13c51c7c14cm6cm20c6c38cm26cm4cm11cm8c2c2cm23cm8_signal, 
                R_c5cm5cm2c13cm21cm3c11c2cm4c0c1c9c34cm2c2c15 => x_c5cm5cm2c13cm21cm3c11c2cm4c0c1c9c34cm2c2c15_signal, 
                R_cm10cm57cm1cm2cm24cm4cm20cm5cm3c13c10cm12cm26cm1cm35c0 => x_cm10cm57cm1cm2cm24cm4cm20cm5cm3c13c10cm12cm26cm1cm35c0_signal, 
                R_cm13cm7cm2cm2cm7c5cm5c0cm6cm5c1cm12c9cm1c2c0 => x_cm13cm7cm2cm2cm7c5cm5c0cm6cm5c1cm12c9cm1c2c0_signal, 
                R_c22cm39c3cm32c1cm50cm13cm1c26cm23cm16c7cm3cm8c1cm3 => x_c22cm39c3cm32c1cm50cm13cm1c26cm23cm16c7cm3cm8c1cm3_signal, 
                R_cm23c24cm6c2cm12c6cm4cm9cm10cm7c18c2c1cm7c6cm9 => x_cm23c24cm6c2cm12c6cm4cm9cm10cm7c18c2c1cm7c6cm9_signal, 
                R_c36c2c4c8cm2c16cm15c23c8cm1c1cm5cm1c5c6cm4 => x_c36c2c4c8cm2c16cm15c23c8cm1c1cm5cm1c5c6cm4_signal, 
                R_cm28c2cm1cm7cm4c6cm1cm8cm8c3c1cm3c3cm4c1cm2 => x_cm28c2cm1cm7cm4c6cm1cm8cm8c3c1cm3c3cm4c1cm2_signal, 
                R_c13cm36c16cm31cm30cm19cm7c27cm12cm4c8cm7c7c1c1c5 => x_c13cm36c16cm31cm30cm19cm7c27cm12cm4c8cm7c7c1c1c5_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm11c8cm64c3c13c22cm7c19cm6c0c15c3c2c0cm2c2_signal;
    yo_2 <= x_c7cm5cm8cm3c1c9c5cm24c6c11c11c24c2c4cm1c42_signal;
    yo_3 <= x_c7cm14cm6c3cm4cm60c5c1cm2c4cm5c2c1c8c5c2_signal;
    yo_4 <= x_cm13c4cm15c30cm12cm3cm4cm2cm35c8c22c10c81c6c14c4_signal;
    yo_5 <= x_c22cm6cm27cm12c3cm24cm13cm6c37cm13cm8cm13cm3cm21cm4cm11_signal;
    yo_6 <= x_c4c6cm45c9cm3c23c8c35c1cm3c7cm11cm1cm9cm10cm8_signal;
    yo_7 <= x_c4c3cm1cm4c6c26c0cm24c8cm8c5c7c11cm5c0cm1_signal;
    yo_8 <= x_c21cm15c48cm1cm9cm5c30cm6cm40c4cm12c3cm1cm4c2c0_signal;
    yo_9 <= x_cm3c15c9cm14cm3cm12cm6cm12cm1c26c3c21c37c4c16cm24_signal;
    yo_10 <= x_cm6cm4cm11cm2c3cm10c7c16c0c1c6c0cm1c0cm7c3_signal;
    yo_11 <= x_cm80c11c8cm20cm19cm5cm9c50cm32cm40c0cm3cm13cm2cm2cm9_signal;
    yo_12 <= x_cm6c2cm2cm8cm2c0cm3cm16cm10cm3c10c2cm4c1c4c0_signal;
    yo_13 <= x_cm2cm56cm4c0cm5c21c5c2cm14cm4cm6c4cm1cm4c5c0_signal;
    yo_14 <= x_c11c0c2c1cm14c2c3c3cm13cm5cm4c9cm3cm4cm7c6_signal;
    yo_15 <= x_c1c55c7cm5cm5cm37cm6c0cm16c6cm3c4c8cm9cm2c0_signal;
    yo_16 <= x_c2cm9c2cm7cm5cm15c6c5cm6cm8cm2cm28c6cm5c7c0_signal;
    yo_17 <= x_c41c28cm9cm6c32c12cm29c11c27c5c7cm13c4cm1c8cm1_signal;
    yo_18 <= x_c7cm3c6c9c14cm1c6cm3c1c4c7cm7c2cm4c3c0_signal;
    yo_19 <= x_c7c20c7c6cm45c4c4cm2c9c8cm15cm1c3c5cm7cm3_signal;
    yo_20 <= x_c18c6cm9cm29cm6cm26cm21c5cm33cm18c3cm16cm4cm5c7c0_signal;
    yo_21 <= x_c1cm4c1c4cm1cm6cm4cm5c0cm5cm1cm2c0c0cm5c68_signal;
    yo_22 <= x_cm14cm12cm17cm14c12cm7cm9cm53cm20cm25c68cm13c8cm7cm2cm7_signal;
    yo_23 <= x_c9cm7c6c4c11c4cm12cm18c24cm7c14c4c2c3cm8cm26_signal;
    yo_24 <= x_c13c51c7c14cm6cm20c6c38cm26cm4cm11cm8c2c2cm23cm8_signal;
    yo_25 <= x_c5cm5cm2c13cm21cm3c11c2cm4c0c1c9c34cm2c2c15_signal;
    yo_26 <= x_cm10cm57cm1cm2cm24cm4cm20cm5cm3c13c10cm12cm26cm1cm35c0_signal;
    yo_27 <= x_cm13cm7cm2cm2cm7c5cm5c0cm6cm5c1cm12c9cm1c2c0_signal;
    yo_28 <= x_c22cm39c3cm32c1cm50cm13cm1c26cm23cm16c7cm3cm8c1cm3_signal;
    yo_29 <= x_cm23c24cm6c2cm12c6cm4cm9cm10cm7c18c2c1cm7c6cm9_signal;
    yo_30 <= x_c36c2c4c8cm2c16cm15c23c8cm1c1cm5cm1c5c6cm4_signal;
    yo_31 <= x_cm28c2cm1cm7cm4c6cm1cm8cm8c3c1cm3c3cm4c1cm2_signal;
    yo_32 <= x_c13cm36c16cm31cm30cm19cm7c27cm12cm4c8cm7c7c1c1c5_signal;



end structural;