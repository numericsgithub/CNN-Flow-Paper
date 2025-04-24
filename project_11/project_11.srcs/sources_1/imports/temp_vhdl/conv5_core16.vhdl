LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core16 is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk   : in std_logic;
        rst   : in std_logic;

        xi    : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        sel_config: in    std_logic_vector(bits(16-1)-1 downto 0);
    
        yo_1  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_2  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_3  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_4  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_10  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_16  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_19  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_20  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_22  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_26  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_29  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(6, -8)
    );
end conv5_core16;

architecture structural of conv5_core16 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c0c1c10cm5cm1cm2c4cm2cm3c0c2cm1c9c0c4c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c4cm13c3cm1c5c3cm12cm30c6cm6cm30cm1c13c25cm8cm16_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c9c2cm18c0cm17c1c0cm23c3c1cm2c0c3cm4cm17c5_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c1cm10cm17c3cm2cm77c0cm3c2c2cm47c0cm12c0cm29_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_cm18c2cm5cm3c2cm11cm3c10cm2cm1c0cm46c4c2cm4c5_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c3c0c0c6c1c0cm6cm4c1cm2c0c1cm1c29c4cm12_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm2c2cm7c1cm7cm2cm1c0cm1c1cm24c0c0cm3c7c4_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1cm1c9cm1cm38c3c12c22c1cm1cm8cm3cm3c14cm14c2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c3cm7cm7cm4cm4c4cm2cm1c39c1cm8c0cm6c8c23c30_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c2c10cm6cm1c0cm8cm1cm30cm2c32cm5cm1c12c7c16c2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c5cm5cm1cm5c1cm3cm1cm2c3cm2c4c12c1cm5cm18c6_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm7c1cm1c1c4cm4c0cm1cm8cm11cm3c1cm7cm3c1cm13_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1c2cm19cm1c0c0c1c18c0c2cm4cm2c5c4cm23c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c6c1c2cm1cm2cm1c1c10c2cm30c1c6cm2c1c5c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c4c29c4cm2cm4cm3c4c0c2cm5c2c3cm1cm3c9cm10_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c14cm1c2c17c6cm6c38cm1cm1c0c3cm16cm3c5cm14c4_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c4cm6c3c3cm2cm5c1cm2cm5cm3c23c5c1c0c3c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c2c3cm4c20c0cm1cm1c26cm1c0c0cm1c12c8cm7cm9_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1c45cm19c18cm21cm4c4cm2c0c7cm9c9c1cm3c0cm7_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm3cm14cm7cm3cm3c1c5c1cm2cm2c0cm1c2c5cm16cm5_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c2c1cm17cm2c46c0c14c26c1c1c1c6c0c0c5c3_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c1cm3c8cm11c1c1c1c5cm1cm1c1cm10c10c4c2c10_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c15c13c4c5cm23c0c1c3c0c2c1c0c13c5cm14cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c1c20cm13c2c0c0cm1c1c1cm5c1c0c2cm9cm14_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm7cm4c0cm2cm1c24c1c36cm3c2cm1cm11c20cm7c1c3_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm1cm3c3c4cm1cm1cm2cm6c2cm2c1c0cm3cm6c1c5_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c7cm1c10c15c5c3c2c1c0cm1cm2c54cm4cm20cm20c0_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm39c6c24cm3cm20c0c0cm32cm4cm9c1cm6cm30c3cm5cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0c1c7cm3c2c0c1c2c0cm1c3c1c25cm31cm38c40_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c5c1cm19c0cm3cm1c2cm1c3c0cm4c3c5c3cm7cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm23c0c2cm3c50cm2c0c1c20cm39c1c2cm11c6cm14cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c1cm10c20c6cm26c1cm11c1c0c4c33c2c1cm23c7c2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core16_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c0c1c10cm5cm1cm2c4cm2cm3c0c2cm1c9c0c4c0 => x_c0c1c10cm5cm1cm2c4cm2cm3c0c2cm1c9c0c4c0_signal, 
                R_c4cm13c3cm1c5c3cm12cm30c6cm6cm30cm1c13c25cm8cm16 => x_c4cm13c3cm1c5c3cm12cm30c6cm6cm30cm1c13c25cm8cm16_signal, 
                R_c9c2cm18c0cm17c1c0cm23c3c1cm2c0c3cm4cm17c5 => x_c9c2cm18c0cm17c1c0cm23c3c1cm2c0c3cm4cm17c5_signal, 
                R_c0c1cm10cm17c3cm2cm77c0cm3c2c2cm47c0cm12c0cm29 => x_c0c1cm10cm17c3cm2cm77c0cm3c2c2cm47c0cm12c0cm29_signal, 
                R_cm18c2cm5cm3c2cm11cm3c10cm2cm1c0cm46c4c2cm4c5 => x_cm18c2cm5cm3c2cm11cm3c10cm2cm1c0cm46c4c2cm4c5_signal, 
                R_c3c0c0c6c1c0cm6cm4c1cm2c0c1cm1c29c4cm12 => x_c3c0c0c6c1c0cm6cm4c1cm2c0c1cm1c29c4cm12_signal, 
                R_cm2c2cm7c1cm7cm2cm1c0cm1c1cm24c0c0cm3c7c4 => x_cm2c2cm7c1cm7cm2cm1c0cm1c1cm24c0c0cm3c7c4_signal, 
                R_cm1cm1c9cm1cm38c3c12c22c1cm1cm8cm3cm3c14cm14c2 => x_cm1cm1c9cm1cm38c3c12c22c1cm1cm8cm3cm3c14cm14c2_signal, 
                R_c3cm7cm7cm4cm4c4cm2cm1c39c1cm8c0cm6c8c23c30 => x_c3cm7cm7cm4cm4c4cm2cm1c39c1cm8c0cm6c8c23c30_signal, 
                R_c2c10cm6cm1c0cm8cm1cm30cm2c32cm5cm1c12c7c16c2 => x_c2c10cm6cm1c0cm8cm1cm30cm2c32cm5cm1c12c7c16c2_signal, 
                R_c5cm5cm1cm5c1cm3cm1cm2c3cm2c4c12c1cm5cm18c6 => x_c5cm5cm1cm5c1cm3cm1cm2c3cm2c4c12c1cm5cm18c6_signal, 
                R_cm7c1cm1c1c4cm4c0cm1cm8cm11cm3c1cm7cm3c1cm13 => x_cm7c1cm1c1c4cm4c0cm1cm8cm11cm3c1cm7cm3c1cm13_signal, 
                R_c1c2cm19cm1c0c0c1c18c0c2cm4cm2c5c4cm23c1 => x_c1c2cm19cm1c0c0c1c18c0c2cm4cm2c5c4cm23c1_signal, 
                R_c6c1c2cm1cm2cm1c1c10c2cm30c1c6cm2c1c5c0 => x_c6c1c2cm1cm2cm1c1c10c2cm30c1c6cm2c1c5c0_signal, 
                R_c4c29c4cm2cm4cm3c4c0c2cm5c2c3cm1cm3c9cm10 => x_c4c29c4cm2cm4cm3c4c0c2cm5c2c3cm1cm3c9cm10_signal, 
                R_c14cm1c2c17c6cm6c38cm1cm1c0c3cm16cm3c5cm14c4 => x_c14cm1c2c17c6cm6c38cm1cm1c0c3cm16cm3c5cm14c4_signal, 
                R_c4cm6c3c3cm2cm5c1cm2cm5cm3c23c5c1c0c3c0 => x_c4cm6c3c3cm2cm5c1cm2cm5cm3c23c5c1c0c3c0_signal, 
                R_c2c3cm4c20c0cm1cm1c26cm1c0c0cm1c12c8cm7cm9 => x_c2c3cm4c20c0cm1cm1c26cm1c0c0cm1c12c8cm7cm9_signal, 
                R_c1c45cm19c18cm21cm4c4cm2c0c7cm9c9c1cm3c0cm7 => x_c1c45cm19c18cm21cm4c4cm2c0c7cm9c9c1cm3c0cm7_signal, 
                R_cm3cm14cm7cm3cm3c1c5c1cm2cm2c0cm1c2c5cm16cm5 => x_cm3cm14cm7cm3cm3c1c5c1cm2cm2c0cm1c2c5cm16cm5_signal, 
                R_c2c1cm17cm2c46c0c14c26c1c1c1c6c0c0c5c3 => x_c2c1cm17cm2c46c0c14c26c1c1c1c6c0c0c5c3_signal, 
                R_c1cm3c8cm11c1c1c1c5cm1cm1c1cm10c10c4c2c10 => x_c1cm3c8cm11c1c1c1c5cm1cm1c1cm10c10c4c2c10_signal, 
                R_c15c13c4c5cm23c0c1c3c0c2c1c0c13c5cm14cm1 => x_c15c13c4c5cm23c0c1c3c0c2c1c0c13c5cm14cm1_signal, 
                R_c0c1c20cm13c2c0c0cm1c1c1cm5c1c0c2cm9cm14 => x_c0c1c20cm13c2c0c0cm1c1c1cm5c1c0c2cm9cm14_signal, 
                R_cm7cm4c0cm2cm1c24c1c36cm3c2cm1cm11c20cm7c1c3 => x_cm7cm4c0cm2cm1c24c1c36cm3c2cm1cm11c20cm7c1c3_signal, 
                R_cm1cm3c3c4cm1cm1cm2cm6c2cm2c1c0cm3cm6c1c5 => x_cm1cm3c3c4cm1cm1cm2cm6c2cm2c1c0cm3cm6c1c5_signal, 
                R_c7cm1c10c15c5c3c2c1c0cm1cm2c54cm4cm20cm20c0 => x_c7cm1c10c15c5c3c2c1c0cm1cm2c54cm4cm20cm20c0_signal, 
                R_cm39c6c24cm3cm20c0c0cm32cm4cm9c1cm6cm30c3cm5cm2 => x_cm39c6c24cm3cm20c0c0cm32cm4cm9c1cm6cm30c3cm5cm2_signal, 
                R_c0c1c7cm3c2c0c1c2c0cm1c3c1c25cm31cm38c40 => x_c0c1c7cm3c2c0c1c2c0cm1c3c1c25cm31cm38c40_signal, 
                R_c5c1cm19c0cm3cm1c2cm1c3c0cm4c3c5c3cm7cm8 => x_c5c1cm19c0cm3cm1c2cm1c3c0cm4c3c5c3cm7cm8_signal, 
                R_cm23c0c2cm3c50cm2c0c1c20cm39c1c2cm11c6cm14cm2 => x_cm23c0c2cm3c50cm2c0c1c20cm39c1c2cm11c6cm14cm2_signal, 
                R_c1cm10c20c6cm26c1cm11c1c0c4c33c2c1cm23c7c2 => x_c1cm10c20c6cm26c1cm11c1c0c4c33c2c1cm23c7c2_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c0c1c10cm5cm1cm2c4cm2cm3c0c2cm1c9c0c4c0_signal;
    yo_2 <= x_c4cm13c3cm1c5c3cm12cm30c6cm6cm30cm1c13c25cm8cm16_signal;
    yo_3 <= x_c9c2cm18c0cm17c1c0cm23c3c1cm2c0c3cm4cm17c5_signal;
    yo_4 <= x_c0c1cm10cm17c3cm2cm77c0cm3c2c2cm47c0cm12c0cm29_signal;
    yo_5 <= x_cm18c2cm5cm3c2cm11cm3c10cm2cm1c0cm46c4c2cm4c5_signal;
    yo_6 <= x_c3c0c0c6c1c0cm6cm4c1cm2c0c1cm1c29c4cm12_signal;
    yo_7 <= x_cm2c2cm7c1cm7cm2cm1c0cm1c1cm24c0c0cm3c7c4_signal;
    yo_8 <= x_cm1cm1c9cm1cm38c3c12c22c1cm1cm8cm3cm3c14cm14c2_signal;
    yo_9 <= x_c3cm7cm7cm4cm4c4cm2cm1c39c1cm8c0cm6c8c23c30_signal;
    yo_10 <= x_c2c10cm6cm1c0cm8cm1cm30cm2c32cm5cm1c12c7c16c2_signal;
    yo_11 <= x_c5cm5cm1cm5c1cm3cm1cm2c3cm2c4c12c1cm5cm18c6_signal;
    yo_12 <= x_cm7c1cm1c1c4cm4c0cm1cm8cm11cm3c1cm7cm3c1cm13_signal;
    yo_13 <= x_c1c2cm19cm1c0c0c1c18c0c2cm4cm2c5c4cm23c1_signal;
    yo_14 <= x_c6c1c2cm1cm2cm1c1c10c2cm30c1c6cm2c1c5c0_signal;
    yo_15 <= x_c4c29c4cm2cm4cm3c4c0c2cm5c2c3cm1cm3c9cm10_signal;
    yo_16 <= x_c14cm1c2c17c6cm6c38cm1cm1c0c3cm16cm3c5cm14c4_signal;
    yo_17 <= x_c4cm6c3c3cm2cm5c1cm2cm5cm3c23c5c1c0c3c0_signal;
    yo_18 <= x_c2c3cm4c20c0cm1cm1c26cm1c0c0cm1c12c8cm7cm9_signal;
    yo_19 <= x_c1c45cm19c18cm21cm4c4cm2c0c7cm9c9c1cm3c0cm7_signal;
    yo_20 <= x_cm3cm14cm7cm3cm3c1c5c1cm2cm2c0cm1c2c5cm16cm5_signal;
    yo_21 <= x_c2c1cm17cm2c46c0c14c26c1c1c1c6c0c0c5c3_signal;
    yo_22 <= x_c1cm3c8cm11c1c1c1c5cm1cm1c1cm10c10c4c2c10_signal;
    yo_23 <= x_c15c13c4c5cm23c0c1c3c0c2c1c0c13c5cm14cm1_signal;
    yo_24 <= x_c0c1c20cm13c2c0c0cm1c1c1cm5c1c0c2cm9cm14_signal;
    yo_25 <= x_cm7cm4c0cm2cm1c24c1c36cm3c2cm1cm11c20cm7c1c3_signal;
    yo_26 <= x_cm1cm3c3c4cm1cm1cm2cm6c2cm2c1c0cm3cm6c1c5_signal;
    yo_27 <= x_c7cm1c10c15c5c3c2c1c0cm1cm2c54cm4cm20cm20c0_signal;
    yo_28 <= x_cm39c6c24cm3cm20c0c0cm32cm4cm9c1cm6cm30c3cm5cm2_signal;
    yo_29 <= x_c0c1c7cm3c2c0c1c2c0cm1c3c1c25cm31cm38c40_signal;
    yo_30 <= x_c5c1cm19c0cm3cm1c2cm1c3c0cm4c3c5c3cm7cm8_signal;
    yo_31 <= x_cm23c0c2cm3c50cm2c0c1c20cm39c1c2cm11c6cm14cm2_signal;
    yo_32 <= x_c1cm10c20c6cm26c1cm11c1c0c4c33c2c1cm23c7c2_signal;



end structural;