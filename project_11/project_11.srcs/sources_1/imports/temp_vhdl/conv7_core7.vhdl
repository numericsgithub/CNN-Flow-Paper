LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core7 is
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
        yo_2  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_3  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_9  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_16  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_18  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_22  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(15-1 downto 0) --	sfix(5, -10)
    );
end conv7_core7;

architecture structural of conv7_core7 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm32c0cm7c3cm1c1c2c3c4c5c14c7c1cm10c4c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm13c4c21c5cm2c0cm1cm4c13c13cm4cm11c4cm2cm11cm21_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm12cm8cm11c1c1cm4cm7c2c1c6cm4c4c0c8c0c3_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm6c17cm10c23c4cm1cm2cm1c12cm4cm33cm16c4c7cm10cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm9c9cm54c1c4c4c2c2c25c10cm40c13cm4cm11c1cm12_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2c3c3c20cm1c1cm2cm5cm6cm6c17cm18c3c5cm11cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm25c4c0c0c0c1c1cm3cm6cm3c4c24c17c13c10cm17_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c14cm8cm6c2cm5c6cm1cm2c8cm2cm1cm6cm13c0c1cm25_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c5c58c21cm20cm3cm2cm8c1c3cm18cm1c2c65cm8c16c43_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c23cm1cm3c8c0cm1c18c4c6c0c4c6cm2c5c21c20_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6cm12c3cm6c1c0cm6c6c10c37cm4c1c15cm1cm36cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c5cm4cm9cm12c1c0cm3cm1c0cm1c9c1cm1c0c10c12_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm7c4cm16cm3cm1c1c0c0cm8cm24c5c13c22cm11c2c11_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm4cm7cm4cm4cm1cm1c0cm1c7c16c9cm5cm12cm6cm14c8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c5c6c4cm4c2cm3cm1cm1c17cm9c19c6cm46cm3c6c14_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c8c8c4c7c1cm7c1c2c8cm8cm5c3cm1cm1cm8cm5_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm4c1c3cm20c2c8cm2cm1cm7cm31c5cm20c0cm9c0cm12_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c15cm2c26cm3cm4cm6c0c14cm35c0cm6c0c2c7c10cm10_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm18cm14c2c6cm2cm2c0c1cm12cm20c12cm6c5cm17cm6cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm10cm2c2c8cm1cm1cm7c0cm14c38c1c33c1c1cm3c3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6c14c2cm9cm1c3c3c114cm3cm14c5c0c4c27c3cm5_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c0cm6c1c8c0cm1c2cm2c1c15c0cm15c6cm19c7cm25_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c3c7c2c7cm5c2c0c11cm30cm4c0cm5cm15c2cm43cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm14c17c2cm11c5c1c0cm3cm6c32cm9cm3cm15c2cm61cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3cm9cm8cm1cm1c0c1cm1cm29c2cm6cm2c8cm3c11c11_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c8c2cm9cm2c3c2cm4c8c5cm28cm13c1cm18c5cm9c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2c3cm10cm14cm5c1cm2cm1c14c6c10c4cm5c4cm1c2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c2cm6c6cm38c4cm5c6c1cm22cm7c47c7c15cm8cm12c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c7cm10cm7c8c0c3c0cm1c27c5c5c19cm10c1c26c17_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c63cm5cm42c7cm2cm7cm1c2cm2c2c2cm8c7cm14cm12cm6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm11c16cm2cm30c1c0c0c2c9c12c12c45c1c10c11c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c9cm1c16cm25cm1cm3cm2c2cm3cm6c65c2cm11c11cm8c14_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core7_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm32c0cm7c3cm1c1c2c3c4c5c14c7c1cm10c4c1 => x_cm32c0cm7c3cm1c1c2c3c4c5c14c7c1cm10c4c1_signal, 
                R_cm13c4c21c5cm2c0cm1cm4c13c13cm4cm11c4cm2cm11cm21 => x_cm13c4c21c5cm2c0cm1cm4c13c13cm4cm11c4cm2cm11cm21_signal, 
                R_cm12cm8cm11c1c1cm4cm7c2c1c6cm4c4c0c8c0c3 => x_cm12cm8cm11c1c1cm4cm7c2c1c6cm4c4c0c8c0c3_signal, 
                R_cm6c17cm10c23c4cm1cm2cm1c12cm4cm33cm16c4c7cm10cm1 => x_cm6c17cm10c23c4cm1cm2cm1c12cm4cm33cm16c4c7cm10cm1_signal, 
                R_cm9c9cm54c1c4c4c2c2c25c10cm40c13cm4cm11c1cm12 => x_cm9c9cm54c1c4c4c2c2c25c10cm40c13cm4cm11c1cm12_signal, 
                R_c2c3c3c20cm1c1cm2cm5cm6cm6c17cm18c3c5cm11cm3 => x_c2c3c3c20cm1c1cm2cm5cm6cm6c17cm18c3c5cm11cm3_signal, 
                R_cm25c4c0c0c0c1c1cm3cm6cm3c4c24c17c13c10cm17 => x_cm25c4c0c0c0c1c1cm3cm6cm3c4c24c17c13c10cm17_signal, 
                R_c14cm8cm6c2cm5c6cm1cm2c8cm2cm1cm6cm13c0c1cm25 => x_c14cm8cm6c2cm5c6cm1cm2c8cm2cm1cm6cm13c0c1cm25_signal, 
                R_c5c58c21cm20cm3cm2cm8c1c3cm18cm1c2c65cm8c16c43 => x_c5c58c21cm20cm3cm2cm8c1c3cm18cm1c2c65cm8c16c43_signal, 
                R_c23cm1cm3c8c0cm1c18c4c6c0c4c6cm2c5c21c20 => x_c23cm1cm3c8c0cm1c18c4c6c0c4c6cm2c5c21c20_signal, 
                R_c6cm12c3cm6c1c0cm6c6c10c37cm4c1c15cm1cm36cm1 => x_c6cm12c3cm6c1c0cm6c6c10c37cm4c1c15cm1cm36cm1_signal, 
                R_c5cm4cm9cm12c1c0cm3cm1c0cm1c9c1cm1c0c10c12 => x_c5cm4cm9cm12c1c0cm3cm1c0cm1c9c1cm1c0c10c12_signal, 
                R_cm7c4cm16cm3cm1c1c0c0cm8cm24c5c13c22cm11c2c11 => x_cm7c4cm16cm3cm1c1c0c0cm8cm24c5c13c22cm11c2c11_signal, 
                R_cm4cm7cm4cm4cm1cm1c0cm1c7c16c9cm5cm12cm6cm14c8 => x_cm4cm7cm4cm4cm1cm1c0cm1c7c16c9cm5cm12cm6cm14c8_signal, 
                R_c5c6c4cm4c2cm3cm1cm1c17cm9c19c6cm46cm3c6c14 => x_c5c6c4cm4c2cm3cm1cm1c17cm9c19c6cm46cm3c6c14_signal, 
                R_c8c8c4c7c1cm7c1c2c8cm8cm5c3cm1cm1cm8cm5 => x_c8c8c4c7c1cm7c1c2c8cm8cm5c3cm1cm1cm8cm5_signal, 
                R_cm4c1c3cm20c2c8cm2cm1cm7cm31c5cm20c0cm9c0cm12 => x_cm4c1c3cm20c2c8cm2cm1cm7cm31c5cm20c0cm9c0cm12_signal, 
                R_c15cm2c26cm3cm4cm6c0c14cm35c0cm6c0c2c7c10cm10 => x_c15cm2c26cm3cm4cm6c0c14cm35c0cm6c0c2c7c10cm10_signal, 
                R_cm18cm14c2c6cm2cm2c0c1cm12cm20c12cm6c5cm17cm6cm3 => x_cm18cm14c2c6cm2cm2c0c1cm12cm20c12cm6c5cm17cm6cm3_signal, 
                R_cm10cm2c2c8cm1cm1cm7c0cm14c38c1c33c1c1cm3c3 => x_cm10cm2c2c8cm1cm1cm7c0cm14c38c1c33c1c1cm3c3_signal, 
                R_cm6c14c2cm9cm1c3c3c114cm3cm14c5c0c4c27c3cm5 => x_cm6c14c2cm9cm1c3c3c114cm3cm14c5c0c4c27c3cm5_signal, 
                R_c0cm6c1c8c0cm1c2cm2c1c15c0cm15c6cm19c7cm25 => x_c0cm6c1c8c0cm1c2cm2c1c15c0cm15c6cm19c7cm25_signal, 
                R_c3c7c2c7cm5c2c0c11cm30cm4c0cm5cm15c2cm43cm4 => x_c3c7c2c7cm5c2c0c11cm30cm4c0cm5cm15c2cm43cm4_signal, 
                R_cm14c17c2cm11c5c1c0cm3cm6c32cm9cm3cm15c2cm61cm3 => x_cm14c17c2cm11c5c1c0cm3cm6c32cm9cm3cm15c2cm61cm3_signal, 
                R_c3cm9cm8cm1cm1c0c1cm1cm29c2cm6cm2c8cm3c11c11 => x_c3cm9cm8cm1cm1c0c1cm1cm29c2cm6cm2c8cm3c11c11_signal, 
                R_c8c2cm9cm2c3c2cm4c8c5cm28cm13c1cm18c5cm9c1 => x_c8c2cm9cm2c3c2cm4c8c5cm28cm13c1cm18c5cm9c1_signal, 
                R_c2c3cm10cm14cm5c1cm2cm1c14c6c10c4cm5c4cm1c2 => x_c2c3cm10cm14cm5c1cm2cm1c14c6c10c4cm5c4cm1c2_signal, 
                R_c2cm6c6cm38c4cm5c6c1cm22cm7c47c7c15cm8cm12c0 => x_c2cm6c6cm38c4cm5c6c1cm22cm7c47c7c15cm8cm12c0_signal, 
                R_c7cm10cm7c8c0c3c0cm1c27c5c5c19cm10c1c26c17 => x_c7cm10cm7c8c0c3c0cm1c27c5c5c19cm10c1c26c17_signal, 
                R_c63cm5cm42c7cm2cm7cm1c2cm2c2c2cm8c7cm14cm12cm6 => x_c63cm5cm42c7cm2cm7cm1c2cm2c2c2cm8c7cm14cm12cm6_signal, 
                R_cm11c16cm2cm30c1c0c0c2c9c12c12c45c1c10c11c1 => x_cm11c16cm2cm30c1c0c0c2c9c12c12c45c1c10c11c1_signal, 
                R_c9cm1c16cm25cm1cm3cm2c2cm3cm6c65c2cm11c11cm8c14 => x_c9cm1c16cm25cm1cm3cm2c2cm3cm6c65c2cm11c11cm8c14_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm32c0cm7c3cm1c1c2c3c4c5c14c7c1cm10c4c1_signal;
    yo_2 <= x_cm13c4c21c5cm2c0cm1cm4c13c13cm4cm11c4cm2cm11cm21_signal;
    yo_3 <= x_cm12cm8cm11c1c1cm4cm7c2c1c6cm4c4c0c8c0c3_signal;
    yo_4 <= x_cm6c17cm10c23c4cm1cm2cm1c12cm4cm33cm16c4c7cm10cm1_signal;
    yo_5 <= x_cm9c9cm54c1c4c4c2c2c25c10cm40c13cm4cm11c1cm12_signal;
    yo_6 <= x_c2c3c3c20cm1c1cm2cm5cm6cm6c17cm18c3c5cm11cm3_signal;
    yo_7 <= x_cm25c4c0c0c0c1c1cm3cm6cm3c4c24c17c13c10cm17_signal;
    yo_8 <= x_c14cm8cm6c2cm5c6cm1cm2c8cm2cm1cm6cm13c0c1cm25_signal;
    yo_9 <= x_c5c58c21cm20cm3cm2cm8c1c3cm18cm1c2c65cm8c16c43_signal;
    yo_10 <= x_c23cm1cm3c8c0cm1c18c4c6c0c4c6cm2c5c21c20_signal;
    yo_11 <= x_c6cm12c3cm6c1c0cm6c6c10c37cm4c1c15cm1cm36cm1_signal;
    yo_12 <= x_c5cm4cm9cm12c1c0cm3cm1c0cm1c9c1cm1c0c10c12_signal;
    yo_13 <= x_cm7c4cm16cm3cm1c1c0c0cm8cm24c5c13c22cm11c2c11_signal;
    yo_14 <= x_cm4cm7cm4cm4cm1cm1c0cm1c7c16c9cm5cm12cm6cm14c8_signal;
    yo_15 <= x_c5c6c4cm4c2cm3cm1cm1c17cm9c19c6cm46cm3c6c14_signal;
    yo_16 <= x_c8c8c4c7c1cm7c1c2c8cm8cm5c3cm1cm1cm8cm5_signal;
    yo_17 <= x_cm4c1c3cm20c2c8cm2cm1cm7cm31c5cm20c0cm9c0cm12_signal;
    yo_18 <= x_c15cm2c26cm3cm4cm6c0c14cm35c0cm6c0c2c7c10cm10_signal;
    yo_19 <= x_cm18cm14c2c6cm2cm2c0c1cm12cm20c12cm6c5cm17cm6cm3_signal;
    yo_20 <= x_cm10cm2c2c8cm1cm1cm7c0cm14c38c1c33c1c1cm3c3_signal;
    yo_21 <= x_cm6c14c2cm9cm1c3c3c114cm3cm14c5c0c4c27c3cm5_signal;
    yo_22 <= x_c0cm6c1c8c0cm1c2cm2c1c15c0cm15c6cm19c7cm25_signal;
    yo_23 <= x_c3c7c2c7cm5c2c0c11cm30cm4c0cm5cm15c2cm43cm4_signal;
    yo_24 <= x_cm14c17c2cm11c5c1c0cm3cm6c32cm9cm3cm15c2cm61cm3_signal;
    yo_25 <= x_c3cm9cm8cm1cm1c0c1cm1cm29c2cm6cm2c8cm3c11c11_signal;
    yo_26 <= x_c8c2cm9cm2c3c2cm4c8c5cm28cm13c1cm18c5cm9c1_signal;
    yo_27 <= x_c2c3cm10cm14cm5c1cm2cm1c14c6c10c4cm5c4cm1c2_signal;
    yo_28 <= x_c2cm6c6cm38c4cm5c6c1cm22cm7c47c7c15cm8cm12c0_signal;
    yo_29 <= x_c7cm10cm7c8c0c3c0cm1c27c5c5c19cm10c1c26c17_signal;
    yo_30 <= x_c63cm5cm42c7cm2cm7cm1c2cm2c2c2cm8c7cm14cm12cm6_signal;
    yo_31 <= x_cm11c16cm2cm30c1c0c0c2c9c12c12c45c1c10c11c1_signal;
    yo_32 <= x_c9cm1c16cm25cm1cm3cm2c2cm3cm6c65c2cm11c11cm8c14_signal;



end structural;