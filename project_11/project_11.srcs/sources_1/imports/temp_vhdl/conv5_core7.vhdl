LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core7 is
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
        yo_5  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_9  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_10  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_11  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_13  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_16  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_18  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_22  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_27  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_29  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_30  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(6, -8)
    );
end conv5_core7;

architecture structural of conv5_core7 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm1c0c2cm1c0c2c6cm2cm3c2cm5cm3cm4c0cm11cm1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm21c1c1cm1cm11c6c7c30cm12cm2cm18cm13cm15c10c1c6_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c2cm1c0c1c0cm5cm17c4cm11cm3c29cm1cm1c12cm1c3_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm77c5cm5c2c0cm16c56cm18c3cm4cm2c12cm5cm12cm1cm3_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_cm2cm1c0cm2cm5c11cm10cm5cm1cm11c2cm8cm19c0cm3c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c14cm1c0cm16c0c6c7cm5c3c1cm9cm7cm42c0c1cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0cm9c2c1c7cm4cm4c0c24cm9cm6cm2cm1cm2c6c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c2cm1cm2cm3c45c3cm12cm20cm12c7cm13c27c1c1c9cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm5c2cm4c1cm2cm7cm1c2c3cm7c4c1cm3c0cm4cm4_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c1c3cm5c1cm9cm9cm3c55c7cm5cm7cm21cm15c7cm18c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c2c2c1c2cm1c0cm1cm2cm1c2c8c6c5cm13c1c6_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm5cm1cm10c2c6cm6cm1c1c1cm24c0c1cm2c3cm7c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c1c6cm1cm2c1c6cm4cm2c0c0cm3c32cm16cm5c2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm9c0c0cm1c6cm1c1c10c6cm1c1c31c1cm1c22cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0cm2c1c47c13c2c6c0c54cm1c1c0cm1c1cm16cm13_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm8c1c0c6c8c16cm5cm1c8c33cm8cm5c2c1c4cm7_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm13cm3c0cm7cm5c2c3cm11cm3c17c9c0c2cm1c1c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm6c2c2cm5c2c2c2cm9c5c7c2cm5cm8c3c11cm10_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm1c5cm22c2c28cm12c3c2cm29cm5c5cm1cm2cm14cm30c22_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c4c34cm4c2c8c0cm4c4c13c1c6c3c1cm7cm4c13_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0c2c0cm1cm23c0cm4c26c15cm1cm19cm47c0c2c11c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm1c0c2cm10c1c1cm1cm1cm3c3cm3cm2cm7cm4cm12c12_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm5c2c0c8c3c2cm6c2c32c11c7c0c6c12c0cm5_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c18cm12c1c0c2cm2c7cm4cm5c7cm2c0cm5c3c10c3_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm3cm6cm4c1cm2cm25cm3cm12cm3cm14cm1c21c8cm8c5c4_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0cm2c4cm1c0c1cm1c9cm3cm1cm1c25cm1cm4cm4c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1c0c1cm2cm8cm2c3c0cm1cm6c6cm2c3cm1cm3c1_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c5cm3c0cm1cm6c7cm4cm21cm23c1c0c39cm15c3cm17c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0cm1c1c1c4c1c3c1c15cm1c3cm1cm2c2cm3cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0c2cm2c1cm1cm3c1c0c5c1cm3c0cm2c13c0cm8_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1c1c0cm7cm27c0cm2cm4cm21c0c7cm3cm9c2c1cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c1cm3c1c34c3c5c0cm17c5c6c0c1cm1c3c4_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core7_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm1c0c2cm1c0c2c6cm2cm3c2cm5cm3cm4c0cm11cm1 => x_cm1c0c2cm1c0c2c6cm2cm3c2cm5cm3cm4c0cm11cm1_signal, 
                R_cm21c1c1cm1cm11c6c7c30cm12cm2cm18cm13cm15c10c1c6 => x_cm21c1c1cm1cm11c6c7c30cm12cm2cm18cm13cm15c10c1c6_signal, 
                R_c2cm1c0c1c0cm5cm17c4cm11cm3c29cm1cm1c12cm1c3 => x_c2cm1c0c1c0cm5cm17c4cm11cm3c29cm1cm1c12cm1c3_signal, 
                R_cm77c5cm5c2c0cm16c56cm18c3cm4cm2c12cm5cm12cm1cm3 => x_cm77c5cm5c2c0cm16c56cm18c3cm4cm2c12cm5cm12cm1cm3_signal, 
                R_cm2cm1c0cm2cm5c11cm10cm5cm1cm11c2cm8cm19c0cm3c0 => x_cm2cm1c0cm2cm5c11cm10cm5cm1cm11c2cm8cm19c0cm3c0_signal, 
                R_c14cm1c0cm16c0c6c7cm5c3c1cm9cm7cm42c0c1cm4 => x_c14cm1c0cm16c0c6c7cm5c3c1cm9cm7cm42c0c1cm4_signal, 
                R_c0cm9c2c1c7cm4cm4c0c24cm9cm6cm2cm1cm2c6c0 => x_c0cm9c2c1c7cm4cm4c0c24cm9cm6cm2cm1cm2c6c0_signal, 
                R_c2cm1cm2cm3c45c3cm12cm20cm12c7cm13c27c1c1c9cm3 => x_c2cm1cm2cm3c45c3cm12cm20cm12c7cm13c27c1c1c9cm3_signal, 
                R_cm5c2cm4c1cm2cm7cm1c2c3cm7c4c1cm3c0cm4cm4 => x_cm5c2cm4c1cm2cm7cm1c2c3cm7c4c1cm3c0cm4cm4_signal, 
                R_c1c3cm5c1cm9cm9cm3c55c7cm5cm7cm21cm15c7cm18c1 => x_c1c3cm5c1cm9cm9cm3c55c7cm5cm7cm21cm15c7cm18c1_signal, 
                R_c2c2c1c2cm1c0cm1cm2cm1c2c8c6c5cm13c1c6 => x_c2c2c1c2cm1c0cm1cm2cm1c2c8c6c5cm13c1c6_signal, 
                R_cm5cm1cm10c2c6cm6cm1c1c1cm24c0c1cm2c3cm7c1 => x_cm5cm1cm10c2c6cm6cm1c1c1cm24c0c1cm2c3cm7c1_signal, 
                R_c0c1c6cm1cm2c1c6cm4cm2c0c0cm3c32cm16cm5c2 => x_c0c1c6cm1cm2c1c6cm4cm2c0c0cm3c32cm16cm5c2_signal, 
                R_cm9c0c0cm1c6cm1c1c10c6cm1c1c31c1cm1c22cm1 => x_cm9c0c0cm1c6cm1c1c10c6cm1c1c31c1cm1c22cm1_signal, 
                R_c0cm2c1c47c13c2c6c0c54cm1c1c0cm1c1cm16cm13 => x_c0cm2c1c47c13c2c6c0c54cm1c1c0cm1c1cm16cm13_signal, 
                R_cm8c1c0c6c8c16cm5cm1c8c33cm8cm5c2c1c4cm7 => x_cm8c1c0c6c8c16cm5cm1c8c33cm8cm5c2c1c4cm7_signal, 
                R_cm13cm3c0cm7cm5c2c3cm11cm3c17c9c0c2cm1c1c0 => x_cm13cm3c0cm7cm5c2c3cm11cm3c17c9c0c2cm1c1c0_signal, 
                R_cm6c2c2cm5c2c2c2cm9c5c7c2cm5cm8c3c11cm10 => x_cm6c2c2cm5c2c2c2cm9c5c7c2cm5cm8c3c11cm10_signal, 
                R_cm1c5cm22c2c28cm12c3c2cm29cm5c5cm1cm2cm14cm30c22 => x_cm1c5cm22c2c28cm12c3c2cm29cm5c5cm1cm2cm14cm30c22_signal, 
                R_c4c34cm4c2c8c0cm4c4c13c1c6c3c1cm7cm4c13 => x_c4c34cm4c2c8c0cm4c4c13c1c6c3c1cm7cm4c13_signal, 
                R_c0c2c0cm1cm23c0cm4c26c15cm1cm19cm47c0c2c11c1 => x_c0c2c0cm1cm23c0cm4c26c15cm1cm19cm47c0c2c11c1_signal, 
                R_cm1c0c2cm10c1c1cm1cm1cm3c3cm3cm2cm7cm4cm12c12 => x_cm1c0c2cm10c1c1cm1cm1cm3c3cm3cm2cm7cm4cm12c12_signal, 
                R_cm5c2c0c8c3c2cm6c2c32c11c7c0c6c12c0cm5 => x_cm5c2c0c8c3c2cm6c2c32c11c7c0c6c12c0cm5_signal, 
                R_c18cm12c1c0c2cm2c7cm4cm5c7cm2c0cm5c3c10c3 => x_c18cm12c1c0c2cm2c7cm4cm5c7cm2c0cm5c3c10c3_signal, 
                R_cm3cm6cm4c1cm2cm25cm3cm12cm3cm14cm1c21c8cm8c5c4 => x_cm3cm6cm4c1cm2cm25cm3cm12cm3cm14cm1c21c8cm8c5c4_signal, 
                R_c0cm2c4cm1c0c1cm1c9cm3cm1cm1c25cm1cm4cm4c1 => x_c0cm2c4cm1c0c1cm1c9cm3cm1cm1c25cm1cm4cm4c1_signal, 
                R_cm1c0c1cm2cm8cm2c3c0cm1cm6c6cm2c3cm1cm3c1 => x_cm1c0c1cm2cm8cm2c3c0cm1cm6c6cm2c3cm1cm3c1_signal, 
                R_c5cm3c0cm1cm6c7cm4cm21cm23c1c0c39cm15c3cm17c1 => x_c5cm3c0cm1cm6c7cm4cm21cm23c1c0c39cm15c3cm17c1_signal, 
                R_c0cm1c1c1c4c1c3c1c15cm1c3cm1cm2c2cm3cm2 => x_c0cm1c1c1c4c1c3c1c15cm1c3cm1cm2c2cm3cm2_signal, 
                R_c0c2cm2c1cm1cm3c1c0c5c1cm3c0cm2c13c0cm8 => x_c0c2cm2c1cm1cm3c1c0c5c1cm3c0cm2c13c0cm8_signal, 
                R_c1c1c0cm7cm27c0cm2cm4cm21c0c7cm3cm9c2c1cm1 => x_c1c1c0cm7cm27c0cm2cm4cm21c0c7cm3cm9c2c1cm1_signal, 
                R_c0c1cm3c1c34c3c5c0cm17c5c6c0c1cm1c3c4 => x_c0c1cm3c1c34c3c5c0cm17c5c6c0c1cm1c3c4_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm1c0c2cm1c0c2c6cm2cm3c2cm5cm3cm4c0cm11cm1_signal;
    yo_2 <= x_cm21c1c1cm1cm11c6c7c30cm12cm2cm18cm13cm15c10c1c6_signal;
    yo_3 <= x_c2cm1c0c1c0cm5cm17c4cm11cm3c29cm1cm1c12cm1c3_signal;
    yo_4 <= x_cm77c5cm5c2c0cm16c56cm18c3cm4cm2c12cm5cm12cm1cm3_signal;
    yo_5 <= x_cm2cm1c0cm2cm5c11cm10cm5cm1cm11c2cm8cm19c0cm3c0_signal;
    yo_6 <= x_c14cm1c0cm16c0c6c7cm5c3c1cm9cm7cm42c0c1cm4_signal;
    yo_7 <= x_c0cm9c2c1c7cm4cm4c0c24cm9cm6cm2cm1cm2c6c0_signal;
    yo_8 <= x_c2cm1cm2cm3c45c3cm12cm20cm12c7cm13c27c1c1c9cm3_signal;
    yo_9 <= x_cm5c2cm4c1cm2cm7cm1c2c3cm7c4c1cm3c0cm4cm4_signal;
    yo_10 <= x_c1c3cm5c1cm9cm9cm3c55c7cm5cm7cm21cm15c7cm18c1_signal;
    yo_11 <= x_c2c2c1c2cm1c0cm1cm2cm1c2c8c6c5cm13c1c6_signal;
    yo_12 <= x_cm5cm1cm10c2c6cm6cm1c1c1cm24c0c1cm2c3cm7c1_signal;
    yo_13 <= x_c0c1c6cm1cm2c1c6cm4cm2c0c0cm3c32cm16cm5c2_signal;
    yo_14 <= x_cm9c0c0cm1c6cm1c1c10c6cm1c1c31c1cm1c22cm1_signal;
    yo_15 <= x_c0cm2c1c47c13c2c6c0c54cm1c1c0cm1c1cm16cm13_signal;
    yo_16 <= x_cm8c1c0c6c8c16cm5cm1c8c33cm8cm5c2c1c4cm7_signal;
    yo_17 <= x_cm13cm3c0cm7cm5c2c3cm11cm3c17c9c0c2cm1c1c0_signal;
    yo_18 <= x_cm6c2c2cm5c2c2c2cm9c5c7c2cm5cm8c3c11cm10_signal;
    yo_19 <= x_cm1c5cm22c2c28cm12c3c2cm29cm5c5cm1cm2cm14cm30c22_signal;
    yo_20 <= x_c4c34cm4c2c8c0cm4c4c13c1c6c3c1cm7cm4c13_signal;
    yo_21 <= x_c0c2c0cm1cm23c0cm4c26c15cm1cm19cm47c0c2c11c1_signal;
    yo_22 <= x_cm1c0c2cm10c1c1cm1cm1cm3c3cm3cm2cm7cm4cm12c12_signal;
    yo_23 <= x_cm5c2c0c8c3c2cm6c2c32c11c7c0c6c12c0cm5_signal;
    yo_24 <= x_c18cm12c1c0c2cm2c7cm4cm5c7cm2c0cm5c3c10c3_signal;
    yo_25 <= x_cm3cm6cm4c1cm2cm25cm3cm12cm3cm14cm1c21c8cm8c5c4_signal;
    yo_26 <= x_c0cm2c4cm1c0c1cm1c9cm3cm1cm1c25cm1cm4cm4c1_signal;
    yo_27 <= x_cm1c0c1cm2cm8cm2c3c0cm1cm6c6cm2c3cm1cm3c1_signal;
    yo_28 <= x_c5cm3c0cm1cm6c7cm4cm21cm23c1c0c39cm15c3cm17c1_signal;
    yo_29 <= x_c0cm1c1c1c4c1c3c1c15cm1c3cm1cm2c2cm3cm2_signal;
    yo_30 <= x_c0c2cm2c1cm1cm3c1c0c5c1cm3c0cm2c13c0cm8_signal;
    yo_31 <= x_c1c1c0cm7cm27c0cm2cm4cm21c0c7cm3cm9c2c1cm1_signal;
    yo_32 <= x_c0c1cm3c1c34c3c5c0cm17c5c6c0c1cm1c3c4_signal;



end structural;