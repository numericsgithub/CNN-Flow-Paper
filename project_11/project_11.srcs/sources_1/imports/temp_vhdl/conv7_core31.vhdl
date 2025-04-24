LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core31 is
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
    
        yo_1  : out std_logic_vector(11-1 downto 0);  --	sfix(1, -10)
        yo_2  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_3  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_7  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_9  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_10  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_13  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_14  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_15  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_19  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_24  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_26  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_29  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_31  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core31;

architecture structural of conv7_core31 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c6c2c4c3c7cm1c3c3cm3cm3c1c2c2c2c3c2_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)
    signal  x_cm9c0cm9c4cm16c1c23c7c1c6cm4c15c2c19c3cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm15c5c2cm4c6c3cm19c5c2c8c0c2cm3c3cm4c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm9cm10cm7cm12c3cm10c40c9cm1c1cm8c0c10c1c1c11_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm5c1cm19c0cm11c7cm1cm17c3c3cm6c8c14c82c3c9_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c0c1cm2c1cm7c0cm8cm2cm1c1cm5c1c1cm1c24c8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6c3c2c1c36c5cm1cm17c6c8c2c4cm7c1c1c10_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm9c1cm1c4cm15c2c2c4cm3c3cm2cm3cm20c0c9c7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2c22cm2cm4c1cm14c5cm2c59c1c6cm18c5c14cm1c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0cm2cm1cm3c0c0c6cm3c3cm9c12c0cm1cm6c6_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm3cm11cm2cm1c1cm22c7cm2cm2c2c1cm12cm28cm21cm4cm14_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm1c2c9c1c2c0cm10cm7c2c0cm2c4c1c1c4cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm7c4cm11cm2cm3c17c4c2cm4c0c1c4cm4cm47cm2cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm5cm4c0c2cm16cm7cm13c11c1cm1cm3c1c11c1cm3c1_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c1cm7c3cm2c3cm16c2cm4cm4cm5c2cm3c5c2c0cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c7c6c1cm7c17c9c5c1c3cm3c11c6cm1cm23cm3cm12_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c1c8cm2cm2c17c16c0c3c9cm4c0c6c41c13c4c0_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6c1c3c0c19c0c0c1cm6cm7c0c31cm5c2c4c4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c10cm1cm5c14cm3c43c5c21cm5c0cm4c2c3cm4cm3c4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c24cm1c2c23c40cm18c0c56c0c10cm10c1cm13cm2cm2cm4_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2cm6c1cm4cm2c2c5c0cm1cm4cm3c127c1cm2c2cm11_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c4c3c9cm3c14cm1c10c3c8cm4c1cm4cm36cm5c1cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm1c24cm2c4cm10c1c4c3cm3c4c4cm9c0cm8c1c12_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c0c3cm1cm2cm6cm13c4c7c6cm2cm13cm7c1c10c2cm7_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c8cm1cm4c0c16cm4c2c2c15c0c1cm20c7c0c1c15_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm4cm2c1c0cm11c6cm4c1c1cm2c7c9c1c0c11cm4_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c5c58cm27cm7cm11c19cm5cm12cm2c3c3cm2c3c2c4cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c11c7cm4c1c26c7cm9cm1cm1cm1c3cm4c8c5cm15c3_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm8cm4c6cm6cm16c6cm5cm11c5c0c7c4c5cm8c7cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm1cm2c5c1cm4c18cm8c5cm13cm8c3cm6c3cm7c1c1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm72c7c0c42c3cm14cm3cm33c4c1c3c5cm11cm5cm1c3_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c3c0c39cm5c4c6cm4c4c10cm12cm3c8c3cm1c3cm7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core31_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c6c2c4c3c7cm1c3c3cm3cm3c1c2c2c2c3c2 => x_c6c2c4c3c7cm1c3c3cm3cm3c1c2c2c2c3c2_signal, 
                R_cm9c0cm9c4cm16c1c23c7c1c6cm4c15c2c19c3cm3 => x_cm9c0cm9c4cm16c1c23c7c1c6cm4c15c2c19c3cm3_signal, 
                R_cm15c5c2cm4c6c3cm19c5c2c8c0c2cm3c3cm4c0 => x_cm15c5c2cm4c6c3cm19c5c2c8c0c2cm3c3cm4c0_signal, 
                R_cm9cm10cm7cm12c3cm10c40c9cm1c1cm8c0c10c1c1c11 => x_cm9cm10cm7cm12c3cm10c40c9cm1c1cm8c0c10c1c1c11_signal, 
                R_cm5c1cm19c0cm11c7cm1cm17c3c3cm6c8c14c82c3c9 => x_cm5c1cm19c0cm11c7cm1cm17c3c3cm6c8c14c82c3c9_signal, 
                R_c0c1cm2c1cm7c0cm8cm2cm1c1cm5c1c1cm1c24c8 => x_c0c1cm2c1cm7c0cm8cm2cm1c1cm5c1c1cm1c24c8_signal, 
                R_c6c3c2c1c36c5cm1cm17c6c8c2c4cm7c1c1c10 => x_c6c3c2c1c36c5cm1cm17c6c8c2c4cm7c1c1c10_signal, 
                R_cm9c1cm1c4cm15c2c2c4cm3c3cm2cm3cm20c0c9c7 => x_cm9c1cm1c4cm15c2c2c4cm3c3cm2cm3cm20c0c9c7_signal, 
                R_c2c22cm2cm4c1cm14c5cm2c59c1c6cm18c5c14cm1c2 => x_c2c22cm2cm4c1cm14c5cm2c59c1c6cm18c5c14cm1c2_signal, 
                R_c0c0cm2cm1cm3c0c0c6cm3c3cm9c12c0cm1cm6c6 => x_c0c0cm2cm1cm3c0c0c6cm3c3cm9c12c0cm1cm6c6_signal, 
                R_cm3cm11cm2cm1c1cm22c7cm2cm2c2c1cm12cm28cm21cm4cm14 => x_cm3cm11cm2cm1c1cm22c7cm2cm2c2c1cm12cm28cm21cm4cm14_signal, 
                R_cm1c2c9c1c2c0cm10cm7c2c0cm2c4c1c1c4cm2 => x_cm1c2c9c1c2c0cm10cm7c2c0cm2c4c1c1c4cm2_signal, 
                R_cm7c4cm11cm2cm3c17c4c2cm4c0c1c4cm4cm47cm2cm2 => x_cm7c4cm11cm2cm3c17c4c2cm4c0c1c4cm4cm47cm2cm2_signal, 
                R_cm5cm4c0c2cm16cm7cm13c11c1cm1cm3c1c11c1cm3c1 => x_cm5cm4c0c2cm16cm7cm13c11c1cm1cm3c1c11c1cm3c1_signal, 
                R_c1cm7c3cm2c3cm16c2cm4cm4cm5c2cm3c5c2c0cm2 => x_c1cm7c3cm2c3cm16c2cm4cm4cm5c2cm3c5c2c0cm2_signal, 
                R_c7c6c1cm7c17c9c5c1c3cm3c11c6cm1cm23cm3cm12 => x_c7c6c1cm7c17c9c5c1c3cm3c11c6cm1cm23cm3cm12_signal, 
                R_c1c8cm2cm2c17c16c0c3c9cm4c0c6c41c13c4c0 => x_c1c8cm2cm2c17c16c0c3c9cm4c0c6c41c13c4c0_signal, 
                R_cm6c1c3c0c19c0c0c1cm6cm7c0c31cm5c2c4c4 => x_cm6c1c3c0c19c0c0c1cm6cm7c0c31cm5c2c4c4_signal, 
                R_c10cm1cm5c14cm3c43c5c21cm5c0cm4c2c3cm4cm3c4 => x_c10cm1cm5c14cm3c43c5c21cm5c0cm4c2c3cm4cm3c4_signal, 
                R_c24cm1c2c23c40cm18c0c56c0c10cm10c1cm13cm2cm2cm4 => x_c24cm1c2c23c40cm18c0c56c0c10cm10c1cm13cm2cm2cm4_signal, 
                R_cm2cm6c1cm4cm2c2c5c0cm1cm4cm3c127c1cm2c2cm11 => x_cm2cm6c1cm4cm2c2c5c0cm1cm4cm3c127c1cm2c2cm11_signal, 
                R_c4c3c9cm3c14cm1c10c3c8cm4c1cm4cm36cm5c1cm2 => x_c4c3c9cm3c14cm1c10c3c8cm4c1cm4cm36cm5c1cm2_signal, 
                R_cm1c24cm2c4cm10c1c4c3cm3c4c4cm9c0cm8c1c12 => x_cm1c24cm2c4cm10c1c4c3cm3c4c4cm9c0cm8c1c12_signal, 
                R_c0c3cm1cm2cm6cm13c4c7c6cm2cm13cm7c1c10c2cm7 => x_c0c3cm1cm2cm6cm13c4c7c6cm2cm13cm7c1c10c2cm7_signal, 
                R_c8cm1cm4c0c16cm4c2c2c15c0c1cm20c7c0c1c15 => x_c8cm1cm4c0c16cm4c2c2c15c0c1cm20c7c0c1c15_signal, 
                R_cm4cm2c1c0cm11c6cm4c1c1cm2c7c9c1c0c11cm4 => x_cm4cm2c1c0cm11c6cm4c1c1cm2c7c9c1c0c11cm4_signal, 
                R_c5c58cm27cm7cm11c19cm5cm12cm2c3c3cm2c3c2c4cm2 => x_c5c58cm27cm7cm11c19cm5cm12cm2c3c3cm2c3c2c4cm2_signal, 
                R_c11c7cm4c1c26c7cm9cm1cm1cm1c3cm4c8c5cm15c3 => x_c11c7cm4c1c26c7cm9cm1cm1cm1c3cm4c8c5cm15c3_signal, 
                R_cm8cm4c6cm6cm16c6cm5cm11c5c0c7c4c5cm8c7cm2 => x_cm8cm4c6cm6cm16c6cm5cm11c5c0c7c4c5cm8c7cm2_signal, 
                R_cm1cm2c5c1cm4c18cm8c5cm13cm8c3cm6c3cm7c1c1 => x_cm1cm2c5c1cm4c18cm8c5cm13cm8c3cm6c3cm7c1c1_signal, 
                R_cm72c7c0c42c3cm14cm3cm33c4c1c3c5cm11cm5cm1c3 => x_cm72c7c0c42c3cm14cm3cm33c4c1c3c5cm11cm5cm1c3_signal, 
                R_c3c0c39cm5c4c6cm4c4c10cm12cm3c8c3cm1c3cm7 => x_c3c0c39cm5c4c6cm4c4c10cm12cm3c8c3cm1c3cm7_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c6c2c4c3c7cm1c3c3cm3cm3c1c2c2c2c3c2_signal;
    yo_2 <= x_cm9c0cm9c4cm16c1c23c7c1c6cm4c15c2c19c3cm3_signal;
    yo_3 <= x_cm15c5c2cm4c6c3cm19c5c2c8c0c2cm3c3cm4c0_signal;
    yo_4 <= x_cm9cm10cm7cm12c3cm10c40c9cm1c1cm8c0c10c1c1c11_signal;
    yo_5 <= x_cm5c1cm19c0cm11c7cm1cm17c3c3cm6c8c14c82c3c9_signal;
    yo_6 <= x_c0c1cm2c1cm7c0cm8cm2cm1c1cm5c1c1cm1c24c8_signal;
    yo_7 <= x_c6c3c2c1c36c5cm1cm17c6c8c2c4cm7c1c1c10_signal;
    yo_8 <= x_cm9c1cm1c4cm15c2c2c4cm3c3cm2cm3cm20c0c9c7_signal;
    yo_9 <= x_c2c22cm2cm4c1cm14c5cm2c59c1c6cm18c5c14cm1c2_signal;
    yo_10 <= x_c0c0cm2cm1cm3c0c0c6cm3c3cm9c12c0cm1cm6c6_signal;
    yo_11 <= x_cm3cm11cm2cm1c1cm22c7cm2cm2c2c1cm12cm28cm21cm4cm14_signal;
    yo_12 <= x_cm1c2c9c1c2c0cm10cm7c2c0cm2c4c1c1c4cm2_signal;
    yo_13 <= x_cm7c4cm11cm2cm3c17c4c2cm4c0c1c4cm4cm47cm2cm2_signal;
    yo_14 <= x_cm5cm4c0c2cm16cm7cm13c11c1cm1cm3c1c11c1cm3c1_signal;
    yo_15 <= x_c1cm7c3cm2c3cm16c2cm4cm4cm5c2cm3c5c2c0cm2_signal;
    yo_16 <= x_c7c6c1cm7c17c9c5c1c3cm3c11c6cm1cm23cm3cm12_signal;
    yo_17 <= x_c1c8cm2cm2c17c16c0c3c9cm4c0c6c41c13c4c0_signal;
    yo_18 <= x_cm6c1c3c0c19c0c0c1cm6cm7c0c31cm5c2c4c4_signal;
    yo_19 <= x_c10cm1cm5c14cm3c43c5c21cm5c0cm4c2c3cm4cm3c4_signal;
    yo_20 <= x_c24cm1c2c23c40cm18c0c56c0c10cm10c1cm13cm2cm2cm4_signal;
    yo_21 <= x_cm2cm6c1cm4cm2c2c5c0cm1cm4cm3c127c1cm2c2cm11_signal;
    yo_22 <= x_c4c3c9cm3c14cm1c10c3c8cm4c1cm4cm36cm5c1cm2_signal;
    yo_23 <= x_cm1c24cm2c4cm10c1c4c3cm3c4c4cm9c0cm8c1c12_signal;
    yo_24 <= x_c0c3cm1cm2cm6cm13c4c7c6cm2cm13cm7c1c10c2cm7_signal;
    yo_25 <= x_c8cm1cm4c0c16cm4c2c2c15c0c1cm20c7c0c1c15_signal;
    yo_26 <= x_cm4cm2c1c0cm11c6cm4c1c1cm2c7c9c1c0c11cm4_signal;
    yo_27 <= x_c5c58cm27cm7cm11c19cm5cm12cm2c3c3cm2c3c2c4cm2_signal;
    yo_28 <= x_c11c7cm4c1c26c7cm9cm1cm1cm1c3cm4c8c5cm15c3_signal;
    yo_29 <= x_cm8cm4c6cm6cm16c6cm5cm11c5c0c7c4c5cm8c7cm2_signal;
    yo_30 <= x_cm1cm2c5c1cm4c18cm8c5cm13cm8c3cm6c3cm7c1c1_signal;
    yo_31 <= x_cm72c7c0c42c3cm14cm3cm33c4c1c3c5cm11cm5cm1c3_signal;
    yo_32 <= x_c3c0c39cm5c4c6cm4c4c10cm12cm3c8c3cm1c3cm7_signal;



end structural;