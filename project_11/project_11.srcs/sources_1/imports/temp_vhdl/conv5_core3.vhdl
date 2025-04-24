LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core3 is
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
        yo_3  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_4  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_5  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_7  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_9  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_11  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_15  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_16  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_19  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_20  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_21  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_24  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_26  : out std_logic_vector(10-1 downto 0);  --	sfix(2, -8)
        yo_27  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_29  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_30  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(5, -8)
    );
end conv5_core3;

architecture structural of conv5_core3 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm12c1cm10cm2c0cm2cm2cm1c0c0c0c0c2cm5cm11cm4_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm1c9c2c6cm13c8c21cm2c0c0c0c0c7c17cm7c11_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm2cm4c5cm3c13c1c6c3c0c0c0c0c4cm5c0cm3_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c21cm5c2c2cm1cm3c22c0c0c0c0c0c11cm3c0c16_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c25c0c3c0c2c2cm14cm4c0c0c0c0cm11c1c0cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm40cm5c1cm9c0c8c3c5c0c0c0c0cm3cm4cm2c6_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm2cm16c1c0cm2cm3c2c1c0c0c0c0c0c4c12c1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0cm3cm1cm6cm7c3c32c11c0c0c0c0cm6c3cm12cm14_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c8c2cm3cm4c2cm4c1cm1c0c0c0c0cm22c13cm23cm10_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm4c3cm18c1cm1c4c12cm9c0c0c0c0c30cm9c5c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c4c2cm4c4c0cm3c0cm2c0c0c0c0c2c7c3c11_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm8c5c15cm3c3cm6c2cm2c0c0c0c0c22c1cm5cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c30cm15cm14c1c1c2cm2c5c0c0c0c0c3c15c4c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm7c0c16cm1c1c0cm2cm16c0c0c0c0c5cm3cm11cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1cm2cm3c70c1c4c8c4c0c0c0c0c3cm27cm2cm13_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_cm1c0c5c2cm2c4cm1c1c0c0c0c0cm14c3c6cm37_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm8cm1c0cm7c1cm10cm7cm8c0c0c0c0cm19cm4cm10c11_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm6cm2c15cm3cm2c0c1cm1c0c0c0c0c6c7cm3cm24_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0cm8cm41c18c4cm8c14cm1c0c0c0c0c4c29cm2c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm6c3cm7c1c3cm4c7cm6c0c0c0c0c19c1c1c6_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1c0c6c2c1c0c13c15c0c0c0c0cm4c0c9c3_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm2cm2cm36c21c0cm2cm2c3c0c0c0c0cm3cm8cm8cm5_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c7cm4c2c4c0c20c8cm5c0c0c0c0c6cm2c7c15_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm2c0c6cm3c0c2c13cm1c0c0c0c0c3cm1cm44c8_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm1cm8cm1c2c0cm10c0cm27c0c0c0c0cm10c10cm6c5_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1cm2cm4c1c0c0c1cm1c0c0c0c0c2cm3cm2cm2_signal : std_logic_vector(10-1 downto 0); --	sfix(2, -8)
    signal  x_c2cm1c5cm4c12c1c7c6c0c0c0c0c0c5cm1cm5_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm2c2cm4cm2c36cm7c2cm22c0c0c0c0cm6cm33c15c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm5c0c4c2c0c0cm1c4c0c0c0c0cm8cm5c0c3_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c3c10cm13c0c0c2c5c1c0c0c0c0c7c0c36c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c2c1cm12cm5cm6cm2cm1cm3c0c0c0c0c18cm9c4c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0cm4cm13c5c2c1c17c1c0c0c0c0c1c1cm13c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core3_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm12c1cm10cm2c0cm2cm2cm1c0c0c0c0c2cm5cm11cm4 => x_cm12c1cm10cm2c0cm2cm2cm1c0c0c0c0c2cm5cm11cm4_signal, 
                R_cm1c9c2c6cm13c8c21cm2c0c0c0c0c7c17cm7c11 => x_cm1c9c2c6cm13c8c21cm2c0c0c0c0c7c17cm7c11_signal, 
                R_cm2cm4c5cm3c13c1c6c3c0c0c0c0c4cm5c0cm3 => x_cm2cm4c5cm3c13c1c6c3c0c0c0c0c4cm5c0cm3_signal, 
                R_c21cm5c2c2cm1cm3c22c0c0c0c0c0c11cm3c0c16 => x_c21cm5c2c2cm1cm3c22c0c0c0c0c0c11cm3c0c16_signal, 
                R_c25c0c3c0c2c2cm14cm4c0c0c0c0cm11c1c0cm8 => x_c25c0c3c0c2c2cm14cm4c0c0c0c0cm11c1c0cm8_signal, 
                R_cm40cm5c1cm9c0c8c3c5c0c0c0c0cm3cm4cm2c6 => x_cm40cm5c1cm9c0c8c3c5c0c0c0c0cm3cm4cm2c6_signal, 
                R_cm2cm16c1c0cm2cm3c2c1c0c0c0c0c0c4c12c1 => x_cm2cm16c1c0cm2cm3c2c1c0c0c0c0c0c4c12c1_signal, 
                R_c0cm3cm1cm6cm7c3c32c11c0c0c0c0cm6c3cm12cm14 => x_c0cm3cm1cm6cm7c3c32c11c0c0c0c0cm6c3cm12cm14_signal, 
                R_c8c2cm3cm4c2cm4c1cm1c0c0c0c0cm22c13cm23cm10 => x_c8c2cm3cm4c2cm4c1cm1c0c0c0c0cm22c13cm23cm10_signal, 
                R_cm4c3cm18c1cm1c4c12cm9c0c0c0c0c30cm9c5c0 => x_cm4c3cm18c1cm1c4c12cm9c0c0c0c0c30cm9c5c0_signal, 
                R_c4c2cm4c4c0cm3c0cm2c0c0c0c0c2c7c3c11 => x_c4c2cm4c4c0cm3c0cm2c0c0c0c0c2c7c3c11_signal, 
                R_cm8c5c15cm3c3cm6c2cm2c0c0c0c0c22c1cm5cm3 => x_cm8c5c15cm3c3cm6c2cm2c0c0c0c0c22c1cm5cm3_signal, 
                R_c30cm15cm14c1c1c2cm2c5c0c0c0c0c3c15c4c1 => x_c30cm15cm14c1c1c2cm2c5c0c0c0c0c3c15c4c1_signal, 
                R_cm7c0c16cm1c1c0cm2cm16c0c0c0c0c5cm3cm11cm2 => x_cm7c0c16cm1c1c0cm2cm16c0c0c0c0c5cm3cm11cm2_signal, 
                R_cm1cm2cm3c70c1c4c8c4c0c0c0c0c3cm27cm2cm13 => x_cm1cm2cm3c70c1c4c8c4c0c0c0c0c3cm27cm2cm13_signal, 
                R_cm1c0c5c2cm2c4cm1c1c0c0c0c0cm14c3c6cm37 => x_cm1c0c5c2cm2c4cm1c1c0c0c0c0cm14c3c6cm37_signal, 
                R_cm8cm1c0cm7c1cm10cm7cm8c0c0c0c0cm19cm4cm10c11 => x_cm8cm1c0cm7c1cm10cm7cm8c0c0c0c0cm19cm4cm10c11_signal, 
                R_cm6cm2c15cm3cm2c0c1cm1c0c0c0c0c6c7cm3cm24 => x_cm6cm2c15cm3cm2c0c1cm1c0c0c0c0c6c7cm3cm24_signal, 
                R_c0cm8cm41c18c4cm8c14cm1c0c0c0c0c4c29cm2c1 => x_c0cm8cm41c18c4cm8c14cm1c0c0c0c0c4c29cm2c1_signal, 
                R_cm6c3cm7c1c3cm4c7cm6c0c0c0c0c19c1c1c6 => x_cm6c3cm7c1c3cm4c7cm6c0c0c0c0c19c1c1c6_signal, 
                R_c1c0c6c2c1c0c13c15c0c0c0c0cm4c0c9c3 => x_c1c0c6c2c1c0c13c15c0c0c0c0cm4c0c9c3_signal, 
                R_cm2cm2cm36c21c0cm2cm2c3c0c0c0c0cm3cm8cm8cm5 => x_cm2cm2cm36c21c0cm2cm2c3c0c0c0c0cm3cm8cm8cm5_signal, 
                R_c7cm4c2c4c0c20c8cm5c0c0c0c0c6cm2c7c15 => x_c7cm4c2c4c0c20c8cm5c0c0c0c0c6cm2c7c15_signal, 
                R_cm2c0c6cm3c0c2c13cm1c0c0c0c0c3cm1cm44c8 => x_cm2c0c6cm3c0c2c13cm1c0c0c0c0c3cm1cm44c8_signal, 
                R_cm1cm8cm1c2c0cm10c0cm27c0c0c0c0cm10c10cm6c5 => x_cm1cm8cm1c2c0cm10c0cm27c0c0c0c0cm10c10cm6c5_signal, 
                R_c1cm2cm4c1c0c0c1cm1c0c0c0c0c2cm3cm2cm2 => x_c1cm2cm4c1c0c0c1cm1c0c0c0c0c2cm3cm2cm2_signal, 
                R_c2cm1c5cm4c12c1c7c6c0c0c0c0c0c5cm1cm5 => x_c2cm1c5cm4c12c1c7c6c0c0c0c0c0c5cm1cm5_signal, 
                R_cm2c2cm4cm2c36cm7c2cm22c0c0c0c0cm6cm33c15c1 => x_cm2c2cm4cm2c36cm7c2cm22c0c0c0c0cm6cm33c15c1_signal, 
                R_cm5c0c4c2c0c0cm1c4c0c0c0c0cm8cm5c0c3 => x_cm5c0c4c2c0c0cm1c4c0c0c0c0cm8cm5c0c3_signal, 
                R_c3c10cm13c0c0c2c5c1c0c0c0c0c7c0c36c1 => x_c3c10cm13c0c0c2c5c1c0c0c0c0c7c0c36c1_signal, 
                R_c2c1cm12cm5cm6cm2cm1cm3c0c0c0c0c18cm9c4c2 => x_c2c1cm12cm5cm6cm2cm1cm3c0c0c0c0c18cm9c4c2_signal, 
                R_c0cm4cm13c5c2c1c17c1c0c0c0c0c1c1cm13c2 => x_c0cm4cm13c5c2c1c17c1c0c0c0c0c1c1cm13c2_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm12c1cm10cm2c0cm2cm2cm1c0c0c0c0c2cm5cm11cm4_signal;
    yo_2 <= x_cm1c9c2c6cm13c8c21cm2c0c0c0c0c7c17cm7c11_signal;
    yo_3 <= x_cm2cm4c5cm3c13c1c6c3c0c0c0c0c4cm5c0cm3_signal;
    yo_4 <= x_c21cm5c2c2cm1cm3c22c0c0c0c0c0c11cm3c0c16_signal;
    yo_5 <= x_c25c0c3c0c2c2cm14cm4c0c0c0c0cm11c1c0cm8_signal;
    yo_6 <= x_cm40cm5c1cm9c0c8c3c5c0c0c0c0cm3cm4cm2c6_signal;
    yo_7 <= x_cm2cm16c1c0cm2cm3c2c1c0c0c0c0c0c4c12c1_signal;
    yo_8 <= x_c0cm3cm1cm6cm7c3c32c11c0c0c0c0cm6c3cm12cm14_signal;
    yo_9 <= x_c8c2cm3cm4c2cm4c1cm1c0c0c0c0cm22c13cm23cm10_signal;
    yo_10 <= x_cm4c3cm18c1cm1c4c12cm9c0c0c0c0c30cm9c5c0_signal;
    yo_11 <= x_c4c2cm4c4c0cm3c0cm2c0c0c0c0c2c7c3c11_signal;
    yo_12 <= x_cm8c5c15cm3c3cm6c2cm2c0c0c0c0c22c1cm5cm3_signal;
    yo_13 <= x_c30cm15cm14c1c1c2cm2c5c0c0c0c0c3c15c4c1_signal;
    yo_14 <= x_cm7c0c16cm1c1c0cm2cm16c0c0c0c0c5cm3cm11cm2_signal;
    yo_15 <= x_cm1cm2cm3c70c1c4c8c4c0c0c0c0c3cm27cm2cm13_signal;
    yo_16 <= x_cm1c0c5c2cm2c4cm1c1c0c0c0c0cm14c3c6cm37_signal;
    yo_17 <= x_cm8cm1c0cm7c1cm10cm7cm8c0c0c0c0cm19cm4cm10c11_signal;
    yo_18 <= x_cm6cm2c15cm3cm2c0c1cm1c0c0c0c0c6c7cm3cm24_signal;
    yo_19 <= x_c0cm8cm41c18c4cm8c14cm1c0c0c0c0c4c29cm2c1_signal;
    yo_20 <= x_cm6c3cm7c1c3cm4c7cm6c0c0c0c0c19c1c1c6_signal;
    yo_21 <= x_c1c0c6c2c1c0c13c15c0c0c0c0cm4c0c9c3_signal;
    yo_22 <= x_cm2cm2cm36c21c0cm2cm2c3c0c0c0c0cm3cm8cm8cm5_signal;
    yo_23 <= x_c7cm4c2c4c0c20c8cm5c0c0c0c0c6cm2c7c15_signal;
    yo_24 <= x_cm2c0c6cm3c0c2c13cm1c0c0c0c0c3cm1cm44c8_signal;
    yo_25 <= x_cm1cm8cm1c2c0cm10c0cm27c0c0c0c0cm10c10cm6c5_signal;
    yo_26 <= x_c1cm2cm4c1c0c0c1cm1c0c0c0c0c2cm3cm2cm2_signal;
    yo_27 <= x_c2cm1c5cm4c12c1c7c6c0c0c0c0c0c5cm1cm5_signal;
    yo_28 <= x_cm2c2cm4cm2c36cm7c2cm22c0c0c0c0cm6cm33c15c1_signal;
    yo_29 <= x_cm5c0c4c2c0c0cm1c4c0c0c0c0cm8cm5c0c3_signal;
    yo_30 <= x_c3c10cm13c0c0c2c5c1c0c0c0c0c7c0c36c1_signal;
    yo_31 <= x_c2c1cm12cm5cm6cm2cm1cm3c0c0c0c0c18cm9c4c2_signal;
    yo_32 <= x_c0cm4cm13c5c2c1c17c1c0c0c0c0c1c1cm13c2_signal;



end structural;