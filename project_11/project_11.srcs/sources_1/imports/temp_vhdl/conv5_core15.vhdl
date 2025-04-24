LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core15 is
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
    
        yo_1  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_2  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_4  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_5  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_7  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_8  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_9  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_12  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_14  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_18  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_23  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_27  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_30  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(5, -8)
    );
end conv5_core15;

architecture structural of conv5_core15 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm1cm13c40c0c7c4c17c0cm2c1cm2cm1c9cm4cm2c2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c5cm4c1c2c22c11cm2c0cm11c1c8cm11cm7c1c1cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c29c6cm1c0cm5cm6cm1c42cm2c4c11cm1cm3c7c0_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm4c18c0c2cm13cm3c0cm4c3cm4cm7cm3cm4c9c3c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1c1cm5c1cm10c0cm3cm3cm6cm1c2c4c6c0cm2cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c3cm11cm1c4c2cm8c2cm64c0cm3c6cm5c29c7cm1cm6_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm1cm3cm2c9c1cm7c10c1c15cm5c6c1c3cm10cm1c1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0c6c5c8c1c4cm1c10cm11c0cm18cm78c2cm3c2c2_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_c2cm4c1c6cm9cm2c8c3cm5cm7c4cm2cm5cm2c1c1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm17cm1c26c0c0c0cm4c0cm3c6cm1cm8c1c4c8cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm2c21c28cm4c1cm30cm4c9c2c2c8cm2cm2cm6c5cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm3c6c2c36c26cm5cm8c5c1c8c2c4c8c0c5c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c3c1c13c0c0c11c8c1cm1c2c3c15cm25c6c7c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c5c0c3c1c7cm1cm7cm2c4c0c0cm9cm5cm1cm11cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm2c3cm23cm5c1cm16c26c25cm30cm2c1c0c2c11c6cm4_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c4c1cm1cm3cm9c2c2cm9cm1c22c7cm2c8c0c1c4_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c6cm2c1cm9cm3cm1cm3c16c0c8cm3cm4c4cm4c0cm15_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm14c0cm1c3cm4cm7cm1cm1c6c2c0cm40cm10cm8cm18c11_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm4cm10c2c0c3c10cm9cm3c16cm1c4c0c0c13cm11cm17_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1c2c3cm47c4cm4c1c2c10c0c2c3cm8c2c3c2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0c0cm1c0c1cm1c9c3c10cm1cm26c47c0c0cm9c0_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c1cm7c7cm1c5c7c3cm18cm1cm13c1cm9cm2c2cm7cm35_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c7c3cm3cm7c3c0c5c15c13c5c2c1c0cm5c1cm5_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm3c1c9c3c1cm10cm22cm3cm3c0c3cm3cm8cm4cm4cm7_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c6c3c20c8cm1c3cm6cm3cm2cm9cm1cm10cm1cm6c4cm9_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1c1cm1cm2c0c0c0cm2c3c1c0c17c0c5c2cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c3c4c5c5c4cm13cm8cm4c13cm7c1c0c2c2cm4c4_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0c4cm4c4cm4cm16c1cm2cm14c1c0cm38cm9cm1c0cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm24c12cm1cm12c0cm8cm4cm7c7c1c2cm3c3cm4c1c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm28c1cm1cm45cm4c2c10cm10c6c2cm2cm3c4cm9c8cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm1c0c6cm2cm3c3cm1cm3c31cm4c6cm6cm2c3c6cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1cm1c0c2cm1cm6cm19c1cm1cm1c26c0c0cm6cm5cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core15_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm1cm13c40c0c7c4c17c0cm2c1cm2cm1c9cm4cm2c2 => x_cm1cm13c40c0c7c4c17c0cm2c1cm2cm1c9cm4cm2c2_signal, 
                R_c5cm4c1c2c22c11cm2c0cm11c1c8cm11cm7c1c1cm1 => x_c5cm4c1c2c22c11cm2c0cm11c1c8cm11cm7c1c1cm1_signal, 
                R_c0c29c6cm1c0cm5cm6cm1c42cm2c4c11cm1cm3c7c0 => x_c0c29c6cm1c0cm5cm6cm1c42cm2c4c11cm1cm3c7c0_signal, 
                R_cm4c18c0c2cm13cm3c0cm4c3cm4cm7cm3cm4c9c3c0 => x_cm4c18c0c2cm13cm3c0cm4c3cm4cm7cm3cm4c9c3c0_signal, 
                R_cm1c1cm5c1cm10c0cm3cm3cm6cm1c2c4c6c0cm2cm2 => x_cm1c1cm5c1cm10c0cm3cm3cm6cm1c2c4c6c0cm2cm2_signal, 
                R_c3cm11cm1c4c2cm8c2cm64c0cm3c6cm5c29c7cm1cm6 => x_c3cm11cm1c4c2cm8c2cm64c0cm3c6cm5c29c7cm1cm6_signal, 
                R_cm1cm3cm2c9c1cm7c10c1c15cm5c6c1c3cm10cm1c1 => x_cm1cm3cm2c9c1cm7c10c1c15cm5c6c1c3cm10cm1c1_signal, 
                R_c0c6c5c8c1c4cm1c10cm11c0cm18cm78c2cm3c2c2 => x_c0c6c5c8c1c4cm1c10cm11c0cm18cm78c2cm3c2c2_signal, 
                R_c2cm4c1c6cm9cm2c8c3cm5cm7c4cm2cm5cm2c1c1 => x_c2cm4c1c6cm9cm2c8c3cm5cm7c4cm2cm5cm2c1c1_signal, 
                R_cm17cm1c26c0c0c0cm4c0cm3c6cm1cm8c1c4c8cm1 => x_cm17cm1c26c0c0c0cm4c0cm3c6cm1cm8c1c4c8cm1_signal, 
                R_cm2c21c28cm4c1cm30cm4c9c2c2c8cm2cm2cm6c5cm2 => x_cm2c21c28cm4c1cm30cm4c9c2c2c8cm2cm2cm6c5cm2_signal, 
                R_cm3c6c2c36c26cm5cm8c5c1c8c2c4c8c0c5c1 => x_cm3c6c2c36c26cm5cm8c5c1c8c2c4c8c0c5c1_signal, 
                R_c3c1c13c0c0c11c8c1cm1c2c3c15cm25c6c7c1 => x_c3c1c13c0c0c11c8c1cm1c2c3c15cm25c6c7c1_signal, 
                R_c5c0c3c1c7cm1cm7cm2c4c0c0cm9cm5cm1cm11cm2 => x_c5c0c3c1c7cm1cm7cm2c4c0c0cm9cm5cm1cm11cm2_signal, 
                R_cm2c3cm23cm5c1cm16c26c25cm30cm2c1c0c2c11c6cm4 => x_cm2c3cm23cm5c1cm16c26c25cm30cm2c1c0c2c11c6cm4_signal, 
                R_c4c1cm1cm3cm9c2c2cm9cm1c22c7cm2c8c0c1c4 => x_c4c1cm1cm3cm9c2c2cm9cm1c22c7cm2c8c0c1c4_signal, 
                R_c6cm2c1cm9cm3cm1cm3c16c0c8cm3cm4c4cm4c0cm15 => x_c6cm2c1cm9cm3cm1cm3c16c0c8cm3cm4c4cm4c0cm15_signal, 
                R_cm14c0cm1c3cm4cm7cm1cm1c6c2c0cm40cm10cm8cm18c11 => x_cm14c0cm1c3cm4cm7cm1cm1c6c2c0cm40cm10cm8cm18c11_signal, 
                R_cm4cm10c2c0c3c10cm9cm3c16cm1c4c0c0c13cm11cm17 => x_cm4cm10c2c0c3c10cm9cm3c16cm1c4c0c0c13cm11cm17_signal, 
                R_cm1c2c3cm47c4cm4c1c2c10c0c2c3cm8c2c3c2 => x_cm1c2c3cm47c4cm4c1c2c10c0c2c3cm8c2c3c2_signal, 
                R_c0c0cm1c0c1cm1c9c3c10cm1cm26c47c0c0cm9c0 => x_c0c0cm1c0c1cm1c9c3c10cm1cm26c47c0c0cm9c0_signal, 
                R_c1cm7c7cm1c5c7c3cm18cm1cm13c1cm9cm2c2cm7cm35 => x_c1cm7c7cm1c5c7c3cm18cm1cm13c1cm9cm2c2cm7cm35_signal, 
                R_c7c3cm3cm7c3c0c5c15c13c5c2c1c0cm5c1cm5 => x_c7c3cm3cm7c3c0c5c15c13c5c2c1c0cm5c1cm5_signal, 
                R_cm3c1c9c3c1cm10cm22cm3cm3c0c3cm3cm8cm4cm4cm7 => x_cm3c1c9c3c1cm10cm22cm3cm3c0c3cm3cm8cm4cm4cm7_signal, 
                R_c6c3c20c8cm1c3cm6cm3cm2cm9cm1cm10cm1cm6c4cm9 => x_c6c3c20c8cm1c3cm6cm3cm2cm9cm1cm10cm1cm6c4cm9_signal, 
                R_c1c1cm1cm2c0c0c0cm2c3c1c0c17c0c5c2cm3 => x_c1c1cm1cm2c0c0c0cm2c3c1c0c17c0c5c2cm3_signal, 
                R_c3c4c5c5c4cm13cm8cm4c13cm7c1c0c2c2cm4c4 => x_c3c4c5c5c4cm13cm8cm4c13cm7c1c0c2c2cm4c4_signal, 
                R_c0c4cm4c4cm4cm16c1cm2cm14c1c0cm38cm9cm1c0cm3 => x_c0c4cm4c4cm4cm16c1cm2cm14c1c0cm38cm9cm1c0cm3_signal, 
                R_cm24c12cm1cm12c0cm8cm4cm7c7c1c2cm3c3cm4c1c2 => x_cm24c12cm1cm12c0cm8cm4cm7c7c1c2cm3c3cm4c1c2_signal, 
                R_cm28c1cm1cm45cm4c2c10cm10c6c2cm2cm3c4cm9c8cm1 => x_cm28c1cm1cm45cm4c2c10cm10c6c2cm2cm3c4cm9c8cm1_signal, 
                R_cm1c0c6cm2cm3c3cm1cm3c31cm4c6cm6cm2c3c6cm6 => x_cm1c0c6cm2cm3c3cm1cm3c31cm4c6cm6cm2c3c6cm6_signal, 
                R_cm1cm1c0c2cm1cm6cm19c1cm1cm1c26c0c0cm6cm5cm3 => x_cm1cm1c0c2cm1cm6cm19c1cm1cm1c26c0c0cm6cm5cm3_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm1cm13c40c0c7c4c17c0cm2c1cm2cm1c9cm4cm2c2_signal;
    yo_2 <= x_c5cm4c1c2c22c11cm2c0cm11c1c8cm11cm7c1c1cm1_signal;
    yo_3 <= x_c0c29c6cm1c0cm5cm6cm1c42cm2c4c11cm1cm3c7c0_signal;
    yo_4 <= x_cm4c18c0c2cm13cm3c0cm4c3cm4cm7cm3cm4c9c3c0_signal;
    yo_5 <= x_cm1c1cm5c1cm10c0cm3cm3cm6cm1c2c4c6c0cm2cm2_signal;
    yo_6 <= x_c3cm11cm1c4c2cm8c2cm64c0cm3c6cm5c29c7cm1cm6_signal;
    yo_7 <= x_cm1cm3cm2c9c1cm7c10c1c15cm5c6c1c3cm10cm1c1_signal;
    yo_8 <= x_c0c6c5c8c1c4cm1c10cm11c0cm18cm78c2cm3c2c2_signal;
    yo_9 <= x_c2cm4c1c6cm9cm2c8c3cm5cm7c4cm2cm5cm2c1c1_signal;
    yo_10 <= x_cm17cm1c26c0c0c0cm4c0cm3c6cm1cm8c1c4c8cm1_signal;
    yo_11 <= x_cm2c21c28cm4c1cm30cm4c9c2c2c8cm2cm2cm6c5cm2_signal;
    yo_12 <= x_cm3c6c2c36c26cm5cm8c5c1c8c2c4c8c0c5c1_signal;
    yo_13 <= x_c3c1c13c0c0c11c8c1cm1c2c3c15cm25c6c7c1_signal;
    yo_14 <= x_c5c0c3c1c7cm1cm7cm2c4c0c0cm9cm5cm1cm11cm2_signal;
    yo_15 <= x_cm2c3cm23cm5c1cm16c26c25cm30cm2c1c0c2c11c6cm4_signal;
    yo_16 <= x_c4c1cm1cm3cm9c2c2cm9cm1c22c7cm2c8c0c1c4_signal;
    yo_17 <= x_c6cm2c1cm9cm3cm1cm3c16c0c8cm3cm4c4cm4c0cm15_signal;
    yo_18 <= x_cm14c0cm1c3cm4cm7cm1cm1c6c2c0cm40cm10cm8cm18c11_signal;
    yo_19 <= x_cm4cm10c2c0c3c10cm9cm3c16cm1c4c0c0c13cm11cm17_signal;
    yo_20 <= x_cm1c2c3cm47c4cm4c1c2c10c0c2c3cm8c2c3c2_signal;
    yo_21 <= x_c0c0cm1c0c1cm1c9c3c10cm1cm26c47c0c0cm9c0_signal;
    yo_22 <= x_c1cm7c7cm1c5c7c3cm18cm1cm13c1cm9cm2c2cm7cm35_signal;
    yo_23 <= x_c7c3cm3cm7c3c0c5c15c13c5c2c1c0cm5c1cm5_signal;
    yo_24 <= x_cm3c1c9c3c1cm10cm22cm3cm3c0c3cm3cm8cm4cm4cm7_signal;
    yo_25 <= x_c6c3c20c8cm1c3cm6cm3cm2cm9cm1cm10cm1cm6c4cm9_signal;
    yo_26 <= x_c1c1cm1cm2c0c0c0cm2c3c1c0c17c0c5c2cm3_signal;
    yo_27 <= x_c3c4c5c5c4cm13cm8cm4c13cm7c1c0c2c2cm4c4_signal;
    yo_28 <= x_c0c4cm4c4cm4cm16c1cm2cm14c1c0cm38cm9cm1c0cm3_signal;
    yo_29 <= x_cm24c12cm1cm12c0cm8cm4cm7c7c1c2cm3c3cm4c1c2_signal;
    yo_30 <= x_cm28c1cm1cm45cm4c2c10cm10c6c2cm2cm3c4cm9c8cm1_signal;
    yo_31 <= x_cm1c0c6cm2cm3c3cm1cm3c31cm4c6cm6cm2c3c6cm6_signal;
    yo_32 <= x_cm1cm1c0c2cm1cm6cm19c1cm1cm1c26c0c0cm6cm5cm3_signal;



end structural;