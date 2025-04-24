LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core27 is
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
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_4  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_5  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_6  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_7  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_8  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_9  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_10  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_13  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_16  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_19  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_26  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_31  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core27;

architecture structural of conv7_core27 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c10cm2c8c2cm1cm3cm11c1c6cm1cm28c3c0cm9c12cm11_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm7cm2c10cm3cm9c9cm18cm6c1c15c7cm27c13c12cm9cm15_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm37c0cm54c4cm1c4c5cm1cm3c3c0c1c7c6c17c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2c3cm18cm4cm4c0cm31cm30c10c8cm20c28c4c13c4c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1cm9cm2c0cm5c5cm7cm28cm42cm3c10c33c8c6cm65c10_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c4cm3cm3cm7c2cm1cm12cm13c0cm2c5cm8c3cm6cm3cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm1cm1c3c8c14cm11c4cm33cm15cm5c8c15c9cm12c0c15_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm4cm3c4cm8cm1cm2c7cm71c15c2c4c16c6cm11c3c4_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c7c1c5c9cm25c1cm3c6cm9c21c4cm4c9cm24cm6c20_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1c2c8cm14cm1c2c9cm2cm3cm1c10c11cm10c0c2cm5_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm1cm45c10cm4cm1c45cm21cm1c22cm22cm6c2c4cm3c6c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm7cm4cm1c6cm6cm1c16c6cm5cm2c28c2cm12cm10c6c19_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1cm7cm25c7c72cm30cm7c8cm3cm3cm6c5cm7cm8cm4c3_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c13cm5cm1c0c11c0cm2c1cm3c5c4cm8c27cm2c9c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1c6c0c12cm6c10c22c13cm6cm12cm23c5c6c0c6c9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c21cm3c3cm5cm22cm6cm1cm28cm11cm34c1c47c2cm7c1cm6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c4cm7c1c12cm15cm5c10cm25cm24cm18c1cm30cm7cm8c6c14_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6c5c1cm1c0cm2c0cm5c5cm4c18c0c12c2c9c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c7cm17cm7c44cm14c13c3cm34cm18cm1c9c7c12cm4c12c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c22cm6c0c44c25c13c1cm12cm8c34c4cm12c16c36c4cm37_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1c0c5c10c3cm45c0cm2cm1c43c4cm2cm5cm11cm17cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c1c7cm11c12c3cm17cm38cm4cm6cm19c19cm35cm1c9cm3cm5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c17c38c4cm2c8c1c47c5c16cm16c24c1c3c15c9c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2c0c4c1c5cm1cm26cm2cm46cm38cm9c0cm6cm2cm2cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1cm1c6cm2c13cm4cm2cm16cm23c0c6c25cm15cm3cm8cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1cm3c7cm3c0cm6cm3c1c10cm24cm7c6c4cm38c5c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3c28cm9cm18c6cm3cm4c4c7cm2c2cm5c20cm11cm5cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1cm1cm20c2c9c13cm4cm7cm6cm10c13c3cm8c15c14c7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6cm6c0c5c13c4c7c16c12c10c19c11c14cm5cm4c17_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1c10c10cm2c7c6cm23cm6cm1c0cm7cm6c24c1c1cm13_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm21c0c5c4c9c9c7cm9cm16c5c6c0c15cm12c7cm91_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c5c7cm4c14cm21cm1cm22c12cm54c7c19c13c0c9cm13cm15_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core27_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c10cm2c8c2cm1cm3cm11c1c6cm1cm28c3c0cm9c12cm11 => x_c10cm2c8c2cm1cm3cm11c1c6cm1cm28c3c0cm9c12cm11_signal, 
                R_cm7cm2c10cm3cm9c9cm18cm6c1c15c7cm27c13c12cm9cm15 => x_cm7cm2c10cm3cm9c9cm18cm6c1c15c7cm27c13c12cm9cm15_signal, 
                R_cm37c0cm54c4cm1c4c5cm1cm3c3c0c1c7c6c17c1 => x_cm37c0cm54c4cm1c4c5cm1cm3c3c0c1c7c6c17c1_signal, 
                R_cm2c3cm18cm4cm4c0cm31cm30c10c8cm20c28c4c13c4c1 => x_cm2c3cm18cm4cm4c0cm31cm30c10c8cm20c28c4c13c4c1_signal, 
                R_c1cm9cm2c0cm5c5cm7cm28cm42cm3c10c33c8c6cm65c10 => x_c1cm9cm2c0cm5c5cm7cm28cm42cm3c10c33c8c6cm65c10_signal, 
                R_c4cm3cm3cm7c2cm1cm12cm13c0cm2c5cm8c3cm6cm3cm2 => x_c4cm3cm3cm7c2cm1cm12cm13c0cm2c5cm8c3cm6cm3cm2_signal, 
                R_cm1cm1c3c8c14cm11c4cm33cm15cm5c8c15c9cm12c0c15 => x_cm1cm1c3c8c14cm11c4cm33cm15cm5c8c15c9cm12c0c15_signal, 
                R_cm4cm3c4cm8cm1cm2c7cm71c15c2c4c16c6cm11c3c4 => x_cm4cm3c4cm8cm1cm2c7cm71c15c2c4c16c6cm11c3c4_signal, 
                R_c7c1c5c9cm25c1cm3c6cm9c21c4cm4c9cm24cm6c20 => x_c7c1c5c9cm25c1cm3c6cm9c21c4cm4c9cm24cm6c20_signal, 
                R_cm1c2c8cm14cm1c2c9cm2cm3cm1c10c11cm10c0c2cm5 => x_cm1c2c8cm14cm1c2c9cm2cm3cm1c10c11cm10c0c2cm5_signal, 
                R_cm1cm45c10cm4cm1c45cm21cm1c22cm22cm6c2c4cm3c6c2 => x_cm1cm45c10cm4cm1c45cm21cm1c22cm22cm6c2c4cm3c6c2_signal, 
                R_cm7cm4cm1c6cm6cm1c16c6cm5cm2c28c2cm12cm10c6c19 => x_cm7cm4cm1c6cm6cm1c16c6cm5cm2c28c2cm12cm10c6c19_signal, 
                R_cm1cm7cm25c7c72cm30cm7c8cm3cm3cm6c5cm7cm8cm4c3 => x_cm1cm7cm25c7c72cm30cm7c8cm3cm3cm6c5cm7cm8cm4c3_signal, 
                R_c13cm5cm1c0c11c0cm2c1cm3c5c4cm8c27cm2c9c2 => x_c13cm5cm1c0c11c0cm2c1cm3c5c4cm8c27cm2c9c2_signal, 
                R_c1c6c0c12cm6c10c22c13cm6cm12cm23c5c6c0c6c9 => x_c1c6c0c12cm6c10c22c13cm6cm12cm23c5c6c0c6c9_signal, 
                R_c21cm3c3cm5cm22cm6cm1cm28cm11cm34c1c47c2cm7c1cm6 => x_c21cm3c3cm5cm22cm6cm1cm28cm11cm34c1c47c2cm7c1cm6_signal, 
                R_c4cm7c1c12cm15cm5c10cm25cm24cm18c1cm30cm7cm8c6c14 => x_c4cm7c1c12cm15cm5c10cm25cm24cm18c1cm30cm7cm8c6c14_signal, 
                R_c6c5c1cm1c0cm2c0cm5c5cm4c18c0c12c2c9c0 => x_c6c5c1cm1c0cm2c0cm5c5cm4c18c0c12c2c9c0_signal, 
                R_c7cm17cm7c44cm14c13c3cm34cm18cm1c9c7c12cm4c12c4 => x_c7cm17cm7c44cm14c13c3cm34cm18cm1c9c7c12cm4c12c4_signal, 
                R_c22cm6c0c44c25c13c1cm12cm8c34c4cm12c16c36c4cm37 => x_c22cm6c0c44c25c13c1cm12cm8c34c4cm12c16c36c4cm37_signal, 
                R_cm1c0c5c10c3cm45c0cm2cm1c43c4cm2cm5cm11cm17cm4 => x_cm1c0c5c10c3cm45c0cm2cm1c43c4cm2cm5cm11cm17cm4_signal, 
                R_c1c7cm11c12c3cm17cm38cm4cm6cm19c19cm35cm1c9cm3cm5 => x_c1c7cm11c12c3cm17cm38cm4cm6cm19c19cm35cm1c9cm3cm5_signal, 
                R_c17c38c4cm2c8c1c47c5c16cm16c24c1c3c15c9c2 => x_c17c38c4cm2c8c1c47c5c16cm16c24c1c3c15c9c2_signal, 
                R_cm2c0c4c1c5cm1cm26cm2cm46cm38cm9c0cm6cm2cm2cm3 => x_cm2c0c4c1c5cm1cm26cm2cm46cm38cm9c0cm6cm2cm2cm3_signal, 
                R_cm1cm1c6cm2c13cm4cm2cm16cm23c0c6c25cm15cm3cm8cm1 => x_cm1cm1c6cm2c13cm4cm2cm16cm23c0c6c25cm15cm3cm8cm1_signal, 
                R_c1cm3c7cm3c0cm6cm3c1c10cm24cm7c6c4cm38c5c2 => x_c1cm3c7cm3c0cm6cm3c1c10cm24cm7c6c4cm38c5c2_signal, 
                R_cm3c28cm9cm18c6cm3cm4c4c7cm2c2cm5c20cm11cm5cm2 => x_cm3c28cm9cm18c6cm3cm4c4c7cm2c2cm5c20cm11cm5cm2_signal, 
                R_cm1cm1cm20c2c9c13cm4cm7cm6cm10c13c3cm8c15c14c7 => x_cm1cm1cm20c2c9c13cm4cm7cm6cm10c13c3cm8c15c14c7_signal, 
                R_c6cm6c0c5c13c4c7c16c12c10c19c11c14cm5cm4c17 => x_c6cm6c0c5c13c4c7c16c12c10c19c11c14cm5cm4c17_signal, 
                R_c1c10c10cm2c7c6cm23cm6cm1c0cm7cm6c24c1c1cm13 => x_c1c10c10cm2c7c6cm23cm6cm1c0cm7cm6c24c1c1cm13_signal, 
                R_cm21c0c5c4c9c9c7cm9cm16c5c6c0c15cm12c7cm91 => x_cm21c0c5c4c9c9c7cm9cm16c5c6c0c15cm12c7cm91_signal, 
                R_c5c7cm4c14cm21cm1cm22c12cm54c7c19c13c0c9cm13cm15 => x_c5c7cm4c14cm21cm1cm22c12cm54c7c19c13c0c9cm13cm15_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c10cm2c8c2cm1cm3cm11c1c6cm1cm28c3c0cm9c12cm11_signal;
    yo_2 <= x_cm7cm2c10cm3cm9c9cm18cm6c1c15c7cm27c13c12cm9cm15_signal;
    yo_3 <= x_cm37c0cm54c4cm1c4c5cm1cm3c3c0c1c7c6c17c1_signal;
    yo_4 <= x_cm2c3cm18cm4cm4c0cm31cm30c10c8cm20c28c4c13c4c1_signal;
    yo_5 <= x_c1cm9cm2c0cm5c5cm7cm28cm42cm3c10c33c8c6cm65c10_signal;
    yo_6 <= x_c4cm3cm3cm7c2cm1cm12cm13c0cm2c5cm8c3cm6cm3cm2_signal;
    yo_7 <= x_cm1cm1c3c8c14cm11c4cm33cm15cm5c8c15c9cm12c0c15_signal;
    yo_8 <= x_cm4cm3c4cm8cm1cm2c7cm71c15c2c4c16c6cm11c3c4_signal;
    yo_9 <= x_c7c1c5c9cm25c1cm3c6cm9c21c4cm4c9cm24cm6c20_signal;
    yo_10 <= x_cm1c2c8cm14cm1c2c9cm2cm3cm1c10c11cm10c0c2cm5_signal;
    yo_11 <= x_cm1cm45c10cm4cm1c45cm21cm1c22cm22cm6c2c4cm3c6c2_signal;
    yo_12 <= x_cm7cm4cm1c6cm6cm1c16c6cm5cm2c28c2cm12cm10c6c19_signal;
    yo_13 <= x_cm1cm7cm25c7c72cm30cm7c8cm3cm3cm6c5cm7cm8cm4c3_signal;
    yo_14 <= x_c13cm5cm1c0c11c0cm2c1cm3c5c4cm8c27cm2c9c2_signal;
    yo_15 <= x_c1c6c0c12cm6c10c22c13cm6cm12cm23c5c6c0c6c9_signal;
    yo_16 <= x_c21cm3c3cm5cm22cm6cm1cm28cm11cm34c1c47c2cm7c1cm6_signal;
    yo_17 <= x_c4cm7c1c12cm15cm5c10cm25cm24cm18c1cm30cm7cm8c6c14_signal;
    yo_18 <= x_c6c5c1cm1c0cm2c0cm5c5cm4c18c0c12c2c9c0_signal;
    yo_19 <= x_c7cm17cm7c44cm14c13c3cm34cm18cm1c9c7c12cm4c12c4_signal;
    yo_20 <= x_c22cm6c0c44c25c13c1cm12cm8c34c4cm12c16c36c4cm37_signal;
    yo_21 <= x_cm1c0c5c10c3cm45c0cm2cm1c43c4cm2cm5cm11cm17cm4_signal;
    yo_22 <= x_c1c7cm11c12c3cm17cm38cm4cm6cm19c19cm35cm1c9cm3cm5_signal;
    yo_23 <= x_c17c38c4cm2c8c1c47c5c16cm16c24c1c3c15c9c2_signal;
    yo_24 <= x_cm2c0c4c1c5cm1cm26cm2cm46cm38cm9c0cm6cm2cm2cm3_signal;
    yo_25 <= x_cm1cm1c6cm2c13cm4cm2cm16cm23c0c6c25cm15cm3cm8cm1_signal;
    yo_26 <= x_c1cm3c7cm3c0cm6cm3c1c10cm24cm7c6c4cm38c5c2_signal;
    yo_27 <= x_cm3c28cm9cm18c6cm3cm4c4c7cm2c2cm5c20cm11cm5cm2_signal;
    yo_28 <= x_cm1cm1cm20c2c9c13cm4cm7cm6cm10c13c3cm8c15c14c7_signal;
    yo_29 <= x_c6cm6c0c5c13c4c7c16c12c10c19c11c14cm5cm4c17_signal;
    yo_30 <= x_c1c10c10cm2c7c6cm23cm6cm1c0cm7cm6c24c1c1cm13_signal;
    yo_31 <= x_cm21c0c5c4c9c9c7cm9cm16c5c6c0c15cm12c7cm91_signal;
    yo_32 <= x_c5c7cm4c14cm21cm1cm22c12cm54c7c19c13c0c9cm13cm15_signal;



end structural;