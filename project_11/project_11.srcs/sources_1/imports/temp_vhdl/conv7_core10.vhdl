LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core10 is
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
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_9  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_10  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_13  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_16  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_22  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(3, -10)
    );
end conv7_core10;

architecture structural of conv7_core10 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c16c1c14c6c2c3c4c4c6cm5c2cm2cm2c0c2c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm2cm28cm2cm34c17c8c15c11c15cm12c11c5cm10cm3cm39cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c4c0cm15cm5cm3c2cm3c2c5c8cm4cm2c34c0c16c33_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm9c4c4cm6c16c4c48c3cm7c14c9c10c0c1cm7cm9_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c34c9cm2c15cm8c14c5cm12cm27c28cm8cm3c5c1c3c7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0cm12c11cm19c4cm4cm15cm17c6cm1cm34cm3c38cm1c8c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c7c0cm12c23c10c0cm6cm7c4c9cm12cm8cm5c3cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1cm13cm4cm12cm16c6cm5cm4c19cm3cm14c0cm2cm7cm5cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm9c3c15cm23cm2cm24c4cm13cm3cm3c17c1cm2cm8c9cm4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2c0c14cm1c2c0c4c9c5c1c11c14cm5c1c5c7_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c11c3c5cm3cm1c45cm3cm3cm19cm6c24cm2cm2cm4cm1c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6c2cm13c0cm13c1c1cm2c4c1c5c8c11cm15c3c11_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c36cm21c3c8cm11c16c4c0c23cm18c1cm2cm1c6c6c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2c11c13cm11cm8cm7cm7c8cm6cm2cm4c2cm26c17c1cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm11cm7c6cm2c8cm19c10cm7cm12c16cm22c5c0cm3c3cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c4c105c9cm27c0c14c9cm3cm5cm12cm1c20cm5cm1c17cm6_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm24cm27c20c12c2c14c15c0c14c7c5c0cm2cm9cm6cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2cm17c0cm2c20c3cm3c0c9cm3c13c2c1c7cm12c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1c14c15cm2cm5c12cm1c11c13cm11cm14c5cm3cm7c20cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1c34c5cm1cm27cm11c1c14cm5c6cm9cm1c5c18c7c6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0cm50cm3cm25c2c0c5cm11c2c14c3cm10cm24cm7c13c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm9c11cm17cm22c26cm1c5c2cm5cm17cm21cm10c1c7cm2c12_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm37c16cm8c9cm5c12cm3c8c2cm8cm7c12cm10cm2cm1cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c16cm16cm8cm3cm6cm7c1c4cm29c3cm18c1c0c8c2c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm28c0c1cm15c19c1c4cm2c14cm3c15cm36cm2cm2cm9cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c24c13cm15c3cm18cm6cm6c1cm4cm4c5c1c1c9c1cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm5c5cm2cm2c3c3c25cm3c4cm3c2c2c27cm10c5c7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm33cm14c23cm2c15cm4c4c3c0cm9c2cm19cm4c11c13cm11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c5cm4cm2c12c6cm2cm5cm11cm4c8c21c7c10c0cm8cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c9c13c4cm6c0c11cm6c2c6cm15cm3c1cm12c13cm1cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c15c11c7c6cm6c1cm1c54cm4c14cm3c7cm21c16c7cm32_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c9cm11cm8c18c4c3cm4c2c5cm3c7cm14c3cm9c3cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core10_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c16c1c14c6c2c3c4c4c6cm5c2cm2cm2c0c2c1 => x_c16c1c14c6c2c3c4c4c6cm5c2cm2cm2c0c2c1_signal, 
                R_cm2cm28cm2cm34c17c8c15c11c15cm12c11c5cm10cm3cm39cm3 => x_cm2cm28cm2cm34c17c8c15c11c15cm12c11c5cm10cm3cm39cm3_signal, 
                R_c4c0cm15cm5cm3c2cm3c2c5c8cm4cm2c34c0c16c33 => x_c4c0cm15cm5cm3c2cm3c2c5c8cm4cm2c34c0c16c33_signal, 
                R_cm9c4c4cm6c16c4c48c3cm7c14c9c10c0c1cm7cm9 => x_cm9c4c4cm6c16c4c48c3cm7c14c9c10c0c1cm7cm9_signal, 
                R_c34c9cm2c15cm8c14c5cm12cm27c28cm8cm3c5c1c3c7 => x_c34c9cm2c15cm8c14c5cm12cm27c28cm8cm3c5c1c3c7_signal, 
                R_c0cm12c11cm19c4cm4cm15cm17c6cm1cm34cm3c38cm1c8c0 => x_c0cm12c11cm19c4cm4cm15cm17c6cm1cm34cm3c38cm1c8c0_signal, 
                R_c0c7c0cm12c23c10c0cm6cm7c4c9cm12cm8cm5c3cm2 => x_c0c7c0cm12c23c10c0cm6cm7c4c9cm12cm8cm5c3cm2_signal, 
                R_c1cm13cm4cm12cm16c6cm5cm4c19cm3cm14c0cm2cm7cm5cm8 => x_c1cm13cm4cm12cm16c6cm5cm4c19cm3cm14c0cm2cm7cm5cm8_signal, 
                R_cm9c3c15cm23cm2cm24c4cm13cm3cm3c17c1cm2cm8c9cm4 => x_cm9c3c15cm23cm2cm24c4cm13cm3cm3c17c1cm2cm8c9cm4_signal, 
                R_c2c0c14cm1c2c0c4c9c5c1c11c14cm5c1c5c7 => x_c2c0c14cm1c2c0c4c9c5c1c11c14cm5c1c5c7_signal, 
                R_c11c3c5cm3cm1c45cm3cm3cm19cm6c24cm2cm2cm4cm1c4 => x_c11c3c5cm3cm1c45cm3cm3cm19cm6c24cm2cm2cm4cm1c4_signal, 
                R_cm6c2cm13c0cm13c1c1cm2c4c1c5c8c11cm15c3c11 => x_cm6c2cm13c0cm13c1c1cm2c4c1c5c8c11cm15c3c11_signal, 
                R_c36cm21c3c8cm11c16c4c0c23cm18c1cm2cm1c6c6c4 => x_c36cm21c3c8cm11c16c4c0c23cm18c1cm2cm1c6c6c4_signal, 
                R_cm2c11c13cm11cm8cm7cm7c8cm6cm2cm4c2cm26c17c1cm1 => x_cm2c11c13cm11cm8cm7cm7c8cm6cm2cm4c2cm26c17c1cm1_signal, 
                R_cm11cm7c6cm2c8cm19c10cm7cm12c16cm22c5c0cm3c3cm1 => x_cm11cm7c6cm2c8cm19c10cm7cm12c16cm22c5c0cm3c3cm1_signal, 
                R_c4c105c9cm27c0c14c9cm3cm5cm12cm1c20cm5cm1c17cm6 => x_c4c105c9cm27c0c14c9cm3cm5cm12cm1c20cm5cm1c17cm6_signal, 
                R_cm24cm27c20c12c2c14c15c0c14c7c5c0cm2cm9cm6cm2 => x_cm24cm27c20c12c2c14c15c0c14c7c5c0cm2cm9cm6cm2_signal, 
                R_c2cm17c0cm2c20c3cm3c0c9cm3c13c2c1c7cm12c1 => x_c2cm17c0cm2c20c3cm3c0c9cm3c13c2c1c7cm12c1_signal, 
                R_c1c14c15cm2cm5c12cm1c11c13cm11cm14c5cm3cm7c20cm6 => x_c1c14c15cm2cm5c12cm1c11c13cm11cm14c5cm3cm7c20cm6_signal, 
                R_cm1c34c5cm1cm27cm11c1c14cm5c6cm9cm1c5c18c7c6 => x_cm1c34c5cm1cm27cm11c1c14cm5c6cm9cm1c5c18c7c6_signal, 
                R_c0cm50cm3cm25c2c0c5cm11c2c14c3cm10cm24cm7c13c0 => x_c0cm50cm3cm25c2c0c5cm11c2c14c3cm10cm24cm7c13c0_signal, 
                R_cm9c11cm17cm22c26cm1c5c2cm5cm17cm21cm10c1c7cm2c12 => x_cm9c11cm17cm22c26cm1c5c2cm5cm17cm21cm10c1c7cm2c12_signal, 
                R_cm37c16cm8c9cm5c12cm3c8c2cm8cm7c12cm10cm2cm1cm1 => x_cm37c16cm8c9cm5c12cm3c8c2cm8cm7c12cm10cm2cm1cm1_signal, 
                R_c16cm16cm8cm3cm6cm7c1c4cm29c3cm18c1c0c8c2c0 => x_c16cm16cm8cm3cm6cm7c1c4cm29c3cm18c1c0c8c2c0_signal, 
                R_cm28c0c1cm15c19c1c4cm2c14cm3c15cm36cm2cm2cm9cm4 => x_cm28c0c1cm15c19c1c4cm2c14cm3c15cm36cm2cm2cm9cm4_signal, 
                R_c24c13cm15c3cm18cm6cm6c1cm4cm4c5c1c1c9c1cm3 => x_c24c13cm15c3cm18cm6cm6c1cm4cm4c5c1c1c9c1cm3_signal, 
                R_cm5c5cm2cm2c3c3c25cm3c4cm3c2c2c27cm10c5c7 => x_cm5c5cm2cm2c3c3c25cm3c4cm3c2c2c27cm10c5c7_signal, 
                R_cm33cm14c23cm2c15cm4c4c3c0cm9c2cm19cm4c11c13cm11 => x_cm33cm14c23cm2c15cm4c4c3c0cm9c2cm19cm4c11c13cm11_signal, 
                R_c5cm4cm2c12c6cm2cm5cm11cm4c8c21c7c10c0cm8cm8 => x_c5cm4cm2c12c6cm2cm5cm11cm4c8c21c7c10c0cm8cm8_signal, 
                R_c9c13c4cm6c0c11cm6c2c6cm15cm3c1cm12c13cm1cm2 => x_c9c13c4cm6c0c11cm6c2c6cm15cm3c1cm12c13cm1cm2_signal, 
                R_c15c11c7c6cm6c1cm1c54cm4c14cm3c7cm21c16c7cm32 => x_c15c11c7c6cm6c1cm1c54cm4c14cm3c7cm21c16c7cm32_signal, 
                R_c9cm11cm8c18c4c3cm4c2c5cm3c7cm14c3cm9c3cm8 => x_c9cm11cm8c18c4c3cm4c2c5cm3c7cm14c3cm9c3cm8_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c16c1c14c6c2c3c4c4c6cm5c2cm2cm2c0c2c1_signal;
    yo_2 <= x_cm2cm28cm2cm34c17c8c15c11c15cm12c11c5cm10cm3cm39cm3_signal;
    yo_3 <= x_c4c0cm15cm5cm3c2cm3c2c5c8cm4cm2c34c0c16c33_signal;
    yo_4 <= x_cm9c4c4cm6c16c4c48c3cm7c14c9c10c0c1cm7cm9_signal;
    yo_5 <= x_c34c9cm2c15cm8c14c5cm12cm27c28cm8cm3c5c1c3c7_signal;
    yo_6 <= x_c0cm12c11cm19c4cm4cm15cm17c6cm1cm34cm3c38cm1c8c0_signal;
    yo_7 <= x_c0c7c0cm12c23c10c0cm6cm7c4c9cm12cm8cm5c3cm2_signal;
    yo_8 <= x_c1cm13cm4cm12cm16c6cm5cm4c19cm3cm14c0cm2cm7cm5cm8_signal;
    yo_9 <= x_cm9c3c15cm23cm2cm24c4cm13cm3cm3c17c1cm2cm8c9cm4_signal;
    yo_10 <= x_c2c0c14cm1c2c0c4c9c5c1c11c14cm5c1c5c7_signal;
    yo_11 <= x_c11c3c5cm3cm1c45cm3cm3cm19cm6c24cm2cm2cm4cm1c4_signal;
    yo_12 <= x_cm6c2cm13c0cm13c1c1cm2c4c1c5c8c11cm15c3c11_signal;
    yo_13 <= x_c36cm21c3c8cm11c16c4c0c23cm18c1cm2cm1c6c6c4_signal;
    yo_14 <= x_cm2c11c13cm11cm8cm7cm7c8cm6cm2cm4c2cm26c17c1cm1_signal;
    yo_15 <= x_cm11cm7c6cm2c8cm19c10cm7cm12c16cm22c5c0cm3c3cm1_signal;
    yo_16 <= x_c4c105c9cm27c0c14c9cm3cm5cm12cm1c20cm5cm1c17cm6_signal;
    yo_17 <= x_cm24cm27c20c12c2c14c15c0c14c7c5c0cm2cm9cm6cm2_signal;
    yo_18 <= x_c2cm17c0cm2c20c3cm3c0c9cm3c13c2c1c7cm12c1_signal;
    yo_19 <= x_c1c14c15cm2cm5c12cm1c11c13cm11cm14c5cm3cm7c20cm6_signal;
    yo_20 <= x_cm1c34c5cm1cm27cm11c1c14cm5c6cm9cm1c5c18c7c6_signal;
    yo_21 <= x_c0cm50cm3cm25c2c0c5cm11c2c14c3cm10cm24cm7c13c0_signal;
    yo_22 <= x_cm9c11cm17cm22c26cm1c5c2cm5cm17cm21cm10c1c7cm2c12_signal;
    yo_23 <= x_cm37c16cm8c9cm5c12cm3c8c2cm8cm7c12cm10cm2cm1cm1_signal;
    yo_24 <= x_c16cm16cm8cm3cm6cm7c1c4cm29c3cm18c1c0c8c2c0_signal;
    yo_25 <= x_cm28c0c1cm15c19c1c4cm2c14cm3c15cm36cm2cm2cm9cm4_signal;
    yo_26 <= x_c24c13cm15c3cm18cm6cm6c1cm4cm4c5c1c1c9c1cm3_signal;
    yo_27 <= x_cm5c5cm2cm2c3c3c25cm3c4cm3c2c2c27cm10c5c7_signal;
    yo_28 <= x_cm33cm14c23cm2c15cm4c4c3c0cm9c2cm19cm4c11c13cm11_signal;
    yo_29 <= x_c5cm4cm2c12c6cm2cm5cm11cm4c8c21c7c10c0cm8cm8_signal;
    yo_30 <= x_c9c13c4cm6c0c11cm6c2c6cm15cm3c1cm12c13cm1cm2_signal;
    yo_31 <= x_c15c11c7c6cm6c1cm1c54cm4c14cm3c7cm21c16c7cm32_signal;
    yo_32 <= x_c9cm11cm8c18c4c3cm4c2c5cm3c7cm14c3cm9c3cm8_signal;



end structural;