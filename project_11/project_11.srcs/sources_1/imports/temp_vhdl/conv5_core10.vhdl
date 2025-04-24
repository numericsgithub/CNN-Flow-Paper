LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core10 is
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
        yo_2  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_5  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_7  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_9  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_13  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_14  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_16  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_17  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_18  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_19  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_21  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_23  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_24  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_25  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_26  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_27  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_28  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_29  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_30  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_32  : out std_logic_vector(12-1 downto 0) --	sfix(4, -8)
    );
end conv5_core10;

architecture structural of conv5_core10 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm1cm16c21c1c3c0c4c1c0c0c0c0c3c0cm4c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1c9c0c0cm6c2cm15cm2c0c0c0c0cm8c5cm14c7_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c2c15c8c1c1cm3cm6cm43c0c0c0c0c4c0c1cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm2c6c1cm9c2cm7c7cm1c0c0c0c0c1cm3c13cm35_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c1c0cm4c0c0cm2cm29cm2c0c0c0c0c1c0c2cm26_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c10c11cm1cm21cm3c3c3cm3c0c0c0c0c1c2c3c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1cm9c1c11cm3cm1c6c1c0c0c0c0c2cm2cm13c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0c1c3cm2c22c6cm11c5c0c0c0c0cm1c1c9cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1cm3c7cm11cm7c4c9c3c0c0c0c0c80c1c9c0_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_cm11c1cm4c1c0c5c1c9c0c0c0c0c1c26c7c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1cm49c6c1c0cm2c1c6c0c0c0c0cm3cm2cm4c29_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm4c0c1c28c3cm23c0c0c0c0c0c0c2cm3c3cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1cm2c14c0c1c4cm4cm3c0c0c0c0c2cm2c6c2_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm3c0c2cm2c2cm1c4c11c0c0c0c0cm3cm10cm1c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1cm2c54c7c5c2c1cm2c0c0c0c0cm6c7cm1cm9_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0c2c1c3c0cm4cm55c3c0c0c0c0c4c0c2c22_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c9c0c0c1c1c0c2cm1c0c0c0c0c8c3c35cm5_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm3c7c0c2c2c7cm1c0c0c0c0c0c1c2cm1c10_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1c1cm1cm2c5cm3cm1cm5c0c0c0c0cm2cm4c9cm9_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0cm2c2cm40cm1c1cm7c1c0c0c0c0c2c2c3c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c1c0c3c0c10c0c9c3c0c0c0c0cm1cm1cm4c3_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c46cm4c0c4c2c12c2c9c0c0c0c0c0c8c0c8_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm2c4c0c2c8c0c4c1c0c0c0c0cm4cm5c1c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0c5cm1c2c0cm2cm2cm3c0c0c0c0cm2cm1c7cm1_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_cm2cm1cm19cm3c6cm3c1c0c0c0c0c0c4c2c0cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0cm1c0c0cm4cm3c1c0c0c0c0c0c5c2cm1c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_cm2cm4c5cm1cm45c0cm7cm4c0c0c0c0c1c2c1c47_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c9cm4c0cm2cm5c0c1cm5c0c0c0c0cm1c6c0c1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c11cm5c5c6c3c1cm8c3c0c0c0c0c1cm1cm5cm1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c12c0c0cm18cm1c3c0cm3c0c0c0c0c3cm1c3cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1c1c47c1cm25c6cm1cm1c0c0c0c0c30cm25cm1cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0cm1c8c0c0c0c5c2c0c0c0c0c1c2c2cm3_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core10_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm1cm16c21c1c3c0c4c1c0c0c0c0c3c0cm4c2 => x_cm1cm16c21c1c3c0c4c1c0c0c0c0c3c0cm4c2_signal, 
                R_c1c9c0c0cm6c2cm15cm2c0c0c0c0cm8c5cm14c7 => x_c1c9c0c0cm6c2cm15cm2c0c0c0c0cm8c5cm14c7_signal, 
                R_c2c15c8c1c1cm3cm6cm43c0c0c0c0c4c0c1cm1 => x_c2c15c8c1c1cm3cm6cm43c0c0c0c0c4c0c1cm1_signal, 
                R_cm2c6c1cm9c2cm7c7cm1c0c0c0c0c1cm3c13cm35 => x_cm2c6c1cm9c2cm7c7cm1c0c0c0c0c1cm3c13cm35_signal, 
                R_c1c0cm4c0c0cm2cm29cm2c0c0c0c0c1c0c2cm26 => x_c1c0cm4c0c0cm2cm29cm2c0c0c0c0c1c0c2cm26_signal, 
                R_c10c11cm1cm21cm3c3c3cm3c0c0c0c0c1c2c3c0 => x_c10c11cm1cm21cm3c3c3cm3c0c0c0c0c1c2c3c0_signal, 
                R_cm1cm9c1c11cm3cm1c6c1c0c0c0c0c2cm2cm13c0 => x_cm1cm9c1c11cm3cm1c6c1c0c0c0c0c2cm2cm13c0_signal, 
                R_c0c1c3cm2c22c6cm11c5c0c0c0c0cm1c1c9cm2 => x_c0c1c3cm2c22c6cm11c5c0c0c0c0cm1c1c9cm2_signal, 
                R_cm1cm3c7cm11cm7c4c9c3c0c0c0c0c80c1c9c0 => x_cm1cm3c7cm11cm7c4c9c3c0c0c0c0c80c1c9c0_signal, 
                R_cm11c1cm4c1c0c5c1c9c0c0c0c0c1c26c7c1 => x_cm11c1cm4c1c0c5c1c9c0c0c0c0c1c26c7c1_signal, 
                R_c1cm49c6c1c0cm2c1c6c0c0c0c0cm3cm2cm4c29 => x_c1cm49c6c1c0cm2c1c6c0c0c0c0cm3cm2cm4c29_signal, 
                R_cm4c0c1c28c3cm23c0c0c0c0c0c0c2cm3c3cm2 => x_cm4c0c1c28c3cm23c0c0c0c0c0c0c2cm3c3cm2_signal, 
                R_c1cm2c14c0c1c4cm4cm3c0c0c0c0c2cm2c6c2 => x_c1cm2c14c0c1c4cm4cm3c0c0c0c0c2cm2c6c2_signal, 
                R_cm3c0c2cm2c2cm1c4c11c0c0c0c0cm3cm10cm1c0 => x_cm3c0c2cm2c2cm1c4c11c0c0c0c0cm3cm10cm1c0_signal, 
                R_c1cm2c54c7c5c2c1cm2c0c0c0c0cm6c7cm1cm9 => x_c1cm2c54c7c5c2c1cm2c0c0c0c0cm6c7cm1cm9_signal, 
                R_c0c2c1c3c0cm4cm55c3c0c0c0c0c4c0c2c22 => x_c0c2c1c3c0cm4cm55c3c0c0c0c0c4c0c2c22_signal, 
                R_c9c0c0c1c1c0c2cm1c0c0c0c0c8c3c35cm5 => x_c9c0c0c1c1c0c2cm1c0c0c0c0c8c3c35cm5_signal, 
                R_cm3c7c0c2c2c7cm1c0c0c0c0c0c1c2cm1c10 => x_cm3c7c0c2c2c7cm1c0c0c0c0c0c1c2cm1c10_signal, 
                R_c1c1cm1cm2c5cm3cm1cm5c0c0c0c0cm2cm4c9cm9 => x_c1c1cm1cm2c5cm3cm1cm5c0c0c0c0cm2cm4c9cm9_signal, 
                R_c0cm2c2cm40cm1c1cm7c1c0c0c0c0c2c2c3c1 => x_c0cm2c2cm40cm1c1cm7c1c0c0c0c0c2c2c3c1_signal, 
                R_c1c0c3c0c10c0c9c3c0c0c0c0cm1cm1cm4c3 => x_c1c0c3c0c10c0c9c3c0c0c0c0cm1cm1cm4c3_signal, 
                R_c46cm4c0c4c2c12c2c9c0c0c0c0c0c8c0c8 => x_c46cm4c0c4c2c12c2c9c0c0c0c0c0c8c0c8_signal, 
                R_cm2c4c0c2c8c0c4c1c0c0c0c0cm4cm5c1c0 => x_cm2c4c0c2c8c0c4c1c0c0c0c0cm4cm5c1c0_signal, 
                R_c0c5cm1c2c0cm2cm2cm3c0c0c0c0cm2cm1c7cm1 => x_c0c5cm1c2c0cm2cm2cm3c0c0c0c0cm2cm1c7cm1_signal, 
                R_cm2cm1cm19cm3c6cm3c1c0c0c0c0c0c4c2c0cm5 => x_cm2cm1cm19cm3c6cm3c1c0c0c0c0c0c4c2c0cm5_signal, 
                R_c0cm1c0c0cm4cm3c1c0c0c0c0c0c5c2cm1c0 => x_c0cm1c0c0cm4cm3c1c0c0c0c0c0c5c2cm1c0_signal, 
                R_cm2cm4c5cm1cm45c0cm7cm4c0c0c0c0c1c2c1c47 => x_cm2cm4c5cm1cm45c0cm7cm4c0c0c0c0c1c2c1c47_signal, 
                R_c9cm4c0cm2cm5c0c1cm5c0c0c0c0cm1c6c0c1 => x_c9cm4c0cm2cm5c0c1cm5c0c0c0c0cm1c6c0c1_signal, 
                R_c11cm5c5c6c3c1cm8c3c0c0c0c0c1cm1cm5cm1 => x_c11cm5c5c6c3c1cm8c3c0c0c0c0c1cm1cm5cm1_signal, 
                R_c12c0c0cm18cm1c3c0cm3c0c0c0c0c3cm1c3cm5 => x_c12c0c0cm18cm1c3c0cm3c0c0c0c0c3cm1c3cm5_signal, 
                R_c1c1c47c1cm25c6cm1cm1c0c0c0c0c30cm25cm1cm3 => x_c1c1c47c1cm25c6cm1cm1c0c0c0c0c30cm25cm1cm3_signal, 
                R_c0cm1c8c0c0c0c5c2c0c0c0c0c1c2c2cm3 => x_c0cm1c8c0c0c0c5c2c0c0c0c0c1c2c2cm3_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm1cm16c21c1c3c0c4c1c0c0c0c0c3c0cm4c2_signal;
    yo_2 <= x_c1c9c0c0cm6c2cm15cm2c0c0c0c0cm8c5cm14c7_signal;
    yo_3 <= x_c2c15c8c1c1cm3cm6cm43c0c0c0c0c4c0c1cm1_signal;
    yo_4 <= x_cm2c6c1cm9c2cm7c7cm1c0c0c0c0c1cm3c13cm35_signal;
    yo_5 <= x_c1c0cm4c0c0cm2cm29cm2c0c0c0c0c1c0c2cm26_signal;
    yo_6 <= x_c10c11cm1cm21cm3c3c3cm3c0c0c0c0c1c2c3c0_signal;
    yo_7 <= x_cm1cm9c1c11cm3cm1c6c1c0c0c0c0c2cm2cm13c0_signal;
    yo_8 <= x_c0c1c3cm2c22c6cm11c5c0c0c0c0cm1c1c9cm2_signal;
    yo_9 <= x_cm1cm3c7cm11cm7c4c9c3c0c0c0c0c80c1c9c0_signal;
    yo_10 <= x_cm11c1cm4c1c0c5c1c9c0c0c0c0c1c26c7c1_signal;
    yo_11 <= x_c1cm49c6c1c0cm2c1c6c0c0c0c0cm3cm2cm4c29_signal;
    yo_12 <= x_cm4c0c1c28c3cm23c0c0c0c0c0c0c2cm3c3cm2_signal;
    yo_13 <= x_c1cm2c14c0c1c4cm4cm3c0c0c0c0c2cm2c6c2_signal;
    yo_14 <= x_cm3c0c2cm2c2cm1c4c11c0c0c0c0cm3cm10cm1c0_signal;
    yo_15 <= x_c1cm2c54c7c5c2c1cm2c0c0c0c0cm6c7cm1cm9_signal;
    yo_16 <= x_c0c2c1c3c0cm4cm55c3c0c0c0c0c4c0c2c22_signal;
    yo_17 <= x_c9c0c0c1c1c0c2cm1c0c0c0c0c8c3c35cm5_signal;
    yo_18 <= x_cm3c7c0c2c2c7cm1c0c0c0c0c0c1c2cm1c10_signal;
    yo_19 <= x_c1c1cm1cm2c5cm3cm1cm5c0c0c0c0cm2cm4c9cm9_signal;
    yo_20 <= x_c0cm2c2cm40cm1c1cm7c1c0c0c0c0c2c2c3c1_signal;
    yo_21 <= x_c1c0c3c0c10c0c9c3c0c0c0c0cm1cm1cm4c3_signal;
    yo_22 <= x_c46cm4c0c4c2c12c2c9c0c0c0c0c0c8c0c8_signal;
    yo_23 <= x_cm2c4c0c2c8c0c4c1c0c0c0c0cm4cm5c1c0_signal;
    yo_24 <= x_c0c5cm1c2c0cm2cm2cm3c0c0c0c0cm2cm1c7cm1_signal;
    yo_25 <= x_cm2cm1cm19cm3c6cm3c1c0c0c0c0c0c4c2c0cm5_signal;
    yo_26 <= x_c0cm1c0c0cm4cm3c1c0c0c0c0c0c5c2cm1c0_signal;
    yo_27 <= x_cm2cm4c5cm1cm45c0cm7cm4c0c0c0c0c1c2c1c47_signal;
    yo_28 <= x_c9cm4c0cm2cm5c0c1cm5c0c0c0c0cm1c6c0c1_signal;
    yo_29 <= x_c11cm5c5c6c3c1cm8c3c0c0c0c0c1cm1cm5cm1_signal;
    yo_30 <= x_c12c0c0cm18cm1c3c0cm3c0c0c0c0c3cm1c3cm5_signal;
    yo_31 <= x_c1c1c47c1cm25c6cm1cm1c0c0c0c0c30cm25cm1cm3_signal;
    yo_32 <= x_c0cm1c8c0c0c0c5c2c0c0c0c0c1c2c2cm3_signal;



end structural;