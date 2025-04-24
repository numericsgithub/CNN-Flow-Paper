LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core8 is
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
        yo_5  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_9  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_13  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_14  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_17  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_18  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_19  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_22  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(3, -10)
    );
end conv7_core8;

architecture structural of conv7_core8 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c11c7c13c6c3cm5c2c1c16cm1cm17c6cm19cm8cm11cm10_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c3c2c49c1cm3cm8cm1cm4cm23c4c16c5c3c7cm44c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm22c6c15cm33cm7cm9cm3cm4cm24cm5c19c3cm14c5cm9c6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c15cm11c11c8c5c9c1cm16c47c2cm13c0cm14cm4cm7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3cm3cm9c1c9cm6cm1cm10c1c10cm3c10cm5c4cm14cm1_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm57cm4c6c2c2cm2c9cm10cm6cm1cm12c3cm4cm1c0c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm13c15cm3c4c15c7c13c6c19c4c2c3cm18cm2cm6c4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm4cm7cm5cm3cm10c6c10c34c0c16c18c8c5c2cm6c5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2c3c6cm10c16c6c2cm7cm12cm26cm2c5c3c4cm7cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm17cm4c0cm6cm1c3cm4cm3c2c0c0c4cm21c5cm3cm19_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c9cm2c1c4c14c8c46c2cm7cm12cm11cm11c12c10c3cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c1c24c7c1c7c0cm27c14cm5c0c3c2cm15cm9cm4c9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0cm3cm32c1c32cm10cm4c18c7cm16cm19cm1cm5cm9cm7c3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c8c13c7c0c29c4cm6c5cm57c3cm1c3c19cm10c6c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2cm5c7cm3c5cm6cm14c40cm6c0c32c0cm3cm5cm17c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c23cm4cm16cm2c1c7cm3c3cm29cm17c3cm8c2cm6c10cm7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2cm4c0cm1c3c9cm10c4c4c1c3c4cm6cm13c8cm12_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm2c2c10c2cm30c5c2cm2cm15c3c41c6cm9cm3cm48c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2cm10cm7c31c15cm43cm23cm4cm14cm21cm3cm13c9c5cm2c7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1cm11c8cm4cm1cm19cm1c9cm9cm3c0cm37c7cm3cm1cm20_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c25c0c0cm2cm1c9c2c6c4c1c5cm6cm17cm3c1c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm4c4c4cm5cm3cm4cm17cm7cm16cm2c13cm2cm4cm2cm6cm4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm8c16c7cm3c49cm7cm8c7c3cm9cm15c4c10c6cm1c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1cm2c1cm1c18c6c19cm4cm1cm1cm13cm6cm5cm7c1cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm11cm27cm6c2cm13c5c11c3c2cm3c18cm1cm3c16cm15c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2c1c5c2c11c2cm11c1c0cm18c12cm3cm1cm5c6c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm3cm1c3cm15cm30cm7c7cm8c11cm10cm20cm3cm1c0c16c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1c1c12c11cm5cm1c9cm5cm2cm53c6cm47c1c11cm4c6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c4c2cm2cm2cm2c0c15c14cm9cm2c12c18cm4cm3cm8cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1c4c9c6c11cm36cm4cm7cm1cm11cm18cm3c0cm8c20cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm24cm4c0cm1cm3c5c10cm10cm12c16c4cm25c3cm8cm2c5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1c1c16cm19cm10c8cm6c2c7cm7c5c22cm2c4cm4cm9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core8_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c11c7c13c6c3cm5c2c1c16cm1cm17c6cm19cm8cm11cm10 => x_c11c7c13c6c3cm5c2c1c16cm1cm17c6cm19cm8cm11cm10_signal, 
                R_c3c2c49c1cm3cm8cm1cm4cm23c4c16c5c3c7cm44c1 => x_c3c2c49c1cm3cm8cm1cm4cm23c4c16c5c3c7cm44c1_signal, 
                R_cm22c6c15cm33cm7cm9cm3cm4cm24cm5c19c3cm14c5cm9c6 => x_cm22c6c15cm33cm7cm9cm3cm4cm24cm5c19c3cm14c5cm9c6_signal, 
                R_c0c15cm11c11c8c5c9c1cm16c47c2cm13c0cm14cm4cm7 => x_c0c15cm11c11c8c5c9c1cm16c47c2cm13c0cm14cm4cm7_signal, 
                R_cm3cm3cm9c1c9cm6cm1cm10c1c10cm3c10cm5c4cm14cm1 => x_cm3cm3cm9c1c9cm6cm1cm10c1c10cm3c10cm5c4cm14cm1_signal, 
                R_cm57cm4c6c2c2cm2c9cm10cm6cm1cm12c3cm4cm1c0c0 => x_cm57cm4c6c2c2cm2c9cm10cm6cm1cm12c3cm4cm1c0c0_signal, 
                R_cm13c15cm3c4c15c7c13c6c19c4c2c3cm18cm2cm6c4 => x_cm13c15cm3c4c15c7c13c6c19c4c2c3cm18cm2cm6c4_signal, 
                R_cm4cm7cm5cm3cm10c6c10c34c0c16c18c8c5c2cm6c5 => x_cm4cm7cm5cm3cm10c6c10c34c0c16c18c8c5c2cm6c5_signal, 
                R_cm2c3c6cm10c16c6c2cm7cm12cm26cm2c5c3c4cm7cm3 => x_cm2c3c6cm10c16c6c2cm7cm12cm26cm2c5c3c4cm7cm3_signal, 
                R_cm17cm4c0cm6cm1c3cm4cm3c2c0c0c4cm21c5cm3cm19 => x_cm17cm4c0cm6cm1c3cm4cm3c2c0c0c4cm21c5cm3cm19_signal, 
                R_c9cm2c1c4c14c8c46c2cm7cm12cm11cm11c12c10c3cm3 => x_c9cm2c1c4c14c8c46c2cm7cm12cm11cm11c12c10c3cm3_signal, 
                R_c1c24c7c1c7c0cm27c14cm5c0c3c2cm15cm9cm4c9 => x_c1c24c7c1c7c0cm27c14cm5c0c3c2cm15cm9cm4c9_signal, 
                R_c0cm3cm32c1c32cm10cm4c18c7cm16cm19cm1cm5cm9cm7c3 => x_c0cm3cm32c1c32cm10cm4c18c7cm16cm19cm1cm5cm9cm7c3_signal, 
                R_c8c13c7c0c29c4cm6c5cm57c3cm1c3c19cm10c6c2 => x_c8c13c7c0c29c4cm6c5cm57c3cm1c3c19cm10c6c2_signal, 
                R_c2cm5c7cm3c5cm6cm14c40cm6c0c32c0cm3cm5cm17c2 => x_c2cm5c7cm3c5cm6cm14c40cm6c0c32c0cm3cm5cm17c2_signal, 
                R_c23cm4cm16cm2c1c7cm3c3cm29cm17c3cm8c2cm6c10cm7 => x_c23cm4cm16cm2c1c7cm3c3cm29cm17c3cm8c2cm6c10cm7_signal, 
                R_c2cm4c0cm1c3c9cm10c4c4c1c3c4cm6cm13c8cm12 => x_c2cm4c0cm1c3c9cm10c4c4c1c3c4cm6cm13c8cm12_signal, 
                R_cm2c2c10c2cm30c5c2cm2cm15c3c41c6cm9cm3cm48c1 => x_cm2c2c10c2cm30c5c2cm2cm15c3c41c6cm9cm3cm48c1_signal, 
                R_cm2cm10cm7c31c15cm43cm23cm4cm14cm21cm3cm13c9c5cm2c7 => x_cm2cm10cm7c31c15cm43cm23cm4cm14cm21cm3cm13c9c5cm2c7_signal, 
                R_cm1cm11c8cm4cm1cm19cm1c9cm9cm3c0cm37c7cm3cm1cm20 => x_cm1cm11c8cm4cm1cm19cm1c9cm9cm3c0cm37c7cm3cm1cm20_signal, 
                R_c25c0c0cm2cm1c9c2c6c4c1c5cm6cm17cm3c1c3 => x_c25c0c0cm2cm1c9c2c6c4c1c5cm6cm17cm3c1c3_signal, 
                R_cm4c4c4cm5cm3cm4cm17cm7cm16cm2c13cm2cm4cm2cm6cm4 => x_cm4c4c4cm5cm3cm4cm17cm7cm16cm2c13cm2cm4cm2cm6cm4_signal, 
                R_cm8c16c7cm3c49cm7cm8c7c3cm9cm15c4c10c6cm1c2 => x_cm8c16c7cm3c49cm7cm8c7c3cm9cm15c4c10c6cm1c2_signal, 
                R_cm1cm2c1cm1c18c6c19cm4cm1cm1cm13cm6cm5cm7c1cm1 => x_cm1cm2c1cm1c18c6c19cm4cm1cm1cm13cm6cm5cm7c1cm1_signal, 
                R_cm11cm27cm6c2cm13c5c11c3c2cm3c18cm1cm3c16cm15c0 => x_cm11cm27cm6c2cm13c5c11c3c2cm3c18cm1cm3c16cm15c0_signal, 
                R_c2c1c5c2c11c2cm11c1c0cm18c12cm3cm1cm5c6c2 => x_c2c1c5c2c11c2cm11c1c0cm18c12cm3cm1cm5c6c2_signal, 
                R_cm3cm1c3cm15cm30cm7c7cm8c11cm10cm20cm3cm1c0c16c1 => x_cm3cm1c3cm15cm30cm7c7cm8c11cm10cm20cm3cm1c0c16c1_signal, 
                R_cm1c1c12c11cm5cm1c9cm5cm2cm53c6cm47c1c11cm4c6 => x_cm1c1c12c11cm5cm1c9cm5cm2cm53c6cm47c1c11cm4c6_signal, 
                R_c4c2cm2cm2cm2c0c15c14cm9cm2c12c18cm4cm3cm8cm1 => x_c4c2cm2cm2cm2c0c15c14cm9cm2c12c18cm4cm3cm8cm1_signal, 
                R_cm1c4c9c6c11cm36cm4cm7cm1cm11cm18cm3c0cm8c20cm4 => x_cm1c4c9c6c11cm36cm4cm7cm1cm11cm18cm3c0cm8c20cm4_signal, 
                R_cm24cm4c0cm1cm3c5c10cm10cm12c16c4cm25c3cm8cm2c5 => x_cm24cm4c0cm1cm3c5c10cm10cm12c16c4cm25c3cm8cm2c5_signal, 
                R_c1c1c16cm19cm10c8cm6c2c7cm7c5c22cm2c4cm4cm9 => x_c1c1c16cm19cm10c8cm6c2c7cm7c5c22cm2c4cm4cm9_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c11c7c13c6c3cm5c2c1c16cm1cm17c6cm19cm8cm11cm10_signal;
    yo_2 <= x_c3c2c49c1cm3cm8cm1cm4cm23c4c16c5c3c7cm44c1_signal;
    yo_3 <= x_cm22c6c15cm33cm7cm9cm3cm4cm24cm5c19c3cm14c5cm9c6_signal;
    yo_4 <= x_c0c15cm11c11c8c5c9c1cm16c47c2cm13c0cm14cm4cm7_signal;
    yo_5 <= x_cm3cm3cm9c1c9cm6cm1cm10c1c10cm3c10cm5c4cm14cm1_signal;
    yo_6 <= x_cm57cm4c6c2c2cm2c9cm10cm6cm1cm12c3cm4cm1c0c0_signal;
    yo_7 <= x_cm13c15cm3c4c15c7c13c6c19c4c2c3cm18cm2cm6c4_signal;
    yo_8 <= x_cm4cm7cm5cm3cm10c6c10c34c0c16c18c8c5c2cm6c5_signal;
    yo_9 <= x_cm2c3c6cm10c16c6c2cm7cm12cm26cm2c5c3c4cm7cm3_signal;
    yo_10 <= x_cm17cm4c0cm6cm1c3cm4cm3c2c0c0c4cm21c5cm3cm19_signal;
    yo_11 <= x_c9cm2c1c4c14c8c46c2cm7cm12cm11cm11c12c10c3cm3_signal;
    yo_12 <= x_c1c24c7c1c7c0cm27c14cm5c0c3c2cm15cm9cm4c9_signal;
    yo_13 <= x_c0cm3cm32c1c32cm10cm4c18c7cm16cm19cm1cm5cm9cm7c3_signal;
    yo_14 <= x_c8c13c7c0c29c4cm6c5cm57c3cm1c3c19cm10c6c2_signal;
    yo_15 <= x_c2cm5c7cm3c5cm6cm14c40cm6c0c32c0cm3cm5cm17c2_signal;
    yo_16 <= x_c23cm4cm16cm2c1c7cm3c3cm29cm17c3cm8c2cm6c10cm7_signal;
    yo_17 <= x_c2cm4c0cm1c3c9cm10c4c4c1c3c4cm6cm13c8cm12_signal;
    yo_18 <= x_cm2c2c10c2cm30c5c2cm2cm15c3c41c6cm9cm3cm48c1_signal;
    yo_19 <= x_cm2cm10cm7c31c15cm43cm23cm4cm14cm21cm3cm13c9c5cm2c7_signal;
    yo_20 <= x_cm1cm11c8cm4cm1cm19cm1c9cm9cm3c0cm37c7cm3cm1cm20_signal;
    yo_21 <= x_c25c0c0cm2cm1c9c2c6c4c1c5cm6cm17cm3c1c3_signal;
    yo_22 <= x_cm4c4c4cm5cm3cm4cm17cm7cm16cm2c13cm2cm4cm2cm6cm4_signal;
    yo_23 <= x_cm8c16c7cm3c49cm7cm8c7c3cm9cm15c4c10c6cm1c2_signal;
    yo_24 <= x_cm1cm2c1cm1c18c6c19cm4cm1cm1cm13cm6cm5cm7c1cm1_signal;
    yo_25 <= x_cm11cm27cm6c2cm13c5c11c3c2cm3c18cm1cm3c16cm15c0_signal;
    yo_26 <= x_c2c1c5c2c11c2cm11c1c0cm18c12cm3cm1cm5c6c2_signal;
    yo_27 <= x_cm3cm1c3cm15cm30cm7c7cm8c11cm10cm20cm3cm1c0c16c1_signal;
    yo_28 <= x_cm1c1c12c11cm5cm1c9cm5cm2cm53c6cm47c1c11cm4c6_signal;
    yo_29 <= x_c4c2cm2cm2cm2c0c15c14cm9cm2c12c18cm4cm3cm8cm1_signal;
    yo_30 <= x_cm1c4c9c6c11cm36cm4cm7cm1cm11cm18cm3c0cm8c20cm4_signal;
    yo_31 <= x_cm24cm4c0cm1cm3c5c10cm10cm12c16c4cm25c3cm8cm2c5_signal;
    yo_32 <= x_c1c1c16cm19cm10c8cm6c2c7cm7c5c22cm2c4cm4cm9_signal;



end structural;