LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core24 is
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
        yo_3  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_4  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_16  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_17  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_18  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_22  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_23  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_26  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_27  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_28  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_29  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_30  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(3, -10)
    );
end conv7_core24;

architecture structural of conv7_core24 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm5c4cm4c5c0c2cm1c5c6c1c36c0c7c4c0c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3c29cm5cm5c8cm12c1c44c12cm15cm15cm3c2c1cm6cm14_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3cm25cm5cm3cm1cm1cm18cm6c7cm5c2cm4cm6c1cm3c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c68c1cm3c4c116c2c7cm9cm5cm5c27cm27cm18cm6cm38cm19_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c11cm12c4c4cm12c22cm14cm24c47c6c8cm23cm54c1c5c19_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3cm1cm1cm20cm1cm14cm25cm15c10cm2c35cm6cm2cm3c0c5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm5c2c1cm1c13c15cm1cm20c0cm7cm1cm10cm5cm2cm1cm4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm4c7cm5c6c2cm3cm6cm1cm45c7cm35cm35c16cm6cm30c26_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm13c5cm6c5c8c0c4cm30cm5cm6c7c15cm3c34c0cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0cm8c9c5cm2c2c15cm2cm1c0cm7c5cm2cm10c0_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm5c4c9c24cm5cm3cm6cm16cm12c7c3cm11c27c8c0cm11_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2cm1c2cm4cm5c1c6cm5cm9cm1c7cm2cm8cm1cm1cm7_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm7c13c1c1cm8c14c1c2c20c4cm2c2cm11c24c0cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm6c1cm1c0cm17cm5cm11c12cm15c9c8cm3cm13cm2cm5c4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c3cm9c0cm7c8cm15cm13cm4c5cm37c3cm1c3cm37c0cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3c33cm3cm9cm3c0c4c9cm5c0cm3cm41cm6c5c0cm14_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6c35c2cm4c13c11c23cm4cm6cm9c5cm6cm71c6c7cm2_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm5c7cm1cm15c6cm7c2cm2c3cm4c3c1c2cm1cm3c4_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c9cm5c0c1c0cm4cm10c5cm17cm9c10cm1cm9cm2cm1cm11_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c4c4c8cm3cm5cm19cm2c2cm7c14c0c0c20cm20cm2cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2cm2cm1c57cm1c13cm3cm32c5c6c2cm9c2cm19cm3cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3cm2cm5cm13c21cm36cm18cm16cm18c8c6c5c80cm4cm11c0_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c4c9c1cm1cm1c8cm3c5c3c12c3cm8c7c6c6c9_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm2c1cm3c4cm15c11cm23c2cm11cm12cm8cm1c21c26c1c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1c2c3cm8c42c2c6c34cm40cm3c3cm3c42cm2c2c17_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3cm2cm14cm2cm44c3cm23cm4c5c27cm13c7cm6c5cm2cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c7c2c5c0c15c1cm2c0cm3c5cm1c4c12cm7cm10c9_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c6c1c8cm2c5cm13cm7cm1cm16c3c8c13c14c14cm11cm4_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm5c1c4cm2cm7c7c4cm13c44cm44cm4c0cm12cm9c2cm5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2cm16c8c1cm4cm3c5c0c9c0cm2cm2c11c7c7c3_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c5c5c2c0c2cm3c1cm9c8c15c3cm7c27c4c0cm16_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2c4cm7c0cm4c0cm6c17c3c10cm22c11c2cm10cm30c9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core24_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm5c4cm4c5c0c2cm1c5c6c1c36c0c7c4c0c0 => x_cm5c4cm4c5c0c2cm1c5c6c1c36c0c7c4c0c0_signal, 
                R_c3c29cm5cm5c8cm12c1c44c12cm15cm15cm3c2c1cm6cm14 => x_c3c29cm5cm5c8cm12c1c44c12cm15cm15cm3c2c1cm6cm14_signal, 
                R_cm3cm25cm5cm3cm1cm1cm18cm6c7cm5c2cm4cm6c1cm3c0 => x_cm3cm25cm5cm3cm1cm1cm18cm6c7cm5c2cm4cm6c1cm3c0_signal, 
                R_c68c1cm3c4c116c2c7cm9cm5cm5c27cm27cm18cm6cm38cm19 => x_c68c1cm3c4c116c2c7cm9cm5cm5c27cm27cm18cm6cm38cm19_signal, 
                R_c11cm12c4c4cm12c22cm14cm24c47c6c8cm23cm54c1c5c19 => x_c11cm12c4c4cm12c22cm14cm24c47c6c8cm23cm54c1c5c19_signal, 
                R_c3cm1cm1cm20cm1cm14cm25cm15c10cm2c35cm6cm2cm3c0c5 => x_c3cm1cm1cm20cm1cm14cm25cm15c10cm2c35cm6cm2cm3c0c5_signal, 
                R_cm5c2c1cm1c13c15cm1cm20c0cm7cm1cm10cm5cm2cm1cm4 => x_cm5c2c1cm1c13c15cm1cm20c0cm7cm1cm10cm5cm2cm1cm4_signal, 
                R_cm4c7cm5c6c2cm3cm6cm1cm45c7cm35cm35c16cm6cm30c26 => x_cm4c7cm5c6c2cm3cm6cm1cm45c7cm35cm35c16cm6cm30c26_signal, 
                R_cm13c5cm6c5c8c0c4cm30cm5cm6c7c15cm3c34c0cm3 => x_cm13c5cm6c5c8c0c4cm30cm5cm6c7c15cm3c34c0cm3_signal, 
                R_c0c0cm8c9c5cm2c2c15cm2cm1c0cm7c5cm2cm10c0 => x_c0c0cm8c9c5cm2c2c15cm2cm1c0cm7c5cm2cm10c0_signal, 
                R_cm5c4c9c24cm5cm3cm6cm16cm12c7c3cm11c27c8c0cm11 => x_cm5c4c9c24cm5cm3cm6cm16cm12c7c3cm11c27c8c0cm11_signal, 
                R_c2cm1c2cm4cm5c1c6cm5cm9cm1c7cm2cm8cm1cm1cm7 => x_c2cm1c2cm4cm5c1c6cm5cm9cm1c7cm2cm8cm1cm1cm7_signal, 
                R_cm7c13c1c1cm8c14c1c2c20c4cm2c2cm11c24c0cm2 => x_cm7c13c1c1cm8c14c1c2c20c4cm2c2cm11c24c0cm2_signal, 
                R_cm6c1cm1c0cm17cm5cm11c12cm15c9c8cm3cm13cm2cm5c4 => x_cm6c1cm1c0cm17cm5cm11c12cm15c9c8cm3cm13cm2cm5c4_signal, 
                R_c3cm9c0cm7c8cm15cm13cm4c5cm37c3cm1c3cm37c0cm2 => x_c3cm9c0cm7c8cm15cm13cm4c5cm37c3cm1c3cm37c0cm2_signal, 
                R_c3c33cm3cm9cm3c0c4c9cm5c0cm3cm41cm6c5c0cm14 => x_c3c33cm3cm9cm3c0c4c9cm5c0cm3cm41cm6c5c0cm14_signal, 
                R_cm6c35c2cm4c13c11c23cm4cm6cm9c5cm6cm71c6c7cm2 => x_cm6c35c2cm4c13c11c23cm4cm6cm9c5cm6cm71c6c7cm2_signal, 
                R_cm5c7cm1cm15c6cm7c2cm2c3cm4c3c1c2cm1cm3c4 => x_cm5c7cm1cm15c6cm7c2cm2c3cm4c3c1c2cm1cm3c4_signal, 
                R_c9cm5c0c1c0cm4cm10c5cm17cm9c10cm1cm9cm2cm1cm11 => x_c9cm5c0c1c0cm4cm10c5cm17cm9c10cm1cm9cm2cm1cm11_signal, 
                R_c4c4c8cm3cm5cm19cm2c2cm7c14c0c0c20cm20cm2cm2 => x_c4c4c8cm3cm5cm19cm2c2cm7c14c0c0c20cm20cm2cm2_signal, 
                R_c2cm2cm1c57cm1c13cm3cm32c5c6c2cm9c2cm19cm3cm3 => x_c2cm2cm1c57cm1c13cm3cm32c5c6c2cm9c2cm19cm3cm3_signal, 
                R_c3cm2cm5cm13c21cm36cm18cm16cm18c8c6c5c80cm4cm11c0 => x_c3cm2cm5cm13c21cm36cm18cm16cm18c8c6c5c80cm4cm11c0_signal, 
                R_c4c9c1cm1cm1c8cm3c5c3c12c3cm8c7c6c6c9 => x_c4c9c1cm1cm1c8cm3c5c3c12c3cm8c7c6c6c9_signal, 
                R_cm2c1cm3c4cm15c11cm23c2cm11cm12cm8cm1c21c26c1c0 => x_cm2c1cm3c4cm15c11cm23c2cm11cm12cm8cm1c21c26c1c0_signal, 
                R_cm1c2c3cm8c42c2c6c34cm40cm3c3cm3c42cm2c2c17 => x_cm1c2c3cm8c42c2c6c34cm40cm3c3cm3c42cm2c2c17_signal, 
                R_cm3cm2cm14cm2cm44c3cm23cm4c5c27cm13c7cm6c5cm2cm3 => x_cm3cm2cm14cm2cm44c3cm23cm4c5c27cm13c7cm6c5cm2cm3_signal, 
                R_c7c2c5c0c15c1cm2c0cm3c5cm1c4c12cm7cm10c9 => x_c7c2c5c0c15c1cm2c0cm3c5cm1c4c12cm7cm10c9_signal, 
                R_c6c1c8cm2c5cm13cm7cm1cm16c3c8c13c14c14cm11cm4 => x_c6c1c8cm2c5cm13cm7cm1cm16c3c8c13c14c14cm11cm4_signal, 
                R_cm5c1c4cm2cm7c7c4cm13c44cm44cm4c0cm12cm9c2cm5 => x_cm5c1c4cm2cm7c7c4cm13c44cm44cm4c0cm12cm9c2cm5_signal, 
                R_c2cm16c8c1cm4cm3c5c0c9c0cm2cm2c11c7c7c3 => x_c2cm16c8c1cm4cm3c5c0c9c0cm2cm2c11c7c7c3_signal, 
                R_c5c5c2c0c2cm3c1cm9c8c15c3cm7c27c4c0cm16 => x_c5c5c2c0c2cm3c1cm9c8c15c3cm7c27c4c0cm16_signal, 
                R_c2c4cm7c0cm4c0cm6c17c3c10cm22c11c2cm10cm30c9 => x_c2c4cm7c0cm4c0cm6c17c3c10cm22c11c2cm10cm30c9_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm5c4cm4c5c0c2cm1c5c6c1c36c0c7c4c0c0_signal;
    yo_2 <= x_c3c29cm5cm5c8cm12c1c44c12cm15cm15cm3c2c1cm6cm14_signal;
    yo_3 <= x_cm3cm25cm5cm3cm1cm1cm18cm6c7cm5c2cm4cm6c1cm3c0_signal;
    yo_4 <= x_c68c1cm3c4c116c2c7cm9cm5cm5c27cm27cm18cm6cm38cm19_signal;
    yo_5 <= x_c11cm12c4c4cm12c22cm14cm24c47c6c8cm23cm54c1c5c19_signal;
    yo_6 <= x_c3cm1cm1cm20cm1cm14cm25cm15c10cm2c35cm6cm2cm3c0c5_signal;
    yo_7 <= x_cm5c2c1cm1c13c15cm1cm20c0cm7cm1cm10cm5cm2cm1cm4_signal;
    yo_8 <= x_cm4c7cm5c6c2cm3cm6cm1cm45c7cm35cm35c16cm6cm30c26_signal;
    yo_9 <= x_cm13c5cm6c5c8c0c4cm30cm5cm6c7c15cm3c34c0cm3_signal;
    yo_10 <= x_c0c0cm8c9c5cm2c2c15cm2cm1c0cm7c5cm2cm10c0_signal;
    yo_11 <= x_cm5c4c9c24cm5cm3cm6cm16cm12c7c3cm11c27c8c0cm11_signal;
    yo_12 <= x_c2cm1c2cm4cm5c1c6cm5cm9cm1c7cm2cm8cm1cm1cm7_signal;
    yo_13 <= x_cm7c13c1c1cm8c14c1c2c20c4cm2c2cm11c24c0cm2_signal;
    yo_14 <= x_cm6c1cm1c0cm17cm5cm11c12cm15c9c8cm3cm13cm2cm5c4_signal;
    yo_15 <= x_c3cm9c0cm7c8cm15cm13cm4c5cm37c3cm1c3cm37c0cm2_signal;
    yo_16 <= x_c3c33cm3cm9cm3c0c4c9cm5c0cm3cm41cm6c5c0cm14_signal;
    yo_17 <= x_cm6c35c2cm4c13c11c23cm4cm6cm9c5cm6cm71c6c7cm2_signal;
    yo_18 <= x_cm5c7cm1cm15c6cm7c2cm2c3cm4c3c1c2cm1cm3c4_signal;
    yo_19 <= x_c9cm5c0c1c0cm4cm10c5cm17cm9c10cm1cm9cm2cm1cm11_signal;
    yo_20 <= x_c4c4c8cm3cm5cm19cm2c2cm7c14c0c0c20cm20cm2cm2_signal;
    yo_21 <= x_c2cm2cm1c57cm1c13cm3cm32c5c6c2cm9c2cm19cm3cm3_signal;
    yo_22 <= x_c3cm2cm5cm13c21cm36cm18cm16cm18c8c6c5c80cm4cm11c0_signal;
    yo_23 <= x_c4c9c1cm1cm1c8cm3c5c3c12c3cm8c7c6c6c9_signal;
    yo_24 <= x_cm2c1cm3c4cm15c11cm23c2cm11cm12cm8cm1c21c26c1c0_signal;
    yo_25 <= x_cm1c2c3cm8c42c2c6c34cm40cm3c3cm3c42cm2c2c17_signal;
    yo_26 <= x_cm3cm2cm14cm2cm44c3cm23cm4c5c27cm13c7cm6c5cm2cm3_signal;
    yo_27 <= x_c7c2c5c0c15c1cm2c0cm3c5cm1c4c12cm7cm10c9_signal;
    yo_28 <= x_c6c1c8cm2c5cm13cm7cm1cm16c3c8c13c14c14cm11cm4_signal;
    yo_29 <= x_cm5c1c4cm2cm7c7c4cm13c44cm44cm4c0cm12cm9c2cm5_signal;
    yo_30 <= x_c2cm16c8c1cm4cm3c5c0c9c0cm2cm2c11c7c7c3_signal;
    yo_31 <= x_c5c5c2c0c2cm3c1cm9c8c15c3cm7c27c4c0cm16_signal;
    yo_32 <= x_c2c4cm7c0cm4c0cm6c17c3c10cm22c11c2cm10cm30c9_signal;



end structural;