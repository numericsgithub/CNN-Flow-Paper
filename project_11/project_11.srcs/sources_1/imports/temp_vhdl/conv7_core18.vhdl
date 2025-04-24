LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core18 is
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
        yo_3  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_4  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_9  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_13  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_18  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_26  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_29  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_30  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_31  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(3, -10)
    );
end conv7_core18;

architecture structural of conv7_core18 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c1c4c0c3cm2cm4cm3c1cm10c6c4c28cm21cm2cm9cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c5c2c3c35cm3cm12cm4cm5c23c2cm10cm5c31c4cm57cm9_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2cm14cm14cm4cm6cm13c2cm4c8cm83cm6cm7c5cm2cm1c3_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c127c1c10cm5c8cm4cm15c1c13c5c15cm3c2cm18cm1c0_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c1c35cm6cm23c7cm2c2cm13cm22cm3cm1c2cm8cm2cm28cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2cm12cm13cm24cm1cm1c7c7c13c7c24cm1cm1cm10c3cm15_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c16c11cm1cm13cm13cm1cm2c2cm22c12cm7cm9cm7c1cm5c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm24cm4c10cm4cm8cm10cm7c15c26c102cm3c8c6cm10cm4c8_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm2c1c0cm20c3c16c1cm10c36c7cm104c16cm2c8cm14cm6_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c3c0c4c15c2c2cm2c6c14cm4cm8cm8cm29c5cm11cm10_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm19cm19cm6cm17cm19cm11c52cm7cm29cm2c41c1cm17c11c0c6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm7c0c6cm4cm3cm1c8c1cm1c1cm5cm19cm16cm2c9c10_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c0c2c0cm2c32cm6c4cm5c41c6cm7cm1cm5c4c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm13cm5cm9c11cm19cm3c0c6cm6c3c6cm3c1cm10c5c6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c4cm10cm1cm1c10cm6cm28c5c32cm7cm3cm28c0c11cm9c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0cm12c5c16cm1c0c1cm2c10c2c0c9cm6cm2cm3c9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c43c17c25cm4c11c9c21c11c11c34c10c26c10c2c14cm11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2cm7c0cm1c28cm1cm10c3c15cm8c14c5cm13cm7cm36c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c5cm1cm11c4c9c4c10c3c24c7c18c11c0cm6c0c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm15cm12cm5cm2cm7cm22c1c8cm5cm4c70c0cm4c2cm4cm9_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm1c1cm5cm51c0cm22cm5c3c6cm9c1c29c2cm1c1cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm20cm24c8cm24cm22c4c55c0c4cm8cm5c22cm9c7cm6cm7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c9cm12cm18c13c7cm7c5c2c24c6cm13c7c16cm2cm3cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm13c6cm24c11c4cm6c2cm5cm1c17c8cm7cm11cm11c3c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm4c2c2c12cm51c3c18cm9cm13c10c19cm18cm2c2cm4cm8_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm48c0cm38cm6c15c0c4cm3cm3cm1cm3cm1c0cm18cm1c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c14cm4cm1cm3c16cm4c10c0c13c2c2c15c14c24c28c9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6cm16cm2c4c10c13c3c6c3c14c6cm7c2c16cm8cm21_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1c13c3cm20cm11cm6cm6c3c7c0cm14cm36cm2cm8cm4c12_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c1c5c9c2c9c21c3c3c9c21c16c33c10cm27c43cm13_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm12cm3c2c0cm12c12c6c6c6cm13cm5c13cm8c6cm1cm1_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm1c2cm11cm1c6c12cm4cm25cm11c10cm1cm10c1c2cm14cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core18_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c1c4c0c3cm2cm4cm3c1cm10c6c4c28cm21cm2cm9cm8 => x_c1c4c0c3cm2cm4cm3c1cm10c6c4c28cm21cm2cm9cm8_signal, 
                R_c5c2c3c35cm3cm12cm4cm5c23c2cm10cm5c31c4cm57cm9 => x_c5c2c3c35cm3cm12cm4cm5c23c2cm10cm5c31c4cm57cm9_signal, 
                R_cm2cm14cm14cm4cm6cm13c2cm4c8cm83cm6cm7c5cm2cm1c3 => x_cm2cm14cm14cm4cm6cm13c2cm4c8cm83cm6cm7c5cm2cm1c3_signal, 
                R_c127c1c10cm5c8cm4cm15c1c13c5c15cm3c2cm18cm1c0 => x_c127c1c10cm5c8cm4cm15c1c13c5c15cm3c2cm18cm1c0_signal, 
                R_c1c35cm6cm23c7cm2c2cm13cm22cm3cm1c2cm8cm2cm28cm4 => x_c1c35cm6cm23c7cm2c2cm13cm22cm3cm1c2cm8cm2cm28cm4_signal, 
                R_cm2cm12cm13cm24cm1cm1c7c7c13c7c24cm1cm1cm10c3cm15 => x_cm2cm12cm13cm24cm1cm1c7c7c13c7c24cm1cm1cm10c3cm15_signal, 
                R_c16c11cm1cm13cm13cm1cm2c2cm22c12cm7cm9cm7c1cm5c1 => x_c16c11cm1cm13cm13cm1cm2c2cm22c12cm7cm9cm7c1cm5c1_signal, 
                R_cm24cm4c10cm4cm8cm10cm7c15c26c102cm3c8c6cm10cm4c8 => x_cm24cm4c10cm4cm8cm10cm7c15c26c102cm3c8c6cm10cm4c8_signal, 
                R_cm2c1c0cm20c3c16c1cm10c36c7cm104c16cm2c8cm14cm6 => x_cm2c1c0cm20c3c16c1cm10c36c7cm104c16cm2c8cm14cm6_signal, 
                R_c3c0c4c15c2c2cm2c6c14cm4cm8cm8cm29c5cm11cm10 => x_c3c0c4c15c2c2cm2c6c14cm4cm8cm8cm29c5cm11cm10_signal, 
                R_cm19cm19cm6cm17cm19cm11c52cm7cm29cm2c41c1cm17c11c0c6 => x_cm19cm19cm6cm17cm19cm11c52cm7cm29cm2c41c1cm17c11c0c6_signal, 
                R_cm7c0c6cm4cm3cm1c8c1cm1c1cm5cm19cm16cm2c9c10 => x_cm7c0c6cm4cm3cm1c8c1cm1c1cm5cm19cm16cm2c9c10_signal, 
                R_c0c0c2c0cm2c32cm6c4cm5c41c6cm7cm1cm5c4c2 => x_c0c0c2c0cm2c32cm6c4cm5c41c6cm7cm1cm5c4c2_signal, 
                R_cm13cm5cm9c11cm19cm3c0c6cm6c3c6cm3c1cm10c5c6 => x_cm13cm5cm9c11cm19cm3c0c6cm6c3c6cm3c1cm10c5c6_signal, 
                R_c4cm10cm1cm1c10cm6cm28c5c32cm7cm3cm28c0c11cm9c1 => x_c4cm10cm1cm1c10cm6cm28c5c32cm7cm3cm28c0c11cm9c1_signal, 
                R_c0cm12c5c16cm1c0c1cm2c10c2c0c9cm6cm2cm3c9 => x_c0cm12c5c16cm1c0c1cm2c10c2c0c9cm6cm2cm3c9_signal, 
                R_c43c17c25cm4c11c9c21c11c11c34c10c26c10c2c14cm11 => x_c43c17c25cm4c11c9c21c11c11c34c10c26c10c2c14cm11_signal, 
                R_c2cm7c0cm1c28cm1cm10c3c15cm8c14c5cm13cm7cm36c2 => x_c2cm7c0cm1c28cm1cm10c3c15cm8c14c5cm13cm7cm36c2_signal, 
                R_c5cm1cm11c4c9c4c10c3c24c7c18c11c0cm6c0c1 => x_c5cm1cm11c4c9c4c10c3c24c7c18c11c0cm6c0c1_signal, 
                R_cm15cm12cm5cm2cm7cm22c1c8cm5cm4c70c0cm4c2cm4cm9 => x_cm15cm12cm5cm2cm7cm22c1c8cm5cm4c70c0cm4c2cm4cm9_signal, 
                R_cm1c1cm5cm51c0cm22cm5c3c6cm9c1c29c2cm1c1cm1 => x_cm1c1cm5cm51c0cm22cm5c3c6cm9c1c29c2cm1c1cm1_signal, 
                R_cm20cm24c8cm24cm22c4c55c0c4cm8cm5c22cm9c7cm6cm7 => x_cm20cm24c8cm24cm22c4c55c0c4cm8cm5c22cm9c7cm6cm7_signal, 
                R_c9cm12cm18c13c7cm7c5c2c24c6cm13c7c16cm2cm3cm6 => x_c9cm12cm18c13c7cm7c5c2c24c6cm13c7c16cm2cm3cm6_signal, 
                R_cm13c6cm24c11c4cm6c2cm5cm1c17c8cm7cm11cm11c3c0 => x_cm13c6cm24c11c4cm6c2cm5cm1c17c8cm7cm11cm11c3c0_signal, 
                R_cm4c2c2c12cm51c3c18cm9cm13c10c19cm18cm2c2cm4cm8 => x_cm4c2c2c12cm51c3c18cm9cm13c10c19cm18cm2c2cm4cm8_signal, 
                R_cm48c0cm38cm6c15c0c4cm3cm3cm1cm3cm1c0cm18cm1c0 => x_cm48c0cm38cm6c15c0c4cm3cm3cm1cm3cm1c0cm18cm1c0_signal, 
                R_c14cm4cm1cm3c16cm4c10c0c13c2c2c15c14c24c28c9 => x_c14cm4cm1cm3c16cm4c10c0c13c2c2c15c14c24c28c9_signal, 
                R_c6cm16cm2c4c10c13c3c6c3c14c6cm7c2c16cm8cm21 => x_c6cm16cm2c4c10c13c3c6c3c14c6cm7c2c16cm8cm21_signal, 
                R_cm1c13c3cm20cm11cm6cm6c3c7c0cm14cm36cm2cm8cm4c12 => x_cm1c13c3cm20cm11cm6cm6c3c7c0cm14cm36cm2cm8cm4c12_signal, 
                R_c1c5c9c2c9c21c3c3c9c21c16c33c10cm27c43cm13 => x_c1c5c9c2c9c21c3c3c9c21c16c33c10cm27c43cm13_signal, 
                R_cm12cm3c2c0cm12c12c6c6c6cm13cm5c13cm8c6cm1cm1 => x_cm12cm3c2c0cm12c12c6c6c6cm13cm5c13cm8c6cm1cm1_signal, 
                R_cm1c2cm11cm1c6c12cm4cm25cm11c10cm1cm10c1c2cm14cm8 => x_cm1c2cm11cm1c6c12cm4cm25cm11c10cm1cm10c1c2cm14cm8_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c1c4c0c3cm2cm4cm3c1cm10c6c4c28cm21cm2cm9cm8_signal;
    yo_2 <= x_c5c2c3c35cm3cm12cm4cm5c23c2cm10cm5c31c4cm57cm9_signal;
    yo_3 <= x_cm2cm14cm14cm4cm6cm13c2cm4c8cm83cm6cm7c5cm2cm1c3_signal;
    yo_4 <= x_c127c1c10cm5c8cm4cm15c1c13c5c15cm3c2cm18cm1c0_signal;
    yo_5 <= x_c1c35cm6cm23c7cm2c2cm13cm22cm3cm1c2cm8cm2cm28cm4_signal;
    yo_6 <= x_cm2cm12cm13cm24cm1cm1c7c7c13c7c24cm1cm1cm10c3cm15_signal;
    yo_7 <= x_c16c11cm1cm13cm13cm1cm2c2cm22c12cm7cm9cm7c1cm5c1_signal;
    yo_8 <= x_cm24cm4c10cm4cm8cm10cm7c15c26c102cm3c8c6cm10cm4c8_signal;
    yo_9 <= x_cm2c1c0cm20c3c16c1cm10c36c7cm104c16cm2c8cm14cm6_signal;
    yo_10 <= x_c3c0c4c15c2c2cm2c6c14cm4cm8cm8cm29c5cm11cm10_signal;
    yo_11 <= x_cm19cm19cm6cm17cm19cm11c52cm7cm29cm2c41c1cm17c11c0c6_signal;
    yo_12 <= x_cm7c0c6cm4cm3cm1c8c1cm1c1cm5cm19cm16cm2c9c10_signal;
    yo_13 <= x_c0c0c2c0cm2c32cm6c4cm5c41c6cm7cm1cm5c4c2_signal;
    yo_14 <= x_cm13cm5cm9c11cm19cm3c0c6cm6c3c6cm3c1cm10c5c6_signal;
    yo_15 <= x_c4cm10cm1cm1c10cm6cm28c5c32cm7cm3cm28c0c11cm9c1_signal;
    yo_16 <= x_c0cm12c5c16cm1c0c1cm2c10c2c0c9cm6cm2cm3c9_signal;
    yo_17 <= x_c43c17c25cm4c11c9c21c11c11c34c10c26c10c2c14cm11_signal;
    yo_18 <= x_c2cm7c0cm1c28cm1cm10c3c15cm8c14c5cm13cm7cm36c2_signal;
    yo_19 <= x_c5cm1cm11c4c9c4c10c3c24c7c18c11c0cm6c0c1_signal;
    yo_20 <= x_cm15cm12cm5cm2cm7cm22c1c8cm5cm4c70c0cm4c2cm4cm9_signal;
    yo_21 <= x_cm1c1cm5cm51c0cm22cm5c3c6cm9c1c29c2cm1c1cm1_signal;
    yo_22 <= x_cm20cm24c8cm24cm22c4c55c0c4cm8cm5c22cm9c7cm6cm7_signal;
    yo_23 <= x_c9cm12cm18c13c7cm7c5c2c24c6cm13c7c16cm2cm3cm6_signal;
    yo_24 <= x_cm13c6cm24c11c4cm6c2cm5cm1c17c8cm7cm11cm11c3c0_signal;
    yo_25 <= x_cm4c2c2c12cm51c3c18cm9cm13c10c19cm18cm2c2cm4cm8_signal;
    yo_26 <= x_cm48c0cm38cm6c15c0c4cm3cm3cm1cm3cm1c0cm18cm1c0_signal;
    yo_27 <= x_c14cm4cm1cm3c16cm4c10c0c13c2c2c15c14c24c28c9_signal;
    yo_28 <= x_c6cm16cm2c4c10c13c3c6c3c14c6cm7c2c16cm8cm21_signal;
    yo_29 <= x_cm1c13c3cm20cm11cm6cm6c3c7c0cm14cm36cm2cm8cm4c12_signal;
    yo_30 <= x_c1c5c9c2c9c21c3c3c9c21c16c33c10cm27c43cm13_signal;
    yo_31 <= x_cm12cm3c2c0cm12c12c6c6c6cm13cm5c13cm8c6cm1cm1_signal;
    yo_32 <= x_cm1c2cm11cm1c6c12cm4cm25cm11c10cm1cm10c1c2cm14cm8_signal;



end structural;