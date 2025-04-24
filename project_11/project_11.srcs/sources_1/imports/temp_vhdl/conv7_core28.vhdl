LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core28 is
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
        yo_3  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_4  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_5  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_17  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_22  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core28;

architecture structural of conv7_core28 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm1c10c3c9cm10c4c4c1c10c2c7c1c34c6c4c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm20c0c23c4cm3c1cm25c7c15c7c25cm34c4c3c61cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6cm4c8cm4cm10c1cm1c5c4cm10cm6cm5cm10cm1cm1cm4_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c2c15c8c13cm5cm2c32c4c1c11cm14c8cm1c83c10cm6_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c4c0c0c7c25c4cm26cm23cm4c10cm28cm26c0cm8c6cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c12cm5cm3cm1c1c0c16c2c16c17c25c31cm14cm3cm7cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c12cm7c4cm23c4cm1c5cm5cm1c9cm3cm10c3cm9c2cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c3c6c23cm1cm15cm5cm35cm14c34cm17cm8c37c1cm6c4cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3c4cm8cm2cm9c25c13cm9c12cm38cm2cm45c2cm2c10cm6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm4cm5c4c3cm1c1c4c10c7cm5c6cm20c4cm3c6c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1cm7cm4c3c0c4c3c2c10c10c45c1c2cm17c5c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c6cm1c9cm5c9cm2cm15cm8c7c5cm4cm11c17c1cm9c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm3cm7c9c4c3c9cm7cm1c4c6c8c2cm3c3c18cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c10c2cm5c2c3c14c2cm5cm11c0c4cm4cm19c3c1c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm10cm5cm5c0c3cm9c7cm5c8c10c7cm4c1cm4c0c2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm30c3cm2c0c2cm13cm4cm2c9c5cm3cm7cm10cm4c20cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2c2cm2c2c6c15cm2c5c5c8cm6cm2cm2cm2cm3c1_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm1c0c15cm3cm20c1c12c6cm3cm1c4cm2c5c5cm1c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm22c8cm2cm5c10c0c6c0cm7cm3c8c16cm12c18c12cm4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm6c4c2c1cm3c25cm3cm7c9cm20c2c4c16c9c5cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm3c4c4cm3c0cm4c5c5c10c5cm4cm3cm47cm7c11cm5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c6cm5c8cm15cm13c11c10c0c2c9c1cm8cm1c4c0cm1_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm8cm7c8cm3cm19c6cm10cm3c25c10c2c8cm9c0c4c4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm6c16cm8c1c11c50c7c3c8cm20c52cm15c2c10c1cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3c0c5c1cm36cm2cm15c5cm35cm6cm4cm7cm14c11c5c6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0cm5c0c0cm5c1cm5cm1c19cm7cm6c1c4c12c2c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1cm19cm13cm2c21cm2c2c0cm8c6c10c17c4cm12cm3c11_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm9cm53c5cm1cm11c22cm9cm21c4c9cm9cm8c9cm4cm3c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c2c2c9c18cm21c5cm2cm1c1cm10c1c3c2cm7c7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm5c5cm1cm1c39c8c7c1cm6c36c34c24c8c0c14c3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6c6c2cm1c4c12cm2cm18c3cm5c1c11cm7cm6c1cm26_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1cm1c9c8c7cm38c5cm9c11cm11c1c0c6c1cm5cm8_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core28_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm1c10c3c9cm10c4c4c1c10c2c7c1c34c6c4c2 => x_cm1c10c3c9cm10c4c4c1c10c2c7c1c34c6c4c2_signal, 
                R_cm20c0c23c4cm3c1cm25c7c15c7c25cm34c4c3c61cm4 => x_cm20c0c23c4cm3c1cm25c7c15c7c25cm34c4c3c61cm4_signal, 
                R_cm6cm4c8cm4cm10c1cm1c5c4cm10cm6cm5cm10cm1cm1cm4 => x_cm6cm4c8cm4cm10c1cm1c5c4cm10cm6cm5cm10cm1cm1cm4_signal, 
                R_c2c15c8c13cm5cm2c32c4c1c11cm14c8cm1c83c10cm6 => x_c2c15c8c13cm5cm2c32c4c1c11cm14c8cm1c83c10cm6_signal, 
                R_c4c0c0c7c25c4cm26cm23cm4c10cm28cm26c0cm8c6cm3 => x_c4c0c0c7c25c4cm26cm23cm4c10cm28cm26c0cm8c6cm3_signal, 
                R_c12cm5cm3cm1c1c0c16c2c16c17c25c31cm14cm3cm7cm2 => x_c12cm5cm3cm1c1c0c16c2c16c17c25c31cm14cm3cm7cm2_signal, 
                R_c12cm7c4cm23c4cm1c5cm5cm1c9cm3cm10c3cm9c2cm1 => x_c12cm7c4cm23c4cm1c5cm5cm1c9cm3cm10c3cm9c2cm1_signal, 
                R_c3c6c23cm1cm15cm5cm35cm14c34cm17cm8c37c1cm6c4cm4 => x_c3c6c23cm1cm15cm5cm35cm14c34cm17cm8c37c1cm6c4cm4_signal, 
                R_c3c4cm8cm2cm9c25c13cm9c12cm38cm2cm45c2cm2c10cm6 => x_c3c4cm8cm2cm9c25c13cm9c12cm38cm2cm45c2cm2c10cm6_signal, 
                R_cm4cm5c4c3cm1c1c4c10c7cm5c6cm20c4cm3c6c3 => x_cm4cm5c4c3cm1c1c4c10c7cm5c6cm20c4cm3c6c3_signal, 
                R_cm1cm7cm4c3c0c4c3c2c10c10c45c1c2cm17c5c0 => x_cm1cm7cm4c3c0c4c3c2c10c10c45c1c2cm17c5c0_signal, 
                R_c6cm1c9cm5c9cm2cm15cm8c7c5cm4cm11c17c1cm9c0 => x_c6cm1c9cm5c9cm2cm15cm8c7c5cm4cm11c17c1cm9c0_signal, 
                R_cm3cm7c9c4c3c9cm7cm1c4c6c8c2cm3c3c18cm1 => x_cm3cm7c9c4c3c9cm7cm1c4c6c8c2cm3c3c18cm1_signal, 
                R_c10c2cm5c2c3c14c2cm5cm11c0c4cm4cm19c3c1c3 => x_c10c2cm5c2c3c14c2cm5cm11c0c4cm4cm19c3c1c3_signal, 
                R_cm10cm5cm5c0c3cm9c7cm5c8c10c7cm4c1cm4c0c2 => x_cm10cm5cm5c0c3cm9c7cm5c8c10c7cm4c1cm4c0c2_signal, 
                R_cm30c3cm2c0c2cm13cm4cm2c9c5cm3cm7cm10cm4c20cm2 => x_cm30c3cm2c0c2cm13cm4cm2c9c5cm3cm7cm10cm4c20cm2_signal, 
                R_c2c2cm2c2c6c15cm2c5c5c8cm6cm2cm2cm2cm3c1 => x_c2c2cm2c2c6c15cm2c5c5c8cm6cm2cm2cm2cm3c1_signal, 
                R_cm1c0c15cm3cm20c1c12c6cm3cm1c4cm2c5c5cm1c0 => x_cm1c0c15cm3cm20c1c12c6cm3cm1c4cm2c5c5cm1c0_signal, 
                R_cm22c8cm2cm5c10c0c6c0cm7cm3c8c16cm12c18c12cm4 => x_cm22c8cm2cm5c10c0c6c0cm7cm3c8c16cm12c18c12cm4_signal, 
                R_cm6c4c2c1cm3c25cm3cm7c9cm20c2c4c16c9c5cm1 => x_cm6c4c2c1cm3c25cm3cm7c9cm20c2c4c16c9c5cm1_signal, 
                R_cm3c4c4cm3c0cm4c5c5c10c5cm4cm3cm47cm7c11cm5 => x_cm3c4c4cm3c0cm4c5c5c10c5cm4cm3cm47cm7c11cm5_signal, 
                R_c6cm5c8cm15cm13c11c10c0c2c9c1cm8cm1c4c0cm1 => x_c6cm5c8cm15cm13c11c10c0c2c9c1cm8cm1c4c0cm1_signal, 
                R_cm8cm7c8cm3cm19c6cm10cm3c25c10c2c8cm9c0c4c4 => x_cm8cm7c8cm3cm19c6cm10cm3c25c10c2c8cm9c0c4c4_signal, 
                R_cm6c16cm8c1c11c50c7c3c8cm20c52cm15c2c10c1cm1 => x_cm6c16cm8c1c11c50c7c3c8cm20c52cm15c2c10c1cm1_signal, 
                R_cm3c0c5c1cm36cm2cm15c5cm35cm6cm4cm7cm14c11c5c6 => x_cm3c0c5c1cm36cm2cm15c5cm35cm6cm4cm7cm14c11c5c6_signal, 
                R_c0cm5c0c0cm5c1cm5cm1c19cm7cm6c1c4c12c2c0 => x_c0cm5c0c0cm5c1cm5cm1c19cm7cm6c1c4c12c2c0_signal, 
                R_c1cm19cm13cm2c21cm2c2c0cm8c6c10c17c4cm12cm3c11 => x_c1cm19cm13cm2c21cm2c2c0cm8c6c10c17c4cm12cm3c11_signal, 
                R_cm9cm53c5cm1cm11c22cm9cm21c4c9cm9cm8c9cm4cm3c4 => x_cm9cm53c5cm1cm11c22cm9cm21c4c9cm9cm8c9cm4cm3c4_signal, 
                R_c0c2c2c9c18cm21c5cm2cm1c1cm10c1c3c2cm7c7 => x_c0c2c2c9c18cm21c5cm2cm1c1cm10c1c3c2cm7c7_signal, 
                R_cm5c5cm1cm1c39c8c7c1cm6c36c34c24c8c0c14c3 => x_cm5c5cm1cm1c39c8c7c1cm6c36c34c24c8c0c14c3_signal, 
                R_cm6c6c2cm1c4c12cm2cm18c3cm5c1c11cm7cm6c1cm26 => x_cm6c6c2cm1c4c12cm2cm18c3cm5c1c11cm7cm6c1cm26_signal, 
                R_cm1cm1c9c8c7cm38c5cm9c11cm11c1c0c6c1cm5cm8 => x_cm1cm1c9c8c7cm38c5cm9c11cm11c1c0c6c1cm5cm8_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm1c10c3c9cm10c4c4c1c10c2c7c1c34c6c4c2_signal;
    yo_2 <= x_cm20c0c23c4cm3c1cm25c7c15c7c25cm34c4c3c61cm4_signal;
    yo_3 <= x_cm6cm4c8cm4cm10c1cm1c5c4cm10cm6cm5cm10cm1cm1cm4_signal;
    yo_4 <= x_c2c15c8c13cm5cm2c32c4c1c11cm14c8cm1c83c10cm6_signal;
    yo_5 <= x_c4c0c0c7c25c4cm26cm23cm4c10cm28cm26c0cm8c6cm3_signal;
    yo_6 <= x_c12cm5cm3cm1c1c0c16c2c16c17c25c31cm14cm3cm7cm2_signal;
    yo_7 <= x_c12cm7c4cm23c4cm1c5cm5cm1c9cm3cm10c3cm9c2cm1_signal;
    yo_8 <= x_c3c6c23cm1cm15cm5cm35cm14c34cm17cm8c37c1cm6c4cm4_signal;
    yo_9 <= x_c3c4cm8cm2cm9c25c13cm9c12cm38cm2cm45c2cm2c10cm6_signal;
    yo_10 <= x_cm4cm5c4c3cm1c1c4c10c7cm5c6cm20c4cm3c6c3_signal;
    yo_11 <= x_cm1cm7cm4c3c0c4c3c2c10c10c45c1c2cm17c5c0_signal;
    yo_12 <= x_c6cm1c9cm5c9cm2cm15cm8c7c5cm4cm11c17c1cm9c0_signal;
    yo_13 <= x_cm3cm7c9c4c3c9cm7cm1c4c6c8c2cm3c3c18cm1_signal;
    yo_14 <= x_c10c2cm5c2c3c14c2cm5cm11c0c4cm4cm19c3c1c3_signal;
    yo_15 <= x_cm10cm5cm5c0c3cm9c7cm5c8c10c7cm4c1cm4c0c2_signal;
    yo_16 <= x_cm30c3cm2c0c2cm13cm4cm2c9c5cm3cm7cm10cm4c20cm2_signal;
    yo_17 <= x_c2c2cm2c2c6c15cm2c5c5c8cm6cm2cm2cm2cm3c1_signal;
    yo_18 <= x_cm1c0c15cm3cm20c1c12c6cm3cm1c4cm2c5c5cm1c0_signal;
    yo_19 <= x_cm22c8cm2cm5c10c0c6c0cm7cm3c8c16cm12c18c12cm4_signal;
    yo_20 <= x_cm6c4c2c1cm3c25cm3cm7c9cm20c2c4c16c9c5cm1_signal;
    yo_21 <= x_cm3c4c4cm3c0cm4c5c5c10c5cm4cm3cm47cm7c11cm5_signal;
    yo_22 <= x_c6cm5c8cm15cm13c11c10c0c2c9c1cm8cm1c4c0cm1_signal;
    yo_23 <= x_cm8cm7c8cm3cm19c6cm10cm3c25c10c2c8cm9c0c4c4_signal;
    yo_24 <= x_cm6c16cm8c1c11c50c7c3c8cm20c52cm15c2c10c1cm1_signal;
    yo_25 <= x_cm3c0c5c1cm36cm2cm15c5cm35cm6cm4cm7cm14c11c5c6_signal;
    yo_26 <= x_c0cm5c0c0cm5c1cm5cm1c19cm7cm6c1c4c12c2c0_signal;
    yo_27 <= x_c1cm19cm13cm2c21cm2c2c0cm8c6c10c17c4cm12cm3c11_signal;
    yo_28 <= x_cm9cm53c5cm1cm11c22cm9cm21c4c9cm9cm8c9cm4cm3c4_signal;
    yo_29 <= x_c0c2c2c9c18cm21c5cm2cm1c1cm10c1c3c2cm7c7_signal;
    yo_30 <= x_cm5c5cm1cm1c39c8c7c1cm6c36c34c24c8c0c14c3_signal;
    yo_31 <= x_cm6c6c2cm1c4c12cm2cm18c3cm5c1c11cm7cm6c1cm26_signal;
    yo_32 <= x_cm1cm1c9c8c7cm38c5cm9c11cm11c1c0c6c1cm5cm8_signal;



end structural;