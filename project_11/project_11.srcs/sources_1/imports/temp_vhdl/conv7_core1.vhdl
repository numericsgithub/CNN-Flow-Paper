LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core1 is
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
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_7  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_9  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_13  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_16  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_17  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_19  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_24  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_26  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_29  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_30  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core1;

architecture structural of conv7_core1 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm9c0c3c21c0cm4cm2cm1cm6cm5cm4c0cm26cm32c12cm14_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c29cm10cm8cm26cm1c8cm3cm5c0c2c3c2c36c1c23c39_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1cm3cm25cm8c5c7c3c3cm1c4c5c2cm2c60c4c3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm27c5c4c6c27c2cm8c2cm3c10c4cm3c0c11c32c5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm16cm10cm15c35cm9cm8c3c27cm16c0cm4c4cm2c8cm3c21_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c17cm23c13cm57c2c3cm11cm3cm1c2cm6cm2c28cm8cm2c40_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm14c72cm1cm26c7cm5c2c0c5cm5c10c19cm10c9c7c52_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm3c22c16cm26cm4c2c0c4cm20c11c4cm1c0c18cm12cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6cm27cm30c11c7cm5c8cm9c30cm1c7c5cm13c20c27c91_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm6c8cm23cm12c0c1cm1cm4c0c2c11c4c26c10cm7cm27_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c32c19cm45c17cm13c7cm5c4cm16cm5c3c4c20c3cm17c3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2c1c21c26c2c0cm4c6c0c1cm12c8cm11c8c3c39_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c4cm66c2c13c4cm2c2c2c32c3c2c6cm14c4c7c3_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm5c5c10cm10cm6cm2cm2c3c0cm4cm1c1c17cm7cm16cm11_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm46cm19c15c6c3c3c11c2cm14c8c1c13c15c7cm2c11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm7c44cm14cm14c4cm10c3c7cm3cm1cm1c6c43cm34c2cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c6cm111c18cm14cm13cm3c1cm1c12cm8c1cm2cm8c8c5c41_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm5c5c14c17c4cm1cm3c8c2cm2c9cm5c31c2cm5c21_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm36c23c11c10cm1cm3cm6cm3c15cm2cm3cm5c71cm19cm19c31_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm5c51c24cm4cm3cm8cm5cm1cm1cm1cm2c6cm25c25cm15c28_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c10cm14cm11c42c0cm65cm2c6c1cm27cm1c2c10c12c17cm27_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm13c10c20cm29c12c0cm12c5cm8cm23c22cm30cm8c18cm3c59_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm43c9c0c1cm15c0c11cm4cm3c0cm22c6c15c14c31c5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm21cm30cm67c0c61c4cm15cm3c40c8cm37c1c20c0c26c6_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm22cm5cm2cm4c21cm2cm4c60c16c1c4cm31c3cm5c11cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c63cm5cm1cm15cm6cm1cm13c1cm5c0cm2c2c10c9c24c14_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm18cm1c9c8cm2c0c1c0c3cm1cm3c8c27c13c38c15_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm55cm21c26c1c2c6c8c1cm2cm18cm9c0c48c49c0cm11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm11cm2c2c28cm22c8c2c1cm26c0c22c11c4cm1cm4c42_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c6c2c17cm23cm6c8cm2cm2c2cm1cm26cm4c18cm14c81cm4_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c8cm1c13c28c4c0c2c9c8c6c4c1c20c21cm4c12_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm24cm15cm1c4cm2cm5c5cm6cm14c12cm18c26c11c59c14cm24_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core1_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm9c0c3c21c0cm4cm2cm1cm6cm5cm4c0cm26cm32c12cm14 => x_cm9c0c3c21c0cm4cm2cm1cm6cm5cm4c0cm26cm32c12cm14_signal, 
                R_c29cm10cm8cm26cm1c8cm3cm5c0c2c3c2c36c1c23c39 => x_c29cm10cm8cm26cm1c8cm3cm5c0c2c3c2c36c1c23c39_signal, 
                R_cm1cm3cm25cm8c5c7c3c3cm1c4c5c2cm2c60c4c3 => x_cm1cm3cm25cm8c5c7c3c3cm1c4c5c2cm2c60c4c3_signal, 
                R_cm27c5c4c6c27c2cm8c2cm3c10c4cm3c0c11c32c5 => x_cm27c5c4c6c27c2cm8c2cm3c10c4cm3c0c11c32c5_signal, 
                R_cm16cm10cm15c35cm9cm8c3c27cm16c0cm4c4cm2c8cm3c21 => x_cm16cm10cm15c35cm9cm8c3c27cm16c0cm4c4cm2c8cm3c21_signal, 
                R_c17cm23c13cm57c2c3cm11cm3cm1c2cm6cm2c28cm8cm2c40 => x_c17cm23c13cm57c2c3cm11cm3cm1c2cm6cm2c28cm8cm2c40_signal, 
                R_cm14c72cm1cm26c7cm5c2c0c5cm5c10c19cm10c9c7c52 => x_cm14c72cm1cm26c7cm5c2c0c5cm5c10c19cm10c9c7c52_signal, 
                R_cm3c22c16cm26cm4c2c0c4cm20c11c4cm1c0c18cm12cm3 => x_cm3c22c16cm26cm4c2c0c4cm20c11c4cm1c0c18cm12cm3_signal, 
                R_c6cm27cm30c11c7cm5c8cm9c30cm1c7c5cm13c20c27c91 => x_c6cm27cm30c11c7cm5c8cm9c30cm1c7c5cm13c20c27c91_signal, 
                R_cm6c8cm23cm12c0c1cm1cm4c0c2c11c4c26c10cm7cm27 => x_cm6c8cm23cm12c0c1cm1cm4c0c2c11c4c26c10cm7cm27_signal, 
                R_c32c19cm45c17cm13c7cm5c4cm16cm5c3c4c20c3cm17c3 => x_c32c19cm45c17cm13c7cm5c4cm16cm5c3c4c20c3cm17c3_signal, 
                R_c2c1c21c26c2c0cm4c6c0c1cm12c8cm11c8c3c39 => x_c2c1c21c26c2c0cm4c6c0c1cm12c8cm11c8c3c39_signal, 
                R_c4cm66c2c13c4cm2c2c2c32c3c2c6cm14c4c7c3 => x_c4cm66c2c13c4cm2c2c2c32c3c2c6cm14c4c7c3_signal, 
                R_cm5c5c10cm10cm6cm2cm2c3c0cm4cm1c1c17cm7cm16cm11 => x_cm5c5c10cm10cm6cm2cm2c3c0cm4cm1c1c17cm7cm16cm11_signal, 
                R_cm46cm19c15c6c3c3c11c2cm14c8c1c13c15c7cm2c11 => x_cm46cm19c15c6c3c3c11c2cm14c8c1c13c15c7cm2c11_signal, 
                R_cm7c44cm14cm14c4cm10c3c7cm3cm1cm1c6c43cm34c2cm1 => x_cm7c44cm14cm14c4cm10c3c7cm3cm1cm1c6c43cm34c2cm1_signal, 
                R_c6cm111c18cm14cm13cm3c1cm1c12cm8c1cm2cm8c8c5c41 => x_c6cm111c18cm14cm13cm3c1cm1c12cm8c1cm2cm8c8c5c41_signal, 
                R_cm5c5c14c17c4cm1cm3c8c2cm2c9cm5c31c2cm5c21 => x_cm5c5c14c17c4cm1cm3c8c2cm2c9cm5c31c2cm5c21_signal, 
                R_cm36c23c11c10cm1cm3cm6cm3c15cm2cm3cm5c71cm19cm19c31 => x_cm36c23c11c10cm1cm3cm6cm3c15cm2cm3cm5c71cm19cm19c31_signal, 
                R_cm5c51c24cm4cm3cm8cm5cm1cm1cm1cm2c6cm25c25cm15c28 => x_cm5c51c24cm4cm3cm8cm5cm1cm1cm1cm2c6cm25c25cm15c28_signal, 
                R_c10cm14cm11c42c0cm65cm2c6c1cm27cm1c2c10c12c17cm27 => x_c10cm14cm11c42c0cm65cm2c6c1cm27cm1c2c10c12c17cm27_signal, 
                R_cm13c10c20cm29c12c0cm12c5cm8cm23c22cm30cm8c18cm3c59 => x_cm13c10c20cm29c12c0cm12c5cm8cm23c22cm30cm8c18cm3c59_signal, 
                R_cm43c9c0c1cm15c0c11cm4cm3c0cm22c6c15c14c31c5 => x_cm43c9c0c1cm15c0c11cm4cm3c0cm22c6c15c14c31c5_signal, 
                R_cm21cm30cm67c0c61c4cm15cm3c40c8cm37c1c20c0c26c6 => x_cm21cm30cm67c0c61c4cm15cm3c40c8cm37c1c20c0c26c6_signal, 
                R_cm22cm5cm2cm4c21cm2cm4c60c16c1c4cm31c3cm5c11cm4 => x_cm22cm5cm2cm4c21cm2cm4c60c16c1c4cm31c3cm5c11cm4_signal, 
                R_c63cm5cm1cm15cm6cm1cm13c1cm5c0cm2c2c10c9c24c14 => x_c63cm5cm1cm15cm6cm1cm13c1cm5c0cm2c2c10c9c24c14_signal, 
                R_cm18cm1c9c8cm2c0c1c0c3cm1cm3c8c27c13c38c15 => x_cm18cm1c9c8cm2c0c1c0c3cm1cm3c8c27c13c38c15_signal, 
                R_cm55cm21c26c1c2c6c8c1cm2cm18cm9c0c48c49c0cm11 => x_cm55cm21c26c1c2c6c8c1cm2cm18cm9c0c48c49c0cm11_signal, 
                R_cm11cm2c2c28cm22c8c2c1cm26c0c22c11c4cm1cm4c42 => x_cm11cm2c2c28cm22c8c2c1cm26c0c22c11c4cm1cm4c42_signal, 
                R_c6c2c17cm23cm6c8cm2cm2c2cm1cm26cm4c18cm14c81cm4 => x_c6c2c17cm23cm6c8cm2cm2c2cm1cm26cm4c18cm14c81cm4_signal, 
                R_c8cm1c13c28c4c0c2c9c8c6c4c1c20c21cm4c12 => x_c8cm1c13c28c4c0c2c9c8c6c4c1c20c21cm4c12_signal, 
                R_cm24cm15cm1c4cm2cm5c5cm6cm14c12cm18c26c11c59c14cm24 => x_cm24cm15cm1c4cm2cm5c5cm6cm14c12cm18c26c11c59c14cm24_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm9c0c3c21c0cm4cm2cm1cm6cm5cm4c0cm26cm32c12cm14_signal;
    yo_2 <= x_c29cm10cm8cm26cm1c8cm3cm5c0c2c3c2c36c1c23c39_signal;
    yo_3 <= x_cm1cm3cm25cm8c5c7c3c3cm1c4c5c2cm2c60c4c3_signal;
    yo_4 <= x_cm27c5c4c6c27c2cm8c2cm3c10c4cm3c0c11c32c5_signal;
    yo_5 <= x_cm16cm10cm15c35cm9cm8c3c27cm16c0cm4c4cm2c8cm3c21_signal;
    yo_6 <= x_c17cm23c13cm57c2c3cm11cm3cm1c2cm6cm2c28cm8cm2c40_signal;
    yo_7 <= x_cm14c72cm1cm26c7cm5c2c0c5cm5c10c19cm10c9c7c52_signal;
    yo_8 <= x_cm3c22c16cm26cm4c2c0c4cm20c11c4cm1c0c18cm12cm3_signal;
    yo_9 <= x_c6cm27cm30c11c7cm5c8cm9c30cm1c7c5cm13c20c27c91_signal;
    yo_10 <= x_cm6c8cm23cm12c0c1cm1cm4c0c2c11c4c26c10cm7cm27_signal;
    yo_11 <= x_c32c19cm45c17cm13c7cm5c4cm16cm5c3c4c20c3cm17c3_signal;
    yo_12 <= x_c2c1c21c26c2c0cm4c6c0c1cm12c8cm11c8c3c39_signal;
    yo_13 <= x_c4cm66c2c13c4cm2c2c2c32c3c2c6cm14c4c7c3_signal;
    yo_14 <= x_cm5c5c10cm10cm6cm2cm2c3c0cm4cm1c1c17cm7cm16cm11_signal;
    yo_15 <= x_cm46cm19c15c6c3c3c11c2cm14c8c1c13c15c7cm2c11_signal;
    yo_16 <= x_cm7c44cm14cm14c4cm10c3c7cm3cm1cm1c6c43cm34c2cm1_signal;
    yo_17 <= x_c6cm111c18cm14cm13cm3c1cm1c12cm8c1cm2cm8c8c5c41_signal;
    yo_18 <= x_cm5c5c14c17c4cm1cm3c8c2cm2c9cm5c31c2cm5c21_signal;
    yo_19 <= x_cm36c23c11c10cm1cm3cm6cm3c15cm2cm3cm5c71cm19cm19c31_signal;
    yo_20 <= x_cm5c51c24cm4cm3cm8cm5cm1cm1cm1cm2c6cm25c25cm15c28_signal;
    yo_21 <= x_c10cm14cm11c42c0cm65cm2c6c1cm27cm1c2c10c12c17cm27_signal;
    yo_22 <= x_cm13c10c20cm29c12c0cm12c5cm8cm23c22cm30cm8c18cm3c59_signal;
    yo_23 <= x_cm43c9c0c1cm15c0c11cm4cm3c0cm22c6c15c14c31c5_signal;
    yo_24 <= x_cm21cm30cm67c0c61c4cm15cm3c40c8cm37c1c20c0c26c6_signal;
    yo_25 <= x_cm22cm5cm2cm4c21cm2cm4c60c16c1c4cm31c3cm5c11cm4_signal;
    yo_26 <= x_c63cm5cm1cm15cm6cm1cm13c1cm5c0cm2c2c10c9c24c14_signal;
    yo_27 <= x_cm18cm1c9c8cm2c0c1c0c3cm1cm3c8c27c13c38c15_signal;
    yo_28 <= x_cm55cm21c26c1c2c6c8c1cm2cm18cm9c0c48c49c0cm11_signal;
    yo_29 <= x_cm11cm2c2c28cm22c8c2c1cm26c0c22c11c4cm1cm4c42_signal;
    yo_30 <= x_c6c2c17cm23cm6c8cm2cm2c2cm1cm26cm4c18cm14c81cm4_signal;
    yo_31 <= x_c8cm1c13c28c4c0c2c9c8c6c4c1c20c21cm4c12_signal;
    yo_32 <= x_cm24cm15cm1c4cm2cm5c5cm6cm14c12cm18c26c11c59c14cm24_signal;



end structural;