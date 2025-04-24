LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core4 is
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
        yo_3  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_5  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_6  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_7  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_9  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_12  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_14  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_16  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_20  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_26  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_28  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_29  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_31  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(5, -8)
    );
end conv5_core4;

architecture structural of conv5_core4 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm1cm2c11c0c1c0c3cm1c0c4cm3cm1c4c12cm45cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c6cm13c2cm2c10c0cm5c1cm12c17c0c4c0c13cm2cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm6c0cm15c2c3cm1c6c0cm11cm2cm11cm1c8cm25cm8c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm2c0cm15cm18cm2c2cm3c1cm8cm7c4c5c1c35cm1cm13_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c3c0c2c1c4c3c2cm6cm23c1cm3c1c2c1cm2cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c3cm1cm1c15c0cm3cm8c4cm2cm8c2c10c5c13c0cm9_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c2c6cm5cm1c5cm4c2cm1cm2c0c5cm1c0cm2c1cm14_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm2c2c12c0cm2c6c17cm8c5cm1c1c7c1c9c23c15_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c11c9cm14c1c1c10cm2cm2cm2c10cm2cm4cm1c2c6c12_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm5c12cm2cm1cm3cm2c4c1c17cm2c22c2c21c4cm6c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1cm10c3cm12cm1cm1cm4c0c1cm6c6c4c2c19c6c4_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm37c2cm5c1c1c1c0c0c58c1c6c2c0cm7c4c11_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c1c1cm10c0c1c1cm13c0c1c0c0c1c5c1cm22c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm25c3c1cm4cm7cm1cm1cm8cm48c0cm4c3cm5cm1cm6cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c2c23c8c1c6cm1c0c2c0cm22cm10c17c1c2cm36c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm20cm2c0c22cm8c2cm6c3cm45cm2c1cm8cm3c4c4c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c11c1cm3cm14c4cm1c3c7cm4c3c4c42c1c0c1cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c11cm4cm4c17cm4cm3cm2c8cm14cm3cm1c2c2c9cm4cm15_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1cm16cm14c10c0cm9cm7c1cm1cm18cm5cm4c3cm7cm7cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm8c23cm3c4cm6c0cm2c3cm3cm15c14cm1c0c1cm22c27_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm2cm1cm5c0c1c0c33cm2c1c1c13cm1c0cm1c17cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c13cm2c16c4cm2c1c1cm10c4cm2cm1c5cm37cm3c0c3_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0cm6cm2cm11cm7c5c2cm3cm2c16cm1cm10c1c16cm2c4_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c5cm1c17cm16c1cm4c3c1cm22c7c0c6c2cm27cm9cm13_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c4c21c3c3c0c4c2c5cm3c5c1c2c6c3c14cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1cm2c4c2c0cm3cm1cm1c0c2cm8cm5c0cm2c1c3_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_cm6cm1c12c4c2c11cm1c1c1cm4cm12cm1cm4c3cm42cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm2c16cm4c7c69cm13cm2c13c4cm12c5cm3cm12c0cm2cm3_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_c1cm2c0cm2cm2cm2cm4cm2c3c2c2c5cm13cm4cm3c5_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c7cm3cm29cm2cm4c1cm1cm2cm2c0c26c3c5c2cm2cm32_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm5c10c8cm9cm4c1cm1c5c4c0c0c7cm2c9c3cm3_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm1cm3c22cm2c1cm10c17c2c2c9c4c2c2cm25c13cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core4_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm1cm2c11c0c1c0c3cm1c0c4cm3cm1c4c12cm45cm1 => x_cm1cm2c11c0c1c0c3cm1c0c4cm3cm1c4c12cm45cm1_signal, 
                R_c6cm13c2cm2c10c0cm5c1cm12c17c0c4c0c13cm2cm5 => x_c6cm13c2cm2c10c0cm5c1cm12c17c0c4c0c13cm2cm5_signal, 
                R_cm6c0cm15c2c3cm1c6c0cm11cm2cm11cm1c8cm25cm8c0 => x_cm6c0cm15c2c3cm1c6c0cm11cm2cm11cm1c8cm25cm8c0_signal, 
                R_cm2c0cm15cm18cm2c2cm3c1cm8cm7c4c5c1c35cm1cm13 => x_cm2c0cm15cm18cm2c2cm3c1cm8cm7c4c5c1c35cm1cm13_signal, 
                R_c3c0c2c1c4c3c2cm6cm23c1cm3c1c2c1cm2cm1 => x_c3c0c2c1c4c3c2cm6cm23c1cm3c1c2c1cm2cm1_signal, 
                R_c3cm1cm1c15c0cm3cm8c4cm2cm8c2c10c5c13c0cm9 => x_c3cm1cm1c15c0cm3cm8c4cm2cm8c2c10c5c13c0cm9_signal, 
                R_c2c6cm5cm1c5cm4c2cm1cm2c0c5cm1c0cm2c1cm14 => x_c2c6cm5cm1c5cm4c2cm1cm2c0c5cm1c0cm2c1cm14_signal, 
                R_cm2c2c12c0cm2c6c17cm8c5cm1c1c7c1c9c23c15 => x_cm2c2c12c0cm2c6c17cm8c5cm1c1c7c1c9c23c15_signal, 
                R_c11c9cm14c1c1c10cm2cm2cm2c10cm2cm4cm1c2c6c12 => x_c11c9cm14c1c1c10cm2cm2cm2c10cm2cm4cm1c2c6c12_signal, 
                R_cm5c12cm2cm1cm3cm2c4c1c17cm2c22c2c21c4cm6c2 => x_cm5c12cm2cm1cm3cm2c4c1c17cm2c22c2c21c4cm6c2_signal, 
                R_cm1cm10c3cm12cm1cm1cm4c0c1cm6c6c4c2c19c6c4 => x_cm1cm10c3cm12cm1cm1cm4c0c1cm6c6c4c2c19c6c4_signal, 
                R_cm37c2cm5c1c1c1c0c0c58c1c6c2c0cm7c4c11 => x_cm37c2cm5c1c1c1c0c0c58c1c6c2c0cm7c4c11_signal, 
                R_c1c1cm10c0c1c1cm13c0c1c0c0c1c5c1cm22c1 => x_c1c1cm10c0c1c1cm13c0c1c0c0c1c5c1cm22c1_signal, 
                R_cm25c3c1cm4cm7cm1cm1cm8cm48c0cm4c3cm5cm1cm6cm4 => x_cm25c3c1cm4cm7cm1cm1cm8cm48c0cm4c3cm5cm1cm6cm4_signal, 
                R_c2c23c8c1c6cm1c0c2c0cm22cm10c17c1c2cm36c1 => x_c2c23c8c1c6cm1c0c2c0cm22cm10c17c1c2cm36c1_signal, 
                R_cm20cm2c0c22cm8c2cm6c3cm45cm2c1cm8cm3c4c4c1 => x_cm20cm2c0c22cm8c2cm6c3cm45cm2c1cm8cm3c4c4c1_signal, 
                R_c11c1cm3cm14c4cm1c3c7cm4c3c4c42c1c0c1cm1 => x_c11c1cm3cm14c4cm1c3c7cm4c3c4c42c1c0c1cm1_signal, 
                R_c11cm4cm4c17cm4cm3cm2c8cm14cm3cm1c2c2c9cm4cm15 => x_c11cm4cm4c17cm4cm3cm2c8cm14cm3cm1c2c2c9cm4cm15_signal, 
                R_c1cm16cm14c10c0cm9cm7c1cm1cm18cm5cm4c3cm7cm7cm6 => x_c1cm16cm14c10c0cm9cm7c1cm1cm18cm5cm4c3cm7cm7cm6_signal, 
                R_cm8c23cm3c4cm6c0cm2c3cm3cm15c14cm1c0c1cm22c27 => x_cm8c23cm3c4cm6c0cm2c3cm3cm15c14cm1c0c1cm22c27_signal, 
                R_cm2cm1cm5c0c1c0c33cm2c1c1c13cm1c0cm1c17cm1 => x_cm2cm1cm5c0c1c0c33cm2c1c1c13cm1c0cm1c17cm1_signal, 
                R_c13cm2c16c4cm2c1c1cm10c4cm2cm1c5cm37cm3c0c3 => x_c13cm2c16c4cm2c1c1cm10c4cm2cm1c5cm37cm3c0c3_signal, 
                R_c0cm6cm2cm11cm7c5c2cm3cm2c16cm1cm10c1c16cm2c4 => x_c0cm6cm2cm11cm7c5c2cm3cm2c16cm1cm10c1c16cm2c4_signal, 
                R_c5cm1c17cm16c1cm4c3c1cm22c7c0c6c2cm27cm9cm13 => x_c5cm1c17cm16c1cm4c3c1cm22c7c0c6c2cm27cm9cm13_signal, 
                R_c4c21c3c3c0c4c2c5cm3c5c1c2c6c3c14cm6 => x_c4c21c3c3c0c4c2c5cm3c5c1c2c6c3c14cm6_signal, 
                R_cm1cm2c4c2c0cm3cm1cm1c0c2cm8cm5c0cm2c1c3 => x_cm1cm2c4c2c0cm3cm1cm1c0c2cm8cm5c0cm2c1c3_signal, 
                R_cm6cm1c12c4c2c11cm1c1c1cm4cm12cm1cm4c3cm42cm1 => x_cm6cm1c12c4c2c11cm1c1c1cm4cm12cm1cm4c3cm42cm1_signal, 
                R_cm2c16cm4c7c69cm13cm2c13c4cm12c5cm3cm12c0cm2cm3 => x_cm2c16cm4c7c69cm13cm2c13c4cm12c5cm3cm12c0cm2cm3_signal, 
                R_c1cm2c0cm2cm2cm2cm4cm2c3c2c2c5cm13cm4cm3c5 => x_c1cm2c0cm2cm2cm2cm4cm2c3c2c2c5cm13cm4cm3c5_signal, 
                R_c7cm3cm29cm2cm4c1cm1cm2cm2c0c26c3c5c2cm2cm32 => x_c7cm3cm29cm2cm4c1cm1cm2cm2c0c26c3c5c2cm2cm32_signal, 
                R_cm5c10c8cm9cm4c1cm1c5c4c0c0c7cm2c9c3cm3 => x_cm5c10c8cm9cm4c1cm1c5c4c0c0c7cm2c9c3cm3_signal, 
                R_cm1cm3c22cm2c1cm10c17c2c2c9c4c2c2cm25c13cm1 => x_cm1cm3c22cm2c1cm10c17c2c2c9c4c2c2cm25c13cm1_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm1cm2c11c0c1c0c3cm1c0c4cm3cm1c4c12cm45cm1_signal;
    yo_2 <= x_c6cm13c2cm2c10c0cm5c1cm12c17c0c4c0c13cm2cm5_signal;
    yo_3 <= x_cm6c0cm15c2c3cm1c6c0cm11cm2cm11cm1c8cm25cm8c0_signal;
    yo_4 <= x_cm2c0cm15cm18cm2c2cm3c1cm8cm7c4c5c1c35cm1cm13_signal;
    yo_5 <= x_c3c0c2c1c4c3c2cm6cm23c1cm3c1c2c1cm2cm1_signal;
    yo_6 <= x_c3cm1cm1c15c0cm3cm8c4cm2cm8c2c10c5c13c0cm9_signal;
    yo_7 <= x_c2c6cm5cm1c5cm4c2cm1cm2c0c5cm1c0cm2c1cm14_signal;
    yo_8 <= x_cm2c2c12c0cm2c6c17cm8c5cm1c1c7c1c9c23c15_signal;
    yo_9 <= x_c11c9cm14c1c1c10cm2cm2cm2c10cm2cm4cm1c2c6c12_signal;
    yo_10 <= x_cm5c12cm2cm1cm3cm2c4c1c17cm2c22c2c21c4cm6c2_signal;
    yo_11 <= x_cm1cm10c3cm12cm1cm1cm4c0c1cm6c6c4c2c19c6c4_signal;
    yo_12 <= x_cm37c2cm5c1c1c1c0c0c58c1c6c2c0cm7c4c11_signal;
    yo_13 <= x_c1c1cm10c0c1c1cm13c0c1c0c0c1c5c1cm22c1_signal;
    yo_14 <= x_cm25c3c1cm4cm7cm1cm1cm8cm48c0cm4c3cm5cm1cm6cm4_signal;
    yo_15 <= x_c2c23c8c1c6cm1c0c2c0cm22cm10c17c1c2cm36c1_signal;
    yo_16 <= x_cm20cm2c0c22cm8c2cm6c3cm45cm2c1cm8cm3c4c4c1_signal;
    yo_17 <= x_c11c1cm3cm14c4cm1c3c7cm4c3c4c42c1c0c1cm1_signal;
    yo_18 <= x_c11cm4cm4c17cm4cm3cm2c8cm14cm3cm1c2c2c9cm4cm15_signal;
    yo_19 <= x_c1cm16cm14c10c0cm9cm7c1cm1cm18cm5cm4c3cm7cm7cm6_signal;
    yo_20 <= x_cm8c23cm3c4cm6c0cm2c3cm3cm15c14cm1c0c1cm22c27_signal;
    yo_21 <= x_cm2cm1cm5c0c1c0c33cm2c1c1c13cm1c0cm1c17cm1_signal;
    yo_22 <= x_c13cm2c16c4cm2c1c1cm10c4cm2cm1c5cm37cm3c0c3_signal;
    yo_23 <= x_c0cm6cm2cm11cm7c5c2cm3cm2c16cm1cm10c1c16cm2c4_signal;
    yo_24 <= x_c5cm1c17cm16c1cm4c3c1cm22c7c0c6c2cm27cm9cm13_signal;
    yo_25 <= x_c4c21c3c3c0c4c2c5cm3c5c1c2c6c3c14cm6_signal;
    yo_26 <= x_cm1cm2c4c2c0cm3cm1cm1c0c2cm8cm5c0cm2c1c3_signal;
    yo_27 <= x_cm6cm1c12c4c2c11cm1c1c1cm4cm12cm1cm4c3cm42cm1_signal;
    yo_28 <= x_cm2c16cm4c7c69cm13cm2c13c4cm12c5cm3cm12c0cm2cm3_signal;
    yo_29 <= x_c1cm2c0cm2cm2cm2cm4cm2c3c2c2c5cm13cm4cm3c5_signal;
    yo_30 <= x_c7cm3cm29cm2cm4c1cm1cm2cm2c0c26c3c5c2cm2cm32_signal;
    yo_31 <= x_cm5c10c8cm9cm4c1cm1c5c4c0c0c7cm2c9c3cm3_signal;
    yo_32 <= x_cm1cm3c22cm2c1cm10c17c2c2c9c4c2c2cm25c13cm1_signal;



end structural;