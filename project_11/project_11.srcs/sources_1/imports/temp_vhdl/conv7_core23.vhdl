LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core23 is
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
        yo_2  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_4  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_9  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_10  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_16  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_22  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core23;

architecture structural of conv7_core23 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm19cm12c1c7c35cm3cm6c4c11cm5cm15c2cm2c0c9cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3c7c34cm4c8cm2c19c19c16c0c9c2cm4cm117cm2c0_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c16c4cm5cm14cm2c12cm36cm3cm58c1cm13c2c8c8c4c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm5c6cm31c1cm25c30c7cm10c2c5cm8c24cm2cm4c7c5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6c4c2cm16c3cm4cm4cm3cm3cm2c2cm2c12cm58cm9c18_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c4c0c12c1c4cm8cm5c18c6cm2cm1cm14c0c7c2c9_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c5cm13c4cm14c10c20c2c10cm22cm3c6c4cm2c2c1c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c11c0cm3c6cm4c8c1cm3cm2c0c5cm10c8c0c8c2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm2c1cm1c9cm7c5c13c2cm4c7c0cm1cm1cm2cm5c0_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c33c1cm6c12c6c2c1c3c4c2c2c0c0cm1c3cm12_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c10c8c3cm7cm2c2cm10cm17cm2c51c8cm1c1cm5cm17c3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm13c8cm3c6cm7c0c1c5c0c0c8c5c1cm1c4c1_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c7c9c11c3cm23cm13cm7cm3c18c3cm24c3cm6cm2cm2cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c10cm3c5cm1cm13c0c2cm2c12cm6c1c3c20cm1cm1c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm2c3c21cm6c24cm12c6c7c1cm1cm5c10cm3c6c5c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c28c7c3cm8cm6cm9c2c1cm37c5c2c1c1cm29c0c16_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c16cm10c9cm21c4cm3cm7c1c4c7c6cm3c18cm6c5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm26cm2c22c4c9c5c17cm1c3c3cm5cm1c1cm2cm1cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c14c1cm9cm4c1cm6cm7c6cm1cm1cm9c22cm1cm8cm3cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm7c1cm3cm9c2c5c1c10cm40cm6cm1cm79cm3cm7c0cm2_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm13cm10c2c3c9c10cm7cm3cm12cm8c9c17c1c47cm1cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c11c0cm5c6cm12cm3cm18c17c10c4cm11c3cm2c0cm8c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c12cm15c2c6cm2cm2cm5cm6c14c30c2c2cm7cm12c11c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c5c15c5c5c14cm9c3cm3c6cm4c5c2cm33cm2c4c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c21cm24c10c1c2c2c5c0c7c3c6cm3c23cm1cm8c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c2c3c2cm2cm2c17c2c0c18cm1c0cm6c5cm2c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2c7cm1cm26c0c1cm8c4cm5cm4c47c22c2c1cm3cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c6c18cm6c1c1cm7cm9c1c3c3cm5cm4c4c9c8c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c5c5c3c5cm12c2cm6c5c2c5c9c2cm24cm1cm2cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm26c15cm20c2c15c1c4cm10cm4c5c8cm1cm1cm10cm2c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1c14cm2c19cm13c7cm3c1c1cm2c1cm24cm8cm5cm3c2_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm2cm7c4c28cm7cm6cm14cm11c3c1cm48c2c10cm5c11cm12_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core23_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm19cm12c1c7c35cm3cm6c4c11cm5cm15c2cm2c0c9cm3 => x_cm19cm12c1c7c35cm3cm6c4c11cm5cm15c2cm2c0c9cm3_signal, 
                R_c3c7c34cm4c8cm2c19c19c16c0c9c2cm4cm117cm2c0 => x_c3c7c34cm4c8cm2c19c19c16c0c9c2cm4cm117cm2c0_signal, 
                R_c16c4cm5cm14cm2c12cm36cm3cm58c1cm13c2c8c8c4c0 => x_c16c4cm5cm14cm2c12cm36cm3cm58c1cm13c2c8c8c4c0_signal, 
                R_cm5c6cm31c1cm25c30c7cm10c2c5cm8c24cm2cm4c7c5 => x_cm5c6cm31c1cm25c30c7cm10c2c5cm8c24cm2cm4c7c5_signal, 
                R_c6c4c2cm16c3cm4cm4cm3cm3cm2c2cm2c12cm58cm9c18 => x_c6c4c2cm16c3cm4cm4cm3cm3cm2c2cm2c12cm58cm9c18_signal, 
                R_c4c0c12c1c4cm8cm5c18c6cm2cm1cm14c0c7c2c9 => x_c4c0c12c1c4cm8cm5c18c6cm2cm1cm14c0c7c2c9_signal, 
                R_c5cm13c4cm14c10c20c2c10cm22cm3c6c4cm2c2c1c3 => x_c5cm13c4cm14c10c20c2c10cm22cm3c6c4cm2c2c1c3_signal, 
                R_c11c0cm3c6cm4c8c1cm3cm2c0c5cm10c8c0c8c2 => x_c11c0cm3c6cm4c8c1cm3cm2c0c5cm10c8c0c8c2_signal, 
                R_cm2c1cm1c9cm7c5c13c2cm4c7c0cm1cm1cm2cm5c0 => x_cm2c1cm1c9cm7c5c13c2cm4c7c0cm1cm1cm2cm5c0_signal, 
                R_c33c1cm6c12c6c2c1c3c4c2c2c0c0cm1c3cm12 => x_c33c1cm6c12c6c2c1c3c4c2c2c0c0cm1c3cm12_signal, 
                R_c10c8c3cm7cm2c2cm10cm17cm2c51c8cm1c1cm5cm17c3 => x_c10c8c3cm7cm2c2cm10cm17cm2c51c8cm1c1cm5cm17c3_signal, 
                R_cm13c8cm3c6cm7c0c1c5c0c0c8c5c1cm1c4c1 => x_cm13c8cm3c6cm7c0c1c5c0c0c8c5c1cm1c4c1_signal, 
                R_c7c9c11c3cm23cm13cm7cm3c18c3cm24c3cm6cm2cm2cm5 => x_c7c9c11c3cm23cm13cm7cm3c18c3cm24c3cm6cm2cm2cm5_signal, 
                R_c10cm3c5cm1cm13c0c2cm2c12cm6c1c3c20cm1cm1c1 => x_c10cm3c5cm1cm13c0c2cm2c12cm6c1c3c20cm1cm1c1_signal, 
                R_cm2c3c21cm6c24cm12c6c7c1cm1cm5c10cm3c6c5c0 => x_cm2c3c21cm6c24cm12c6c7c1cm1cm5c10cm3c6c5c0_signal, 
                R_c28c7c3cm8cm6cm9c2c1cm37c5c2c1c1cm29c0c16 => x_c28c7c3cm8cm6cm9c2c1cm37c5c2c1c1cm29c0c16_signal, 
                R_c0c16cm10c9cm21c4cm3cm7c1c4c7c6cm3c18cm6c5 => x_c0c16cm10c9cm21c4cm3cm7c1c4c7c6cm3c18cm6c5_signal, 
                R_cm26cm2c22c4c9c5c17cm1c3c3cm5cm1c1cm2cm1cm5 => x_cm26cm2c22c4c9c5c17cm1c3c3cm5cm1c1cm2cm1cm5_signal, 
                R_c14c1cm9cm4c1cm6cm7c6cm1cm1cm9c22cm1cm8cm3cm3 => x_c14c1cm9cm4c1cm6cm7c6cm1cm1cm9c22cm1cm8cm3cm3_signal, 
                R_cm7c1cm3cm9c2c5c1c10cm40cm6cm1cm79cm3cm7c0cm2 => x_cm7c1cm3cm9c2c5c1c10cm40cm6cm1cm79cm3cm7c0cm2_signal, 
                R_cm13cm10c2c3c9c10cm7cm3cm12cm8c9c17c1c47cm1cm2 => x_cm13cm10c2c3c9c10cm7cm3cm12cm8c9c17c1c47cm1cm2_signal, 
                R_c11c0cm5c6cm12cm3cm18c17c10c4cm11c3cm2c0cm8c2 => x_c11c0cm5c6cm12cm3cm18c17c10c4cm11c3cm2c0cm8c2_signal, 
                R_c12cm15c2c6cm2cm2cm5cm6c14c30c2c2cm7cm12c11c3 => x_c12cm15c2c6cm2cm2cm5cm6c14c30c2c2cm7cm12c11c3_signal, 
                R_c5c15c5c5c14cm9c3cm3c6cm4c5c2cm33cm2c4c2 => x_c5c15c5c5c14cm9c3cm3c6cm4c5c2cm33cm2c4c2_signal, 
                R_c21cm24c10c1c2c2c5c0c7c3c6cm3c23cm1cm8c1 => x_c21cm24c10c1c2c2c5c0c7c3c6cm3c23cm1cm8c1_signal, 
                R_c0c2c3c2cm2cm2c17c2c0c18cm1c0cm6c5cm2c1 => x_c0c2c3c2cm2cm2c17c2c0c18cm1c0cm6c5cm2c1_signal, 
                R_c2c7cm1cm26c0c1cm8c4cm5cm4c47c22c2c1cm3cm4 => x_c2c7cm1cm26c0c1cm8c4cm5cm4c47c22c2c1cm3cm4_signal, 
                R_c6c18cm6c1c1cm7cm9c1c3c3cm5cm4c4c9c8c1 => x_c6c18cm6c1c1cm7cm9c1c3c3cm5cm4c4c9c8c1_signal, 
                R_c5c5c3c5cm12c2cm6c5c2c5c9c2cm24cm1cm2cm1 => x_c5c5c3c5cm12c2cm6c5c2c5c9c2cm24cm1cm2cm1_signal, 
                R_cm26c15cm20c2c15c1c4cm10cm4c5c8cm1cm1cm10cm2c3 => x_cm26c15cm20c2c15c1c4cm10cm4c5c8cm1cm1cm10cm2c3_signal, 
                R_c1c14cm2c19cm13c7cm3c1c1cm2c1cm24cm8cm5cm3c2 => x_c1c14cm2c19cm13c7cm3c1c1cm2c1cm24cm8cm5cm3c2_signal, 
                R_cm2cm7c4c28cm7cm6cm14cm11c3c1cm48c2c10cm5c11cm12 => x_cm2cm7c4c28cm7cm6cm14cm11c3c1cm48c2c10cm5c11cm12_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm19cm12c1c7c35cm3cm6c4c11cm5cm15c2cm2c0c9cm3_signal;
    yo_2 <= x_c3c7c34cm4c8cm2c19c19c16c0c9c2cm4cm117cm2c0_signal;
    yo_3 <= x_c16c4cm5cm14cm2c12cm36cm3cm58c1cm13c2c8c8c4c0_signal;
    yo_4 <= x_cm5c6cm31c1cm25c30c7cm10c2c5cm8c24cm2cm4c7c5_signal;
    yo_5 <= x_c6c4c2cm16c3cm4cm4cm3cm3cm2c2cm2c12cm58cm9c18_signal;
    yo_6 <= x_c4c0c12c1c4cm8cm5c18c6cm2cm1cm14c0c7c2c9_signal;
    yo_7 <= x_c5cm13c4cm14c10c20c2c10cm22cm3c6c4cm2c2c1c3_signal;
    yo_8 <= x_c11c0cm3c6cm4c8c1cm3cm2c0c5cm10c8c0c8c2_signal;
    yo_9 <= x_cm2c1cm1c9cm7c5c13c2cm4c7c0cm1cm1cm2cm5c0_signal;
    yo_10 <= x_c33c1cm6c12c6c2c1c3c4c2c2c0c0cm1c3cm12_signal;
    yo_11 <= x_c10c8c3cm7cm2c2cm10cm17cm2c51c8cm1c1cm5cm17c3_signal;
    yo_12 <= x_cm13c8cm3c6cm7c0c1c5c0c0c8c5c1cm1c4c1_signal;
    yo_13 <= x_c7c9c11c3cm23cm13cm7cm3c18c3cm24c3cm6cm2cm2cm5_signal;
    yo_14 <= x_c10cm3c5cm1cm13c0c2cm2c12cm6c1c3c20cm1cm1c1_signal;
    yo_15 <= x_cm2c3c21cm6c24cm12c6c7c1cm1cm5c10cm3c6c5c0_signal;
    yo_16 <= x_c28c7c3cm8cm6cm9c2c1cm37c5c2c1c1cm29c0c16_signal;
    yo_17 <= x_c0c16cm10c9cm21c4cm3cm7c1c4c7c6cm3c18cm6c5_signal;
    yo_18 <= x_cm26cm2c22c4c9c5c17cm1c3c3cm5cm1c1cm2cm1cm5_signal;
    yo_19 <= x_c14c1cm9cm4c1cm6cm7c6cm1cm1cm9c22cm1cm8cm3cm3_signal;
    yo_20 <= x_cm7c1cm3cm9c2c5c1c10cm40cm6cm1cm79cm3cm7c0cm2_signal;
    yo_21 <= x_cm13cm10c2c3c9c10cm7cm3cm12cm8c9c17c1c47cm1cm2_signal;
    yo_22 <= x_c11c0cm5c6cm12cm3cm18c17c10c4cm11c3cm2c0cm8c2_signal;
    yo_23 <= x_c12cm15c2c6cm2cm2cm5cm6c14c30c2c2cm7cm12c11c3_signal;
    yo_24 <= x_c5c15c5c5c14cm9c3cm3c6cm4c5c2cm33cm2c4c2_signal;
    yo_25 <= x_c21cm24c10c1c2c2c5c0c7c3c6cm3c23cm1cm8c1_signal;
    yo_26 <= x_c0c2c3c2cm2cm2c17c2c0c18cm1c0cm6c5cm2c1_signal;
    yo_27 <= x_c2c7cm1cm26c0c1cm8c4cm5cm4c47c22c2c1cm3cm4_signal;
    yo_28 <= x_c6c18cm6c1c1cm7cm9c1c3c3cm5cm4c4c9c8c1_signal;
    yo_29 <= x_c5c5c3c5cm12c2cm6c5c2c5c9c2cm24cm1cm2cm1_signal;
    yo_30 <= x_cm26c15cm20c2c15c1c4cm10cm4c5c8cm1cm1cm10cm2c3_signal;
    yo_31 <= x_c1c14cm2c19cm13c7cm3c1c1cm2c1cm24cm8cm5cm3c2_signal;
    yo_32 <= x_cm2cm7c4c28cm7cm6cm14cm11c3c1cm48c2c10cm5c11cm12_signal;



end structural;