LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core9 is
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
        yo_2  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_4  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_6  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_7  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_9  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_14  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_16  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_20  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_23  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_29  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_30  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_31  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_32  : out std_logic_vector(11-1 downto 0) --	sfix(3, -8)
    );
end conv5_core9;

architecture structural of conv5_core9 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm5cm7c57c0cm2cm1cm1c1cm14cm2cm4c3cm8cm2c26c0_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c15c2c4c4c2c0c1cm75cm11c7c2cm1c27c6c14c20_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_c2c8c2c1c15c2c9c53cm2c2c5c1cm2c14c21cm6_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0cm41cm1c2c0c6cm90c16c9c2c4c0cm7c13c3cm3_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_cm3c0cm6cm1c0c3c36c0cm35cm1cm2cm4cm5c4cm17c4_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c3c4cm1cm9cm2cm1cm9c4cm10cm9c0cm12c1c9c5c8_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm2c0c2cm2c1cm1c0c1cm2c27c2c2c23c4c4c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c2cm12cm5cm2c11c1c5cm4c2c3c0cm7cm7cm18cm36cm17_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm1c0cm1cm4cm6cm2c3c0c1cm3c11cm2cm2c0cm4cm3_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm8cm1c6c0cm1cm3c6c8c9c1c15c0cm19c4cm10cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c2cm14c2cm1cm1c5cm2cm4c2c5cm1cm5cm3cm27c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm2c4c0c16c1cm1c2c0c8cm3cm16cm5c1c26c1c3_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm2cm3c7c2c1c0cm7cm7c27cm14cm16cm1c0cm2c10c3_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c2c1cm1c1c1c0c3cm3c4cm1c11cm3cm2c0cm9cm12_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm1cm1c10c1c1cm5c0c0c0cm2cm1c34cm13cm3cm5c8_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c6c0c3c1cm2cm1c15c1c9c0cm1cm4c2c8c5c2_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c11c2c1cm2c1c1cm3c1cm8c1cm2c11c15c22c2cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm5cm2c3cm1cm1c5c0cm1c0c3cm13c9c5cm4cm3cm18_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c4c1c10c6cm1c1cm1c2c13c20cm8cm5c10cm3c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1cm1c9cm31c1cm2cm1cm2c5cm2cm8c6c19c2c11cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1c0cm1cm2c1c0c4c8cm1c0cm6cm2cm2c0cm47cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm10c0c2cm2c2cm10c2cm4c2c2c56cm28c1cm3c0c8_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm1cm1c3c3c13c0c19cm3cm4cm8c0c2c29cm34c6cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c4c2c6c3c2cm3cm1cm1cm4c0c5c3c13cm22c7cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm6c1c1c7c1cm2c0c6c8cm5c4cm6cm2cm26c6c8_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c1c0cm2c3cm1c0c2c0c4c2c0c0c18cm2c9_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c2c1c9cm2c37cm1cm1cm5c0cm1c5cm4c13c6c2c6_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm1c0c6cm3cm4cm4cm1cm11c9cm9cm6cm3c29c0cm3c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c3cm1c13c1cm1cm2cm9cm3c3cm2cm9cm4c7c3c2c5_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c12cm3c2c2c0c2c0cm2cm4cm11cm3c7c9cm16c5cm14_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1c0cm74cm1c50cm1c2c1c2cm4c21cm3c2c2cm16cm3_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_c0c6c5c0c7cm7c5c1c0cm5c0cm5c0cm7cm4cm6_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core9_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm5cm7c57c0cm2cm1cm1c1cm14cm2cm4c3cm8cm2c26c0 => x_cm5cm7c57c0cm2cm1cm1c1cm14cm2cm4c3cm8cm2c26c0_signal, 
                R_c15c2c4c4c2c0c1cm75cm11c7c2cm1c27c6c14c20 => x_c15c2c4c4c2c0c1cm75cm11c7c2cm1c27c6c14c20_signal, 
                R_c2c8c2c1c15c2c9c53cm2c2c5c1cm2c14c21cm6 => x_c2c8c2c1c15c2c9c53cm2c2c5c1cm2c14c21cm6_signal, 
                R_c0cm41cm1c2c0c6cm90c16c9c2c4c0cm7c13c3cm3 => x_c0cm41cm1c2c0c6cm90c16c9c2c4c0cm7c13c3cm3_signal, 
                R_cm3c0cm6cm1c0c3c36c0cm35cm1cm2cm4cm5c4cm17c4 => x_cm3c0cm6cm1c0c3c36c0cm35cm1cm2cm4cm5c4cm17c4_signal, 
                R_c3c4cm1cm9cm2cm1cm9c4cm10cm9c0cm12c1c9c5c8 => x_c3c4cm1cm9cm2cm1cm9c4cm10cm9c0cm12c1c9c5c8_signal, 
                R_cm2c0c2cm2c1cm1c0c1cm2c27c2c2c23c4c4c0 => x_cm2c0c2cm2c1cm1c0c1cm2c27c2c2c23c4c4c0_signal, 
                R_c2cm12cm5cm2c11c1c5cm4c2c3c0cm7cm7cm18cm36cm17 => x_c2cm12cm5cm2c11c1c5cm4c2c3c0cm7cm7cm18cm36cm17_signal, 
                R_cm1c0cm1cm4cm6cm2c3c0c1cm3c11cm2cm2c0cm4cm3 => x_cm1c0cm1cm4cm6cm2c3c0c1cm3c11cm2cm2c0cm4cm3_signal, 
                R_cm8cm1c6c0cm1cm3c6c8c9c1c15c0cm19c4cm10cm5 => x_cm8cm1c6c0cm1cm3c6c8c9c1c15c0cm19c4cm10cm5_signal, 
                R_c0c2cm14c2cm1cm1c5cm2cm4c2c5cm1cm5cm3cm27c0 => x_c0c2cm14c2cm1cm1c5cm2cm4c2c5cm1cm5cm3cm27c0_signal, 
                R_cm2c4c0c16c1cm1c2c0c8cm3cm16cm5c1c26c1c3 => x_cm2c4c0c16c1cm1c2c0c8cm3cm16cm5c1c26c1c3_signal, 
                R_cm2cm3c7c2c1c0cm7cm7c27cm14cm16cm1c0cm2c10c3 => x_cm2cm3c7c2c1c0cm7cm7c27cm14cm16cm1c0cm2c10c3_signal, 
                R_c2c1cm1c1c1c0c3cm3c4cm1c11cm3cm2c0cm9cm12 => x_c2c1cm1c1c1c0c3cm3c4cm1c11cm3cm2c0cm9cm12_signal, 
                R_cm1cm1c10c1c1cm5c0c0c0cm2cm1c34cm13cm3cm5c8 => x_cm1cm1c10c1c1cm5c0c0c0cm2cm1c34cm13cm3cm5c8_signal, 
                R_c6c0c3c1cm2cm1c15c1c9c0cm1cm4c2c8c5c2 => x_c6c0c3c1cm2cm1c15c1c9c0cm1cm4c2c8c5c2_signal, 
                R_c11c2c1cm2c1c1cm3c1cm8c1cm2c11c15c22c2cm3 => x_c11c2c1cm2c1c1cm3c1cm8c1cm2c11c15c22c2cm3_signal, 
                R_cm5cm2c3cm1cm1c5c0cm1c0c3cm13c9c5cm4cm3cm18 => x_cm5cm2c3cm1cm1c5c0cm1c0c3cm13c9c5cm4cm3cm18_signal, 
                R_c0c4c1c10c6cm1c1cm1c2c13c20cm8cm5c10cm3c2 => x_c0c4c1c10c6cm1c1cm1c2c13c20cm8cm5c10cm3c2_signal, 
                R_c1cm1c9cm31c1cm2cm1cm2c5cm2cm8c6c19c2c11cm1 => x_c1cm1c9cm31c1cm2cm1cm2c5cm2cm8c6c19c2c11cm1_signal, 
                R_c1c0cm1cm2c1c0c4c8cm1c0cm6cm2cm2c0cm47cm3 => x_c1c0cm1cm2c1c0c4c8cm1c0cm6cm2cm2c0cm47cm3_signal, 
                R_cm10c0c2cm2c2cm10c2cm4c2c2c56cm28c1cm3c0c8 => x_cm10c0c2cm2c2cm10c2cm4c2c2c56cm28c1cm3c0c8_signal, 
                R_cm1cm1c3c3c13c0c19cm3cm4cm8c0c2c29cm34c6cm3 => x_cm1cm1c3c3c13c0c19cm3cm4cm8c0c2c29cm34c6cm3_signal, 
                R_c4c2c6c3c2cm3cm1cm1cm4c0c5c3c13cm22c7cm3 => x_c4c2c6c3c2cm3cm1cm1cm4c0c5c3c13cm22c7cm3_signal, 
                R_cm6c1c1c7c1cm2c0c6c8cm5c4cm6cm2cm26c6c8 => x_cm6c1c1c7c1cm2c0c6c8cm5c4cm6cm2cm26c6c8_signal, 
                R_c0c1c0cm2c3cm1c0c2c0c4c2c0c0c18cm2c9 => x_c0c1c0cm2c3cm1c0c2c0c4c2c0c0c18cm2c9_signal, 
                R_c2c1c9cm2c37cm1cm1cm5c0cm1c5cm4c13c6c2c6 => x_c2c1c9cm2c37cm1cm1cm5c0cm1c5cm4c13c6c2c6_signal, 
                R_cm1c0c6cm3cm4cm4cm1cm11c9cm9cm6cm3c29c0cm3c0 => x_cm1c0c6cm3cm4cm4cm1cm11c9cm9cm6cm3c29c0cm3c0_signal, 
                R_c3cm1c13c1cm1cm2cm9cm3c3cm2cm9cm4c7c3c2c5 => x_c3cm1c13c1cm1cm2cm9cm3c3cm2cm9cm4c7c3c2c5_signal, 
                R_c12cm3c2c2c0c2c0cm2cm4cm11cm3c7c9cm16c5cm14 => x_c12cm3c2c2c0c2c0cm2cm4cm11cm3c7c9cm16c5cm14_signal, 
                R_c1c0cm74cm1c50cm1c2c1c2cm4c21cm3c2c2cm16cm3 => x_c1c0cm74cm1c50cm1c2c1c2cm4c21cm3c2c2cm16cm3_signal, 
                R_c0c6c5c0c7cm7c5c1c0cm5c0cm5c0cm7cm4cm6 => x_c0c6c5c0c7cm7c5c1c0cm5c0cm5c0cm7cm4cm6_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm5cm7c57c0cm2cm1cm1c1cm14cm2cm4c3cm8cm2c26c0_signal;
    yo_2 <= x_c15c2c4c4c2c0c1cm75cm11c7c2cm1c27c6c14c20_signal;
    yo_3 <= x_c2c8c2c1c15c2c9c53cm2c2c5c1cm2c14c21cm6_signal;
    yo_4 <= x_c0cm41cm1c2c0c6cm90c16c9c2c4c0cm7c13c3cm3_signal;
    yo_5 <= x_cm3c0cm6cm1c0c3c36c0cm35cm1cm2cm4cm5c4cm17c4_signal;
    yo_6 <= x_c3c4cm1cm9cm2cm1cm9c4cm10cm9c0cm12c1c9c5c8_signal;
    yo_7 <= x_cm2c0c2cm2c1cm1c0c1cm2c27c2c2c23c4c4c0_signal;
    yo_8 <= x_c2cm12cm5cm2c11c1c5cm4c2c3c0cm7cm7cm18cm36cm17_signal;
    yo_9 <= x_cm1c0cm1cm4cm6cm2c3c0c1cm3c11cm2cm2c0cm4cm3_signal;
    yo_10 <= x_cm8cm1c6c0cm1cm3c6c8c9c1c15c0cm19c4cm10cm5_signal;
    yo_11 <= x_c0c2cm14c2cm1cm1c5cm2cm4c2c5cm1cm5cm3cm27c0_signal;
    yo_12 <= x_cm2c4c0c16c1cm1c2c0c8cm3cm16cm5c1c26c1c3_signal;
    yo_13 <= x_cm2cm3c7c2c1c0cm7cm7c27cm14cm16cm1c0cm2c10c3_signal;
    yo_14 <= x_c2c1cm1c1c1c0c3cm3c4cm1c11cm3cm2c0cm9cm12_signal;
    yo_15 <= x_cm1cm1c10c1c1cm5c0c0c0cm2cm1c34cm13cm3cm5c8_signal;
    yo_16 <= x_c6c0c3c1cm2cm1c15c1c9c0cm1cm4c2c8c5c2_signal;
    yo_17 <= x_c11c2c1cm2c1c1cm3c1cm8c1cm2c11c15c22c2cm3_signal;
    yo_18 <= x_cm5cm2c3cm1cm1c5c0cm1c0c3cm13c9c5cm4cm3cm18_signal;
    yo_19 <= x_c0c4c1c10c6cm1c1cm1c2c13c20cm8cm5c10cm3c2_signal;
    yo_20 <= x_c1cm1c9cm31c1cm2cm1cm2c5cm2cm8c6c19c2c11cm1_signal;
    yo_21 <= x_c1c0cm1cm2c1c0c4c8cm1c0cm6cm2cm2c0cm47cm3_signal;
    yo_22 <= x_cm10c0c2cm2c2cm10c2cm4c2c2c56cm28c1cm3c0c8_signal;
    yo_23 <= x_cm1cm1c3c3c13c0c19cm3cm4cm8c0c2c29cm34c6cm3_signal;
    yo_24 <= x_c4c2c6c3c2cm3cm1cm1cm4c0c5c3c13cm22c7cm3_signal;
    yo_25 <= x_cm6c1c1c7c1cm2c0c6c8cm5c4cm6cm2cm26c6c8_signal;
    yo_26 <= x_c0c1c0cm2c3cm1c0c2c0c4c2c0c0c18cm2c9_signal;
    yo_27 <= x_c2c1c9cm2c37cm1cm1cm5c0cm1c5cm4c13c6c2c6_signal;
    yo_28 <= x_cm1c0c6cm3cm4cm4cm1cm11c9cm9cm6cm3c29c0cm3c0_signal;
    yo_29 <= x_c3cm1c13c1cm1cm2cm9cm3c3cm2cm9cm4c7c3c2c5_signal;
    yo_30 <= x_c12cm3c2c2c0c2c0cm2cm4cm11cm3c7c9cm16c5cm14_signal;
    yo_31 <= x_c1c0cm74cm1c50cm1c2c1c2cm4c21cm3c2c2cm16cm3_signal;
    yo_32 <= x_c0c6c5c0c7cm7c5c1c0cm5c0cm5c0cm7cm4cm6_signal;



end structural;