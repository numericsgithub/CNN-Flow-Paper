LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core14 is
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
    
        yo_1  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_2  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_3  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_4  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_5  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_7  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_8  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_9  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_12  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_13  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_19  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_21  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_23  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_25  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_26  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_29  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_30  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_31  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_32  : out std_logic_vector(12-1 downto 0) --	sfix(4, -8)
    );
end conv5_core14;

architecture structural of conv5_core14 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm3cm5c7c1c0c0cm2c0cm4c0c4cm1c4cm5cm18c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm29c15c0c0c3c3cm1c1cm2c1cm2c2cm1c2c1c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c3c0c5c2cm1cm1c3c1c2c1cm6c0c5cm11cm12c4_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c6c7c1c10c13c4c5c0cm16c12c1cm8cm3cm23cm1cm4_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c5c0cm4c0c98c0cm1c0cm30cm1cm6c3c0c1c2c0_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_cm3cm13c1cm10c5c3c0cm1c2c5c0cm4c5c0cm4cm19_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1cm3c4c0c0cm9c0cm1c2cm10cm1c1cm1cm10c1cm13_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c5c0cm10c2c1c1c4c0c2cm3c5cm2c0c6c10c7_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm22cm6c12cm1c3cm3cm1c1cm4cm8cm2c6cm1cm1c2cm20_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c13cm18c14c0cm3cm2c4c1cm6cm1cm9c1cm7c0c0c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm2c5cm2c8cm1c1cm3c0c1c2cm10cm3c1cm43c33c2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c62cm3c1cm1cm1c2cm41c0cm16c3cm3c3c0c4c4cm14_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm2c1c5cm1c1c0cm1c0c0c0c9c0c4cm2c5c1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm2cm4cm6c1c18c0c0cm2c11c0cm4cm1cm1c0c1c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm2cm28cm1cm4c0cm3c7cm31c2c4cm8cm5cm1c1c30cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm19c1c3cm24c0cm1c1c1cm3cm1cm1c3c3c2c3c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c10c4cm1c20cm39c1c1cm6c5cm2cm1cm25c5cm1c0cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm5c3c2cm5c7cm1cm1c1c6cm4cm1c17cm5c12cm4c5_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0cm15c15cm10c1c11c14c0c0c15cm6c1cm1cm4cm3cm1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c8c2c14cm2c3c17c1c0c3c34cm2cm1cm1c4c5cm25_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0cm1c4c0cm1c5c0c1c2cm6c3c0cm1cm1c5c1_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c2cm2c2c11c2cm2cm11c6c2c1cm9cm58c42cm11c7cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c1c5cm2c0c0cm3c0c4c6c5c2c7c5c12cm8c5_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm3c9cm10cm4c56c3c0cm1c12cm9c0cm3cm3c24c6cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c1c6c2c1cm1c3c1c1cm4c2cm1c1c7c2cm6c8_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1c1c2cm3c0c1c12c0c0c1c5c1c1cm1c2c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm2cm1cm17cm2c0c1cm2c0c0c1c2cm4cm6c2cm3c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c3cm31cm8cm2cm4c3cm1c1c3c2c7cm6cm16cm2cm5c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c2c1c6c0cm1c0cm2c1cm3c1c14c3cm3c7c9c1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm6cm1c43c3cm1c0c3cm2c6c1cm8c5cm8c2c7c18_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm4cm17c0c0c3cm3c1c0c1c1c3cm10c3c2cm92cm1_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_c1c4cm9cm1c1c1c4cm1c0cm1c1c4c0c2c10c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core14_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm3cm5c7c1c0c0cm2c0cm4c0c4cm1c4cm5cm18c1 => x_cm3cm5c7c1c0c0cm2c0cm4c0c4cm1c4cm5cm18c1_signal, 
                R_cm29c15c0c0c3c3cm1c1cm2c1cm2c2cm1c2c1c2 => x_cm29c15c0c0c3c3cm1c1cm2c1cm2c2cm1c2c1c2_signal, 
                R_c3c0c5c2cm1cm1c3c1c2c1cm6c0c5cm11cm12c4 => x_c3c0c5c2cm1cm1c3c1c2c1cm6c0c5cm11cm12c4_signal, 
                R_c6c7c1c10c13c4c5c0cm16c12c1cm8cm3cm23cm1cm4 => x_c6c7c1c10c13c4c5c0cm16c12c1cm8cm3cm23cm1cm4_signal, 
                R_c5c0cm4c0c98c0cm1c0cm30cm1cm6c3c0c1c2c0 => x_c5c0cm4c0c98c0cm1c0cm30cm1cm6c3c0c1c2c0_signal, 
                R_cm3cm13c1cm10c5c3c0cm1c2c5c0cm4c5c0cm4cm19 => x_cm3cm13c1cm10c5c3c0cm1c2c5c0cm4c5c0cm4cm19_signal, 
                R_cm1cm3c4c0c0cm9c0cm1c2cm10cm1c1cm1cm10c1cm13 => x_cm1cm3c4c0c0cm9c0cm1c2cm10cm1c1cm1cm10c1cm13_signal, 
                R_c5c0cm10c2c1c1c4c0c2cm3c5cm2c0c6c10c7 => x_c5c0cm10c2c1c1c4c0c2cm3c5cm2c0c6c10c7_signal, 
                R_cm22cm6c12cm1c3cm3cm1c1cm4cm8cm2c6cm1cm1c2cm20 => x_cm22cm6c12cm1c3cm3cm1c1cm4cm8cm2c6cm1cm1c2cm20_signal, 
                R_c13cm18c14c0cm3cm2c4c1cm6cm1cm9c1cm7c0c0c2 => x_c13cm18c14c0cm3cm2c4c1cm6cm1cm9c1cm7c0c0c2_signal, 
                R_cm2c5cm2c8cm1c1cm3c0c1c2cm10cm3c1cm43c33c2 => x_cm2c5cm2c8cm1c1cm3c0c1c2cm10cm3c1cm43c33c2_signal, 
                R_c62cm3c1cm1cm1c2cm41c0cm16c3cm3c3c0c4c4cm14 => x_c62cm3c1cm1cm1c2cm41c0cm16c3cm3c3c0c4c4cm14_signal, 
                R_cm2c1c5cm1c1c0cm1c0c0c0c9c0c4cm2c5c1 => x_cm2c1c5cm1c1c0cm1c0c0c0c9c0c4cm2c5c1_signal, 
                R_cm2cm4cm6c1c18c0c0cm2c11c0cm4cm1cm1c0c1c1 => x_cm2cm4cm6c1c18c0c0cm2c11c0cm4cm1cm1c0c1c1_signal, 
                R_cm2cm28cm1cm4c0cm3c7cm31c2c4cm8cm5cm1c1c30cm1 => x_cm2cm28cm1cm4c0cm3c7cm31c2c4cm8cm5cm1c1c30cm1_signal, 
                R_cm19c1c3cm24c0cm1c1c1cm3cm1cm1c3c3c2c3c2 => x_cm19c1c3cm24c0cm1c1c1cm3cm1cm1c3c3c2c3c2_signal, 
                R_c10c4cm1c20cm39c1c1cm6c5cm2cm1cm25c5cm1c0cm3 => x_c10c4cm1c20cm39c1c1cm6c5cm2cm1cm25c5cm1c0cm3_signal, 
                R_cm5c3c2cm5c7cm1cm1c1c6cm4cm1c17cm5c12cm4c5 => x_cm5c3c2cm5c7cm1cm1c1c6cm4cm1c17cm5c12cm4c5_signal, 
                R_c0cm15c15cm10c1c11c14c0c0c15cm6c1cm1cm4cm3cm1 => x_c0cm15c15cm10c1c11c14c0c0c15cm6c1cm1cm4cm3cm1_signal, 
                R_c8c2c14cm2c3c17c1c0c3c34cm2cm1cm1c4c5cm25 => x_c8c2c14cm2c3c17c1c0c3c34cm2cm1cm1c4c5cm25_signal, 
                R_c0cm1c4c0cm1c5c0c1c2cm6c3c0cm1cm1c5c1 => x_c0cm1c4c0cm1c5c0c1c2cm6c3c0cm1cm1c5c1_signal, 
                R_c2cm2c2c11c2cm2cm11c6c2c1cm9cm58c42cm11c7cm3 => x_c2cm2c2c11c2cm2cm11c6c2c1cm9cm58c42cm11c7cm3_signal, 
                R_c1c5cm2c0c0cm3c0c4c6c5c2c7c5c12cm8c5 => x_c1c5cm2c0c0cm3c0c4c6c5c2c7c5c12cm8c5_signal, 
                R_cm3c9cm10cm4c56c3c0cm1c12cm9c0cm3cm3c24c6cm1 => x_cm3c9cm10cm4c56c3c0cm1c12cm9c0cm3cm3c24c6cm1_signal, 
                R_c1c6c2c1cm1c3c1c1cm4c2cm1c1c7c2cm6c8 => x_c1c6c2c1cm1c3c1c1cm4c2cm1c1c7c2cm6c8_signal, 
                R_c1c1c2cm3c0c1c12c0c0c1c5c1c1cm1c2c0 => x_c1c1c2cm3c0c1c12c0c0c1c5c1c1cm1c2c0_signal, 
                R_cm2cm1cm17cm2c0c1cm2c0c0c1c2cm4cm6c2cm3c2 => x_cm2cm1cm17cm2c0c1cm2c0c0c1c2cm4cm6c2cm3c2_signal, 
                R_c3cm31cm8cm2cm4c3cm1c1c3c2c7cm6cm16cm2cm5c1 => x_c3cm31cm8cm2cm4c3cm1c1c3c2c7cm6cm16cm2cm5c1_signal, 
                R_c2c1c6c0cm1c0cm2c1cm3c1c14c3cm3c7c9c1 => x_c2c1c6c0cm1c0cm2c1cm3c1c14c3cm3c7c9c1_signal, 
                R_cm6cm1c43c3cm1c0c3cm2c6c1cm8c5cm8c2c7c18 => x_cm6cm1c43c3cm1c0c3cm2c6c1cm8c5cm8c2c7c18_signal, 
                R_cm4cm17c0c0c3cm3c1c0c1c1c3cm10c3c2cm92cm1 => x_cm4cm17c0c0c3cm3c1c0c1c1c3cm10c3c2cm92cm1_signal, 
                R_c1c4cm9cm1c1c1c4cm1c0cm1c1c4c0c2c10c0 => x_c1c4cm9cm1c1c1c4cm1c0cm1c1c4c0c2c10c0_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm3cm5c7c1c0c0cm2c0cm4c0c4cm1c4cm5cm18c1_signal;
    yo_2 <= x_cm29c15c0c0c3c3cm1c1cm2c1cm2c2cm1c2c1c2_signal;
    yo_3 <= x_c3c0c5c2cm1cm1c3c1c2c1cm6c0c5cm11cm12c4_signal;
    yo_4 <= x_c6c7c1c10c13c4c5c0cm16c12c1cm8cm3cm23cm1cm4_signal;
    yo_5 <= x_c5c0cm4c0c98c0cm1c0cm30cm1cm6c3c0c1c2c0_signal;
    yo_6 <= x_cm3cm13c1cm10c5c3c0cm1c2c5c0cm4c5c0cm4cm19_signal;
    yo_7 <= x_cm1cm3c4c0c0cm9c0cm1c2cm10cm1c1cm1cm10c1cm13_signal;
    yo_8 <= x_c5c0cm10c2c1c1c4c0c2cm3c5cm2c0c6c10c7_signal;
    yo_9 <= x_cm22cm6c12cm1c3cm3cm1c1cm4cm8cm2c6cm1cm1c2cm20_signal;
    yo_10 <= x_c13cm18c14c0cm3cm2c4c1cm6cm1cm9c1cm7c0c0c2_signal;
    yo_11 <= x_cm2c5cm2c8cm1c1cm3c0c1c2cm10cm3c1cm43c33c2_signal;
    yo_12 <= x_c62cm3c1cm1cm1c2cm41c0cm16c3cm3c3c0c4c4cm14_signal;
    yo_13 <= x_cm2c1c5cm1c1c0cm1c0c0c0c9c0c4cm2c5c1_signal;
    yo_14 <= x_cm2cm4cm6c1c18c0c0cm2c11c0cm4cm1cm1c0c1c1_signal;
    yo_15 <= x_cm2cm28cm1cm4c0cm3c7cm31c2c4cm8cm5cm1c1c30cm1_signal;
    yo_16 <= x_cm19c1c3cm24c0cm1c1c1cm3cm1cm1c3c3c2c3c2_signal;
    yo_17 <= x_c10c4cm1c20cm39c1c1cm6c5cm2cm1cm25c5cm1c0cm3_signal;
    yo_18 <= x_cm5c3c2cm5c7cm1cm1c1c6cm4cm1c17cm5c12cm4c5_signal;
    yo_19 <= x_c0cm15c15cm10c1c11c14c0c0c15cm6c1cm1cm4cm3cm1_signal;
    yo_20 <= x_c8c2c14cm2c3c17c1c0c3c34cm2cm1cm1c4c5cm25_signal;
    yo_21 <= x_c0cm1c4c0cm1c5c0c1c2cm6c3c0cm1cm1c5c1_signal;
    yo_22 <= x_c2cm2c2c11c2cm2cm11c6c2c1cm9cm58c42cm11c7cm3_signal;
    yo_23 <= x_c1c5cm2c0c0cm3c0c4c6c5c2c7c5c12cm8c5_signal;
    yo_24 <= x_cm3c9cm10cm4c56c3c0cm1c12cm9c0cm3cm3c24c6cm1_signal;
    yo_25 <= x_c1c6c2c1cm1c3c1c1cm4c2cm1c1c7c2cm6c8_signal;
    yo_26 <= x_c1c1c2cm3c0c1c12c0c0c1c5c1c1cm1c2c0_signal;
    yo_27 <= x_cm2cm1cm17cm2c0c1cm2c0c0c1c2cm4cm6c2cm3c2_signal;
    yo_28 <= x_c3cm31cm8cm2cm4c3cm1c1c3c2c7cm6cm16cm2cm5c1_signal;
    yo_29 <= x_c2c1c6c0cm1c0cm2c1cm3c1c14c3cm3c7c9c1_signal;
    yo_30 <= x_cm6cm1c43c3cm1c0c3cm2c6c1cm8c5cm8c2c7c18_signal;
    yo_31 <= x_cm4cm17c0c0c3cm3c1c0c1c1c3cm10c3c2cm92cm1_signal;
    yo_32 <= x_c1c4cm9cm1c1c1c4cm1c0cm1c1c4c0c2c10c0_signal;



end structural;