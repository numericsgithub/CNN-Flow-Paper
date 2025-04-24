LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core1 is
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
        yo_2  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_3  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_5  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_7  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_9  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_13  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_16  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_17  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_18  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_19  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_21  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_23  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_26  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_27  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_28  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_30  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_32  : out std_logic_vector(12-1 downto 0) --	sfix(4, -8)
    );
end conv5_core1;

architecture structural of conv5_core1 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c6cm13c41c1cm1cm5cm36c1c18cm8cm18c2cm11c2c4c2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm10c0c1cm1cm19c9cm1c2c54cm9c1c0cm13c12cm2c3_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c4c16c0c2cm5cm12cm5c1cm3c15cm22c0c7cm2cm8cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c4c46c0cm4cm5c2c0c6c1c18c4c2cm6cm1c3cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c3c0c2c1c3c1c7c2cm3c1cm5c2cm8c0cm2cm2_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_cm12c3cm1c32cm2c2c1c14cm7cm12c0c3cm10cm5c4cm15_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0c7c1c12c3c7c1c2c4cm5cm6c11cm1c7cm2c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1c4c6c3c0c2c18c6c2c13c7cm10c2cm4c8cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c6cm6cm5c1cm1cm2c22c7c7c8cm4c0cm15c10c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm15c3cm16c1cm14c5c15c0cm8cm9c24c2c8cm1c1cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c51c2c1c1cm4cm4c2c1cm6cm2cm7cm3cm3cm2c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0cm1c0c26c8cm2c3cm10c4c1cm4cm21cm3cm1c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c2c2c5c1c3cm1cm15c2c3c10cm9c0c10cm15c0cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm1c0cm2c0c8c1c3cm6cm1c0c1c0c17cm1c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1cm1cm55cm5c0c4c14cm10cm3c0c9cm18c4cm1cm8c4_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c1c4c4c1cm9c2cm2c8cm4c8cm1c3c6c4c4c3_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1c1c0c4c3c0cm1c5cm12c6c0cm1c8cm3cm4c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c5c3cm3c0cm3cm9cm4c14cm7c5cm6cm2c1cm5cm12c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c3cm6c1cm7c3cm7c2cm1c1cm5c4cm16cm2c6c9cm8_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm2cm5c6cm13cm4cm5c0c5c1cm1cm1cm34c5cm7c3cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0cm2c6c0c1cm1c5cm1c0cm1c6c0cm4c1c1c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c32c0c1c6cm39c3c4c1cm6cm6cm3cm8cm6cm1c11cm37_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm7c5cm1cm14c12c7cm10cm2cm8c4c0cm2cm4c8c5c11_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm3c15c6c1cm4cm52c4cm16cm6c3c2c5cm6cm5c12cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c4c1cm21cm2c4c3c19c3c19cm2c14cm1c3cm7cm3cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0cm1cm1c3c2cm1cm3c5c1cm4c1c6cm1c4cm12cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm2c3c9cm2cm2c12cm2cm1cm1c4c2cm1cm8c2c1cm5_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c8c5cm1cm4cm9cm2c0c7c2c1cm13c3cm7c0cm3c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm1cm1c3c3cm15c14cm3cm10cm9c5cm18cm19c4cm1c4cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm4c1c0cm27c3cm1cm2c2cm20c6cm6c43cm3cm8cm6cm9_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c3c1cm4c3cm2c4cm6c2c7cm3c41c4c3cm1c1cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0c0c4c0c1cm9c0cm1c0cm4c6c2cm1cm3c8cm5_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core1_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c6cm13c41c1cm1cm5cm36c1c18cm8cm18c2cm11c2c4c2 => x_c6cm13c41c1cm1cm5cm36c1c18cm8cm18c2cm11c2c4c2_signal, 
                R_cm10c0c1cm1cm19c9cm1c2c54cm9c1c0cm13c12cm2c3 => x_cm10c0c1cm1cm19c9cm1c2c54cm9c1c0cm13c12cm2c3_signal, 
                R_c4c16c0c2cm5cm12cm5c1cm3c15cm22c0c7cm2cm8cm1 => x_c4c16c0c2cm5cm12cm5c1cm3c15cm22c0c7cm2cm8cm1_signal, 
                R_c4c46c0cm4cm5c2c0c6c1c18c4c2cm6cm1c3cm2 => x_c4c46c0cm4cm5c2c0c6c1c18c4c2cm6cm1c3cm2_signal, 
                R_c3c0c2c1c3c1c7c2cm3c1cm5c2cm8c0cm2cm2 => x_c3c0c2c1c3c1c7c2cm3c1cm5c2cm8c0cm2cm2_signal, 
                R_cm12c3cm1c32cm2c2c1c14cm7cm12c0c3cm10cm5c4cm15 => x_cm12c3cm1c32cm2c2c1c14cm7cm12c0c3cm10cm5c4cm15_signal, 
                R_c0c7c1c12c3c7c1c2c4cm5cm6c11cm1c7cm2c0 => x_c0c7c1c12c3c7c1c2c4cm5cm6c11cm1c7cm2c0_signal, 
                R_c1c4c6c3c0c2c18c6c2c13c7cm10c2cm4c8cm5 => x_c1c4c6c3c0c2c18c6c2c13c7cm10c2cm4c8cm5_signal, 
                R_c0c6cm6cm5c1cm1cm2c22c7c7c8cm4c0cm15c10c2 => x_c0c6cm6cm5c1cm1cm2c22c7c7c8cm4c0cm15c10c2_signal, 
                R_cm15c3cm16c1cm14c5c15c0cm8cm9c24c2c8cm1c1cm1 => x_cm15c3cm16c1cm14c5c15c0cm8cm9c24c2c8cm1c1cm1_signal, 
                R_c0c51c2c1c1cm4cm4c2c1cm6cm2cm7cm3cm3cm2c1 => x_c0c51c2c1c1cm4cm4c2c1cm6cm2cm7cm3cm3cm2c1_signal, 
                R_c0cm1c0c26c8cm2c3cm10c4c1cm4cm21cm3cm1c0c0 => x_c0cm1c0c26c8cm2c3cm10c4c1cm4cm21cm3cm1c0c0_signal, 
                R_c2c2c5c1c3cm1cm15c2c3c10cm9c0c10cm15c0cm2 => x_c2c2c5c1c3cm1cm15c2c3c10cm9c0c10cm15c0cm2_signal, 
                R_cm1c0cm2c0c8c1c3cm6cm1c0c1c0c17cm1c0c0 => x_cm1c0cm2c0c8c1c3cm6cm1c0c1c0c17cm1c0c0_signal, 
                R_c1cm1cm55cm5c0c4c14cm10cm3c0c9cm18c4cm1cm8c4 => x_c1cm1cm55cm5c0c4c14cm10cm3c0c9cm18c4cm1cm8c4_signal, 
                R_c1c4c4c1cm9c2cm2c8cm4c8cm1c3c6c4c4c3 => x_c1c4c4c1cm9c2cm2c8cm4c8cm1c3c6c4c4c3_signal, 
                R_c1c1c0c4c3c0cm1c5cm12c6c0cm1c8cm3cm4c0 => x_c1c1c0c4c3c0cm1c5cm12c6c0cm1c8cm3cm4c0_signal, 
                R_c5c3cm3c0cm3cm9cm4c14cm7c5cm6cm2c1cm5cm12c0 => x_c5c3cm3c0cm3cm9cm4c14cm7c5cm6cm2c1cm5cm12c0_signal, 
                R_c3cm6c1cm7c3cm7c2cm1c1cm5c4cm16cm2c6c9cm8 => x_c3cm6c1cm7c3cm7c2cm1c1cm5c4cm16cm2c6c9cm8_signal, 
                R_cm2cm5c6cm13cm4cm5c0c5c1cm1cm1cm34c5cm7c3cm1 => x_cm2cm5c6cm13cm4cm5c0c5c1cm1cm1cm34c5cm7c3cm1_signal, 
                R_c0cm2c6c0c1cm1c5cm1c0cm1c6c0cm4c1c1c0 => x_c0cm2c6c0c1cm1c5cm1c0cm1c6c0cm4c1c1c0_signal, 
                R_c32c0c1c6cm39c3c4c1cm6cm6cm3cm8cm6cm1c11cm37 => x_c32c0c1c6cm39c3c4c1cm6cm6cm3cm8cm6cm1c11cm37_signal, 
                R_cm7c5cm1cm14c12c7cm10cm2cm8c4c0cm2cm4c8c5c11 => x_cm7c5cm1cm14c12c7cm10cm2cm8c4c0cm2cm4c8c5c11_signal, 
                R_cm3c15c6c1cm4cm52c4cm16cm6c3c2c5cm6cm5c12cm1 => x_cm3c15c6c1cm4cm52c4cm16cm6c3c2c5cm6cm5c12cm1_signal, 
                R_c4c1cm21cm2c4c3c19c3c19cm2c14cm1c3cm7cm3cm6 => x_c4c1cm21cm2c4c3c19c3c19cm2c14cm1c3cm7cm3cm6_signal, 
                R_c0cm1cm1c3c2cm1cm3c5c1cm4c1c6cm1c4cm12cm2 => x_c0cm1cm1c3c2cm1cm3c5c1cm4c1c6cm1c4cm12cm2_signal, 
                R_cm2c3c9cm2cm2c12cm2cm1cm1c4c2cm1cm8c2c1cm5 => x_cm2c3c9cm2cm2c12cm2cm1cm1c4c2cm1cm8c2c1cm5_signal, 
                R_c8c5cm1cm4cm9cm2c0c7c2c1cm13c3cm7c0cm3c0 => x_c8c5cm1cm4cm9cm2c0c7c2c1cm13c3cm7c0cm3c0_signal, 
                R_cm1cm1c3c3cm15c14cm3cm10cm9c5cm18cm19c4cm1c4cm5 => x_cm1cm1c3c3cm15c14cm3cm10cm9c5cm18cm19c4cm1c4cm5_signal, 
                R_cm4c1c0cm27c3cm1cm2c2cm20c6cm6c43cm3cm8cm6cm9 => x_cm4c1c0cm27c3cm1cm2c2cm20c6cm6c43cm3cm8cm6cm9_signal, 
                R_c3c1cm4c3cm2c4cm6c2c7cm3c41c4c3cm1c1cm1 => x_c3c1cm4c3cm2c4cm6c2c7cm3c41c4c3cm1c1cm1_signal, 
                R_c0c0c4c0c1cm9c0cm1c0cm4c6c2cm1cm3c8cm5 => x_c0c0c4c0c1cm9c0cm1c0cm4c6c2cm1cm3c8cm5_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c6cm13c41c1cm1cm5cm36c1c18cm8cm18c2cm11c2c4c2_signal;
    yo_2 <= x_cm10c0c1cm1cm19c9cm1c2c54cm9c1c0cm13c12cm2c3_signal;
    yo_3 <= x_c4c16c0c2cm5cm12cm5c1cm3c15cm22c0c7cm2cm8cm1_signal;
    yo_4 <= x_c4c46c0cm4cm5c2c0c6c1c18c4c2cm6cm1c3cm2_signal;
    yo_5 <= x_c3c0c2c1c3c1c7c2cm3c1cm5c2cm8c0cm2cm2_signal;
    yo_6 <= x_cm12c3cm1c32cm2c2c1c14cm7cm12c0c3cm10cm5c4cm15_signal;
    yo_7 <= x_c0c7c1c12c3c7c1c2c4cm5cm6c11cm1c7cm2c0_signal;
    yo_8 <= x_c1c4c6c3c0c2c18c6c2c13c7cm10c2cm4c8cm5_signal;
    yo_9 <= x_c0c6cm6cm5c1cm1cm2c22c7c7c8cm4c0cm15c10c2_signal;
    yo_10 <= x_cm15c3cm16c1cm14c5c15c0cm8cm9c24c2c8cm1c1cm1_signal;
    yo_11 <= x_c0c51c2c1c1cm4cm4c2c1cm6cm2cm7cm3cm3cm2c1_signal;
    yo_12 <= x_c0cm1c0c26c8cm2c3cm10c4c1cm4cm21cm3cm1c0c0_signal;
    yo_13 <= x_c2c2c5c1c3cm1cm15c2c3c10cm9c0c10cm15c0cm2_signal;
    yo_14 <= x_cm1c0cm2c0c8c1c3cm6cm1c0c1c0c17cm1c0c0_signal;
    yo_15 <= x_c1cm1cm55cm5c0c4c14cm10cm3c0c9cm18c4cm1cm8c4_signal;
    yo_16 <= x_c1c4c4c1cm9c2cm2c8cm4c8cm1c3c6c4c4c3_signal;
    yo_17 <= x_c1c1c0c4c3c0cm1c5cm12c6c0cm1c8cm3cm4c0_signal;
    yo_18 <= x_c5c3cm3c0cm3cm9cm4c14cm7c5cm6cm2c1cm5cm12c0_signal;
    yo_19 <= x_c3cm6c1cm7c3cm7c2cm1c1cm5c4cm16cm2c6c9cm8_signal;
    yo_20 <= x_cm2cm5c6cm13cm4cm5c0c5c1cm1cm1cm34c5cm7c3cm1_signal;
    yo_21 <= x_c0cm2c6c0c1cm1c5cm1c0cm1c6c0cm4c1c1c0_signal;
    yo_22 <= x_c32c0c1c6cm39c3c4c1cm6cm6cm3cm8cm6cm1c11cm37_signal;
    yo_23 <= x_cm7c5cm1cm14c12c7cm10cm2cm8c4c0cm2cm4c8c5c11_signal;
    yo_24 <= x_cm3c15c6c1cm4cm52c4cm16cm6c3c2c5cm6cm5c12cm1_signal;
    yo_25 <= x_c4c1cm21cm2c4c3c19c3c19cm2c14cm1c3cm7cm3cm6_signal;
    yo_26 <= x_c0cm1cm1c3c2cm1cm3c5c1cm4c1c6cm1c4cm12cm2_signal;
    yo_27 <= x_cm2c3c9cm2cm2c12cm2cm1cm1c4c2cm1cm8c2c1cm5_signal;
    yo_28 <= x_c8c5cm1cm4cm9cm2c0c7c2c1cm13c3cm7c0cm3c0_signal;
    yo_29 <= x_cm1cm1c3c3cm15c14cm3cm10cm9c5cm18cm19c4cm1c4cm5_signal;
    yo_30 <= x_cm4c1c0cm27c3cm1cm2c2cm20c6cm6c43cm3cm8cm6cm9_signal;
    yo_31 <= x_c3c1cm4c3cm2c4cm6c2c7cm3c41c4c3cm1c1cm1_signal;
    yo_32 <= x_c0c0c4c0c1cm9c0cm1c0cm4c6c2cm1cm3c8cm5_signal;



end structural;