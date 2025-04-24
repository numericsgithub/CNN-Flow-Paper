LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core21 is
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
        yo_2  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_12  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_13  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_15  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_16  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_18  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_20  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_21  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_22  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_23  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_25  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(3, -10)
    );
end conv7_core21;

architecture structural of conv7_core21 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm5cm7cm2cm3cm5c10cm1c14c8c2cm13c6cm8cm7cm5cm11_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c3cm1cm12c4cm1cm13cm13cm12cm28cm7cm4cm1c34c0cm74c0_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c50c5cm13cm56cm8cm30cm5c4cm9cm6c13cm5cm12c1cm20c19_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3cm10c2cm4c3cm3c9cm3cm7c23cm13cm2c7c40c8c5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3cm5c5c8c10cm12c9c8cm3cm9c0c11c3cm8c2cm5_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm29c1cm1c1cm5c15cm3c25c9c0cm9cm4cm32c3cm2c8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm2cm2c0c0cm4cm5c1cm17c11c8c2c6cm11cm2cm2cm16_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1cm14cm8cm4cm3c24c12c0c4c14c17c8c1cm13cm9c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1c1c12cm10cm12cm2cm45c18cm12cm41cm2c3c5cm3cm12cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm9c1c7cm10c5cm6c38c12c8c1cm2c22c15c2c2cm15_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6c8cm5c0cm4cm1cm6c19cm8cm18cm4cm7c1cm7cm1c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c4c40c8c5cm2cm1c1cm7c8c0cm2c4cm6cm8cm3c5_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0cm8c32c4cm5c0c3cm1cm3cm12cm8c4cm3c2cm29cm9_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3c3cm2c1cm14c4c3c1cm17c0c1c0c8c7cm9c4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c7c6cm1c2cm16c1c3cm6cm7cm14c0c2c8cm11cm6_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm17c0c33cm5cm3c15cm1cm2cm4cm14c10c0cm20c0c31cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm7cm7cm1c2cm6cm5cm24c3c4cm2c4cm12cm4cm2c0cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6c11cm2cm1c7c10cm4c9cm5c1c46c2cm5c0cm23c1_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c1cm6c10cm23cm10cm4c3cm3cm17c1c3c2c15cm2cm5cm29_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c4c6c8cm5c1c1cm14c1c6c3c5cm16c2cm5c2cm17_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm10c3c17c6c1c3cm7cm25c0cm12c2c9cm12cm4c15cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1cm1c1c6cm7cm11cm2cm25c1cm2c8cm23c4c1cm7c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm2cm4c3c4c1c5c3cm15cm15cm14cm5c1c0cm3cm3c5_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm6c10cm4cm2cm2c3cm1cm4c0cm22cm16c2c3c3cm1c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0cm10cm2cm11c6c0c9cm2cm2c3c4c2c3c1cm13c3_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c2cm4cm1c1cm21c3cm10cm3cm2cm7c7c0c3c3cm2c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c11cm7cm17cm14cm8c1c0c2cm18c7cm17cm4c5cm6c11c28_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c3c14c2cm2cm12cm5cm5cm4cm5cm46c6c16cm1c10cm10c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c2c4cm4cm1cm1c9cm2cm9cm5c10c1c17cm2c5cm14c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm2c8c7cm5c2cm6cm1c19c6cm8cm22cm2c10cm3cm13c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c16c6c2c0c1c2cm1c3cm21cm30c5cm40c6c4cm6cm18_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1cm2cm1cm4cm5cm1cm8c10cm13cm10c20c18c4c10cm24c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core21_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm5cm7cm2cm3cm5c10cm1c14c8c2cm13c6cm8cm7cm5cm11 => x_cm5cm7cm2cm3cm5c10cm1c14c8c2cm13c6cm8cm7cm5cm11_signal, 
                R_c3cm1cm12c4cm1cm13cm13cm12cm28cm7cm4cm1c34c0cm74c0 => x_c3cm1cm12c4cm1cm13cm13cm12cm28cm7cm4cm1c34c0cm74c0_signal, 
                R_c50c5cm13cm56cm8cm30cm5c4cm9cm6c13cm5cm12c1cm20c19 => x_c50c5cm13cm56cm8cm30cm5c4cm9cm6c13cm5cm12c1cm20c19_signal, 
                R_c3cm10c2cm4c3cm3c9cm3cm7c23cm13cm2c7c40c8c5 => x_c3cm10c2cm4c3cm3c9cm3cm7c23cm13cm2c7c40c8c5_signal, 
                R_cm3cm5c5c8c10cm12c9c8cm3cm9c0c11c3cm8c2cm5 => x_cm3cm5c5c8c10cm12c9c8cm3cm9c0c11c3cm8c2cm5_signal, 
                R_cm29c1cm1c1cm5c15cm3c25c9c0cm9cm4cm32c3cm2c8 => x_cm29c1cm1c1cm5c15cm3c25c9c0cm9cm4cm32c3cm2c8_signal, 
                R_cm2cm2c0c0cm4cm5c1cm17c11c8c2c6cm11cm2cm2cm16 => x_cm2cm2c0c0cm4cm5c1cm17c11c8c2c6cm11cm2cm2cm16_signal, 
                R_cm1cm14cm8cm4cm3c24c12c0c4c14c17c8c1cm13cm9c0 => x_cm1cm14cm8cm4cm3c24c12c0c4c14c17c8c1cm13cm9c0_signal, 
                R_cm1c1c12cm10cm12cm2cm45c18cm12cm41cm2c3c5cm3cm12cm3 => x_cm1c1c12cm10cm12cm2cm45c18cm12cm41cm2c3c5cm3cm12cm3_signal, 
                R_cm9c1c7cm10c5cm6c38c12c8c1cm2c22c15c2c2cm15 => x_cm9c1c7cm10c5cm6c38c12c8c1cm2c22c15c2c2cm15_signal, 
                R_cm6c8cm5c0cm4cm1cm6c19cm8cm18cm4cm7c1cm7cm1c1 => x_cm6c8cm5c0cm4cm1cm6c19cm8cm18cm4cm7c1cm7cm1c1_signal, 
                R_c4c40c8c5cm2cm1c1cm7c8c0cm2c4cm6cm8cm3c5 => x_c4c40c8c5cm2cm1c1cm7c8c0cm2c4cm6cm8cm3c5_signal, 
                R_c0cm8c32c4cm5c0c3cm1cm3cm12cm8c4cm3c2cm29cm9 => x_c0cm8c32c4cm5c0c3cm1cm3cm12cm8c4cm3c2cm29cm9_signal, 
                R_cm3c3cm2c1cm14c4c3c1cm17c0c1c0c8c7cm9c4 => x_cm3c3cm2c1cm14c4c3c1cm17c0c1c0c8c7cm9c4_signal, 
                R_c0c7c6cm1c2cm16c1c3cm6cm7cm14c0c2c8cm11cm6 => x_c0c7c6cm1c2cm16c1c3cm6cm7cm14c0c2c8cm11cm6_signal, 
                R_cm17c0c33cm5cm3c15cm1cm2cm4cm14c10c0cm20c0c31cm1 => x_cm17c0c33cm5cm3c15cm1cm2cm4cm14c10c0cm20c0c31cm1_signal, 
                R_cm7cm7cm1c2cm6cm5cm24c3c4cm2c4cm12cm4cm2c0cm5 => x_cm7cm7cm1c2cm6cm5cm24c3c4cm2c4cm12cm4cm2c0cm5_signal, 
                R_c6c11cm2cm1c7c10cm4c9cm5c1c46c2cm5c0cm23c1 => x_c6c11cm2cm1c7c10cm4c9cm5c1c46c2cm5c0cm23c1_signal, 
                R_c1cm6c10cm23cm10cm4c3cm3cm17c1c3c2c15cm2cm5cm29 => x_c1cm6c10cm23cm10cm4c3cm3cm17c1c3c2c15cm2cm5cm29_signal, 
                R_c4c6c8cm5c1c1cm14c1c6c3c5cm16c2cm5c2cm17 => x_c4c6c8cm5c1c1cm14c1c6c3c5cm16c2cm5c2cm17_signal, 
                R_cm10c3c17c6c1c3cm7cm25c0cm12c2c9cm12cm4c15cm5 => x_cm10c3c17c6c1c3cm7cm25c0cm12c2c9cm12cm4c15cm5_signal, 
                R_cm1cm1c1c6cm7cm11cm2cm25c1cm2c8cm23c4c1cm7c0 => x_cm1cm1c1c6cm7cm11cm2cm25c1cm2c8cm23c4c1cm7c0_signal, 
                R_cm2cm4c3c4c1c5c3cm15cm15cm14cm5c1c0cm3cm3c5 => x_cm2cm4c3c4c1c5c3cm15cm15cm14cm5c1c0cm3cm3c5_signal, 
                R_cm6c10cm4cm2cm2c3cm1cm4c0cm22cm16c2c3c3cm1c1 => x_cm6c10cm4cm2cm2c3cm1cm4c0cm22cm16c2c3c3cm1c1_signal, 
                R_c0cm10cm2cm11c6c0c9cm2cm2c3c4c2c3c1cm13c3 => x_c0cm10cm2cm11c6c0c9cm2cm2c3c4c2c3c1cm13c3_signal, 
                R_c2cm4cm1c1cm21c3cm10cm3cm2cm7c7c0c3c3cm2c3 => x_c2cm4cm1c1cm21c3cm10cm3cm2cm7c7c0c3c3cm2c3_signal, 
                R_c11cm7cm17cm14cm8c1c0c2cm18c7cm17cm4c5cm6c11c28 => x_c11cm7cm17cm14cm8c1c0c2cm18c7cm17cm4c5cm6c11c28_signal, 
                R_c3c14c2cm2cm12cm5cm5cm4cm5cm46c6c16cm1c10cm10c4 => x_c3c14c2cm2cm12cm5cm5cm4cm5cm46c6c16cm1c10cm10c4_signal, 
                R_c2c4cm4cm1cm1c9cm2cm9cm5c10c1c17cm2c5cm14c0 => x_c2c4cm4cm1cm1c9cm2cm9cm5c10c1c17cm2c5cm14c0_signal, 
                R_cm2c8c7cm5c2cm6cm1c19c6cm8cm22cm2c10cm3cm13c1 => x_cm2c8c7cm5c2cm6cm1c19c6cm8cm22cm2c10cm3cm13c1_signal, 
                R_c16c6c2c0c1c2cm1c3cm21cm30c5cm40c6c4cm6cm18 => x_c16c6c2c0c1c2cm1c3cm21cm30c5cm40c6c4cm6cm18_signal, 
                R_cm1cm2cm1cm4cm5cm1cm8c10cm13cm10c20c18c4c10cm24c1 => x_cm1cm2cm1cm4cm5cm1cm8c10cm13cm10c20c18c4c10cm24c1_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm5cm7cm2cm3cm5c10cm1c14c8c2cm13c6cm8cm7cm5cm11_signal;
    yo_2 <= x_c3cm1cm12c4cm1cm13cm13cm12cm28cm7cm4cm1c34c0cm74c0_signal;
    yo_3 <= x_c50c5cm13cm56cm8cm30cm5c4cm9cm6c13cm5cm12c1cm20c19_signal;
    yo_4 <= x_c3cm10c2cm4c3cm3c9cm3cm7c23cm13cm2c7c40c8c5_signal;
    yo_5 <= x_cm3cm5c5c8c10cm12c9c8cm3cm9c0c11c3cm8c2cm5_signal;
    yo_6 <= x_cm29c1cm1c1cm5c15cm3c25c9c0cm9cm4cm32c3cm2c8_signal;
    yo_7 <= x_cm2cm2c0c0cm4cm5c1cm17c11c8c2c6cm11cm2cm2cm16_signal;
    yo_8 <= x_cm1cm14cm8cm4cm3c24c12c0c4c14c17c8c1cm13cm9c0_signal;
    yo_9 <= x_cm1c1c12cm10cm12cm2cm45c18cm12cm41cm2c3c5cm3cm12cm3_signal;
    yo_10 <= x_cm9c1c7cm10c5cm6c38c12c8c1cm2c22c15c2c2cm15_signal;
    yo_11 <= x_cm6c8cm5c0cm4cm1cm6c19cm8cm18cm4cm7c1cm7cm1c1_signal;
    yo_12 <= x_c4c40c8c5cm2cm1c1cm7c8c0cm2c4cm6cm8cm3c5_signal;
    yo_13 <= x_c0cm8c32c4cm5c0c3cm1cm3cm12cm8c4cm3c2cm29cm9_signal;
    yo_14 <= x_cm3c3cm2c1cm14c4c3c1cm17c0c1c0c8c7cm9c4_signal;
    yo_15 <= x_c0c7c6cm1c2cm16c1c3cm6cm7cm14c0c2c8cm11cm6_signal;
    yo_16 <= x_cm17c0c33cm5cm3c15cm1cm2cm4cm14c10c0cm20c0c31cm1_signal;
    yo_17 <= x_cm7cm7cm1c2cm6cm5cm24c3c4cm2c4cm12cm4cm2c0cm5_signal;
    yo_18 <= x_c6c11cm2cm1c7c10cm4c9cm5c1c46c2cm5c0cm23c1_signal;
    yo_19 <= x_c1cm6c10cm23cm10cm4c3cm3cm17c1c3c2c15cm2cm5cm29_signal;
    yo_20 <= x_c4c6c8cm5c1c1cm14c1c6c3c5cm16c2cm5c2cm17_signal;
    yo_21 <= x_cm10c3c17c6c1c3cm7cm25c0cm12c2c9cm12cm4c15cm5_signal;
    yo_22 <= x_cm1cm1c1c6cm7cm11cm2cm25c1cm2c8cm23c4c1cm7c0_signal;
    yo_23 <= x_cm2cm4c3c4c1c5c3cm15cm15cm14cm5c1c0cm3cm3c5_signal;
    yo_24 <= x_cm6c10cm4cm2cm2c3cm1cm4c0cm22cm16c2c3c3cm1c1_signal;
    yo_25 <= x_c0cm10cm2cm11c6c0c9cm2cm2c3c4c2c3c1cm13c3_signal;
    yo_26 <= x_c2cm4cm1c1cm21c3cm10cm3cm2cm7c7c0c3c3cm2c3_signal;
    yo_27 <= x_c11cm7cm17cm14cm8c1c0c2cm18c7cm17cm4c5cm6c11c28_signal;
    yo_28 <= x_c3c14c2cm2cm12cm5cm5cm4cm5cm46c6c16cm1c10cm10c4_signal;
    yo_29 <= x_c2c4cm4cm1cm1c9cm2cm9cm5c10c1c17cm2c5cm14c0_signal;
    yo_30 <= x_cm2c8c7cm5c2cm6cm1c19c6cm8cm22cm2c10cm3cm13c1_signal;
    yo_31 <= x_c16c6c2c0c1c2cm1c3cm21cm30c5cm40c6c4cm6cm18_signal;
    yo_32 <= x_cm1cm2cm1cm4cm5cm1cm8c10cm13cm10c20c18c4c10cm24c1_signal;



end structural;