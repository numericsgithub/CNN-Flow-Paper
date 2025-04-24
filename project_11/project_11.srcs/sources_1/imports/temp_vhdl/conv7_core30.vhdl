LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core30 is
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
        yo_3  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_7  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_8  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_9  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_10  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_16  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_19  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_20  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_21  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_22  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_24  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_26  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_28  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_29  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_30  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_32  : out std_logic_vector(15-1 downto 0) --	sfix(5, -10)
    );
end conv7_core30;

architecture structural of conv7_core30 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c16cm2cm8c3c5c11c7cm8cm8c10c10c1cm2cm6cm5c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c4cm37cm27c1c1cm1c8c11c4cm10cm38cm9cm5c8c1cm11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm4c3c2c1cm9cm21c9c6cm8cm1c4c2cm3c15c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm10cm5cm15cm12c46c13cm3cm4cm15cm3cm35c7c4cm5cm1c3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm15cm26c3cm12c27c14c15c13c9c19cm65cm5c8c23c1cm2_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm1cm3cm21cm10cm1c8c17cm1c8c1c10c8cm5c1c2c29_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm13c0c6cm12c48c20c2cm57cm4cm20cm2cm12c5c13c15c3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c21cm3c1cm28c7c58c80c1c15cm8cm8c2cm2cm6cm12c18_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm6c41c11c15c3cm29cm5cm21cm4c31c33cm23c73cm2c2cm4_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c4c1c1c16c1cm11cm4c118cm11cm3cm4c15c8c3cm20c5_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c3c17c22cm3c13cm2cm1cm18cm5c3c12cm14c1cm14c8cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm12c1c6c4c4c1c19cm12cm1c0c1cm7c1cm2c0c19_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c17c7cm4c5c0c0c6c10c3c1cm3cm2cm13c18cm5c10_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c29cm2cm8c8cm13cm2cm1c8cm1c7c5cm7cm3cm5cm9c13_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1c1cm25c6cm1cm84c47c11c5cm3c20cm9cm84cm9cm14cm1_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c4cm30cm1cm2cm7c38c4c12c13c10cm8cm5cm8cm4cm2cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm16c12c8c15c18c23c9cm42cm1c7c4cm19cm3c0cm2c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3c0cm7cm4cm25cm4c12cm1cm26c1c5c20c1c12cm4c28_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm6cm24cm10cm4cm58c31cm8c3c23cm3c8cm14c5c4cm4c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c25cm2c5cm6c1c10cm30cm3c3cm7c2cm16c2cm11cm8cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c4cm13cm2cm14c0c2c8cm12c1cm4c4cm5cm1c21c1cm15_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c27c22cm54c11c12cm28c14cm77cm8cm47cm6cm16cm9c1c1c3_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c23c15cm35c10cm34c12cm31cm3cm8c7c15cm3c20c2cm1cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm4cm10c0c1c8cm9cm31cm1c23c24c20c2cm84c7cm20c0_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c30c1cm12cm3c0cm4c53c8cm22cm5cm13c10cm24c5c0c27_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c7cm4c6cm7c4c8c36c14c10c15c7cm2cm12cm9c10c13_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm10c0cm1c15cm21c5cm13cm7cm9c2c0cm4c6c0c2c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c24cm1c1c8cm5cm69c75c5cm3c27c0cm40c12c4cm26cm2_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm3c2c14c0cm34cm6c0c8cm6cm15c1cm21c6cm1c38c25_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm4cm7c36cm4cm11c8c3cm6c40c11c7c4cm3cm16cm8cm13_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c20cm4c0cm3c21c2c11c18c16cm3cm1cm24c4c4c10c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c40c5cm15c11cm26cm45cm13c80c30cm93cm7cm17cm6c4cm2cm11_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core30_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c16cm2cm8c3c5c11c7cm8cm8c10c10c1cm2cm6cm5c0 => x_c16cm2cm8c3c5c11c7cm8cm8c10c10c1cm2cm6cm5c0_signal, 
                R_c4cm37cm27c1c1cm1c8c11c4cm10cm38cm9cm5c8c1cm11 => x_c4cm37cm27c1c1cm1c8c11c4cm10cm38cm9cm5c8c1cm11_signal, 
                R_cm4c3c2c1cm9cm21c9c6cm8cm1c4c2cm3c15c0c0 => x_cm4c3c2c1cm9cm21c9c6cm8cm1c4c2cm3c15c0c0_signal, 
                R_cm10cm5cm15cm12c46c13cm3cm4cm15cm3cm35c7c4cm5cm1c3 => x_cm10cm5cm15cm12c46c13cm3cm4cm15cm3cm35c7c4cm5cm1c3_signal, 
                R_cm15cm26c3cm12c27c14c15c13c9c19cm65cm5c8c23c1cm2 => x_cm15cm26c3cm12c27c14c15c13c9c19cm65cm5c8c23c1cm2_signal, 
                R_cm1cm3cm21cm10cm1c8c17cm1c8c1c10c8cm5c1c2c29 => x_cm1cm3cm21cm10cm1c8c17cm1c8c1c10c8cm5c1c2c29_signal, 
                R_cm13c0c6cm12c48c20c2cm57cm4cm20cm2cm12c5c13c15c3 => x_cm13c0c6cm12c48c20c2cm57cm4cm20cm2cm12c5c13c15c3_signal, 
                R_c21cm3c1cm28c7c58c80c1c15cm8cm8c2cm2cm6cm12c18 => x_c21cm3c1cm28c7c58c80c1c15cm8cm8c2cm2cm6cm12c18_signal, 
                R_cm6c41c11c15c3cm29cm5cm21cm4c31c33cm23c73cm2c2cm4 => x_cm6c41c11c15c3cm29cm5cm21cm4c31c33cm23c73cm2c2cm4_signal, 
                R_c4c1c1c16c1cm11cm4c118cm11cm3cm4c15c8c3cm20c5 => x_c4c1c1c16c1cm11cm4c118cm11cm3cm4c15c8c3cm20c5_signal, 
                R_c3c17c22cm3c13cm2cm1cm18cm5c3c12cm14c1cm14c8cm6 => x_c3c17c22cm3c13cm2cm1cm18cm5c3c12cm14c1cm14c8cm6_signal, 
                R_cm12c1c6c4c4c1c19cm12cm1c0c1cm7c1cm2c0c19 => x_cm12c1c6c4c4c1c19cm12cm1c0c1cm7c1cm2c0c19_signal, 
                R_c17c7cm4c5c0c0c6c10c3c1cm3cm2cm13c18cm5c10 => x_c17c7cm4c5c0c0c6c10c3c1cm3cm2cm13c18cm5c10_signal, 
                R_c29cm2cm8c8cm13cm2cm1c8cm1c7c5cm7cm3cm5cm9c13 => x_c29cm2cm8c8cm13cm2cm1c8cm1c7c5cm7cm3cm5cm9c13_signal, 
                R_c1c1cm25c6cm1cm84c47c11c5cm3c20cm9cm84cm9cm14cm1 => x_c1c1cm25c6cm1cm84c47c11c5cm3c20cm9cm84cm9cm14cm1_signal, 
                R_c4cm30cm1cm2cm7c38c4c12c13c10cm8cm5cm8cm4cm2cm4 => x_c4cm30cm1cm2cm7c38c4c12c13c10cm8cm5cm8cm4cm2cm4_signal, 
                R_cm16c12c8c15c18c23c9cm42cm1c7c4cm19cm3c0cm2c4 => x_cm16c12c8c15c18c23c9cm42cm1c7c4cm19cm3c0cm2c4_signal, 
                R_cm3c0cm7cm4cm25cm4c12cm1cm26c1c5c20c1c12cm4c28 => x_cm3c0cm7cm4cm25cm4c12cm1cm26c1c5c20c1c12cm4c28_signal, 
                R_cm6cm24cm10cm4cm58c31cm8c3c23cm3c8cm14c5c4cm4c1 => x_cm6cm24cm10cm4cm58c31cm8c3c23cm3c8cm14c5c4cm4c1_signal, 
                R_c25cm2c5cm6c1c10cm30cm3c3cm7c2cm16c2cm11cm8cm6 => x_c25cm2c5cm6c1c10cm30cm3c3cm7c2cm16c2cm11cm8cm6_signal, 
                R_c4cm13cm2cm14c0c2c8cm12c1cm4c4cm5cm1c21c1cm15 => x_c4cm13cm2cm14c0c2c8cm12c1cm4c4cm5cm1c21c1cm15_signal, 
                R_c27c22cm54c11c12cm28c14cm77cm8cm47cm6cm16cm9c1c1c3 => x_c27c22cm54c11c12cm28c14cm77cm8cm47cm6cm16cm9c1c1c3_signal, 
                R_c23c15cm35c10cm34c12cm31cm3cm8c7c15cm3c20c2cm1cm2 => x_c23c15cm35c10cm34c12cm31cm3cm8c7c15cm3c20c2cm1cm2_signal, 
                R_cm4cm10c0c1c8cm9cm31cm1c23c24c20c2cm84c7cm20c0 => x_cm4cm10c0c1c8cm9cm31cm1c23c24c20c2cm84c7cm20c0_signal, 
                R_c30c1cm12cm3c0cm4c53c8cm22cm5cm13c10cm24c5c0c27 => x_c30c1cm12cm3c0cm4c53c8cm22cm5cm13c10cm24c5c0c27_signal, 
                R_c7cm4c6cm7c4c8c36c14c10c15c7cm2cm12cm9c10c13 => x_c7cm4c6cm7c4c8c36c14c10c15c7cm2cm12cm9c10c13_signal, 
                R_cm10c0cm1c15cm21c5cm13cm7cm9c2c0cm4c6c0c2c0 => x_cm10c0cm1c15cm21c5cm13cm7cm9c2c0cm4c6c0c2c0_signal, 
                R_c24cm1c1c8cm5cm69c75c5cm3c27c0cm40c12c4cm26cm2 => x_c24cm1c1c8cm5cm69c75c5cm3c27c0cm40c12c4cm26cm2_signal, 
                R_cm3c2c14c0cm34cm6c0c8cm6cm15c1cm21c6cm1c38c25 => x_cm3c2c14c0cm34cm6c0c8cm6cm15c1cm21c6cm1c38c25_signal, 
                R_cm4cm7c36cm4cm11c8c3cm6c40c11c7c4cm3cm16cm8cm13 => x_cm4cm7c36cm4cm11c8c3cm6c40c11c7c4cm3cm16cm8cm13_signal, 
                R_c20cm4c0cm3c21c2c11c18c16cm3cm1cm24c4c4c10c2 => x_c20cm4c0cm3c21c2c11c18c16cm3cm1cm24c4c4c10c2_signal, 
                R_c40c5cm15c11cm26cm45cm13c80c30cm93cm7cm17cm6c4cm2cm11 => x_c40c5cm15c11cm26cm45cm13c80c30cm93cm7cm17cm6c4cm2cm11_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c16cm2cm8c3c5c11c7cm8cm8c10c10c1cm2cm6cm5c0_signal;
    yo_2 <= x_c4cm37cm27c1c1cm1c8c11c4cm10cm38cm9cm5c8c1cm11_signal;
    yo_3 <= x_cm4c3c2c1cm9cm21c9c6cm8cm1c4c2cm3c15c0c0_signal;
    yo_4 <= x_cm10cm5cm15cm12c46c13cm3cm4cm15cm3cm35c7c4cm5cm1c3_signal;
    yo_5 <= x_cm15cm26c3cm12c27c14c15c13c9c19cm65cm5c8c23c1cm2_signal;
    yo_6 <= x_cm1cm3cm21cm10cm1c8c17cm1c8c1c10c8cm5c1c2c29_signal;
    yo_7 <= x_cm13c0c6cm12c48c20c2cm57cm4cm20cm2cm12c5c13c15c3_signal;
    yo_8 <= x_c21cm3c1cm28c7c58c80c1c15cm8cm8c2cm2cm6cm12c18_signal;
    yo_9 <= x_cm6c41c11c15c3cm29cm5cm21cm4c31c33cm23c73cm2c2cm4_signal;
    yo_10 <= x_c4c1c1c16c1cm11cm4c118cm11cm3cm4c15c8c3cm20c5_signal;
    yo_11 <= x_c3c17c22cm3c13cm2cm1cm18cm5c3c12cm14c1cm14c8cm6_signal;
    yo_12 <= x_cm12c1c6c4c4c1c19cm12cm1c0c1cm7c1cm2c0c19_signal;
    yo_13 <= x_c17c7cm4c5c0c0c6c10c3c1cm3cm2cm13c18cm5c10_signal;
    yo_14 <= x_c29cm2cm8c8cm13cm2cm1c8cm1c7c5cm7cm3cm5cm9c13_signal;
    yo_15 <= x_c1c1cm25c6cm1cm84c47c11c5cm3c20cm9cm84cm9cm14cm1_signal;
    yo_16 <= x_c4cm30cm1cm2cm7c38c4c12c13c10cm8cm5cm8cm4cm2cm4_signal;
    yo_17 <= x_cm16c12c8c15c18c23c9cm42cm1c7c4cm19cm3c0cm2c4_signal;
    yo_18 <= x_cm3c0cm7cm4cm25cm4c12cm1cm26c1c5c20c1c12cm4c28_signal;
    yo_19 <= x_cm6cm24cm10cm4cm58c31cm8c3c23cm3c8cm14c5c4cm4c1_signal;
    yo_20 <= x_c25cm2c5cm6c1c10cm30cm3c3cm7c2cm16c2cm11cm8cm6_signal;
    yo_21 <= x_c4cm13cm2cm14c0c2c8cm12c1cm4c4cm5cm1c21c1cm15_signal;
    yo_22 <= x_c27c22cm54c11c12cm28c14cm77cm8cm47cm6cm16cm9c1c1c3_signal;
    yo_23 <= x_c23c15cm35c10cm34c12cm31cm3cm8c7c15cm3c20c2cm1cm2_signal;
    yo_24 <= x_cm4cm10c0c1c8cm9cm31cm1c23c24c20c2cm84c7cm20c0_signal;
    yo_25 <= x_c30c1cm12cm3c0cm4c53c8cm22cm5cm13c10cm24c5c0c27_signal;
    yo_26 <= x_c7cm4c6cm7c4c8c36c14c10c15c7cm2cm12cm9c10c13_signal;
    yo_27 <= x_cm10c0cm1c15cm21c5cm13cm7cm9c2c0cm4c6c0c2c0_signal;
    yo_28 <= x_c24cm1c1c8cm5cm69c75c5cm3c27c0cm40c12c4cm26cm2_signal;
    yo_29 <= x_cm3c2c14c0cm34cm6c0c8cm6cm15c1cm21c6cm1c38c25_signal;
    yo_30 <= x_cm4cm7c36cm4cm11c8c3cm6c40c11c7c4cm3cm16cm8cm13_signal;
    yo_31 <= x_c20cm4c0cm3c21c2c11c18c16cm3cm1cm24c4c4c10c2_signal;
    yo_32 <= x_c40c5cm15c11cm26cm45cm13c80c30cm93cm7cm17cm6c4cm2cm11_signal;



end structural;