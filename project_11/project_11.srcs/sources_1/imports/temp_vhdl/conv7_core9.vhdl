LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core9 is
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
        yo_4  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_7  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_13  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_16  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_22  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_29  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(3, -10)
    );
end conv7_core9;

architecture structural of conv7_core9 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c12cm15cm41cm9c0c0c4c0cm4c15c5c5c9cm5c9c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c14c14c20c12cm1cm36c0cm4c13c14cm2cm17c3c5cm2c14_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2c6c18c14cm2c5c7c0c17cm12c0cm7cm2c11c1cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1cm2c31c21c4c1c6cm11cm3c7c24c6cm2c6c7c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm2cm5cm39cm2c39cm11c4cm4cm12c1c16c5cm8cm14c11cm12_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3c0cm9cm2c0cm1c18cm2c5c13cm9c36c2cm3cm10cm22_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm19cm3c0c11cm3c5c1cm8cm42c10cm8c13c16cm3c1cm16_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm11c4c13c4cm11c2cm17cm12c5cm6cm5cm8cm22cm13c0cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6c14cm2c19cm3cm7c4cm2cm6c1cm3cm23c2cm23c13c34_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm12c5c3cm11c2cm1c1cm3cm1cm8c1cm1cm1c4c16c7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c4c7cm9cm1cm6c8c6cm3cm17c7cm6cm7c11c11cm37c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm9cm4cm5c14cm2c1cm5cm2cm2cm1c10cm13cm7cm1cm49c12_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3cm12cm1cm3c8cm18c0c2c22c4c2cm9c68cm12c2c4_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c13cm16cm3c6c6c2c4cm1cm8c18c19cm8c2cm6cm8c7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm5cm13c1c6cm2cm5c1c0c13c17cm6cm8cm9cm7c27c18_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c4c4c12c15c0c37c4cm115cm3cm5cm3c1c4cm21c0cm7_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c2c8c8c39c3c8c4c2cm8c2cm20cm14c8cm3c7c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c18c1c21cm7c1cm7cm1cm3c4c1c8cm3cm22cm3c2cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c21c1cm11c18c0c0c3cm4cm11cm30c19c8cm21cm11cm8c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c5cm19c4c5c2cm6c2c12cm3c19c6c8c16cm8cm1cm7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm3cm4cm17c2c1cm21cm2cm14c2cm49c0cm1c1cm40cm1cm12_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2c4cm5cm2c3c1c2c6cm3cm1c4c3c14c6c72cm22_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c6c7c1c6c8c12cm12c3cm3cm1c3c2cm40cm10cm50c12_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2cm52cm9c2c10cm5c1c4c28cm6c16cm9c9c25cm26cm7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c18cm5c6cm5c5cm1cm2cm5cm2c3cm17c20c8cm3cm1cm37_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1c25c9c1c0c7c2c2c2cm3cm5cm5cm7cm3cm19cm7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm3cm6cm6cm38c1c2cm7c5c1c2c2c2c0c4cm4cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c8c1cm7cm8cm2c7cm17c3cm13c8c10cm2c22c11cm15cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2cm1cm4c0c48cm14c2c0c8cm3cm12cm17c1c1c0c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c13cm1cm3cm3c8c10cm3c0cm1cm5c4c24cm7c7c18cm4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c14cm7cm1cm42c6cm5c1cm3cm8c16cm4c6cm5c8c4c13_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c13c17cm29c16c6c5cm6c0cm14cm4cm3cm7c6cm18c3cm10_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core9_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c12cm15cm41cm9c0c0c4c0cm4c15c5c5c9cm5c9c1 => x_c12cm15cm41cm9c0c0c4c0cm4c15c5c5c9cm5c9c1_signal, 
                R_c14c14c20c12cm1cm36c0cm4c13c14cm2cm17c3c5cm2c14 => x_c14c14c20c12cm1cm36c0cm4c13c14cm2cm17c3c5cm2c14_signal, 
                R_cm2c6c18c14cm2c5c7c0c17cm12c0cm7cm2c11c1cm1 => x_cm2c6c18c14cm2c5c7c0c17cm12c0cm7cm2c11c1cm1_signal, 
                R_c1cm2c31c21c4c1c6cm11cm3c7c24c6cm2c6c7c2 => x_c1cm2c31c21c4c1c6cm11cm3c7c24c6cm2c6c7c2_signal, 
                R_cm2cm5cm39cm2c39cm11c4cm4cm12c1c16c5cm8cm14c11cm12 => x_cm2cm5cm39cm2c39cm11c4cm4cm12c1c16c5cm8cm14c11cm12_signal, 
                R_cm3c0cm9cm2c0cm1c18cm2c5c13cm9c36c2cm3cm10cm22 => x_cm3c0cm9cm2c0cm1c18cm2c5c13cm9c36c2cm3cm10cm22_signal, 
                R_cm19cm3c0c11cm3c5c1cm8cm42c10cm8c13c16cm3c1cm16 => x_cm19cm3c0c11cm3c5c1cm8cm42c10cm8c13c16cm3c1cm16_signal, 
                R_cm11c4c13c4cm11c2cm17cm12c5cm6cm5cm8cm22cm13c0cm1 => x_cm11c4c13c4cm11c2cm17cm12c5cm6cm5cm8cm22cm13c0cm1_signal, 
                R_c6c14cm2c19cm3cm7c4cm2cm6c1cm3cm23c2cm23c13c34 => x_c6c14cm2c19cm3cm7c4cm2cm6c1cm3cm23c2cm23c13c34_signal, 
                R_cm12c5c3cm11c2cm1c1cm3cm1cm8c1cm1cm1c4c16c7 => x_cm12c5c3cm11c2cm1c1cm3cm1cm8c1cm1cm1c4c16c7_signal, 
                R_c4c7cm9cm1cm6c8c6cm3cm17c7cm6cm7c11c11cm37c2 => x_c4c7cm9cm1cm6c8c6cm3cm17c7cm6cm7c11c11cm37c2_signal, 
                R_cm9cm4cm5c14cm2c1cm5cm2cm2cm1c10cm13cm7cm1cm49c12 => x_cm9cm4cm5c14cm2c1cm5cm2cm2cm1c10cm13cm7cm1cm49c12_signal, 
                R_c3cm12cm1cm3c8cm18c0c2c22c4c2cm9c68cm12c2c4 => x_c3cm12cm1cm3c8cm18c0c2c22c4c2cm9c68cm12c2c4_signal, 
                R_c13cm16cm3c6c6c2c4cm1cm8c18c19cm8c2cm6cm8c7 => x_c13cm16cm3c6c6c2c4cm1cm8c18c19cm8c2cm6cm8c7_signal, 
                R_cm5cm13c1c6cm2cm5c1c0c13c17cm6cm8cm9cm7c27c18 => x_cm5cm13c1c6cm2cm5c1c0c13c17cm6cm8cm9cm7c27c18_signal, 
                R_c4c4c12c15c0c37c4cm115cm3cm5cm3c1c4cm21c0cm7 => x_c4c4c12c15c0c37c4cm115cm3cm5cm3c1c4cm21c0cm7_signal, 
                R_c2c8c8c39c3c8c4c2cm8c2cm20cm14c8cm3c7c0 => x_c2c8c8c39c3c8c4c2cm8c2cm20cm14c8cm3c7c0_signal, 
                R_c18c1c21cm7c1cm7cm1cm3c4c1c8cm3cm22cm3c2cm3 => x_c18c1c21cm7c1cm7cm1cm3c4c1c8cm3cm22cm3c2cm3_signal, 
                R_c21c1cm11c18c0c0c3cm4cm11cm30c19c8cm21cm11cm8c3 => x_c21c1cm11c18c0c0c3cm4cm11cm30c19c8cm21cm11cm8c3_signal, 
                R_c5cm19c4c5c2cm6c2c12cm3c19c6c8c16cm8cm1cm7 => x_c5cm19c4c5c2cm6c2c12cm3c19c6c8c16cm8cm1cm7_signal, 
                R_cm3cm4cm17c2c1cm21cm2cm14c2cm49c0cm1c1cm40cm1cm12 => x_cm3cm4cm17c2c1cm21cm2cm14c2cm49c0cm1c1cm40cm1cm12_signal, 
                R_cm2c4cm5cm2c3c1c2c6cm3cm1c4c3c14c6c72cm22 => x_cm2c4cm5cm2c3c1c2c6cm3cm1c4c3c14c6c72cm22_signal, 
                R_c6c7c1c6c8c12cm12c3cm3cm1c3c2cm40cm10cm50c12 => x_c6c7c1c6c8c12cm12c3cm3cm1c3c2cm40cm10cm50c12_signal, 
                R_cm2cm52cm9c2c10cm5c1c4c28cm6c16cm9c9c25cm26cm7 => x_cm2cm52cm9c2c10cm5c1c4c28cm6c16cm9c9c25cm26cm7_signal, 
                R_c18cm5c6cm5c5cm1cm2cm5cm2c3cm17c20c8cm3cm1cm37 => x_c18cm5c6cm5c5cm1cm2cm5cm2c3cm17c20c8cm3cm1cm37_signal, 
                R_cm1c25c9c1c0c7c2c2c2cm3cm5cm5cm7cm3cm19cm7 => x_cm1c25c9c1c0c7c2c2c2cm3cm5cm5cm7cm3cm19cm7_signal, 
                R_cm3cm6cm6cm38c1c2cm7c5c1c2c2c2c0c4cm4cm1 => x_cm3cm6cm6cm38c1c2cm7c5c1c2c2c2c0c4cm4cm1_signal, 
                R_c8c1cm7cm8cm2c7cm17c3cm13c8c10cm2c22c11cm15cm3 => x_c8c1cm7cm8cm2c7cm17c3cm13c8c10cm2c22c11cm15cm3_signal, 
                R_c2cm1cm4c0c48cm14c2c0c8cm3cm12cm17c1c1c0c2 => x_c2cm1cm4c0c48cm14c2c0c8cm3cm12cm17c1c1c0c2_signal, 
                R_c13cm1cm3cm3c8c10cm3c0cm1cm5c4c24cm7c7c18cm4 => x_c13cm1cm3cm3c8c10cm3c0cm1cm5c4c24cm7c7c18cm4_signal, 
                R_c14cm7cm1cm42c6cm5c1cm3cm8c16cm4c6cm5c8c4c13 => x_c14cm7cm1cm42c6cm5c1cm3cm8c16cm4c6cm5c8c4c13_signal, 
                R_c13c17cm29c16c6c5cm6c0cm14cm4cm3cm7c6cm18c3cm10 => x_c13c17cm29c16c6c5cm6c0cm14cm4cm3cm7c6cm18c3cm10_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c12cm15cm41cm9c0c0c4c0cm4c15c5c5c9cm5c9c1_signal;
    yo_2 <= x_c14c14c20c12cm1cm36c0cm4c13c14cm2cm17c3c5cm2c14_signal;
    yo_3 <= x_cm2c6c18c14cm2c5c7c0c17cm12c0cm7cm2c11c1cm1_signal;
    yo_4 <= x_c1cm2c31c21c4c1c6cm11cm3c7c24c6cm2c6c7c2_signal;
    yo_5 <= x_cm2cm5cm39cm2c39cm11c4cm4cm12c1c16c5cm8cm14c11cm12_signal;
    yo_6 <= x_cm3c0cm9cm2c0cm1c18cm2c5c13cm9c36c2cm3cm10cm22_signal;
    yo_7 <= x_cm19cm3c0c11cm3c5c1cm8cm42c10cm8c13c16cm3c1cm16_signal;
    yo_8 <= x_cm11c4c13c4cm11c2cm17cm12c5cm6cm5cm8cm22cm13c0cm1_signal;
    yo_9 <= x_c6c14cm2c19cm3cm7c4cm2cm6c1cm3cm23c2cm23c13c34_signal;
    yo_10 <= x_cm12c5c3cm11c2cm1c1cm3cm1cm8c1cm1cm1c4c16c7_signal;
    yo_11 <= x_c4c7cm9cm1cm6c8c6cm3cm17c7cm6cm7c11c11cm37c2_signal;
    yo_12 <= x_cm9cm4cm5c14cm2c1cm5cm2cm2cm1c10cm13cm7cm1cm49c12_signal;
    yo_13 <= x_c3cm12cm1cm3c8cm18c0c2c22c4c2cm9c68cm12c2c4_signal;
    yo_14 <= x_c13cm16cm3c6c6c2c4cm1cm8c18c19cm8c2cm6cm8c7_signal;
    yo_15 <= x_cm5cm13c1c6cm2cm5c1c0c13c17cm6cm8cm9cm7c27c18_signal;
    yo_16 <= x_c4c4c12c15c0c37c4cm115cm3cm5cm3c1c4cm21c0cm7_signal;
    yo_17 <= x_c2c8c8c39c3c8c4c2cm8c2cm20cm14c8cm3c7c0_signal;
    yo_18 <= x_c18c1c21cm7c1cm7cm1cm3c4c1c8cm3cm22cm3c2cm3_signal;
    yo_19 <= x_c21c1cm11c18c0c0c3cm4cm11cm30c19c8cm21cm11cm8c3_signal;
    yo_20 <= x_c5cm19c4c5c2cm6c2c12cm3c19c6c8c16cm8cm1cm7_signal;
    yo_21 <= x_cm3cm4cm17c2c1cm21cm2cm14c2cm49c0cm1c1cm40cm1cm12_signal;
    yo_22 <= x_cm2c4cm5cm2c3c1c2c6cm3cm1c4c3c14c6c72cm22_signal;
    yo_23 <= x_c6c7c1c6c8c12cm12c3cm3cm1c3c2cm40cm10cm50c12_signal;
    yo_24 <= x_cm2cm52cm9c2c10cm5c1c4c28cm6c16cm9c9c25cm26cm7_signal;
    yo_25 <= x_c18cm5c6cm5c5cm1cm2cm5cm2c3cm17c20c8cm3cm1cm37_signal;
    yo_26 <= x_cm1c25c9c1c0c7c2c2c2cm3cm5cm5cm7cm3cm19cm7_signal;
    yo_27 <= x_cm3cm6cm6cm38c1c2cm7c5c1c2c2c2c0c4cm4cm1_signal;
    yo_28 <= x_c8c1cm7cm8cm2c7cm17c3cm13c8c10cm2c22c11cm15cm3_signal;
    yo_29 <= x_c2cm1cm4c0c48cm14c2c0c8cm3cm12cm17c1c1c0c2_signal;
    yo_30 <= x_c13cm1cm3cm3c8c10cm3c0cm1cm5c4c24cm7c7c18cm4_signal;
    yo_31 <= x_c14cm7cm1cm42c6cm5c1cm3cm8c16cm4c6cm5c8c4c13_signal;
    yo_32 <= x_c13c17cm29c16c6c5cm6c0cm14cm4cm3cm7c6cm18c3cm10_signal;



end structural;