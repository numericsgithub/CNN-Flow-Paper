LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core2 is
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
    
        yo_1  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_2  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_3  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_4  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_6  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_7  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_8  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_9  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_10  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_11  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_13  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_14  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_15  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_16  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_17  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_20  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_21  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_22  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_25  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_27  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_30  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_32  : out std_logic_vector(12-1 downto 0) --	sfix(4, -8)
    );
end conv5_core2;

architecture structural of conv5_core2 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c1cm1c2cm5cm1c0c2c0c0cm1c3cm1c4c4cm4cm2_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c27c5cm5c2cm2c2c0c2c7c0cm2c1c27c1cm7cm14_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0cm4cm7c3c1cm3cm2c2c1c4cm10c2c6c2c65cm3_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_cm6cm6c3c1cm2c3c2c6c27c9c0cm5c0cm1cm12cm6_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm11c1cm1cm3cm2c1c0c1c41c0c1cm2c1c3cm5cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm37cm8c2c10cm57c2c0cm12c7c3c0cm5cm3cm2cm4c2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm3c1c3c0c2c99c2cm1cm2c7c4c1c2cm4cm1cm1_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_cm1cm6c7cm4c0c0cm1cm1c1cm1c0c0c3c2cm11cm13_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm4c9cm11cm4c1c0c4cm1cm6c0cm3c1cm4c4cm2c1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm1cm13c4c1c11c1c1cm1c5cm1cm15c1cm3c2c2cm1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c6cm3c1c3cm1c3c0c1c2c3cm3c2c6cm2c1cm2_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c14c2cm3cm2c2cm1cm3c2cm7c0c27c2c7cm9c0cm3_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c1c5cm2c1cm1cm4c1c0cm1c13c0c2cm1cm6cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm4cm1cm1cm4c2c1cm1c4c13cm1cm1cm2cm4c0c3cm6_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm3cm19c3c36c0c0cm2c10c0cm9c0cm8c5c5cm4c5_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm15c3c4c1c5c0c3c3cm6c1cm3cm2c2c5cm5cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c9c5c0c9c15cm1c0c4cm24c0c1c2c3c5cm2cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm3cm8c7c22cm1c2c0cm2c1cm3c1c2c1c4c1cm24_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c2c2cm24c19cm1c1cm1cm2cm1c8cm2c6c2cm3cm1cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1c8c5c0c1cm1c2c4c1c14c0cm4c3c0c7c1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm1cm3c12c0c0cm1cm5c0cm1cm1cm4cm1cm3c0cm7c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c4c1c13cm66cm3cm5c0c3c0c4c15cm27c3cm5c2cm5_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_c0c19c1c2c3c3cm3c3cm2c0c2c25cm3c27cm8cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c18c0cm25c8c1cm3c2c1cm29c2cm7c3cm3c3c1cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm14c10c1c2c0cm6c3c2cm6c2c1c2cm3cm3cm3cm9_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1cm6c8c3c0c1c3c0c0c0c25c2c0cm6c0c8_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c4cm2cm5c1c2cm1cm2cm1c1cm1c0cm2cm6cm7c7c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_cm19cm10c25c0cm3cm3c1c0c2cm3c2cm1c1c4c4c8_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm4c0c20cm1c2c2c1c1cm3c2c5c2c3cm1c0cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c4c11c1cm3c3cm1c2cm2c1c3cm6c3cm8c11c1c1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm3cm6cm3c3c0c0c0cm2cm1cm3c5c4cm19cm1cm4cm2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c5cm2c12c0c1c1c0c0c2c5c1c3c9c3c4_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core2_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c1cm1c2cm5cm1c0c2c0c0cm1c3cm1c4c4cm4cm2 => x_c1cm1c2cm5cm1c0c2c0c0cm1c3cm1c4c4cm4cm2_signal, 
                R_c27c5cm5c2cm2c2c0c2c7c0cm2c1c27c1cm7cm14 => x_c27c5cm5c2cm2c2c0c2c7c0cm2c1c27c1cm7cm14_signal, 
                R_c0cm4cm7c3c1cm3cm2c2c1c4cm10c2c6c2c65cm3 => x_c0cm4cm7c3c1cm3cm2c2c1c4cm10c2c6c2c65cm3_signal, 
                R_cm6cm6c3c1cm2c3c2c6c27c9c0cm5c0cm1cm12cm6 => x_cm6cm6c3c1cm2c3c2c6c27c9c0cm5c0cm1cm12cm6_signal, 
                R_cm11c1cm1cm3cm2c1c0c1c41c0c1cm2c1c3cm5cm1 => x_cm11c1cm1cm3cm2c1c0c1c41c0c1cm2c1c3cm5cm1_signal, 
                R_cm37cm8c2c10cm57c2c0cm12c7c3c0cm5cm3cm2cm4c2 => x_cm37cm8c2c10cm57c2c0cm12c7c3c0cm5cm3cm2cm4c2_signal, 
                R_cm3c1c3c0c2c99c2cm1cm2c7c4c1c2cm4cm1cm1 => x_cm3c1c3c0c2c99c2cm1cm2c7c4c1c2cm4cm1cm1_signal, 
                R_cm1cm6c7cm4c0c0cm1cm1c1cm1c0c0c3c2cm11cm13 => x_cm1cm6c7cm4c0c0cm1cm1c1cm1c0c0c3c2cm11cm13_signal, 
                R_cm4c9cm11cm4c1c0c4cm1cm6c0cm3c1cm4c4cm2c1 => x_cm4c9cm11cm4c1c0c4cm1cm6c0cm3c1cm4c4cm2c1_signal, 
                R_cm1cm13c4c1c11c1c1cm1c5cm1cm15c1cm3c2c2cm1 => x_cm1cm13c4c1c11c1c1cm1c5cm1cm15c1cm3c2c2cm1_signal, 
                R_c6cm3c1c3cm1c3c0c1c2c3cm3c2c6cm2c1cm2 => x_c6cm3c1c3cm1c3c0c1c2c3cm3c2c6cm2c1cm2_signal, 
                R_c14c2cm3cm2c2cm1cm3c2cm7c0c27c2c7cm9c0cm3 => x_c14c2cm3cm2c2cm1cm3c2cm7c0c27c2c7cm9c0cm3_signal, 
                R_c0c1c5cm2c1cm1cm4c1c0cm1c13c0c2cm1cm6cm2 => x_c0c1c5cm2c1cm1cm4c1c0cm1c13c0c2cm1cm6cm2_signal, 
                R_cm4cm1cm1cm4c2c1cm1c4c13cm1cm1cm2cm4c0c3cm6 => x_cm4cm1cm1cm4c2c1cm1c4c13cm1cm1cm2cm4c0c3cm6_signal, 
                R_cm3cm19c3c36c0c0cm2c10c0cm9c0cm8c5c5cm4c5 => x_cm3cm19c3c36c0c0cm2c10c0cm9c0cm8c5c5cm4c5_signal, 
                R_cm15c3c4c1c5c0c3c3cm6c1cm3cm2c2c5cm5cm2 => x_cm15c3c4c1c5c0c3c3cm6c1cm3cm2c2c5cm5cm2_signal, 
                R_c9c5c0c9c15cm1c0c4cm24c0c1c2c3c5cm2cm1 => x_c9c5c0c9c15cm1c0c4cm24c0c1c2c3c5cm2cm1_signal, 
                R_cm3cm8c7c22cm1c2c0cm2c1cm3c1c2c1c4c1cm24 => x_cm3cm8c7c22cm1c2c0cm2c1cm3c1c2c1c4c1cm24_signal, 
                R_c2c2cm24c19cm1c1cm1cm2cm1c8cm2c6c2cm3cm1cm1 => x_c2c2cm24c19cm1c1cm1cm2cm1c8cm2c6c2cm3cm1cm1_signal, 
                R_cm1c8c5c0c1cm1c2c4c1c14c0cm4c3c0c7c1 => x_cm1c8c5c0c1cm1c2c4c1c14c0cm4c3c0c7c1_signal, 
                R_cm1cm3c12c0c0cm1cm5c0cm1cm1cm4cm1cm3c0cm7c0 => x_cm1cm3c12c0c0cm1cm5c0cm1cm1cm4cm1cm3c0cm7c0_signal, 
                R_c4c1c13cm66cm3cm5c0c3c0c4c15cm27c3cm5c2cm5 => x_c4c1c13cm66cm3cm5c0c3c0c4c15cm27c3cm5c2cm5_signal, 
                R_c0c19c1c2c3c3cm3c3cm2c0c2c25cm3c27cm8cm2 => x_c0c19c1c2c3c3cm3c3cm2c0c2c25cm3c27cm8cm2_signal, 
                R_c18c0cm25c8c1cm3c2c1cm29c2cm7c3cm3c3c1cm1 => x_c18c0cm25c8c1cm3c2c1cm29c2cm7c3cm3c3c1cm1_signal, 
                R_cm14c10c1c2c0cm6c3c2cm6c2c1c2cm3cm3cm3cm9 => x_cm14c10c1c2c0cm6c3c2cm6c2c1c2cm3cm3cm3cm9_signal, 
                R_c1cm6c8c3c0c1c3c0c0c0c25c2c0cm6c0c8 => x_c1cm6c8c3c0c1c3c0c0c0c25c2c0cm6c0c8_signal, 
                R_c4cm2cm5c1c2cm1cm2cm1c1cm1c0cm2cm6cm7c7c0 => x_c4cm2cm5c1c2cm1cm2cm1c1cm1c0cm2cm6cm7c7c0_signal, 
                R_cm19cm10c25c0cm3cm3c1c0c2cm3c2cm1c1c4c4c8 => x_cm19cm10c25c0cm3cm3c1c0c2cm3c2cm1c1c4c4c8_signal, 
                R_cm4c0c20cm1c2c2c1c1cm3c2c5c2c3cm1c0cm1 => x_cm4c0c20cm1c2c2c1c1cm3c2c5c2c3cm1c0cm1_signal, 
                R_c4c11c1cm3c3cm1c2cm2c1c3cm6c3cm8c11c1c1 => x_c4c11c1cm3c3cm1c2cm2c1c3cm6c3cm8c11c1c1_signal, 
                R_cm3cm6cm3c3c0c0c0cm2cm1cm3c5c4cm19cm1cm4cm2 => x_cm3cm6cm3c3c0c0c0cm2cm1cm3c5c4cm19cm1cm4cm2_signal, 
                R_c0c5cm2c12c0c1c1c0c0c2c5c1c3c9c3c4 => x_c0c5cm2c12c0c1c1c0c0c2c5c1c3c9c3c4_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c1cm1c2cm5cm1c0c2c0c0cm1c3cm1c4c4cm4cm2_signal;
    yo_2 <= x_c27c5cm5c2cm2c2c0c2c7c0cm2c1c27c1cm7cm14_signal;
    yo_3 <= x_c0cm4cm7c3c1cm3cm2c2c1c4cm10c2c6c2c65cm3_signal;
    yo_4 <= x_cm6cm6c3c1cm2c3c2c6c27c9c0cm5c0cm1cm12cm6_signal;
    yo_5 <= x_cm11c1cm1cm3cm2c1c0c1c41c0c1cm2c1c3cm5cm1_signal;
    yo_6 <= x_cm37cm8c2c10cm57c2c0cm12c7c3c0cm5cm3cm2cm4c2_signal;
    yo_7 <= x_cm3c1c3c0c2c99c2cm1cm2c7c4c1c2cm4cm1cm1_signal;
    yo_8 <= x_cm1cm6c7cm4c0c0cm1cm1c1cm1c0c0c3c2cm11cm13_signal;
    yo_9 <= x_cm4c9cm11cm4c1c0c4cm1cm6c0cm3c1cm4c4cm2c1_signal;
    yo_10 <= x_cm1cm13c4c1c11c1c1cm1c5cm1cm15c1cm3c2c2cm1_signal;
    yo_11 <= x_c6cm3c1c3cm1c3c0c1c2c3cm3c2c6cm2c1cm2_signal;
    yo_12 <= x_c14c2cm3cm2c2cm1cm3c2cm7c0c27c2c7cm9c0cm3_signal;
    yo_13 <= x_c0c1c5cm2c1cm1cm4c1c0cm1c13c0c2cm1cm6cm2_signal;
    yo_14 <= x_cm4cm1cm1cm4c2c1cm1c4c13cm1cm1cm2cm4c0c3cm6_signal;
    yo_15 <= x_cm3cm19c3c36c0c0cm2c10c0cm9c0cm8c5c5cm4c5_signal;
    yo_16 <= x_cm15c3c4c1c5c0c3c3cm6c1cm3cm2c2c5cm5cm2_signal;
    yo_17 <= x_c9c5c0c9c15cm1c0c4cm24c0c1c2c3c5cm2cm1_signal;
    yo_18 <= x_cm3cm8c7c22cm1c2c0cm2c1cm3c1c2c1c4c1cm24_signal;
    yo_19 <= x_c2c2cm24c19cm1c1cm1cm2cm1c8cm2c6c2cm3cm1cm1_signal;
    yo_20 <= x_cm1c8c5c0c1cm1c2c4c1c14c0cm4c3c0c7c1_signal;
    yo_21 <= x_cm1cm3c12c0c0cm1cm5c0cm1cm1cm4cm1cm3c0cm7c0_signal;
    yo_22 <= x_c4c1c13cm66cm3cm5c0c3c0c4c15cm27c3cm5c2cm5_signal;
    yo_23 <= x_c0c19c1c2c3c3cm3c3cm2c0c2c25cm3c27cm8cm2_signal;
    yo_24 <= x_c18c0cm25c8c1cm3c2c1cm29c2cm7c3cm3c3c1cm1_signal;
    yo_25 <= x_cm14c10c1c2c0cm6c3c2cm6c2c1c2cm3cm3cm3cm9_signal;
    yo_26 <= x_c1cm6c8c3c0c1c3c0c0c0c25c2c0cm6c0c8_signal;
    yo_27 <= x_c4cm2cm5c1c2cm1cm2cm1c1cm1c0cm2cm6cm7c7c0_signal;
    yo_28 <= x_cm19cm10c25c0cm3cm3c1c0c2cm3c2cm1c1c4c4c8_signal;
    yo_29 <= x_cm4c0c20cm1c2c2c1c1cm3c2c5c2c3cm1c0cm1_signal;
    yo_30 <= x_c4c11c1cm3c3cm1c2cm2c1c3cm6c3cm8c11c1c1_signal;
    yo_31 <= x_cm3cm6cm3c3c0c0c0cm2cm1cm3c5c4cm19cm1cm4cm2_signal;
    yo_32 <= x_c0c5cm2c12c0c1c1c0c0c2c5c1c3c9c3c4_signal;



end structural;