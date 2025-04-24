LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core26 is
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
    
        yo_1  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_2  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_3  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_7  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_9  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_12  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_13  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_14  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_18  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_19  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_22  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_23  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_28  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(3, -10)
    );
end conv7_core26;

architecture structural of conv7_core26 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c1c5cm15c3c4c1cm1c0cm6c0cm2c3c2c4cm11cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm13c3c9cm6cm5cm2cm3cm7cm1c0c0c0c1c4c7c0_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm12c2c5c2c10cm4c2c9c1cm6c3cm2cm13c0cm8cm1_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm8cm13c43c12c5c0c13cm4c15c2cm2c1cm8c2c29c13_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm24cm8cm9cm10c0cm2c43c1c1c19c7c0cm3c2c60cm8_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm13cm4cm16cm4cm5cm2c1cm9c1cm3c8cm22c3c1cm8c21_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c34c3c4c0cm97c10c1cm20cm1cm1cm1cm3cm19c0cm1c2_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm20c14cm2c3cm14c12c22cm2c1c4cm4cm3c18cm13cm6cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c1cm13c13c4c99cm6cm5cm21c5c3c11c1c30c21cm1_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c10cm2cm10c5cm4cm2cm6c21cm1c1cm19c0cm8cm1cm1cm4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0cm16cm16cm3c1cm1c0cm3c1c5c1c22cm12c0cm6cm4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c62cm1c0c1c1c1c3c3c4c0c1cm1c2cm2c2cm8_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3cm2cm15c1c2cm2cm6c8c1cm1c1c1c0c2cm3cm6_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c9cm3cm9c6cm12cm4cm4c3c2c3c2cm3c12c7cm3c0_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c6cm3c5c8c0cm22c13c1c5cm2c1cm8c7c43cm1cm7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm14c1c3c0c0c5c3c4c1c25cm4cm6c5cm11cm4cm7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c3c13c7cm24cm4cm2c5cm1cm10c13c6cm5c14c10c2cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm57cm8cm3c4cm2c0c2c0cm6c6cm2cm14c0cm3c7c8_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2c17cm10cm14c0cm116cm11cm7c3cm1c1c4c26cm59cm5c6_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c12c4cm4c45cm4cm6cm5c5c3cm1c18cm7c10c7cm4cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3c3c3cm6cm3cm2c1c10c1cm4c0c123c0cm12c8cm15_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm1c0cm12cm5c8cm7cm1cm19cm1c1cm3c5cm20c10cm2c14_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm16c0cm1cm10cm6cm8c3c0cm9c2c2c4cm3c3cm8c5_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm2cm30cm3cm1c2c3cm12c3cm1c10cm6cm2c12cm36c3cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c11c4cm18cm3c2cm4c14cm2c1c2cm3c0cm10cm5cm9c8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm3c0c0cm7cm1c5c1c2c7c3cm29cm6c4cm22c3c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm4cm12cm20cm1c91cm4cm5c0cm4c1c2c0c34c1c5c8_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c22c17cm18cm11cm5cm9c2cm93c0c0c13c1cm1cm7cm6cm17_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c0c2c16c0cm5cm7cm2c1c2cm4c1cm2c8c9c1c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm13c9c10cm1cm18cm11cm15cm2cm2cm16cm3cm2cm127c5c26c3_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm35c10c3c12cm3c58c0cm9c0cm2c1c6cm19c17cm5cm8_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2cm6cm11cm18cm6cm15cm1c13c4c4c2c10c5c24c11cm25_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core26_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c1c5cm15c3c4c1cm1c0cm6c0cm2c3c2c4cm11cm2 => x_c1c5cm15c3c4c1cm1c0cm6c0cm2c3c2c4cm11cm2_signal, 
                R_cm13c3c9cm6cm5cm2cm3cm7cm1c0c0c0c1c4c7c0 => x_cm13c3c9cm6cm5cm2cm3cm7cm1c0c0c0c1c4c7c0_signal, 
                R_cm12c2c5c2c10cm4c2c9c1cm6c3cm2cm13c0cm8cm1 => x_cm12c2c5c2c10cm4c2c9c1cm6c3cm2cm13c0cm8cm1_signal, 
                R_cm8cm13c43c12c5c0c13cm4c15c2cm2c1cm8c2c29c13 => x_cm8cm13c43c12c5c0c13cm4c15c2cm2c1cm8c2c29c13_signal, 
                R_cm24cm8cm9cm10c0cm2c43c1c1c19c7c0cm3c2c60cm8 => x_cm24cm8cm9cm10c0cm2c43c1c1c19c7c0cm3c2c60cm8_signal, 
                R_cm13cm4cm16cm4cm5cm2c1cm9c1cm3c8cm22c3c1cm8c21 => x_cm13cm4cm16cm4cm5cm2c1cm9c1cm3c8cm22c3c1cm8c21_signal, 
                R_c34c3c4c0cm97c10c1cm20cm1cm1cm1cm3cm19c0cm1c2 => x_c34c3c4c0cm97c10c1cm20cm1cm1cm1cm3cm19c0cm1c2_signal, 
                R_cm20c14cm2c3cm14c12c22cm2c1c4cm4cm3c18cm13cm6cm2 => x_cm20c14cm2c3cm14c12c22cm2c1c4cm4cm3c18cm13cm6cm2_signal, 
                R_c0c1cm13c13c4c99cm6cm5cm21c5c3c11c1c30c21cm1 => x_c0c1cm13c13c4c99cm6cm5cm21c5c3c11c1c30c21cm1_signal, 
                R_c10cm2cm10c5cm4cm2cm6c21cm1c1cm19c0cm8cm1cm1cm4 => x_c10cm2cm10c5cm4cm2cm6c21cm1c1cm19c0cm8cm1cm1cm4_signal, 
                R_c0cm16cm16cm3c1cm1c0cm3c1c5c1c22cm12c0cm6cm4 => x_c0cm16cm16cm3c1cm1c0cm3c1c5c1c22cm12c0cm6cm4_signal, 
                R_c62cm1c0c1c1c1c3c3c4c0c1cm1c2cm2c2cm8 => x_c62cm1c0c1c1c1c3c3c4c0c1cm1c2cm2c2cm8_signal, 
                R_cm3cm2cm15c1c2cm2cm6c8c1cm1c1c1c0c2cm3cm6 => x_cm3cm2cm15c1c2cm2cm6c8c1cm1c1c1c0c2cm3cm6_signal, 
                R_c9cm3cm9c6cm12cm4cm4c3c2c3c2cm3c12c7cm3c0 => x_c9cm3cm9c6cm12cm4cm4c3c2c3c2cm3c12c7cm3c0_signal, 
                R_c6cm3c5c8c0cm22c13c1c5cm2c1cm8c7c43cm1cm7 => x_c6cm3c5c8c0cm22c13c1c5cm2c1cm8c7c43cm1cm7_signal, 
                R_cm14c1c3c0c0c5c3c4c1c25cm4cm6c5cm11cm4cm7 => x_cm14c1c3c0c0c5c3c4c1c25cm4cm6c5cm11cm4cm7_signal, 
                R_c3c13c7cm24cm4cm2c5cm1cm10c13c6cm5c14c10c2cm5 => x_c3c13c7cm24cm4cm2c5cm1cm10c13c6cm5c14c10c2cm5_signal, 
                R_cm57cm8cm3c4cm2c0c2c0cm6c6cm2cm14c0cm3c7c8 => x_cm57cm8cm3c4cm2c0c2c0cm6c6cm2cm14c0cm3c7c8_signal, 
                R_c2c17cm10cm14c0cm116cm11cm7c3cm1c1c4c26cm59cm5c6 => x_c2c17cm10cm14c0cm116cm11cm7c3cm1c1c4c26cm59cm5c6_signal, 
                R_c12c4cm4c45cm4cm6cm5c5c3cm1c18cm7c10c7cm4cm2 => x_c12c4cm4c45cm4cm6cm5c5c3cm1c18cm7c10c7cm4cm2_signal, 
                R_cm3c3c3cm6cm3cm2c1c10c1cm4c0c123c0cm12c8cm15 => x_cm3c3c3cm6cm3cm2c1c10c1cm4c0c123c0cm12c8cm15_signal, 
                R_cm1c0cm12cm5c8cm7cm1cm19cm1c1cm3c5cm20c10cm2c14 => x_cm1c0cm12cm5c8cm7cm1cm19cm1c1cm3c5cm20c10cm2c14_signal, 
                R_cm16c0cm1cm10cm6cm8c3c0cm9c2c2c4cm3c3cm8c5 => x_cm16c0cm1cm10cm6cm8c3c0cm9c2c2c4cm3c3cm8c5_signal, 
                R_cm2cm30cm3cm1c2c3cm12c3cm1c10cm6cm2c12cm36c3cm3 => x_cm2cm30cm3cm1c2c3cm12c3cm1c10cm6cm2c12cm36c3cm3_signal, 
                R_c11c4cm18cm3c2cm4c14cm2c1c2cm3c0cm10cm5cm9c8 => x_c11c4cm18cm3c2cm4c14cm2c1c2cm3c0cm10cm5cm9c8_signal, 
                R_cm3c0c0cm7cm1c5c1c2c7c3cm29cm6c4cm22c3c0 => x_cm3c0c0cm7cm1c5c1c2c7c3cm29cm6c4cm22c3c0_signal, 
                R_cm4cm12cm20cm1c91cm4cm5c0cm4c1c2c0c34c1c5c8 => x_cm4cm12cm20cm1c91cm4cm5c0cm4c1c2c0c34c1c5c8_signal, 
                R_c22c17cm18cm11cm5cm9c2cm93c0c0c13c1cm1cm7cm6cm17 => x_c22c17cm18cm11cm5cm9c2cm93c0c0c13c1cm1cm7cm6cm17_signal, 
                R_c0c2c16c0cm5cm7cm2c1c2cm4c1cm2c8c9c1c2 => x_c0c2c16c0cm5cm7cm2c1c2cm4c1cm2c8c9c1c2_signal, 
                R_cm13c9c10cm1cm18cm11cm15cm2cm2cm16cm3cm2cm127c5c26c3 => x_cm13c9c10cm1cm18cm11cm15cm2cm2cm16cm3cm2cm127c5c26c3_signal, 
                R_cm35c10c3c12cm3c58c0cm9c0cm2c1c6cm19c17cm5cm8 => x_cm35c10c3c12cm3c58c0cm9c0cm2c1c6cm19c17cm5cm8_signal, 
                R_c2cm6cm11cm18cm6cm15cm1c13c4c4c2c10c5c24c11cm25 => x_c2cm6cm11cm18cm6cm15cm1c13c4c4c2c10c5c24c11cm25_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c1c5cm15c3c4c1cm1c0cm6c0cm2c3c2c4cm11cm2_signal;
    yo_2 <= x_cm13c3c9cm6cm5cm2cm3cm7cm1c0c0c0c1c4c7c0_signal;
    yo_3 <= x_cm12c2c5c2c10cm4c2c9c1cm6c3cm2cm13c0cm8cm1_signal;
    yo_4 <= x_cm8cm13c43c12c5c0c13cm4c15c2cm2c1cm8c2c29c13_signal;
    yo_5 <= x_cm24cm8cm9cm10c0cm2c43c1c1c19c7c0cm3c2c60cm8_signal;
    yo_6 <= x_cm13cm4cm16cm4cm5cm2c1cm9c1cm3c8cm22c3c1cm8c21_signal;
    yo_7 <= x_c34c3c4c0cm97c10c1cm20cm1cm1cm1cm3cm19c0cm1c2_signal;
    yo_8 <= x_cm20c14cm2c3cm14c12c22cm2c1c4cm4cm3c18cm13cm6cm2_signal;
    yo_9 <= x_c0c1cm13c13c4c99cm6cm5cm21c5c3c11c1c30c21cm1_signal;
    yo_10 <= x_c10cm2cm10c5cm4cm2cm6c21cm1c1cm19c0cm8cm1cm1cm4_signal;
    yo_11 <= x_c0cm16cm16cm3c1cm1c0cm3c1c5c1c22cm12c0cm6cm4_signal;
    yo_12 <= x_c62cm1c0c1c1c1c3c3c4c0c1cm1c2cm2c2cm8_signal;
    yo_13 <= x_cm3cm2cm15c1c2cm2cm6c8c1cm1c1c1c0c2cm3cm6_signal;
    yo_14 <= x_c9cm3cm9c6cm12cm4cm4c3c2c3c2cm3c12c7cm3c0_signal;
    yo_15 <= x_c6cm3c5c8c0cm22c13c1c5cm2c1cm8c7c43cm1cm7_signal;
    yo_16 <= x_cm14c1c3c0c0c5c3c4c1c25cm4cm6c5cm11cm4cm7_signal;
    yo_17 <= x_c3c13c7cm24cm4cm2c5cm1cm10c13c6cm5c14c10c2cm5_signal;
    yo_18 <= x_cm57cm8cm3c4cm2c0c2c0cm6c6cm2cm14c0cm3c7c8_signal;
    yo_19 <= x_c2c17cm10cm14c0cm116cm11cm7c3cm1c1c4c26cm59cm5c6_signal;
    yo_20 <= x_c12c4cm4c45cm4cm6cm5c5c3cm1c18cm7c10c7cm4cm2_signal;
    yo_21 <= x_cm3c3c3cm6cm3cm2c1c10c1cm4c0c123c0cm12c8cm15_signal;
    yo_22 <= x_cm1c0cm12cm5c8cm7cm1cm19cm1c1cm3c5cm20c10cm2c14_signal;
    yo_23 <= x_cm16c0cm1cm10cm6cm8c3c0cm9c2c2c4cm3c3cm8c5_signal;
    yo_24 <= x_cm2cm30cm3cm1c2c3cm12c3cm1c10cm6cm2c12cm36c3cm3_signal;
    yo_25 <= x_c11c4cm18cm3c2cm4c14cm2c1c2cm3c0cm10cm5cm9c8_signal;
    yo_26 <= x_cm3c0c0cm7cm1c5c1c2c7c3cm29cm6c4cm22c3c0_signal;
    yo_27 <= x_cm4cm12cm20cm1c91cm4cm5c0cm4c1c2c0c34c1c5c8_signal;
    yo_28 <= x_c22c17cm18cm11cm5cm9c2cm93c0c0c13c1cm1cm7cm6cm17_signal;
    yo_29 <= x_c0c2c16c0cm5cm7cm2c1c2cm4c1cm2c8c9c1c2_signal;
    yo_30 <= x_cm13c9c10cm1cm18cm11cm15cm2cm2cm16cm3cm2cm127c5c26c3_signal;
    yo_31 <= x_cm35c10c3c12cm3c58c0cm9c0cm2c1c6cm19c17cm5cm8_signal;
    yo_32 <= x_c2cm6cm11cm18cm6cm15cm1c13c4c4c2c10c5c24c11cm25_signal;



end structural;