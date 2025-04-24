LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core13 is
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
        yo_2  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_4  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_7  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_13  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_16  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_18  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_19  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_22  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_25  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_26  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_28  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_29  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_30  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core13;

architecture structural of conv7_core13 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm2cm2c1c0cm7c6c0cm4c5c4cm8c5cm2c13c3c8_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c9cm11c0c44c6cm9cm3cm7c10cm22cm1c36cm36c0cm9cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2c9c2cm8c1c2c1c5cm4c4c0c1cm33c5c11c5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c66c3cm1c1cm7cm2c30cm3c4c1c12c9c7cm9cm17cm1_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c12cm20c4cm3cm13cm6cm3c45cm4c7c0c24c4c0c15c6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c9cm16cm34cm29c8cm2c32c2c0cm2cm8c3c4c3c7c10_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c5c20cm1cm20c35cm2c3c36cm5c6c1c2cm14c4c2cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm33cm1c8c15c5c25cm1cm37cm11c1c4c10c1c3cm8cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6cm1c0cm7cm7c17cm34cm2c21c7cm5cm10cm5c10c11cm12_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm5c2c16cm4cm11cm3cm2cm8cm7cm2cm10c22c5cm6c5c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm29c11cm17c10cm43cm3c11cm18c4cm13cm16cm5c11cm10c3cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3c1c14c12c5c0c4c2cm1cm2c15cm5c14cm6cm4cm6_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c5c5cm4cm3c7c16cm11cm17cm20c10c7c0c5c1cm40cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm4cm18cm23c22c17cm1cm9cm2cm16cm2c1c3cm12c21c2c4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm3cm1c12c3cm6cm2c10cm10c0cm7c9c1cm1c1c8c0_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c1cm74cm5cm14c4cm2cm3cm15c0c12cm2c12c2cm4cm5cm7_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c15c55c18c8c3cm22cm6cm19c14c13c3cm26cm6c5cm5cm11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6cm12c7cm4cm38c4c4cm13cm18c0c9c1c7c0c8c3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c4cm1cm22cm1cm22cm2cm18cm6cm24cm9cm8c8cm4cm22c8c48_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c8cm5c21cm9c5c52c0cm5cm1c14c1cm9cm10c7c4c19_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2cm8c6cm9c3cm4c8cm3cm2cm23c3c18c6c1c13cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm5cm22c7cm12c3c2cm12c14cm12cm3c22cm27c4cm3cm4c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c13c4cm19cm30cm38cm9c5c13cm10cm5c1c4c1c38cm5c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6cm16cm17c1cm4cm24cm9c4c34cm16cm18c0c0c26c8c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm8c0cm5cm12cm1cm8cm81cm3c9c1c7cm6cm16c4cm1c5_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm104c1c2c32cm33cm4cm18c9cm11cm6cm18c1c2c25c1c0_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm4c0c3c3c3c0cm9cm1cm1c1c3c6c6c21cm11cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c53c0cm53cm2c21c0c116c4c6cm21c14c7cm8c6c13cm3_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm13cm5cm4cm5cm14cm14c11c2cm8c3c2cm1c6c1c3cm8_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c1cm4c3c2c1cm16c1c0cm12cm5c5cm1cm3cm2c1c0_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c3cm10c0c8cm17c18cm15cm13cm5cm16c1c6cm49c6c3cm23_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c33cm8c0c2cm8cm31c3cm27cm4cm21cm6cm1cm1cm11c15cm8_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core13_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm2cm2c1c0cm7c6c0cm4c5c4cm8c5cm2c13c3c8 => x_cm2cm2c1c0cm7c6c0cm4c5c4cm8c5cm2c13c3c8_signal, 
                R_c9cm11c0c44c6cm9cm3cm7c10cm22cm1c36cm36c0cm9cm1 => x_c9cm11c0c44c6cm9cm3cm7c10cm22cm1c36cm36c0cm9cm1_signal, 
                R_c2c9c2cm8c1c2c1c5cm4c4c0c1cm33c5c11c5 => x_c2c9c2cm8c1c2c1c5cm4c4c0c1cm33c5c11c5_signal, 
                R_c66c3cm1c1cm7cm2c30cm3c4c1c12c9c7cm9cm17cm1 => x_c66c3cm1c1cm7cm2c30cm3c4c1c12c9c7cm9cm17cm1_signal, 
                R_c12cm20c4cm3cm13cm6cm3c45cm4c7c0c24c4c0c15c6 => x_c12cm20c4cm3cm13cm6cm3c45cm4c7c0c24c4c0c15c6_signal, 
                R_c9cm16cm34cm29c8cm2c32c2c0cm2cm8c3c4c3c7c10 => x_c9cm16cm34cm29c8cm2c32c2c0cm2cm8c3c4c3c7c10_signal, 
                R_c5c20cm1cm20c35cm2c3c36cm5c6c1c2cm14c4c2cm4 => x_c5c20cm1cm20c35cm2c3c36cm5c6c1c2cm14c4c2cm4_signal, 
                R_cm33cm1c8c15c5c25cm1cm37cm11c1c4c10c1c3cm8cm1 => x_cm33cm1c8c15c5c25cm1cm37cm11c1c4c10c1c3cm8cm1_signal, 
                R_cm6cm1c0cm7cm7c17cm34cm2c21c7cm5cm10cm5c10c11cm12 => x_cm6cm1c0cm7cm7c17cm34cm2c21c7cm5cm10cm5c10c11cm12_signal, 
                R_cm5c2c16cm4cm11cm3cm2cm8cm7cm2cm10c22c5cm6c5c3 => x_cm5c2c16cm4cm11cm3cm2cm8cm7cm2cm10c22c5cm6c5c3_signal, 
                R_cm29c11cm17c10cm43cm3c11cm18c4cm13cm16cm5c11cm10c3cm2 => x_cm29c11cm17c10cm43cm3c11cm18c4cm13cm16cm5c11cm10c3cm2_signal, 
                R_c3c1c14c12c5c0c4c2cm1cm2c15cm5c14cm6cm4cm6 => x_c3c1c14c12c5c0c4c2cm1cm2c15cm5c14cm6cm4cm6_signal, 
                R_c5c5cm4cm3c7c16cm11cm17cm20c10c7c0c5c1cm40cm3 => x_c5c5cm4cm3c7c16cm11cm17cm20c10c7c0c5c1cm40cm3_signal, 
                R_cm4cm18cm23c22c17cm1cm9cm2cm16cm2c1c3cm12c21c2c4 => x_cm4cm18cm23c22c17cm1cm9cm2cm16cm2c1c3cm12c21c2c4_signal, 
                R_cm3cm1c12c3cm6cm2c10cm10c0cm7c9c1cm1c1c8c0 => x_cm3cm1c12c3cm6cm2c10cm10c0cm7c9c1cm1c1c8c0_signal, 
                R_c1cm74cm5cm14c4cm2cm3cm15c0c12cm2c12c2cm4cm5cm7 => x_c1cm74cm5cm14c4cm2cm3cm15c0c12cm2c12c2cm4cm5cm7_signal, 
                R_c15c55c18c8c3cm22cm6cm19c14c13c3cm26cm6c5cm5cm11 => x_c15c55c18c8c3cm22cm6cm19c14c13c3cm26cm6c5cm5cm11_signal, 
                R_cm6cm12c7cm4cm38c4c4cm13cm18c0c9c1c7c0c8c3 => x_cm6cm12c7cm4cm38c4c4cm13cm18c0c9c1c7c0c8c3_signal, 
                R_c4cm1cm22cm1cm22cm2cm18cm6cm24cm9cm8c8cm4cm22c8c48 => x_c4cm1cm22cm1cm22cm2cm18cm6cm24cm9cm8c8cm4cm22c8c48_signal, 
                R_c8cm5c21cm9c5c52c0cm5cm1c14c1cm9cm10c7c4c19 => x_c8cm5c21cm9c5c52c0cm5cm1c14c1cm9cm10c7c4c19_signal, 
                R_c2cm8c6cm9c3cm4c8cm3cm2cm23c3c18c6c1c13cm1 => x_c2cm8c6cm9c3cm4c8cm3cm2cm23c3c18c6c1c13cm1_signal, 
                R_cm5cm22c7cm12c3c2cm12c14cm12cm3c22cm27c4cm3cm4c3 => x_cm5cm22c7cm12c3c2cm12c14cm12cm3c22cm27c4cm3cm4c3_signal, 
                R_c13c4cm19cm30cm38cm9c5c13cm10cm5c1c4c1c38cm5c2 => x_c13c4cm19cm30cm38cm9c5c13cm10cm5c1c4c1c38cm5c2_signal, 
                R_cm6cm16cm17c1cm4cm24cm9c4c34cm16cm18c0c0c26c8c0 => x_cm6cm16cm17c1cm4cm24cm9c4c34cm16cm18c0c0c26c8c0_signal, 
                R_cm8c0cm5cm12cm1cm8cm81cm3c9c1c7cm6cm16c4cm1c5 => x_cm8c0cm5cm12cm1cm8cm81cm3c9c1c7cm6cm16c4cm1c5_signal, 
                R_cm104c1c2c32cm33cm4cm18c9cm11cm6cm18c1c2c25c1c0 => x_cm104c1c2c32cm33cm4cm18c9cm11cm6cm18c1c2c25c1c0_signal, 
                R_cm4c0c3c3c3c0cm9cm1cm1c1c3c6c6c21cm11cm1 => x_cm4c0c3c3c3c0cm9cm1cm1c1c3c6c6c21cm11cm1_signal, 
                R_c53c0cm53cm2c21c0c116c4c6cm21c14c7cm8c6c13cm3 => x_c53c0cm53cm2c21c0c116c4c6cm21c14c7cm8c6c13cm3_signal, 
                R_cm13cm5cm4cm5cm14cm14c11c2cm8c3c2cm1c6c1c3cm8 => x_cm13cm5cm4cm5cm14cm14c11c2cm8c3c2cm1c6c1c3cm8_signal, 
                R_c1cm4c3c2c1cm16c1c0cm12cm5c5cm1cm3cm2c1c0 => x_c1cm4c3c2c1cm16c1c0cm12cm5c5cm1cm3cm2c1c0_signal, 
                R_c3cm10c0c8cm17c18cm15cm13cm5cm16c1c6cm49c6c3cm23 => x_c3cm10c0c8cm17c18cm15cm13cm5cm16c1c6cm49c6c3cm23_signal, 
                R_c33cm8c0c2cm8cm31c3cm27cm4cm21cm6cm1cm1cm11c15cm8 => x_c33cm8c0c2cm8cm31c3cm27cm4cm21cm6cm1cm1cm11c15cm8_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm2cm2c1c0cm7c6c0cm4c5c4cm8c5cm2c13c3c8_signal;
    yo_2 <= x_c9cm11c0c44c6cm9cm3cm7c10cm22cm1c36cm36c0cm9cm1_signal;
    yo_3 <= x_c2c9c2cm8c1c2c1c5cm4c4c0c1cm33c5c11c5_signal;
    yo_4 <= x_c66c3cm1c1cm7cm2c30cm3c4c1c12c9c7cm9cm17cm1_signal;
    yo_5 <= x_c12cm20c4cm3cm13cm6cm3c45cm4c7c0c24c4c0c15c6_signal;
    yo_6 <= x_c9cm16cm34cm29c8cm2c32c2c0cm2cm8c3c4c3c7c10_signal;
    yo_7 <= x_c5c20cm1cm20c35cm2c3c36cm5c6c1c2cm14c4c2cm4_signal;
    yo_8 <= x_cm33cm1c8c15c5c25cm1cm37cm11c1c4c10c1c3cm8cm1_signal;
    yo_9 <= x_cm6cm1c0cm7cm7c17cm34cm2c21c7cm5cm10cm5c10c11cm12_signal;
    yo_10 <= x_cm5c2c16cm4cm11cm3cm2cm8cm7cm2cm10c22c5cm6c5c3_signal;
    yo_11 <= x_cm29c11cm17c10cm43cm3c11cm18c4cm13cm16cm5c11cm10c3cm2_signal;
    yo_12 <= x_c3c1c14c12c5c0c4c2cm1cm2c15cm5c14cm6cm4cm6_signal;
    yo_13 <= x_c5c5cm4cm3c7c16cm11cm17cm20c10c7c0c5c1cm40cm3_signal;
    yo_14 <= x_cm4cm18cm23c22c17cm1cm9cm2cm16cm2c1c3cm12c21c2c4_signal;
    yo_15 <= x_cm3cm1c12c3cm6cm2c10cm10c0cm7c9c1cm1c1c8c0_signal;
    yo_16 <= x_c1cm74cm5cm14c4cm2cm3cm15c0c12cm2c12c2cm4cm5cm7_signal;
    yo_17 <= x_c15c55c18c8c3cm22cm6cm19c14c13c3cm26cm6c5cm5cm11_signal;
    yo_18 <= x_cm6cm12c7cm4cm38c4c4cm13cm18c0c9c1c7c0c8c3_signal;
    yo_19 <= x_c4cm1cm22cm1cm22cm2cm18cm6cm24cm9cm8c8cm4cm22c8c48_signal;
    yo_20 <= x_c8cm5c21cm9c5c52c0cm5cm1c14c1cm9cm10c7c4c19_signal;
    yo_21 <= x_c2cm8c6cm9c3cm4c8cm3cm2cm23c3c18c6c1c13cm1_signal;
    yo_22 <= x_cm5cm22c7cm12c3c2cm12c14cm12cm3c22cm27c4cm3cm4c3_signal;
    yo_23 <= x_c13c4cm19cm30cm38cm9c5c13cm10cm5c1c4c1c38cm5c2_signal;
    yo_24 <= x_cm6cm16cm17c1cm4cm24cm9c4c34cm16cm18c0c0c26c8c0_signal;
    yo_25 <= x_cm8c0cm5cm12cm1cm8cm81cm3c9c1c7cm6cm16c4cm1c5_signal;
    yo_26 <= x_cm104c1c2c32cm33cm4cm18c9cm11cm6cm18c1c2c25c1c0_signal;
    yo_27 <= x_cm4c0c3c3c3c0cm9cm1cm1c1c3c6c6c21cm11cm1_signal;
    yo_28 <= x_c53c0cm53cm2c21c0c116c4c6cm21c14c7cm8c6c13cm3_signal;
    yo_29 <= x_cm13cm5cm4cm5cm14cm14c11c2cm8c3c2cm1c6c1c3cm8_signal;
    yo_30 <= x_c1cm4c3c2c1cm16c1c0cm12cm5c5cm1cm3cm2c1c0_signal;
    yo_31 <= x_c3cm10c0c8cm17c18cm15cm13cm5cm16c1c6cm49c6c3cm23_signal;
    yo_32 <= x_c33cm8c0c2cm8cm31c3cm27cm4cm21cm6cm1cm1cm11c15cm8_signal;



end structural;