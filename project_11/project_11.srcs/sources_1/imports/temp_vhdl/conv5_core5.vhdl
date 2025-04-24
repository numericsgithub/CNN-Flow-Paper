LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core5 is
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
        yo_5  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_7  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_9  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_14  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_16  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_18  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_21  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_26  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_28  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_29  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_31  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(5, -8)
    );
end conv5_core5;

architecture structural of conv5_core5 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm3c0c2cm1cm8cm4c28cm1c13cm3cm23c0cm15c3c7c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm19c2c1c5c3cm8c3c1c20cm22c3cm10c17c8c1cm4_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1cm2cm2c3cm6cm11c11c1c3cm15cm15c6cm1cm5c3c1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c15c8cm2c3c5cm23cm7cm1cm5cm7c12c23cm2cm11c0cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c18c0cm6cm1c1c0cm7cm1c0c1c6c3c12c0cm7c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c9c2c0cm26cm4cm8cm4c4c1cm24cm4c6c7cm5c0c9_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1cm10c0cm1c3cm9cm3c3c4cm8cm5cm7c3c57c1cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c5cm2c9c1c0cm12c5c0cm3c17c6cm6c0cm2c5c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1c6cm4c2c2c2cm9cm6c10cm10c17cm26c0c7c13cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c8cm4c2c3cm12c1c7cm2c6cm8cm2cm1cm3c0c23c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1c6cm4c1cm3c0c13cm5c1c10c52cm7cm5c4cm2c2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm7c1c13c1c0cm2c3cm10c19cm23c1cm3cm6cm1c2c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c0c2cm1cm1cm3c8c1c5c8cm30cm1c20cm13cm14c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c15c0c0cm2cm1c0cm11c2cm3c0cm2cm7cm5c0c2c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm1cm6c0cm12c1cm3cm4cm4c1cm14c6cm5c0c12cm6c17_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c10c0c3c7cm1c5c2cm3cm8cm2c2c1c3c5c1c4_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c12c0c0c18c10c3cm1cm2c6cm2cm3cm3c3c0c1cm13_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1cm4c1c12cm3cm9c0c0cm1c6cm8c2c2c3cm7cm5_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1c3c26c8c3cm3c5c7c3cm1c12cm20c2cm3c0c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c2cm30c2c3c2c0c15cm10c0cm2c13c32cm3c1cm7c0_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm1cm3cm2c1c0c0cm3cm2c0c0cm23cm2cm1cm2c8c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm2cm6cm47cm21c12cm5c4c21c2c14cm5c24cm1cm3cm11cm57_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm10c6c2c23c3c0c2cm4c2c3cm14cm3cm7c3cm2cm9_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm29c3cm2c2c0c3c5c5c2c1c10c15cm9c2c23c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1c8c1cm2cm11cm2c4cm3c16c2cm2cm3c5c6c3cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0cm2cm4c0c0c5cm1c0c0cm5c1c3c0c4cm3cm1_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c0c1cm7cm2c5c6c12cm2c0c10c24cm10cm3c2c9c4_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm5cm2c4c0c5cm3c8cm3cm10c1cm11cm4cm15c6c1cm1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c4c1c4c1cm8c10c10cm1c2c25cm41cm20c4cm1c2cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm2c0cm1c1cm4cm8cm4cm23c6c6cm11cm18cm1cm10c7c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1cm3cm2c6cm12cm6c6c2c10cm9cm13c7cm1cm1c6cm1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1c1c10c2c2c11c0cm3c2c21cm20c0c1cm7c2cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core5_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm3c0c2cm1cm8cm4c28cm1c13cm3cm23c0cm15c3c7c2 => x_cm3c0c2cm1cm8cm4c28cm1c13cm3cm23c0cm15c3c7c2_signal, 
                R_cm19c2c1c5c3cm8c3c1c20cm22c3cm10c17c8c1cm4 => x_cm19c2c1c5c3cm8c3c1c20cm22c3cm10c17c8c1cm4_signal, 
                R_c1cm2cm2c3cm6cm11c11c1c3cm15cm15c6cm1cm5c3c1 => x_c1cm2cm2c3cm6cm11c11c1c3cm15cm15c6cm1cm5c3c1_signal, 
                R_c15c8cm2c3c5cm23cm7cm1cm5cm7c12c23cm2cm11c0cm8 => x_c15c8cm2c3c5cm23cm7cm1cm5cm7c12c23cm2cm11c0cm8_signal, 
                R_c18c0cm6cm1c1c0cm7cm1c0c1c6c3c12c0cm7c1 => x_c18c0cm6cm1c1c0cm7cm1c0c1c6c3c12c0cm7c1_signal, 
                R_c9c2c0cm26cm4cm8cm4c4c1cm24cm4c6c7cm5c0c9 => x_c9c2c0cm26cm4cm8cm4c4c1cm24cm4c6c7cm5c0c9_signal, 
                R_cm1cm10c0cm1c3cm9cm3c3c4cm8cm5cm7c3c57c1cm1 => x_cm1cm10c0cm1c3cm9cm3c3c4cm8cm5cm7c3c57c1cm1_signal, 
                R_c5cm2c9c1c0cm12c5c0cm3c17c6cm6c0cm2c5c1 => x_c5cm2c9c1c0cm12c5c0cm3c17c6cm6c0cm2c5c1_signal, 
                R_cm1c6cm4c2c2c2cm9cm6c10cm10c17cm26c0c7c13cm2 => x_cm1c6cm4c2c2c2cm9cm6c10cm10c17cm26c0c7c13cm2_signal, 
                R_c8cm4c2c3cm12c1c7cm2c6cm8cm2cm1cm3c0c23c0 => x_c8cm4c2c3cm12c1c7cm2c6cm8cm2cm1cm3c0c23c0_signal, 
                R_c1c6cm4c1cm3c0c13cm5c1c10c52cm7cm5c4cm2c2 => x_c1c6cm4c1cm3c0c13cm5c1c10c52cm7cm5c4cm2c2_signal, 
                R_cm7c1c13c1c0cm2c3cm10c19cm23c1cm3cm6cm1c2c2 => x_cm7c1c13c1c0cm2c3cm10c19cm23c1cm3cm6cm1c2c2_signal, 
                R_c0c0c2cm1cm1cm3c8c1c5c8cm30cm1c20cm13cm14c2 => x_c0c0c2cm1cm1cm3c8c1c5c8cm30cm1c20cm13cm14c2_signal, 
                R_c15c0c0cm2cm1c0cm11c2cm3c0cm2cm7cm5c0c2c0 => x_c15c0c0cm2cm1c0cm11c2cm3c0cm2cm7cm5c0c2c0_signal, 
                R_cm1cm6c0cm12c1cm3cm4cm4c1cm14c6cm5c0c12cm6c17 => x_cm1cm6c0cm12c1cm3cm4cm4c1cm14c6cm5c0c12cm6c17_signal, 
                R_c10c0c3c7cm1c5c2cm3cm8cm2c2c1c3c5c1c4 => x_c10c0c3c7cm1c5c2cm3cm8cm2c2c1c3c5c1c4_signal, 
                R_c12c0c0c18c10c3cm1cm2c6cm2cm3cm3c3c0c1cm13 => x_c12c0c0c18c10c3cm1cm2c6cm2cm3cm3c3c0c1cm13_signal, 
                R_cm1cm4c1c12cm3cm9c0c0cm1c6cm8c2c2c3cm7cm5 => x_cm1cm4c1c12cm3cm9c0c0cm1c6cm8c2c2c3cm7cm5_signal, 
                R_c1c3c26c8c3cm3c5c7c3cm1c12cm20c2cm3c0c2 => x_c1c3c26c8c3cm3c5c7c3cm1c12cm20c2cm3c0c2_signal, 
                R_c2cm30c2c3c2c0c15cm10c0cm2c13c32cm3c1cm7c0 => x_c2cm30c2c3c2c0c15cm10c0cm2c13c32cm3c1cm7c0_signal, 
                R_cm1cm3cm2c1c0c0cm3cm2c0c0cm23cm2cm1cm2c8c1 => x_cm1cm3cm2c1c0c0cm3cm2c0c0cm23cm2cm1cm2c8c1_signal, 
                R_cm2cm6cm47cm21c12cm5c4c21c2c14cm5c24cm1cm3cm11cm57 => x_cm2cm6cm47cm21c12cm5c4c21c2c14cm5c24cm1cm3cm11cm57_signal, 
                R_cm10c6c2c23c3c0c2cm4c2c3cm14cm3cm7c3cm2cm9 => x_cm10c6c2c23c3c0c2cm4c2c3cm14cm3cm7c3cm2cm9_signal, 
                R_cm29c3cm2c2c0c3c5c5c2c1c10c15cm9c2c23c1 => x_cm29c3cm2c2c0c3c5c5c2c1c10c15cm9c2c23c1_signal, 
                R_cm1c8c1cm2cm11cm2c4cm3c16c2cm2cm3c5c6c3cm5 => x_cm1c8c1cm2cm11cm2c4cm3c16c2cm2cm3c5c6c3cm5_signal, 
                R_c0cm2cm4c0c0c5cm1c0c0cm5c1c3c0c4cm3cm1 => x_c0cm2cm4c0c0c5cm1c0c0cm5c1c3c0c4cm3cm1_signal, 
                R_c0c1cm7cm2c5c6c12cm2c0c10c24cm10cm3c2c9c4 => x_c0c1cm7cm2c5c6c12cm2c0c10c24cm10cm3c2c9c4_signal, 
                R_cm5cm2c4c0c5cm3c8cm3cm10c1cm11cm4cm15c6c1cm1 => x_cm5cm2c4c0c5cm3c8cm3cm10c1cm11cm4cm15c6c1cm1_signal, 
                R_c4c1c4c1cm8c10c10cm1c2c25cm41cm20c4cm1c2cm2 => x_c4c1c4c1cm8c10c10cm1c2c25cm41cm20c4cm1c2cm2_signal, 
                R_cm2c0cm1c1cm4cm8cm4cm23c6c6cm11cm18cm1cm10c7c1 => x_cm2c0cm1c1cm4cm8cm4cm23c6c6cm11cm18cm1cm10c7c1_signal, 
                R_c1cm3cm2c6cm12cm6c6c2c10cm9cm13c7cm1cm1c6cm1 => x_c1cm3cm2c6cm12cm6c6c2c10cm9cm13c7cm1cm1c6cm1_signal, 
                R_c1c1c10c2c2c11c0cm3c2c21cm20c0c1cm7c2cm3 => x_c1c1c10c2c2c11c0cm3c2c21cm20c0c1cm7c2cm3_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm3c0c2cm1cm8cm4c28cm1c13cm3cm23c0cm15c3c7c2_signal;
    yo_2 <= x_cm19c2c1c5c3cm8c3c1c20cm22c3cm10c17c8c1cm4_signal;
    yo_3 <= x_c1cm2cm2c3cm6cm11c11c1c3cm15cm15c6cm1cm5c3c1_signal;
    yo_4 <= x_c15c8cm2c3c5cm23cm7cm1cm5cm7c12c23cm2cm11c0cm8_signal;
    yo_5 <= x_c18c0cm6cm1c1c0cm7cm1c0c1c6c3c12c0cm7c1_signal;
    yo_6 <= x_c9c2c0cm26cm4cm8cm4c4c1cm24cm4c6c7cm5c0c9_signal;
    yo_7 <= x_cm1cm10c0cm1c3cm9cm3c3c4cm8cm5cm7c3c57c1cm1_signal;
    yo_8 <= x_c5cm2c9c1c0cm12c5c0cm3c17c6cm6c0cm2c5c1_signal;
    yo_9 <= x_cm1c6cm4c2c2c2cm9cm6c10cm10c17cm26c0c7c13cm2_signal;
    yo_10 <= x_c8cm4c2c3cm12c1c7cm2c6cm8cm2cm1cm3c0c23c0_signal;
    yo_11 <= x_c1c6cm4c1cm3c0c13cm5c1c10c52cm7cm5c4cm2c2_signal;
    yo_12 <= x_cm7c1c13c1c0cm2c3cm10c19cm23c1cm3cm6cm1c2c2_signal;
    yo_13 <= x_c0c0c2cm1cm1cm3c8c1c5c8cm30cm1c20cm13cm14c2_signal;
    yo_14 <= x_c15c0c0cm2cm1c0cm11c2cm3c0cm2cm7cm5c0c2c0_signal;
    yo_15 <= x_cm1cm6c0cm12c1cm3cm4cm4c1cm14c6cm5c0c12cm6c17_signal;
    yo_16 <= x_c10c0c3c7cm1c5c2cm3cm8cm2c2c1c3c5c1c4_signal;
    yo_17 <= x_c12c0c0c18c10c3cm1cm2c6cm2cm3cm3c3c0c1cm13_signal;
    yo_18 <= x_cm1cm4c1c12cm3cm9c0c0cm1c6cm8c2c2c3cm7cm5_signal;
    yo_19 <= x_c1c3c26c8c3cm3c5c7c3cm1c12cm20c2cm3c0c2_signal;
    yo_20 <= x_c2cm30c2c3c2c0c15cm10c0cm2c13c32cm3c1cm7c0_signal;
    yo_21 <= x_cm1cm3cm2c1c0c0cm3cm2c0c0cm23cm2cm1cm2c8c1_signal;
    yo_22 <= x_cm2cm6cm47cm21c12cm5c4c21c2c14cm5c24cm1cm3cm11cm57_signal;
    yo_23 <= x_cm10c6c2c23c3c0c2cm4c2c3cm14cm3cm7c3cm2cm9_signal;
    yo_24 <= x_cm29c3cm2c2c0c3c5c5c2c1c10c15cm9c2c23c1_signal;
    yo_25 <= x_cm1c8c1cm2cm11cm2c4cm3c16c2cm2cm3c5c6c3cm5_signal;
    yo_26 <= x_c0cm2cm4c0c0c5cm1c0c0cm5c1c3c0c4cm3cm1_signal;
    yo_27 <= x_c0c1cm7cm2c5c6c12cm2c0c10c24cm10cm3c2c9c4_signal;
    yo_28 <= x_cm5cm2c4c0c5cm3c8cm3cm10c1cm11cm4cm15c6c1cm1_signal;
    yo_29 <= x_c4c1c4c1cm8c10c10cm1c2c25cm41cm20c4cm1c2cm2_signal;
    yo_30 <= x_cm2c0cm1c1cm4cm8cm4cm23c6c6cm11cm18cm1cm10c7c1_signal;
    yo_31 <= x_c1cm3cm2c6cm12cm6c6c2c10cm9cm13c7cm1cm1c6cm1_signal;
    yo_32 <= x_c1c1c10c2c2c11c0cm3c2c21cm20c0c1cm7c2cm3_signal;



end structural;