LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core11 is
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
    
        yo_1  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_2  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_3  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_5  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_7  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_9  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_10  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_12  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_14  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_18  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_19  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_24  : out std_logic_vector(15-1 downto 0);  --	sfix(5, -10)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(3, -10)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_29  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_30  : out std_logic_vector(12-1 downto 0);  --	sfix(2, -10)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(4, -10)
        yo_32  : out std_logic_vector(14-1 downto 0) --	sfix(4, -10)
    );
end conv7_core11;

architecture structural of conv7_core11 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm6c6cm10cm7cm2cm5cm4c2c22cm5c4cm2c4c6cm13c4_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm14cm7c10cm2c3cm18cm1cm24cm5c3c22cm2cm21c10c31cm14_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm4c9cm12c2cm8c8c5c0cm2c2c2cm2c6c3cm5cm8_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm23cm5c0c14cm16c0cm2c1cm7c15cm12c2c5cm7cm11c36_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3cm15cm8c12cm15cm6cm4c12c1cm10c0c1c20c10cm18c17_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c2cm6c6cm2c0cm5c0cm9c0c6cm13cm8cm9cm6c18cm15_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c87cm1cm1c23c0c3c4cm4c18c2c5cm2cm11cm1c3c17_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm4cm35c10cm8cm1c2cm4c1cm30cm7c20c3c9cm1cm6c3_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3cm88c4c8c35c11c15c15c1cm7cm4c8cm1cm19cm3c9_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_cm1cm4cm6cm32c1c3c13c18cm4c2cm4c34c10cm2c1c9_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c5cm10c0cm9c12cm9cm15cm6c19cm8cm16c12c3cm18cm4cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c3c2c0c0cm3c0c10c5c0c0c14c4c15c2c4cm1_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm12cm10cm14cm1c14c0cm2c8c5cm24c8c1c0cm17c0c10_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c37c5cm1cm3c5c3c5cm4cm35cm5cm8c6c7c12c11cm7_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c6cm16cm10cm15cm24cm5cm12c6cm5cm10cm15c5c5c0c10c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c7cm18cm3cm1c3c10cm3c8c10c10c2c9cm9cm9cm10c7_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_cm11cm1cm9c7cm2cm6c2cm11c9cm15cm4cm13cm9cm33c8cm19_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c3c1cm4c0c4c4c1cm12cm4c0c6cm4cm14cm3cm4c2_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_c6c53cm3c11c2c9c10cm1c1c7c8c12cm17cm18c9cm8_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm11cm7c1cm4cm9c15c5c1cm15c4c1c5c23c30cm3c40_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm2c7cm1cm1c1cm56c0c4cm1c8cm4c2c4cm8c7cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c6cm24c27cm6c5c3cm7cm9cm15c47cm15c3c9c4cm9_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm6cm6c19cm1cm20cm4cm21cm1c22c3cm11c9cm18c2c1cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c6cm8c20cm4c97c0cm35cm1cm3cm16cm6cm4cm6c19cm8cm1_signal : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal  x_c10cm6cm58c2cm20c0cm1cm14c10c1c2cm7cm18c5cm10c2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm4cm7c1c0c6cm1cm17cm5cm6c5cm14c6c11c11cm1c0_signal : std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal  x_c51c1c10cm11c8c0c6cm5cm7c3c6c4c13cm1c0c13_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c10c16c16cm41cm6cm2cm17c0c6cm25cm7cm6cm20c4c34cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0cm7c7cm6cm3cm4c18c4c3c10c8c32cm2c5c17_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_cm3cm7c2cm3c9c6c2cm4cm8c8c2cm1cm14c4c3cm6_signal : std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal  x_cm9c45c1cm1c2c5c6c1c4cm1c2c9cm9c9c7cm37_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c5cm3c13cm58cm22c14cm1c0cm1cm6cm4cm7cm9cm18cm33cm18_signal : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv7_core11_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm6c6cm10cm7cm2cm5cm4c2c22cm5c4cm2c4c6cm13c4 => x_cm6c6cm10cm7cm2cm5cm4c2c22cm5c4cm2c4c6cm13c4_signal, 
                R_cm14cm7c10cm2c3cm18cm1cm24cm5c3c22cm2cm21c10c31cm14 => x_cm14cm7c10cm2c3cm18cm1cm24cm5c3c22cm2cm21c10c31cm14_signal, 
                R_cm4c9cm12c2cm8c8c5c0cm2c2c2cm2c6c3cm5cm8 => x_cm4c9cm12c2cm8c8c5c0cm2c2c2cm2c6c3cm5cm8_signal, 
                R_cm23cm5c0c14cm16c0cm2c1cm7c15cm12c2c5cm7cm11c36 => x_cm23cm5c0c14cm16c0cm2c1cm7c15cm12c2c5cm7cm11c36_signal, 
                R_cm3cm15cm8c12cm15cm6cm4c12c1cm10c0c1c20c10cm18c17 => x_cm3cm15cm8c12cm15cm6cm4c12c1cm10c0c1c20c10cm18c17_signal, 
                R_c2cm6c6cm2c0cm5c0cm9c0c6cm13cm8cm9cm6c18cm15 => x_c2cm6c6cm2c0cm5c0cm9c0c6cm13cm8cm9cm6c18cm15_signal, 
                R_c87cm1cm1c23c0c3c4cm4c18c2c5cm2cm11cm1c3c17 => x_c87cm1cm1c23c0c3c4cm4c18c2c5cm2cm11cm1c3c17_signal, 
                R_cm4cm35c10cm8cm1c2cm4c1cm30cm7c20c3c9cm1cm6c3 => x_cm4cm35c10cm8cm1c2cm4c1cm30cm7c20c3c9cm1cm6c3_signal, 
                R_cm3cm88c4c8c35c11c15c15c1cm7cm4c8cm1cm19cm3c9 => x_cm3cm88c4c8c35c11c15c15c1cm7cm4c8cm1cm19cm3c9_signal, 
                R_cm1cm4cm6cm32c1c3c13c18cm4c2cm4c34c10cm2c1c9 => x_cm1cm4cm6cm32c1c3c13c18cm4c2cm4c34c10cm2c1c9_signal, 
                R_c5cm10c0cm9c12cm9cm15cm6c19cm8cm16c12c3cm18cm4cm1 => x_c5cm10c0cm9c12cm9cm15cm6c19cm8cm16c12c3cm18cm4cm1_signal, 
                R_c3c2c0c0cm3c0c10c5c0c0c14c4c15c2c4cm1 => x_c3c2c0c0cm3c0c10c5c0c0c14c4c15c2c4cm1_signal, 
                R_cm12cm10cm14cm1c14c0cm2c8c5cm24c8c1c0cm17c0c10 => x_cm12cm10cm14cm1c14c0cm2c8c5cm24c8c1c0cm17c0c10_signal, 
                R_c37c5cm1cm3c5c3c5cm4cm35cm5cm8c6c7c12c11cm7 => x_c37c5cm1cm3c5c3c5cm4cm35cm5cm8c6c7c12c11cm7_signal, 
                R_c6cm16cm10cm15cm24cm5cm12c6cm5cm10cm15c5c5c0c10c0 => x_c6cm16cm10cm15cm24cm5cm12c6cm5cm10cm15c5c5c0c10c0_signal, 
                R_c7cm18cm3cm1c3c10cm3c8c10c10c2c9cm9cm9cm10c7 => x_c7cm18cm3cm1c3c10cm3c8c10c10c2c9cm9cm9cm10c7_signal, 
                R_cm11cm1cm9c7cm2cm6c2cm11c9cm15cm4cm13cm9cm33c8cm19 => x_cm11cm1cm9c7cm2cm6c2cm11c9cm15cm4cm13cm9cm33c8cm19_signal, 
                R_c3c1cm4c0c4c4c1cm12cm4c0c6cm4cm14cm3cm4c2 => x_c3c1cm4c0c4c4c1cm12cm4c0c6cm4cm14cm3cm4c2_signal, 
                R_c6c53cm3c11c2c9c10cm1c1c7c8c12cm17cm18c9cm8 => x_c6c53cm3c11c2c9c10cm1c1c7c8c12cm17cm18c9cm8_signal, 
                R_cm11cm7c1cm4cm9c15c5c1cm15c4c1c5c23c30cm3c40 => x_cm11cm7c1cm4cm9c15c5c1cm15c4c1c5c23c30cm3c40_signal, 
                R_cm2c7cm1cm1c1cm56c0c4cm1c8cm4c2c4cm8c7cm2 => x_cm2c7cm1cm1c1cm56c0c4cm1c8cm4c2c4cm8c7cm2_signal, 
                R_c0c6cm24c27cm6c5c3cm7cm9cm15c47cm15c3c9c4cm9 => x_c0c6cm24c27cm6c5c3cm7cm9cm15c47cm15c3c9c4cm9_signal, 
                R_cm6cm6c19cm1cm20cm4cm21cm1c22c3cm11c9cm18c2c1cm8 => x_cm6cm6c19cm1cm20cm4cm21cm1c22c3cm11c9cm18c2c1cm8_signal, 
                R_c6cm8c20cm4c97c0cm35cm1cm3cm16cm6cm4cm6c19cm8cm1 => x_c6cm8c20cm4c97c0cm35cm1cm3cm16cm6cm4cm6c19cm8cm1_signal, 
                R_c10cm6cm58c2cm20c0cm1cm14c10c1c2cm7cm18c5cm10c2 => x_c10cm6cm58c2cm20c0cm1cm14c10c1c2cm7cm18c5cm10c2_signal, 
                R_cm4cm7c1c0c6cm1cm17cm5cm6c5cm14c6c11c11cm1c0 => x_cm4cm7c1c0c6cm1cm17cm5cm6c5cm14c6c11c11cm1c0_signal, 
                R_c51c1c10cm11c8c0c6cm5cm7c3c6c4c13cm1c0c13 => x_c51c1c10cm11c8c0c6cm5cm7c3c6c4c13cm1c0c13_signal, 
                R_c10c16c16cm41cm6cm2cm17c0c6cm25cm7cm6cm20c4c34cm2 => x_c10c16c16cm41cm6cm2cm17c0c6cm25cm7cm6cm20c4c34cm2_signal, 
                R_c0c0cm7c7cm6cm3cm4c18c4c3c10c8c32cm2c5c17 => x_c0c0cm7c7cm6cm3cm4c18c4c3c10c8c32cm2c5c17_signal, 
                R_cm3cm7c2cm3c9c6c2cm4cm8c8c2cm1cm14c4c3cm6 => x_cm3cm7c2cm3c9c6c2cm4cm8c8c2cm1cm14c4c3cm6_signal, 
                R_cm9c45c1cm1c2c5c6c1c4cm1c2c9cm9c9c7cm37 => x_cm9c45c1cm1c2c5c6c1c4cm1c2c9cm9c9c7cm37_signal, 
                R_c5cm3c13cm58cm22c14cm1c0cm1cm6cm4cm7cm9cm18cm33cm18 => x_c5cm3c13cm58cm22c14cm1c0cm1cm6cm4cm7cm9cm18cm33cm18_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm6c6cm10cm7cm2cm5cm4c2c22cm5c4cm2c4c6cm13c4_signal;
    yo_2 <= x_cm14cm7c10cm2c3cm18cm1cm24cm5c3c22cm2cm21c10c31cm14_signal;
    yo_3 <= x_cm4c9cm12c2cm8c8c5c0cm2c2c2cm2c6c3cm5cm8_signal;
    yo_4 <= x_cm23cm5c0c14cm16c0cm2c1cm7c15cm12c2c5cm7cm11c36_signal;
    yo_5 <= x_cm3cm15cm8c12cm15cm6cm4c12c1cm10c0c1c20c10cm18c17_signal;
    yo_6 <= x_c2cm6c6cm2c0cm5c0cm9c0c6cm13cm8cm9cm6c18cm15_signal;
    yo_7 <= x_c87cm1cm1c23c0c3c4cm4c18c2c5cm2cm11cm1c3c17_signal;
    yo_8 <= x_cm4cm35c10cm8cm1c2cm4c1cm30cm7c20c3c9cm1cm6c3_signal;
    yo_9 <= x_cm3cm88c4c8c35c11c15c15c1cm7cm4c8cm1cm19cm3c9_signal;
    yo_10 <= x_cm1cm4cm6cm32c1c3c13c18cm4c2cm4c34c10cm2c1c9_signal;
    yo_11 <= x_c5cm10c0cm9c12cm9cm15cm6c19cm8cm16c12c3cm18cm4cm1_signal;
    yo_12 <= x_c3c2c0c0cm3c0c10c5c0c0c14c4c15c2c4cm1_signal;
    yo_13 <= x_cm12cm10cm14cm1c14c0cm2c8c5cm24c8c1c0cm17c0c10_signal;
    yo_14 <= x_c37c5cm1cm3c5c3c5cm4cm35cm5cm8c6c7c12c11cm7_signal;
    yo_15 <= x_c6cm16cm10cm15cm24cm5cm12c6cm5cm10cm15c5c5c0c10c0_signal;
    yo_16 <= x_c7cm18cm3cm1c3c10cm3c8c10c10c2c9cm9cm9cm10c7_signal;
    yo_17 <= x_cm11cm1cm9c7cm2cm6c2cm11c9cm15cm4cm13cm9cm33c8cm19_signal;
    yo_18 <= x_c3c1cm4c0c4c4c1cm12cm4c0c6cm4cm14cm3cm4c2_signal;
    yo_19 <= x_c6c53cm3c11c2c9c10cm1c1c7c8c12cm17cm18c9cm8_signal;
    yo_20 <= x_cm11cm7c1cm4cm9c15c5c1cm15c4c1c5c23c30cm3c40_signal;
    yo_21 <= x_cm2c7cm1cm1c1cm56c0c4cm1c8cm4c2c4cm8c7cm2_signal;
    yo_22 <= x_c0c6cm24c27cm6c5c3cm7cm9cm15c47cm15c3c9c4cm9_signal;
    yo_23 <= x_cm6cm6c19cm1cm20cm4cm21cm1c22c3cm11c9cm18c2c1cm8_signal;
    yo_24 <= x_c6cm8c20cm4c97c0cm35cm1cm3cm16cm6cm4cm6c19cm8cm1_signal;
    yo_25 <= x_c10cm6cm58c2cm20c0cm1cm14c10c1c2cm7cm18c5cm10c2_signal;
    yo_26 <= x_cm4cm7c1c0c6cm1cm17cm5cm6c5cm14c6c11c11cm1c0_signal;
    yo_27 <= x_c51c1c10cm11c8c0c6cm5cm7c3c6c4c13cm1c0c13_signal;
    yo_28 <= x_c10c16c16cm41cm6cm2cm17c0c6cm25cm7cm6cm20c4c34cm2_signal;
    yo_29 <= x_c0c0cm7c7cm6cm3cm4c18c4c3c10c8c32cm2c5c17_signal;
    yo_30 <= x_cm3cm7c2cm3c9c6c2cm4cm8c8c2cm1cm14c4c3cm6_signal;
    yo_31 <= x_cm9c45c1cm1c2c5c6c1c4cm1c2c9cm9c9c7cm37_signal;
    yo_32 <= x_c5cm3c13cm58cm22c14cm1c0cm1cm6cm4cm7cm9cm18cm33cm18_signal;



end structural;