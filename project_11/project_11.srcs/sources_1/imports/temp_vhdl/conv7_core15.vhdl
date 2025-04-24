LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core15 is
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
        yo_3  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_4  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_5  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_6  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_13  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_14  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_15  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_16  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_18  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_19  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_26  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_29  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_30  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core15;

architecture structural of conv7_core15 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c25cm12c6cm7c5c6cm25c3c4c5c6c6c10cm2cm2cm11_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm27c1cm21cm3c7c20c1c6cm1cm4cm2cm48c6c21cm5c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm9c4cm10c5c11cm8cm4cm5cm1cm4cm5cm4c4cm8cm1c2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm5cm30cm1c9cm8c2c19c18cm24c5c7cm9cm9c0c6c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm12cm7c8cm5cm6cm24c1cm10cm7c1c2c16c0cm17c13cm9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c7cm5cm9cm4c12cm2cm5c4c0cm8c7cm13cm3cm8c1cm9_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c20cm6c0cm4c11cm11c0cm9cm6cm1c3cm13cm20cm11c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm8cm15cm11cm3cm1cm19c9c23cm2cm3cm4cm14c16cm11c30c8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0cm6cm2cm9c2cm58c28cm25c21c8c6cm23cm3c29c8c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c19c6cm1cm22cm12cm2cm12c17cm3cm1cm10c9c3c1cm10c30_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6cm12c8c2cm9c9c11cm10c2c4c6cm8cm19c0c10c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c5c28c0c10c1c2c17cm5cm3cm2cm1c2cm1c2cm3c17_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm2cm2c3cm5cm9cm10cm6cm2c13cm12c3c4c12c8c9c5_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c1cm10cm6c3cm10cm2c1c1cm7c11c12cm7cm11cm4c7cm4_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c8c5cm1c2c11c9c10c1c3cm3c8cm5cm6cm13cm3c3_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c62cm3c31cm4c12c2cm3c15c5c127c7c9c6c9c2c4_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm2cm6cm1cm8c16c21c0cm25cm11cm20c12cm4c6c18c9c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm8c6c26c1cm35cm3c9c16cm5cm5c3cm2cm4c3cm5c13_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c5c12c2cm7cm57cm17cm6c12cm5c10c11c1c9cm11cm2c5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2c1cm5cm20c15cm15c1cm14cm3c42c7cm4cm2cm20cm8cm11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c83cm5c14cm2c2c5c4cm10cm1c56cm7c28cm1c4cm2c4_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm1c10c3c5c17c30cm13cm35cm6c8cm12cm11cm10c8c5cm6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2cm2c4c1c7cm12cm45cm1cm13c9c3cm10c5c1c5c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0cm4c0c3cm6cm51c8c10cm25cm12cm18cm3cm1cm9c7cm7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3c34cm9cm2c17cm4cm9cm19cm26cm1c3cm5c3cm1c8c18_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c6c4c9c2cm2cm38c4cm2c25c5cm30cm8cm1cm6c3cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c22cm14cm27c7cm8cm2c12cm6c3c4c1c13c13c8c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c3c13cm13c3c13c22c2c17cm33cm3c12cm5cm18c3c9cm8_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2cm2cm15cm2cm2c4c3cm6c7c1c5c2cm5cm3c1c11_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c4c1c0cm2cm33c26c4c2c2c7c2cm9cm22c15c17cm21_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm16c8cm3cm22cm36c11cm1c2c2c6c5c5cm10c1c3c14_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c13c9cm18cm19cm53c25c13cm5cm18cm8cm4c1cm7cm3cm12c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core15_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c25cm12c6cm7c5c6cm25c3c4c5c6c6c10cm2cm2cm11 => x_c25cm12c6cm7c5c6cm25c3c4c5c6c6c10cm2cm2cm11_signal, 
                R_cm27c1cm21cm3c7c20c1c6cm1cm4cm2cm48c6c21cm5c4 => x_cm27c1cm21cm3c7c20c1c6cm1cm4cm2cm48c6c21cm5c4_signal, 
                R_cm9c4cm10c5c11cm8cm4cm5cm1cm4cm5cm4c4cm8cm1c2 => x_cm9c4cm10c5c11cm8cm4cm5cm1cm4cm5cm4c4cm8cm1c2_signal, 
                R_cm5cm30cm1c9cm8c2c19c18cm24c5c7cm9cm9c0c6c0 => x_cm5cm30cm1c9cm8c2c19c18cm24c5c7cm9cm9c0c6c0_signal, 
                R_cm12cm7c8cm5cm6cm24c1cm10cm7c1c2c16c0cm17c13cm9 => x_cm12cm7c8cm5cm6cm24c1cm10cm7c1c2c16c0cm17c13cm9_signal, 
                R_c7cm5cm9cm4c12cm2cm5c4c0cm8c7cm13cm3cm8c1cm9 => x_c7cm5cm9cm4c12cm2cm5c4c0cm8c7cm13cm3cm8c1cm9_signal, 
                R_c20cm6c0cm4c11cm11c0cm9cm6cm1c3cm13cm20cm11c0c0 => x_c20cm6c0cm4c11cm11c0cm9cm6cm1c3cm13cm20cm11c0c0_signal, 
                R_cm8cm15cm11cm3cm1cm19c9c23cm2cm3cm4cm14c16cm11c30c8 => x_cm8cm15cm11cm3cm1cm19c9c23cm2cm3cm4cm14c16cm11c30c8_signal, 
                R_c0cm6cm2cm9c2cm58c28cm25c21c8c6cm23cm3c29c8c4 => x_c0cm6cm2cm9c2cm58c28cm25c21c8c6cm23cm3c29c8c4_signal, 
                R_c19c6cm1cm22cm12cm2cm12c17cm3cm1cm10c9c3c1cm10c30 => x_c19c6cm1cm22cm12cm2cm12c17cm3cm1cm10c9c3c1cm10c30_signal, 
                R_c6cm12c8c2cm9c9c11cm10c2c4c6cm8cm19c0c10c0 => x_c6cm12c8c2cm9c9c11cm10c2c4c6cm8cm19c0c10c0_signal, 
                R_c5c28c0c10c1c2c17cm5cm3cm2cm1c2cm1c2cm3c17 => x_c5c28c0c10c1c2c17cm5cm3cm2cm1c2cm1c2cm3c17_signal, 
                R_cm2cm2c3cm5cm9cm10cm6cm2c13cm12c3c4c12c8c9c5 => x_cm2cm2c3cm5cm9cm10cm6cm2c13cm12c3c4c12c8c9c5_signal, 
                R_c1cm10cm6c3cm10cm2c1c1cm7c11c12cm7cm11cm4c7cm4 => x_c1cm10cm6c3cm10cm2c1c1cm7c11c12cm7cm11cm4c7cm4_signal, 
                R_c8c5cm1c2c11c9c10c1c3cm3c8cm5cm6cm13cm3c3 => x_c8c5cm1c2c11c9c10c1c3cm3c8cm5cm6cm13cm3c3_signal, 
                R_c62cm3c31cm4c12c2cm3c15c5c127c7c9c6c9c2c4 => x_c62cm3c31cm4c12c2cm3c15c5c127c7c9c6c9c2c4_signal, 
                R_cm2cm6cm1cm8c16c21c0cm25cm11cm20c12cm4c6c18c9c0 => x_cm2cm6cm1cm8c16c21c0cm25cm11cm20c12cm4c6c18c9c0_signal, 
                R_cm8c6c26c1cm35cm3c9c16cm5cm5c3cm2cm4c3cm5c13 => x_cm8c6c26c1cm35cm3c9c16cm5cm5c3cm2cm4c3cm5c13_signal, 
                R_c5c12c2cm7cm57cm17cm6c12cm5c10c11c1c9cm11cm2c5 => x_c5c12c2cm7cm57cm17cm6c12cm5c10c11c1c9cm11cm2c5_signal, 
                R_cm2c1cm5cm20c15cm15c1cm14cm3c42c7cm4cm2cm20cm8cm11 => x_cm2c1cm5cm20c15cm15c1cm14cm3c42c7cm4cm2cm20cm8cm11_signal, 
                R_c83cm5c14cm2c2c5c4cm10cm1c56cm7c28cm1c4cm2c4 => x_c83cm5c14cm2c2c5c4cm10cm1c56cm7c28cm1c4cm2c4_signal, 
                R_cm1c10c3c5c17c30cm13cm35cm6c8cm12cm11cm10c8c5cm6 => x_cm1c10c3c5c17c30cm13cm35cm6c8cm12cm11cm10c8c5cm6_signal, 
                R_c2cm2c4c1c7cm12cm45cm1cm13c9c3cm10c5c1c5c4 => x_c2cm2c4c1c7cm12cm45cm1cm13c9c3cm10c5c1c5c4_signal, 
                R_c0cm4c0c3cm6cm51c8c10cm25cm12cm18cm3cm1cm9c7cm7 => x_c0cm4c0c3cm6cm51c8c10cm25cm12cm18cm3cm1cm9c7cm7_signal, 
                R_cm3c34cm9cm2c17cm4cm9cm19cm26cm1c3cm5c3cm1c8c18 => x_cm3c34cm9cm2c17cm4cm9cm19cm26cm1c3cm5c3cm1c8c18_signal, 
                R_c6c4c9c2cm2cm38c4cm2c25c5cm30cm8cm1cm6c3cm1 => x_c6c4c9c2cm2cm38c4cm2c25c5cm30cm8cm1cm6c3cm1_signal, 
                R_c0c22cm14cm27c7cm8cm2c12cm6c3c4c1c13c13c8c0 => x_c0c22cm14cm27c7cm8cm2c12cm6c3c4c1c13c13c8c0_signal, 
                R_c3c13cm13c3c13c22c2c17cm33cm3c12cm5cm18c3c9cm8 => x_c3c13cm13c3c13c22c2c17cm33cm3c12cm5cm18c3c9cm8_signal, 
                R_c2cm2cm15cm2cm2c4c3cm6c7c1c5c2cm5cm3c1c11 => x_c2cm2cm15cm2cm2c4c3cm6c7c1c5c2cm5cm3c1c11_signal, 
                R_c4c1c0cm2cm33c26c4c2c2c7c2cm9cm22c15c17cm21 => x_c4c1c0cm2cm33c26c4c2c2c7c2cm9cm22c15c17cm21_signal, 
                R_cm16c8cm3cm22cm36c11cm1c2c2c6c5c5cm10c1c3c14 => x_cm16c8cm3cm22cm36c11cm1c2c2c6c5c5cm10c1c3c14_signal, 
                R_c13c9cm18cm19cm53c25c13cm5cm18cm8cm4c1cm7cm3cm12c2 => x_c13c9cm18cm19cm53c25c13cm5cm18cm8cm4c1cm7cm3cm12c2_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c25cm12c6cm7c5c6cm25c3c4c5c6c6c10cm2cm2cm11_signal;
    yo_2 <= x_cm27c1cm21cm3c7c20c1c6cm1cm4cm2cm48c6c21cm5c4_signal;
    yo_3 <= x_cm9c4cm10c5c11cm8cm4cm5cm1cm4cm5cm4c4cm8cm1c2_signal;
    yo_4 <= x_cm5cm30cm1c9cm8c2c19c18cm24c5c7cm9cm9c0c6c0_signal;
    yo_5 <= x_cm12cm7c8cm5cm6cm24c1cm10cm7c1c2c16c0cm17c13cm9_signal;
    yo_6 <= x_c7cm5cm9cm4c12cm2cm5c4c0cm8c7cm13cm3cm8c1cm9_signal;
    yo_7 <= x_c20cm6c0cm4c11cm11c0cm9cm6cm1c3cm13cm20cm11c0c0_signal;
    yo_8 <= x_cm8cm15cm11cm3cm1cm19c9c23cm2cm3cm4cm14c16cm11c30c8_signal;
    yo_9 <= x_c0cm6cm2cm9c2cm58c28cm25c21c8c6cm23cm3c29c8c4_signal;
    yo_10 <= x_c19c6cm1cm22cm12cm2cm12c17cm3cm1cm10c9c3c1cm10c30_signal;
    yo_11 <= x_c6cm12c8c2cm9c9c11cm10c2c4c6cm8cm19c0c10c0_signal;
    yo_12 <= x_c5c28c0c10c1c2c17cm5cm3cm2cm1c2cm1c2cm3c17_signal;
    yo_13 <= x_cm2cm2c3cm5cm9cm10cm6cm2c13cm12c3c4c12c8c9c5_signal;
    yo_14 <= x_c1cm10cm6c3cm10cm2c1c1cm7c11c12cm7cm11cm4c7cm4_signal;
    yo_15 <= x_c8c5cm1c2c11c9c10c1c3cm3c8cm5cm6cm13cm3c3_signal;
    yo_16 <= x_c62cm3c31cm4c12c2cm3c15c5c127c7c9c6c9c2c4_signal;
    yo_17 <= x_cm2cm6cm1cm8c16c21c0cm25cm11cm20c12cm4c6c18c9c0_signal;
    yo_18 <= x_cm8c6c26c1cm35cm3c9c16cm5cm5c3cm2cm4c3cm5c13_signal;
    yo_19 <= x_c5c12c2cm7cm57cm17cm6c12cm5c10c11c1c9cm11cm2c5_signal;
    yo_20 <= x_cm2c1cm5cm20c15cm15c1cm14cm3c42c7cm4cm2cm20cm8cm11_signal;
    yo_21 <= x_c83cm5c14cm2c2c5c4cm10cm1c56cm7c28cm1c4cm2c4_signal;
    yo_22 <= x_cm1c10c3c5c17c30cm13cm35cm6c8cm12cm11cm10c8c5cm6_signal;
    yo_23 <= x_c2cm2c4c1c7cm12cm45cm1cm13c9c3cm10c5c1c5c4_signal;
    yo_24 <= x_c0cm4c0c3cm6cm51c8c10cm25cm12cm18cm3cm1cm9c7cm7_signal;
    yo_25 <= x_cm3c34cm9cm2c17cm4cm9cm19cm26cm1c3cm5c3cm1c8c18_signal;
    yo_26 <= x_c6c4c9c2cm2cm38c4cm2c25c5cm30cm8cm1cm6c3cm1_signal;
    yo_27 <= x_c0c22cm14cm27c7cm8cm2c12cm6c3c4c1c13c13c8c0_signal;
    yo_28 <= x_c3c13cm13c3c13c22c2c17cm33cm3c12cm5cm18c3c9cm8_signal;
    yo_29 <= x_c2cm2cm15cm2cm2c4c3cm6c7c1c5c2cm5cm3c1c11_signal;
    yo_30 <= x_c4c1c0cm2cm33c26c4c2c2c7c2cm9cm22c15c17cm21_signal;
    yo_31 <= x_cm16c8cm3cm22cm36c11cm1c2c2c6c5c5cm10c1c3c14_signal;
    yo_32 <= x_c13c9cm18cm19cm53c25c13cm5cm18cm8cm4c1cm7cm3cm12c2_signal;



end structural;