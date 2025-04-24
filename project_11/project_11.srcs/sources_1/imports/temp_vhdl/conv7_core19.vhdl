LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core19 is
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
        yo_2  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_13  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_18  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_26  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core19;

architecture structural of conv7_core19 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm35cm4cm4cm11c10cm5c6c1c3c8cm3c7c2cm2c3cm5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c4c0cm13cm6c3c1c29cm9c7c8cm8c1c7cm7c5cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c21c7cm19cm11cm5c6cm7c3c5cm43c3c2c8cm3c0c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2cm35cm9cm11cm2c1c5cm1cm1cm2c2c11cm5c0cm11c3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2cm4cm7cm5cm1cm2cm8cm16c0c12cm9cm8c11c9c6c30_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm29c1c2cm4cm3cm8c30cm7cm1c7cm3c9c5cm5cm18c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm30cm8cm8c5cm1cm14c5c10c11c9c0cm13cm10cm5c5c23_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6c1c6c9c4c2c20c10c17c14c6c8c9c29c3cm25_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c4cm13c15cm1c6c12cm11c36c5cm8c16cm9cm8c1cm11c11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm4c3cm1c1c16cm8cm5c21c2cm5cm6c16cm3c1cm14c8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1c6c6cm1c19c12cm4c12cm12c3c6c29cm53c6c8cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm10c47cm3c2c9c0c8c15c1cm1cm6cm15c0c0c0c11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c5cm4cm14c0c10c10c14c6c10cm4c2c0c1c50c3c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2cm7c3cm3cm17cm20cm14c6cm3c1cm3c1c4cm5cm2cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c7cm8cm15cm8cm4cm1c12c15cm10cm23c3c0cm1cm7c7c9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm32cm3c17c3c5cm11c9cm1c2cm11c2c7cm3cm7c4c14_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c4cm6c9c3c22cm3cm9c7c32c26cm10c4c14c49c7cm9_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c5c2c3c2cm4c12cm4cm1c5cm3c1c1cm6c4cm3cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c7c0c2cm9cm5c30cm17c13cm15c1c2cm2cm24cm4cm5cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm12cm5c6cm7c9cm2c22c21cm4cm15cm9c10c7c24cm15c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c57cm4c7c2cm2cm10cm6c12cm1c3c0cm9c5cm12cm3cm11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0cm2cm6c4c6c5cm17cm11cm6c3cm3cm34c10cm10c14c3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c5cm2c2c4c2c17c7c5c7cm9cm5c1cm26cm3cm12c5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c5c0c3cm1c20cm16c8cm5c4cm14c2c28cm8c8cm1c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm3cm13cm8cm5c13c5c19c19cm13c0c10cm5cm18cm4cm28c7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm3cm20c5c3c0cm3cm7c7cm4cm9cm33c0c3c2cm14c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0cm25c11cm7c23cm4c2cm6c9c3cm4c0cm4cm3cm3c4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c7cm10cm8c2cm35c23cm6c1cm19c6cm1cm10cm9cm17c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6cm1cm9cm7c1cm13c6c20cm13cm3cm2cm3c14cm8c7c8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c3cm13cm23c0c20c8c9cm16cm5c19cm1c9cm3cm2c5cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c11cm6c2cm14c17c12c4c10cm11c4c0c1c5cm7c2c5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c5c13c10cm2c0c19c41cm4cm14c0c6c1cm18cm1cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core19_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm35cm4cm4cm11c10cm5c6c1c3c8cm3c7c2cm2c3cm5 => x_cm35cm4cm4cm11c10cm5c6c1c3c8cm3c7c2cm2c3cm5_signal, 
                R_c4c0cm13cm6c3c1c29cm9c7c8cm8c1c7cm7c5cm6 => x_c4c0cm13cm6c3c1c29cm9c7c8cm8c1c7cm7c5cm6_signal, 
                R_c21c7cm19cm11cm5c6cm7c3c5cm43c3c2c8cm3c0c1 => x_c21c7cm19cm11cm5c6cm7c3c5cm43c3c2c8cm3c0c1_signal, 
                R_cm2cm35cm9cm11cm2c1c5cm1cm1cm2c2c11cm5c0cm11c3 => x_cm2cm35cm9cm11cm2c1c5cm1cm1cm2c2c11cm5c0cm11c3_signal, 
                R_cm2cm4cm7cm5cm1cm2cm8cm16c0c12cm9cm8c11c9c6c30 => x_cm2cm4cm7cm5cm1cm2cm8cm16c0c12cm9cm8c11c9c6c30_signal, 
                R_cm29c1c2cm4cm3cm8c30cm7cm1c7cm3c9c5cm5cm18c0 => x_cm29c1c2cm4cm3cm8c30cm7cm1c7cm3c9c5cm5cm18c0_signal, 
                R_cm30cm8cm8c5cm1cm14c5c10c11c9c0cm13cm10cm5c5c23 => x_cm30cm8cm8c5cm1cm14c5c10c11c9c0cm13cm10cm5c5c23_signal, 
                R_c6c1c6c9c4c2c20c10c17c14c6c8c9c29c3cm25 => x_c6c1c6c9c4c2c20c10c17c14c6c8c9c29c3cm25_signal, 
                R_c4cm13c15cm1c6c12cm11c36c5cm8c16cm9cm8c1cm11c11 => x_c4cm13c15cm1c6c12cm11c36c5cm8c16cm9cm8c1cm11c11_signal, 
                R_cm4c3cm1c1c16cm8cm5c21c2cm5cm6c16cm3c1cm14c8 => x_cm4c3cm1c1c16cm8cm5c21c2cm5cm6c16cm3c1cm14c8_signal, 
                R_c1c6c6cm1c19c12cm4c12cm12c3c6c29cm53c6c8cm4 => x_c1c6c6cm1c19c12cm4c12cm12c3c6c29cm53c6c8cm4_signal, 
                R_cm10c47cm3c2c9c0c8c15c1cm1cm6cm15c0c0c0c11 => x_cm10c47cm3c2c9c0c8c15c1cm1cm6cm15c0c0c0c11_signal, 
                R_c5cm4cm14c0c10c10c14c6c10cm4c2c0c1c50c3c1 => x_c5cm4cm14c0c10c10c14c6c10cm4c2c0c1c50c3c1_signal, 
                R_cm2cm7c3cm3cm17cm20cm14c6cm3c1cm3c1c4cm5cm2cm3 => x_cm2cm7c3cm3cm17cm20cm14c6cm3c1cm3c1c4cm5cm2cm3_signal, 
                R_c7cm8cm15cm8cm4cm1c12c15cm10cm23c3c0cm1cm7c7c9 => x_c7cm8cm15cm8cm4cm1c12c15cm10cm23c3c0cm1cm7c7c9_signal, 
                R_cm32cm3c17c3c5cm11c9cm1c2cm11c2c7cm3cm7c4c14 => x_cm32cm3c17c3c5cm11c9cm1c2cm11c2c7cm3cm7c4c14_signal, 
                R_c4cm6c9c3c22cm3cm9c7c32c26cm10c4c14c49c7cm9 => x_c4cm6c9c3c22cm3cm9c7c32c26cm10c4c14c49c7cm9_signal, 
                R_c5c2c3c2cm4c12cm4cm1c5cm3c1c1cm6c4cm3cm2 => x_c5c2c3c2cm4c12cm4cm1c5cm3c1c1cm6c4cm3cm2_signal, 
                R_c7c0c2cm9cm5c30cm17c13cm15c1c2cm2cm24cm4cm5cm5 => x_c7c0c2cm9cm5c30cm17c13cm15c1c2cm2cm24cm4cm5cm5_signal, 
                R_cm12cm5c6cm7c9cm2c22c21cm4cm15cm9c10c7c24cm15c1 => x_cm12cm5c6cm7c9cm2c22c21cm4cm15cm9c10c7c24cm15c1_signal, 
                R_c57cm4c7c2cm2cm10cm6c12cm1c3c0cm9c5cm12cm3cm11 => x_c57cm4c7c2cm2cm10cm6c12cm1c3c0cm9c5cm12cm3cm11_signal, 
                R_c0cm2cm6c4c6c5cm17cm11cm6c3cm3cm34c10cm10c14c3 => x_c0cm2cm6c4c6c5cm17cm11cm6c3cm3cm34c10cm10c14c3_signal, 
                R_c5cm2c2c4c2c17c7c5c7cm9cm5c1cm26cm3cm12c5 => x_c5cm2c2c4c2c17c7c5c7cm9cm5c1cm26cm3cm12c5_signal, 
                R_c5c0c3cm1c20cm16c8cm5c4cm14c2c28cm8c8cm1c0 => x_c5c0c3cm1c20cm16c8cm5c4cm14c2c28cm8c8cm1c0_signal, 
                R_cm3cm13cm8cm5c13c5c19c19cm13c0c10cm5cm18cm4cm28c7 => x_cm3cm13cm8cm5c13c5c19c19cm13c0c10cm5cm18cm4cm28c7_signal, 
                R_cm3cm20c5c3c0cm3cm7c7cm4cm9cm33c0c3c2cm14c2 => x_cm3cm20c5c3c0cm3cm7c7cm4cm9cm33c0c3c2cm14c2_signal, 
                R_c0cm25c11cm7c23cm4c2cm6c9c3cm4c0cm4cm3cm3c4 => x_c0cm25c11cm7c23cm4c2cm6c9c3cm4c0cm4cm3cm3c4_signal, 
                R_c0c7cm10cm8c2cm35c23cm6c1cm19c6cm1cm10cm9cm17c4 => x_c0c7cm10cm8c2cm35c23cm6c1cm19c6cm1cm10cm9cm17c4_signal, 
                R_cm6cm1cm9cm7c1cm13c6c20cm13cm3cm2cm3c14cm8c7c8 => x_cm6cm1cm9cm7c1cm13c6c20cm13cm3cm2cm3c14cm8c7c8_signal, 
                R_c3cm13cm23c0c20c8c9cm16cm5c19cm1c9cm3cm2c5cm5 => x_c3cm13cm23c0c20c8c9cm16cm5c19cm1c9cm3cm2c5cm5_signal, 
                R_c11cm6c2cm14c17c12c4c10cm11c4c0c1c5cm7c2c5 => x_c11cm6c2cm14c17c12c4c10cm11c4c0c1c5cm7c2c5_signal, 
                R_c0c5c13c10cm2c0c19c41cm4cm14c0c6c1cm18cm1cm4 => x_c0c5c13c10cm2c0c19c41cm4cm14c0c6c1cm18cm1cm4_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm35cm4cm4cm11c10cm5c6c1c3c8cm3c7c2cm2c3cm5_signal;
    yo_2 <= x_c4c0cm13cm6c3c1c29cm9c7c8cm8c1c7cm7c5cm6_signal;
    yo_3 <= x_c21c7cm19cm11cm5c6cm7c3c5cm43c3c2c8cm3c0c1_signal;
    yo_4 <= x_cm2cm35cm9cm11cm2c1c5cm1cm1cm2c2c11cm5c0cm11c3_signal;
    yo_5 <= x_cm2cm4cm7cm5cm1cm2cm8cm16c0c12cm9cm8c11c9c6c30_signal;
    yo_6 <= x_cm29c1c2cm4cm3cm8c30cm7cm1c7cm3c9c5cm5cm18c0_signal;
    yo_7 <= x_cm30cm8cm8c5cm1cm14c5c10c11c9c0cm13cm10cm5c5c23_signal;
    yo_8 <= x_c6c1c6c9c4c2c20c10c17c14c6c8c9c29c3cm25_signal;
    yo_9 <= x_c4cm13c15cm1c6c12cm11c36c5cm8c16cm9cm8c1cm11c11_signal;
    yo_10 <= x_cm4c3cm1c1c16cm8cm5c21c2cm5cm6c16cm3c1cm14c8_signal;
    yo_11 <= x_c1c6c6cm1c19c12cm4c12cm12c3c6c29cm53c6c8cm4_signal;
    yo_12 <= x_cm10c47cm3c2c9c0c8c15c1cm1cm6cm15c0c0c0c11_signal;
    yo_13 <= x_c5cm4cm14c0c10c10c14c6c10cm4c2c0c1c50c3c1_signal;
    yo_14 <= x_cm2cm7c3cm3cm17cm20cm14c6cm3c1cm3c1c4cm5cm2cm3_signal;
    yo_15 <= x_c7cm8cm15cm8cm4cm1c12c15cm10cm23c3c0cm1cm7c7c9_signal;
    yo_16 <= x_cm32cm3c17c3c5cm11c9cm1c2cm11c2c7cm3cm7c4c14_signal;
    yo_17 <= x_c4cm6c9c3c22cm3cm9c7c32c26cm10c4c14c49c7cm9_signal;
    yo_18 <= x_c5c2c3c2cm4c12cm4cm1c5cm3c1c1cm6c4cm3cm2_signal;
    yo_19 <= x_c7c0c2cm9cm5c30cm17c13cm15c1c2cm2cm24cm4cm5cm5_signal;
    yo_20 <= x_cm12cm5c6cm7c9cm2c22c21cm4cm15cm9c10c7c24cm15c1_signal;
    yo_21 <= x_c57cm4c7c2cm2cm10cm6c12cm1c3c0cm9c5cm12cm3cm11_signal;
    yo_22 <= x_c0cm2cm6c4c6c5cm17cm11cm6c3cm3cm34c10cm10c14c3_signal;
    yo_23 <= x_c5cm2c2c4c2c17c7c5c7cm9cm5c1cm26cm3cm12c5_signal;
    yo_24 <= x_c5c0c3cm1c20cm16c8cm5c4cm14c2c28cm8c8cm1c0_signal;
    yo_25 <= x_cm3cm13cm8cm5c13c5c19c19cm13c0c10cm5cm18cm4cm28c7_signal;
    yo_26 <= x_cm3cm20c5c3c0cm3cm7c7cm4cm9cm33c0c3c2cm14c2_signal;
    yo_27 <= x_c0cm25c11cm7c23cm4c2cm6c9c3cm4c0cm4cm3cm3c4_signal;
    yo_28 <= x_c0c7cm10cm8c2cm35c23cm6c1cm19c6cm1cm10cm9cm17c4_signal;
    yo_29 <= x_cm6cm1cm9cm7c1cm13c6c20cm13cm3cm2cm3c14cm8c7c8_signal;
    yo_30 <= x_c3cm13cm23c0c20c8c9cm16cm5c19cm1c9cm3cm2c5cm5_signal;
    yo_31 <= x_c11cm6c2cm14c17c12c4c10cm11c4c0c1c5cm7c2c5_signal;
    yo_32 <= x_c0c5c13c10cm2c0c19c41cm4cm14c0c6c1cm18cm1cm4_signal;



end structural;