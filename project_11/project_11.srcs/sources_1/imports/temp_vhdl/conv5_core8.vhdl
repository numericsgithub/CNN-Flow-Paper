LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core8 is
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
        yo_2  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_4  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_5  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_6  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_8  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_9  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_11  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_12  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_14  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_16  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_17  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_19  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_20  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_21  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_22  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_23  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_26  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_30  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(5, -8)
    );
end conv5_core8;

architecture structural of conv5_core8 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c16c5c19c1cm7cm5cm23c0c9cm2cm2cm3cm7c6c3c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm49cm2cm1c4c0c8cm3cm5cm20c0cm1c2c2c26cm7cm12_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c1c43c6c2c5cm45c1c0cm2cm19c5c0c3cm5c0cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0cm5c1c0c7c7cm1c1cm1cm6c1c6c0cm4c0cm23_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm5c2c1c2cm5c0cm1cm3cm23c1cm3c0c9c2c7c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c3cm11c0cm4cm7c8cm1c9c127c3c0c5cm2c34c2cm12_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_c1cm8c0cm2c1c1c5cm3c0c23c1c0c6c1c8c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c3c13cm1cm8cm5cm8c8cm2c0cm5c3c4c5cm6cm12cm8_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm2c3c15cm2c4cm3cm10c6cm2c2c2c6cm7cm3cm12c12_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm17cm7c3cm1c7c4cm24cm2cm3c2cm2c3c1c8cm20c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1cm4c1c0cm1cm13c11c2c4cm3cm6c2cm1cm9cm9c7_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0c6cm1c52cm7c1cm2c6cm13c1cm4cm3cm13cm11c1c6_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c2c3c6c0c2cm1cm2c0cm11c6c11c1cm1cm6c20c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c3c0c8cm3c4c1cm5cm2c0c0cm3c0c0c0c1c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm1c3cm7cm26cm1cm4c9cm3c2c5c2cm19c1c0cm2cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c4c4cm1cm5cm2c2cm5cm2c2c0cm2c0cm5c2cm8c2_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_cm6cm2c1cm8c1cm2cm3cm5cm12c0c1c4cm1cm1cm3c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c3c6cm7cm7cm1cm5c2cm16c2cm4c20c0c7cm10c2c3_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm3c10c6cm14cm1cm1c1c6cm1cm1cm7c12cm1c1c7c4_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c2c1cm7cm8c3cm2c2cm4c1cm6c7cm6cm3c0cm20c9_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c0cm4c0cm2c0c6cm2c0c2cm1c4c3cm1c2c4_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_cm8cm2c1cm11c15cm3c0c47c7cm3c74cm10c7c3cm2cm24_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_c5c0cm3cm7c8c10cm1c4cm8cm7c2c5cm1cm6cm14c3_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm7c4cm4cm2c1c1cm2cm1c3cm5cm7cm1cm1cm17cm17cm10_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c21cm5c3c4cm10cm6c0cm7cm12c0cm2c3cm6cm2cm11cm14_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0cm5c0c2c1c2cm1c1c0cm4cm1c0cm3c2cm1cm1_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_cm4cm5cm4c1c2c4cm1cm1c2c1c2c0cm5cm16cm21c4_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm10cm2cm13c2c1cm2cm1c1c0cm3cm2c1cm20cm5c1cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c5cm11cm11cm1c7cm1c8c4c0c4c3c5c0cm16c21c26_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm15c6c3c19c5cm2cm7cm67c7c11c3cm8c20c0cm6c14_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_c0cm2cm7c2cm2cm4cm20cm5c7c2cm16cm2cm7c9c4cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0cm8c5c3c0c0cm4c0c1c5c2c5c1cm28c3c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core8_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c16c5c19c1cm7cm5cm23c0c9cm2cm2cm3cm7c6c3c0 => x_c16c5c19c1cm7cm5cm23c0c9cm2cm2cm3cm7c6c3c0_signal, 
                R_cm49cm2cm1c4c0c8cm3cm5cm20c0cm1c2c2c26cm7cm12 => x_cm49cm2cm1c4c0c8cm3cm5cm20c0cm1c2c2c26cm7cm12_signal, 
                R_c1c43c6c2c5cm45c1c0cm2cm19c5c0c3cm5c0cm2 => x_c1c43c6c2c5cm45c1c0cm2cm19c5c0c3cm5c0cm2_signal, 
                R_c0cm5c1c0c7c7cm1c1cm1cm6c1c6c0cm4c0cm23 => x_c0cm5c1c0c7c7cm1c1cm1cm6c1c6c0cm4c0cm23_signal, 
                R_cm5c2c1c2cm5c0cm1cm3cm23c1cm3c0c9c2c7c0 => x_cm5c2c1c2cm5c0cm1cm3cm23c1cm3c0c9c2c7c0_signal, 
                R_c3cm11c0cm4cm7c8cm1c9c127c3c0c5cm2c34c2cm12 => x_c3cm11c0cm4cm7c8cm1c9c127c3c0c5cm2c34c2cm12_signal, 
                R_c1cm8c0cm2c1c1c5cm3c0c23c1c0c6c1c8c1 => x_c1cm8c0cm2c1c1c5cm3c0c23c1c0c6c1c8c1_signal, 
                R_c3c13cm1cm8cm5cm8c8cm2c0cm5c3c4c5cm6cm12cm8 => x_c3c13cm1cm8cm5cm8c8cm2c0cm5c3c4c5cm6cm12cm8_signal, 
                R_cm2c3c15cm2c4cm3cm10c6cm2c2c2c6cm7cm3cm12c12 => x_cm2c3c15cm2c4cm3cm10c6cm2c2c2c6cm7cm3cm12c12_signal, 
                R_cm17cm7c3cm1c7c4cm24cm2cm3c2cm2c3c1c8cm20c1 => x_cm17cm7c3cm1c7c4cm24cm2cm3c2cm2c3c1c8cm20c1_signal, 
                R_c1cm4c1c0cm1cm13c11c2c4cm3cm6c2cm1cm9cm9c7 => x_c1cm4c1c0cm1cm13c11c2c4cm3cm6c2cm1cm9cm9c7_signal, 
                R_c0c6cm1c52cm7c1cm2c6cm13c1cm4cm3cm13cm11c1c6 => x_c0c6cm1c52cm7c1cm2c6cm13c1cm4cm3cm13cm11c1c6_signal, 
                R_c2c3c6c0c2cm1cm2c0cm11c6c11c1cm1cm6c20c2 => x_c2c3c6c0c2cm1cm2c0cm11c6c11c1cm1cm6c20c2_signal, 
                R_c3c0c8cm3c4c1cm5cm2c0c0cm3c0c0c0c1c0 => x_c3c0c8cm3c4c1cm5cm2c0c0cm3c0c0c0c1c0_signal, 
                R_cm1c3cm7cm26cm1cm4c9cm3c2c5c2cm19c1c0cm2cm2 => x_cm1c3cm7cm26cm1cm4c9cm3c2c5c2cm19c1c0cm2cm2_signal, 
                R_c4c4cm1cm5cm2c2cm5cm2c2c0cm2c0cm5c2cm8c2 => x_c4c4cm1cm5cm2c2cm5cm2c2c0cm2c0cm5c2cm8c2_signal, 
                R_cm6cm2c1cm8c1cm2cm3cm5cm12c0c1c4cm1cm1cm3c0 => x_cm6cm2c1cm8c1cm2cm3cm5cm12c0c1c4cm1cm1cm3c0_signal, 
                R_c3c6cm7cm7cm1cm5c2cm16c2cm4c20c0c7cm10c2c3 => x_c3c6cm7cm7cm1cm5c2cm16c2cm4c20c0c7cm10c2c3_signal, 
                R_cm3c10c6cm14cm1cm1c1c6cm1cm1cm7c12cm1c1c7c4 => x_cm3c10c6cm14cm1cm1c1c6cm1cm1cm7c12cm1c1c7c4_signal, 
                R_c2c1cm7cm8c3cm2c2cm4c1cm6c7cm6cm3c0cm20c9 => x_c2c1cm7cm8c3cm2c2cm4c1cm6c7cm6cm3c0cm20c9_signal, 
                R_c0c0cm4c0cm2c0c6cm2c0c2cm1c4c3cm1c2c4 => x_c0c0cm4c0cm2c0c6cm2c0c2cm1c4c3cm1c2c4_signal, 
                R_cm8cm2c1cm11c15cm3c0c47c7cm3c74cm10c7c3cm2cm24 => x_cm8cm2c1cm11c15cm3c0c47c7cm3c74cm10c7c3cm2cm24_signal, 
                R_c5c0cm3cm7c8c10cm1c4cm8cm7c2c5cm1cm6cm14c3 => x_c5c0cm3cm7c8c10cm1c4cm8cm7c2c5cm1cm6cm14c3_signal, 
                R_cm7c4cm4cm2c1c1cm2cm1c3cm5cm7cm1cm1cm17cm17cm10 => x_cm7c4cm4cm2c1c1cm2cm1c3cm5cm7cm1cm1cm17cm17cm10_signal, 
                R_c21cm5c3c4cm10cm6c0cm7cm12c0cm2c3cm6cm2cm11cm14 => x_c21cm5c3c4cm10cm6c0cm7cm12c0cm2c3cm6cm2cm11cm14_signal, 
                R_c0cm5c0c2c1c2cm1c1c0cm4cm1c0cm3c2cm1cm1 => x_c0cm5c0c2c1c2cm1c1c0cm4cm1c0cm3c2cm1cm1_signal, 
                R_cm4cm5cm4c1c2c4cm1cm1c2c1c2c0cm5cm16cm21c4 => x_cm4cm5cm4c1c2c4cm1cm1c2c1c2c0cm5cm16cm21c4_signal, 
                R_cm10cm2cm13c2c1cm2cm1c1c0cm3cm2c1cm20cm5c1cm3 => x_cm10cm2cm13c2c1cm2cm1c1c0cm3cm2c1cm20cm5c1cm3_signal, 
                R_c5cm11cm11cm1c7cm1c8c4c0c4c3c5c0cm16c21c26 => x_c5cm11cm11cm1c7cm1c8c4c0c4c3c5c0cm16c21c26_signal, 
                R_cm15c6c3c19c5cm2cm7cm67c7c11c3cm8c20c0cm6c14 => x_cm15c6c3c19c5cm2cm7cm67c7c11c3cm8c20c0cm6c14_signal, 
                R_c0cm2cm7c2cm2cm4cm20cm5c7c2cm16cm2cm7c9c4cm6 => x_c0cm2cm7c2cm2cm4cm20cm5c7c2cm16cm2cm7c9c4cm6_signal, 
                R_c0cm8c5c3c0c0cm4c0c1c5c2c5c1cm28c3c0 => x_c0cm8c5c3c0c0cm4c0c1c5c2c5c1cm28c3c0_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c16c5c19c1cm7cm5cm23c0c9cm2cm2cm3cm7c6c3c0_signal;
    yo_2 <= x_cm49cm2cm1c4c0c8cm3cm5cm20c0cm1c2c2c26cm7cm12_signal;
    yo_3 <= x_c1c43c6c2c5cm45c1c0cm2cm19c5c0c3cm5c0cm2_signal;
    yo_4 <= x_c0cm5c1c0c7c7cm1c1cm1cm6c1c6c0cm4c0cm23_signal;
    yo_5 <= x_cm5c2c1c2cm5c0cm1cm3cm23c1cm3c0c9c2c7c0_signal;
    yo_6 <= x_c3cm11c0cm4cm7c8cm1c9c127c3c0c5cm2c34c2cm12_signal;
    yo_7 <= x_c1cm8c0cm2c1c1c5cm3c0c23c1c0c6c1c8c1_signal;
    yo_8 <= x_c3c13cm1cm8cm5cm8c8cm2c0cm5c3c4c5cm6cm12cm8_signal;
    yo_9 <= x_cm2c3c15cm2c4cm3cm10c6cm2c2c2c6cm7cm3cm12c12_signal;
    yo_10 <= x_cm17cm7c3cm1c7c4cm24cm2cm3c2cm2c3c1c8cm20c1_signal;
    yo_11 <= x_c1cm4c1c0cm1cm13c11c2c4cm3cm6c2cm1cm9cm9c7_signal;
    yo_12 <= x_c0c6cm1c52cm7c1cm2c6cm13c1cm4cm3cm13cm11c1c6_signal;
    yo_13 <= x_c2c3c6c0c2cm1cm2c0cm11c6c11c1cm1cm6c20c2_signal;
    yo_14 <= x_c3c0c8cm3c4c1cm5cm2c0c0cm3c0c0c0c1c0_signal;
    yo_15 <= x_cm1c3cm7cm26cm1cm4c9cm3c2c5c2cm19c1c0cm2cm2_signal;
    yo_16 <= x_c4c4cm1cm5cm2c2cm5cm2c2c0cm2c0cm5c2cm8c2_signal;
    yo_17 <= x_cm6cm2c1cm8c1cm2cm3cm5cm12c0c1c4cm1cm1cm3c0_signal;
    yo_18 <= x_c3c6cm7cm7cm1cm5c2cm16c2cm4c20c0c7cm10c2c3_signal;
    yo_19 <= x_cm3c10c6cm14cm1cm1c1c6cm1cm1cm7c12cm1c1c7c4_signal;
    yo_20 <= x_c2c1cm7cm8c3cm2c2cm4c1cm6c7cm6cm3c0cm20c9_signal;
    yo_21 <= x_c0c0cm4c0cm2c0c6cm2c0c2cm1c4c3cm1c2c4_signal;
    yo_22 <= x_cm8cm2c1cm11c15cm3c0c47c7cm3c74cm10c7c3cm2cm24_signal;
    yo_23 <= x_c5c0cm3cm7c8c10cm1c4cm8cm7c2c5cm1cm6cm14c3_signal;
    yo_24 <= x_cm7c4cm4cm2c1c1cm2cm1c3cm5cm7cm1cm1cm17cm17cm10_signal;
    yo_25 <= x_c21cm5c3c4cm10cm6c0cm7cm12c0cm2c3cm6cm2cm11cm14_signal;
    yo_26 <= x_c0cm5c0c2c1c2cm1c1c0cm4cm1c0cm3c2cm1cm1_signal;
    yo_27 <= x_cm4cm5cm4c1c2c4cm1cm1c2c1c2c0cm5cm16cm21c4_signal;
    yo_28 <= x_cm10cm2cm13c2c1cm2cm1c1c0cm3cm2c1cm20cm5c1cm3_signal;
    yo_29 <= x_c5cm11cm11cm1c7cm1c8c4c0c4c3c5c0cm16c21c26_signal;
    yo_30 <= x_cm15c6c3c19c5cm2cm7cm67c7c11c3cm8c20c0cm6c14_signal;
    yo_31 <= x_c0cm2cm7c2cm2cm4cm20cm5c7c2cm16cm2cm7c9c4cm6_signal;
    yo_32 <= x_c0cm8c5c3c0c0cm4c0c1c5c2c5c1cm28c3c0_signal;



end structural;