LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core32 is
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
        yo_3  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_7  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_13  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_14  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_19  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_24  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(3, -10)
    );
end conv7_core32;

architecture structural of conv7_core32 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm6c8c2c5c11cm3cm11cm1cm4cm5cm5c4c3c11c2c4_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c19cm3cm51c1c0c14cm17c2cm11c6c41cm6c0c21c6c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c127c2c8cm24c13cm3c1cm2c8cm1c6cm11c4c26cm7cm4_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c4cm1cm3c2c0cm5cm40cm11c5c1cm3cm8cm17cm1c34cm7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2c0c11c6cm14cm2c14cm12c31c2cm43cm1cm19c3c6c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm7c0c3c10cm2c3cm26cm15c11cm3c3cm4c1c1c4c4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm11c3c2cm4cm12cm9c2cm13cm54cm1cm2c12cm73c9cm1c77_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c3c6cm1c1c18c4c25cm27cm8cm8c8cm1cm8cm19c16cm25_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c3c9c7cm2cm5c25c7c6cm9cm3c14c8c1c53c4c3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c10cm4cm2c7cm4c1cm4c18c9c3c3cm4cm2cm7cm1cm20_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c7cm5cm2cm2cm14c30cm4cm2cm8cm18cm4cm7cm6c5cm20cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c9cm7c0cm3c0c5c0c5cm24c1c19c9cm3c1cm32cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c2c39cm3c27c5c6cm1c1cm16cm3c1cm9cm15c0c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm12c15c2c2c10cm6cm4c7c3c7c8cm7c95c4c0c0_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c0c6c6c1c4c17cm17c12c1cm4cm2cm3c8cm23cm36cm13_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c10c3cm13c3cm9c9cm4c8cm5cm16cm1cm10c0cm16cm7cm17_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1c1c1cm5c7c22c5c12cm10cm5c7cm2c0c2cm5c7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2cm1c5cm2cm27c1c1c1c9c0c16cm3cm4c0c1c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm7cm10c6cm93cm4cm4cm6cm16c37cm27cm3c4c6cm91cm3cm13_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm8c10cm1cm10c51c1cm2cm7c1c21c3cm6cm8c2cm2cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm4cm4c8cm3c6cm5c3c9c16c1cm9cm5cm1c1c6cm10_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c3cm2c0c0c15cm7cm15cm17cm2c0c8c7cm1c1cm36c18_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm10cm58c0c2c8cm2c7c2c14c2c2cm1cm14cm8c3cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c10cm1c0cm8cm10c3c2cm7c2c0cm6c1cm2c7cm4_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm6c13cm2c3c31c7c6c4cm10cm5cm6c3c19c6cm56cm6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3c4c2c2c3cm18c7cm3c2cm8c0cm4cm9c1cm1cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm2cm37cm29cm2cm5cm6cm14c9c1c0c1cm14cm63cm4c0cm6_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm10c1c13cm8c15c14cm4cm3cm5cm8cm1cm11c7cm7c17c13_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0cm1c6cm2cm10c24c1c0c8c0cm2c12c15c2c5c6_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm12cm1cm6c1cm12c3cm6cm1c16cm23cm5c2cm5cm50cm4c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c37c4c2cm28c20cm8c3c11cm3c3c0cm20cm6cm49c4cm18_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm4cm5c13cm5cm1cm3cm32c4c2cm9c18c27cm1cm7cm3cm23_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core32_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm6c8c2c5c11cm3cm11cm1cm4cm5cm5c4c3c11c2c4 => x_cm6c8c2c5c11cm3cm11cm1cm4cm5cm5c4c3c11c2c4_signal, 
                R_c19cm3cm51c1c0c14cm17c2cm11c6c41cm6c0c21c6c1 => x_c19cm3cm51c1c0c14cm17c2cm11c6c41cm6c0c21c6c1_signal, 
                R_c127c2c8cm24c13cm3c1cm2c8cm1c6cm11c4c26cm7cm4 => x_c127c2c8cm24c13cm3c1cm2c8cm1c6cm11c4c26cm7cm4_signal, 
                R_c4cm1cm3c2c0cm5cm40cm11c5c1cm3cm8cm17cm1c34cm7 => x_c4cm1cm3c2c0cm5cm40cm11c5c1cm3cm8cm17cm1c34cm7_signal, 
                R_c2c0c11c6cm14cm2c14cm12c31c2cm43cm1cm19c3c6c1 => x_c2c0c11c6cm14cm2c14cm12c31c2cm43cm1cm19c3c6c1_signal, 
                R_cm7c0c3c10cm2c3cm26cm15c11cm3c3cm4c1c1c4c4 => x_cm7c0c3c10cm2c3cm26cm15c11cm3c3cm4c1c1c4c4_signal, 
                R_cm11c3c2cm4cm12cm9c2cm13cm54cm1cm2c12cm73c9cm1c77 => x_cm11c3c2cm4cm12cm9c2cm13cm54cm1cm2c12cm73c9cm1c77_signal, 
                R_c3c6cm1c1c18c4c25cm27cm8cm8c8cm1cm8cm19c16cm25 => x_c3c6cm1c1c18c4c25cm27cm8cm8c8cm1cm8cm19c16cm25_signal, 
                R_c3c9c7cm2cm5c25c7c6cm9cm3c14c8c1c53c4c3 => x_c3c9c7cm2cm5c25c7c6cm9cm3c14c8c1c53c4c3_signal, 
                R_c10cm4cm2c7cm4c1cm4c18c9c3c3cm4cm2cm7cm1cm20 => x_c10cm4cm2c7cm4c1cm4c18c9c3c3cm4cm2cm7cm1cm20_signal, 
                R_c7cm5cm2cm2cm14c30cm4cm2cm8cm18cm4cm7cm6c5cm20cm6 => x_c7cm5cm2cm2cm14c30cm4cm2cm8cm18cm4cm7cm6c5cm20cm6_signal, 
                R_c9cm7c0cm3c0c5c0c5cm24c1c19c9cm3c1cm32cm5 => x_c9cm7c0cm3c0c5c0c5cm24c1c19c9cm3c1cm32cm5_signal, 
                R_c0c2c39cm3c27c5c6cm1c1cm16cm3c1cm9cm15c0c2 => x_c0c2c39cm3c27c5c6cm1c1cm16cm3c1cm9cm15c0c2_signal, 
                R_cm12c15c2c2c10cm6cm4c7c3c7c8cm7c95c4c0c0 => x_cm12c15c2c2c10cm6cm4c7c3c7c8cm7c95c4c0c0_signal, 
                R_c0c6c6c1c4c17cm17c12c1cm4cm2cm3c8cm23cm36cm13 => x_c0c6c6c1c4c17cm17c12c1cm4cm2cm3c8cm23cm36cm13_signal, 
                R_c10c3cm13c3cm9c9cm4c8cm5cm16cm1cm10c0cm16cm7cm17 => x_c10c3cm13c3cm9c9cm4c8cm5cm16cm1cm10c0cm16cm7cm17_signal, 
                R_c1c1c1cm5c7c22c5c12cm10cm5c7cm2c0c2cm5c7 => x_c1c1c1cm5c7c22c5c12cm10cm5c7cm2c0c2cm5c7_signal, 
                R_c2cm1c5cm2cm27c1c1c1c9c0c16cm3cm4c0c1c3 => x_c2cm1c5cm2cm27c1c1c1c9c0c16cm3cm4c0c1c3_signal, 
                R_cm7cm10c6cm93cm4cm4cm6cm16c37cm27cm3c4c6cm91cm3cm13 => x_cm7cm10c6cm93cm4cm4cm6cm16c37cm27cm3c4c6cm91cm3cm13_signal, 
                R_cm8c10cm1cm10c51c1cm2cm7c1c21c3cm6cm8c2cm2cm1 => x_cm8c10cm1cm10c51c1cm2cm7c1c21c3cm6cm8c2cm2cm1_signal, 
                R_cm4cm4c8cm3c6cm5c3c9c16c1cm9cm5cm1c1c6cm10 => x_cm4cm4c8cm3c6cm5c3c9c16c1cm9cm5cm1c1c6cm10_signal, 
                R_c3cm2c0c0c15cm7cm15cm17cm2c0c8c7cm1c1cm36c18 => x_c3cm2c0c0c15cm7cm15cm17cm2c0c8c7cm1c1cm36c18_signal, 
                R_cm10cm58c0c2c8cm2c7c2c14c2c2cm1cm14cm8c3cm2 => x_cm10cm58c0c2c8cm2c7c2c14c2c2cm1cm14cm8c3cm2_signal, 
                R_c0c10cm1c0cm8cm10c3c2cm7c2c0cm6c1cm2c7cm4 => x_c0c10cm1c0cm8cm10c3c2cm7c2c0cm6c1cm2c7cm4_signal, 
                R_cm6c13cm2c3c31c7c6c4cm10cm5cm6c3c19c6cm56cm6 => x_cm6c13cm2c3c31c7c6c4cm10cm5cm6c3c19c6cm56cm6_signal, 
                R_c3c4c2c2c3cm18c7cm3c2cm8c0cm4cm9c1cm1cm1 => x_c3c4c2c2c3cm18c7cm3c2cm8c0cm4cm9c1cm1cm1_signal, 
                R_cm2cm37cm29cm2cm5cm6cm14c9c1c0c1cm14cm63cm4c0cm6 => x_cm2cm37cm29cm2cm5cm6cm14c9c1c0c1cm14cm63cm4c0cm6_signal, 
                R_cm10c1c13cm8c15c14cm4cm3cm5cm8cm1cm11c7cm7c17c13 => x_cm10c1c13cm8c15c14cm4cm3cm5cm8cm1cm11c7cm7c17c13_signal, 
                R_c0cm1c6cm2cm10c24c1c0c8c0cm2c12c15c2c5c6 => x_c0cm1c6cm2cm10c24c1c0c8c0cm2c12c15c2c5c6_signal, 
                R_cm12cm1cm6c1cm12c3cm6cm1c16cm23cm5c2cm5cm50cm4c0 => x_cm12cm1cm6c1cm12c3cm6cm1c16cm23cm5c2cm5cm50cm4c0_signal, 
                R_c37c4c2cm28c20cm8c3c11cm3c3c0cm20cm6cm49c4cm18 => x_c37c4c2cm28c20cm8c3c11cm3c3c0cm20cm6cm49c4cm18_signal, 
                R_cm4cm5c13cm5cm1cm3cm32c4c2cm9c18c27cm1cm7cm3cm23 => x_cm4cm5c13cm5cm1cm3cm32c4c2cm9c18c27cm1cm7cm3cm23_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm6c8c2c5c11cm3cm11cm1cm4cm5cm5c4c3c11c2c4_signal;
    yo_2 <= x_c19cm3cm51c1c0c14cm17c2cm11c6c41cm6c0c21c6c1_signal;
    yo_3 <= x_c127c2c8cm24c13cm3c1cm2c8cm1c6cm11c4c26cm7cm4_signal;
    yo_4 <= x_c4cm1cm3c2c0cm5cm40cm11c5c1cm3cm8cm17cm1c34cm7_signal;
    yo_5 <= x_c2c0c11c6cm14cm2c14cm12c31c2cm43cm1cm19c3c6c1_signal;
    yo_6 <= x_cm7c0c3c10cm2c3cm26cm15c11cm3c3cm4c1c1c4c4_signal;
    yo_7 <= x_cm11c3c2cm4cm12cm9c2cm13cm54cm1cm2c12cm73c9cm1c77_signal;
    yo_8 <= x_c3c6cm1c1c18c4c25cm27cm8cm8c8cm1cm8cm19c16cm25_signal;
    yo_9 <= x_c3c9c7cm2cm5c25c7c6cm9cm3c14c8c1c53c4c3_signal;
    yo_10 <= x_c10cm4cm2c7cm4c1cm4c18c9c3c3cm4cm2cm7cm1cm20_signal;
    yo_11 <= x_c7cm5cm2cm2cm14c30cm4cm2cm8cm18cm4cm7cm6c5cm20cm6_signal;
    yo_12 <= x_c9cm7c0cm3c0c5c0c5cm24c1c19c9cm3c1cm32cm5_signal;
    yo_13 <= x_c0c2c39cm3c27c5c6cm1c1cm16cm3c1cm9cm15c0c2_signal;
    yo_14 <= x_cm12c15c2c2c10cm6cm4c7c3c7c8cm7c95c4c0c0_signal;
    yo_15 <= x_c0c6c6c1c4c17cm17c12c1cm4cm2cm3c8cm23cm36cm13_signal;
    yo_16 <= x_c10c3cm13c3cm9c9cm4c8cm5cm16cm1cm10c0cm16cm7cm17_signal;
    yo_17 <= x_c1c1c1cm5c7c22c5c12cm10cm5c7cm2c0c2cm5c7_signal;
    yo_18 <= x_c2cm1c5cm2cm27c1c1c1c9c0c16cm3cm4c0c1c3_signal;
    yo_19 <= x_cm7cm10c6cm93cm4cm4cm6cm16c37cm27cm3c4c6cm91cm3cm13_signal;
    yo_20 <= x_cm8c10cm1cm10c51c1cm2cm7c1c21c3cm6cm8c2cm2cm1_signal;
    yo_21 <= x_cm4cm4c8cm3c6cm5c3c9c16c1cm9cm5cm1c1c6cm10_signal;
    yo_22 <= x_c3cm2c0c0c15cm7cm15cm17cm2c0c8c7cm1c1cm36c18_signal;
    yo_23 <= x_cm10cm58c0c2c8cm2c7c2c14c2c2cm1cm14cm8c3cm2_signal;
    yo_24 <= x_c0c10cm1c0cm8cm10c3c2cm7c2c0cm6c1cm2c7cm4_signal;
    yo_25 <= x_cm6c13cm2c3c31c7c6c4cm10cm5cm6c3c19c6cm56cm6_signal;
    yo_26 <= x_c3c4c2c2c3cm18c7cm3c2cm8c0cm4cm9c1cm1cm1_signal;
    yo_27 <= x_cm2cm37cm29cm2cm5cm6cm14c9c1c0c1cm14cm63cm4c0cm6_signal;
    yo_28 <= x_cm10c1c13cm8c15c14cm4cm3cm5cm8cm1cm11c7cm7c17c13_signal;
    yo_29 <= x_c0cm1c6cm2cm10c24c1c0c8c0cm2c12c15c2c5c6_signal;
    yo_30 <= x_cm12cm1cm6c1cm12c3cm6cm1c16cm23cm5c2cm5cm50cm4c0_signal;
    yo_31 <= x_c37c4c2cm28c20cm8c3c11cm3c3c0cm20cm6cm49c4cm18_signal;
    yo_32 <= x_cm4cm5c13cm5cm1cm3cm32c4c2cm9c18c27cm1cm7cm3cm23_signal;



end structural;