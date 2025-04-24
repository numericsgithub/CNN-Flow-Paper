LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core11 is
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
        yo_3  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_4  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_5  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_7  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_9  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_10  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_11  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_12  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_14  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_15  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_16  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_17  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_18  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_20  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_21  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_22  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_23  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_24  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_25  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_26  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_29  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_30  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_32  : out std_logic_vector(12-1 downto 0) --	sfix(4, -8)
    );
end conv5_core11;

architecture structural of conv5_core11 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c2c1cm2c2c0c1c0cm2cm1cm1cm4c1cm1c10c43c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0c0cm1c1c20c4cm5cm4c0c4c6c31cm3cm10c0c4_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c1cm4c1c1c0cm6c1c34c3c16c2c10cm18c8cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm2c1cm1cm2cm34cm7c3cm4cm3c5c74cm9cm3cm55c0c1_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_cm3cm1cm2cm2c64c0c0c1cm3cm8c4cm8c4c0cm7c0_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_c3c5c1cm2c14cm4c0c7c3c4c1c0cm11cm8c0c17_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0cm1c1c2c0c8c2c1cm2cm5c0cm1cm4c12cm3cm13_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1c0c1cm2c1cm3cm1c6cm16c4c14cm19c5c2c3cm8_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1c2c5c2c1c3cm3cm1c2c3cm3c5c1cm1cm6cm4_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_cm1c2c1cm2cm5cm2cm10c0cm2c2c1cm16cm33cm6c3c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0cm4c1c0c3c1c1c1c1cm2cm3cm3cm1cm30cm1cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1cm1cm2c2cm3c1c36cm2cm3c1c1cm2cm4c2c1c0_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c1cm3c1c1cm1c0c2c2c0cm3cm2c15cm3c2c21c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm3c0c1c0cm8cm1cm3cm1cm1c1c0cm36cm1c0c3cm2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c1c5cm1cm2c1cm6c0c6cm7c0c3c5cm1c4c11cm1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c4c1c0c0cm3c3cm2cm4c5c0cm5c0c2c5c7c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c0c0c1cm5cm2c0c1c2c0c0c2c1c10c4c1c4_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1c1cm2cm1cm4cm5c1cm7cm2c3c0c8c5c1c0cm2_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm1cm1cm3cm1c1cm2cm26c5cm6cm2c0c0c2c2c5cm4_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm5cm2c0c0c1c16cm2cm2c0c0cm6c2c3cm3c0c45_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm1c0cm4c1cm1c1c2c0c21c0c6c25c2c0c12cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm2c0c0c2cm1c3cm13cm33cm3c1c0c0c9c1c6cm13_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0cm1cm1c1c1cm3cm1cm14c0cm5cm10c4cm15cm2c6cm6_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm4cm1c0c1cm1cm3cm4c2c2cm3c2c8c3cm8c10c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c3cm1c1cm1cm6cm2c0cm3c4c14c0cm13c1cm1cm8cm4_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0c2cm1cm3c0c0cm113c1c2c0c4c3c1c1cm1c1_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_c2c0c0c0cm1cm1c3c0c22c1c1cm1cm3c4c11cm4_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1cm1cm2cm2cm16cm3c10cm1cm1cm2cm1cm47c11c5c3cm3_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c3cm1c0c5cm3c2c7c0cm1c0cm1c1c1c3cm1cm5_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c4cm2cm1c3c4c1cm6c4c2c1c1cm2cm14c1c0c8_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1c1c3cm2cm2cm3c5cm5cm49c16c4c0cm1cm5c3c2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c1c0c4cm2c1c0cm4c4cm12cm2c0c0c0c4c0cm1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core11_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c2c1cm2c2c0c1c0cm2cm1cm1cm4c1cm1c10c43c1 => x_c2c1cm2c2c0c1c0cm2cm1cm1cm4c1cm1c10c43c1_signal, 
                R_c0c0cm1c1c20c4cm5cm4c0c4c6c31cm3cm10c0c4 => x_c0c0cm1c1c20c4cm5cm4c0c4c6c31cm3cm10c0c4_signal, 
                R_c0c1cm4c1c1c0cm6c1c34c3c16c2c10cm18c8cm1 => x_c0c1cm4c1c1c0cm6c1c34c3c16c2c10cm18c8cm1_signal, 
                R_cm2c1cm1cm2cm34cm7c3cm4cm3c5c74cm9cm3cm55c0c1 => x_cm2c1cm1cm2cm34cm7c3cm4cm3c5c74cm9cm3cm55c0c1_signal, 
                R_cm3cm1cm2cm2c64c0c0c1cm3cm8c4cm8c4c0cm7c0 => x_cm3cm1cm2cm2c64c0c0c1cm3cm8c4cm8c4c0cm7c0_signal, 
                R_c3c5c1cm2c14cm4c0c7c3c4c1c0cm11cm8c0c17 => x_c3c5c1cm2c14cm4c0c7c3c4c1c0cm11cm8c0c17_signal, 
                R_c0cm1c1c2c0c8c2c1cm2cm5c0cm1cm4c12cm3cm13 => x_c0cm1c1c2c0c8c2c1cm2cm5c0cm1cm4c12cm3cm13_signal, 
                R_c1c0c1cm2c1cm3cm1c6cm16c4c14cm19c5c2c3cm8 => x_c1c0c1cm2c1cm3cm1c6cm16c4c14cm19c5c2c3cm8_signal, 
                R_c1c2c5c2c1c3cm3cm1c2c3cm3c5c1cm1cm6cm4 => x_c1c2c5c2c1c3cm3cm1c2c3cm3c5c1cm1cm6cm4_signal, 
                R_cm1c2c1cm2cm5cm2cm10c0cm2c2c1cm16cm33cm6c3c1 => x_cm1c2c1cm2cm5cm2cm10c0cm2c2c1cm16cm33cm6c3c1_signal, 
                R_c0cm4c1c0c3c1c1c1c1cm2cm3cm3cm1cm30cm1cm1 => x_c0cm4c1c0c3c1c1c1c1cm2cm3cm3cm1cm30cm1cm1_signal, 
                R_cm1cm1cm2c2cm3c1c36cm2cm3c1c1cm2cm4c2c1c0 => x_cm1cm1cm2c2cm3c1c36cm2cm3c1c1cm2cm4c2c1c0_signal, 
                R_c1cm3c1c1cm1c0c2c2c0cm3cm2c15cm3c2c21c1 => x_c1cm3c1c1cm1c0c2c2c0cm3cm2c15cm3c2c21c1_signal, 
                R_cm3c0c1c0cm8cm1cm3cm1cm1c1c0cm36cm1c0c3cm2 => x_cm3c0c1c0cm8cm1cm3cm1cm1c1c0cm36cm1c0c3cm2_signal, 
                R_c1c5cm1cm2c1cm6c0c6cm7c0c3c5cm1c4c11cm1 => x_c1c5cm1cm2c1cm6c0c6cm7c0c3c5cm1c4c11cm1_signal, 
                R_c4c1c0c0cm3c3cm2cm4c5c0cm5c0c2c5c7c0 => x_c4c1c0c0cm3c3cm2cm4c5c0cm5c0c2c5c7c0_signal, 
                R_c0c0c1cm5cm2c0c1c2c0c0c2c1c10c4c1c4 => x_c0c0c1cm5cm2c0c1c2c0c0c2c1c10c4c1c4_signal, 
                R_c1c1cm2cm1cm4cm5c1cm7cm2c3c0c8c5c1c0cm2 => x_c1c1cm2cm1cm4cm5c1cm7cm2c3c0c8c5c1c0cm2_signal, 
                R_cm1cm1cm3cm1c1cm2cm26c5cm6cm2c0c0c2c2c5cm4 => x_cm1cm1cm3cm1c1cm2cm26c5cm6cm2c0c0c2c2c5cm4_signal, 
                R_cm5cm2c0c0c1c16cm2cm2c0c0cm6c2c3cm3c0c45 => x_cm5cm2c0c0c1c16cm2cm2c0c0cm6c2c3cm3c0c45_signal, 
                R_cm1c0cm4c1cm1c1c2c0c21c0c6c25c2c0c12cm1 => x_cm1c0cm4c1cm1c1c2c0c21c0c6c25c2c0c12cm1_signal, 
                R_cm2c0c0c2cm1c3cm13cm33cm3c1c0c0c9c1c6cm13 => x_cm2c0c0c2cm1c3cm13cm33cm3c1c0c0c9c1c6cm13_signal, 
                R_c0cm1cm1c1c1cm3cm1cm14c0cm5cm10c4cm15cm2c6cm6 => x_c0cm1cm1c1c1cm3cm1cm14c0cm5cm10c4cm15cm2c6cm6_signal, 
                R_cm4cm1c0c1cm1cm3cm4c2c2cm3c2c8c3cm8c10c0 => x_cm4cm1c0c1cm1cm3cm4c2c2cm3c2c8c3cm8c10c0_signal, 
                R_c3cm1c1cm1cm6cm2c0cm3c4c14c0cm13c1cm1cm8cm4 => x_c3cm1c1cm1cm6cm2c0cm3c4c14c0cm13c1cm1cm8cm4_signal, 
                R_c0c2cm1cm3c0c0cm113c1c2c0c4c3c1c1cm1c1 => x_c0c2cm1cm3c0c0cm113c1c2c0c4c3c1c1cm1c1_signal, 
                R_c2c0c0c0cm1cm1c3c0c22c1c1cm1cm3c4c11cm4 => x_c2c0c0c0cm1cm1c3c0c22c1c1cm1cm3c4c11cm4_signal, 
                R_c1cm1cm2cm2cm16cm3c10cm1cm1cm2cm1cm47c11c5c3cm3 => x_c1cm1cm2cm2cm16cm3c10cm1cm1cm2cm1cm47c11c5c3cm3_signal, 
                R_c3cm1c0c5cm3c2c7c0cm1c0cm1c1c1c3cm1cm5 => x_c3cm1c0c5cm3c2c7c0cm1c0cm1c1c1c3cm1cm5_signal, 
                R_c4cm2cm1c3c4c1cm6c4c2c1c1cm2cm14c1c0c8 => x_c4cm2cm1c3c4c1cm6c4c2c1c1cm2cm14c1c0c8_signal, 
                R_c1c1c3cm2cm2cm3c5cm5cm49c16c4c0cm1cm5c3c2 => x_c1c1c3cm2cm2cm3c5cm5cm49c16c4c0cm1cm5c3c2_signal, 
                R_c1c0c4cm2c1c0cm4c4cm12cm2c0c0c0c4c0cm1 => x_c1c0c4cm2c1c0cm4c4cm12cm2c0c0c0c4c0cm1_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c2c1cm2c2c0c1c0cm2cm1cm1cm4c1cm1c10c43c1_signal;
    yo_2 <= x_c0c0cm1c1c20c4cm5cm4c0c4c6c31cm3cm10c0c4_signal;
    yo_3 <= x_c0c1cm4c1c1c0cm6c1c34c3c16c2c10cm18c8cm1_signal;
    yo_4 <= x_cm2c1cm1cm2cm34cm7c3cm4cm3c5c74cm9cm3cm55c0c1_signal;
    yo_5 <= x_cm3cm1cm2cm2c64c0c0c1cm3cm8c4cm8c4c0cm7c0_signal;
    yo_6 <= x_c3c5c1cm2c14cm4c0c7c3c4c1c0cm11cm8c0c17_signal;
    yo_7 <= x_c0cm1c1c2c0c8c2c1cm2cm5c0cm1cm4c12cm3cm13_signal;
    yo_8 <= x_c1c0c1cm2c1cm3cm1c6cm16c4c14cm19c5c2c3cm8_signal;
    yo_9 <= x_c1c2c5c2c1c3cm3cm1c2c3cm3c5c1cm1cm6cm4_signal;
    yo_10 <= x_cm1c2c1cm2cm5cm2cm10c0cm2c2c1cm16cm33cm6c3c1_signal;
    yo_11 <= x_c0cm4c1c0c3c1c1c1c1cm2cm3cm3cm1cm30cm1cm1_signal;
    yo_12 <= x_cm1cm1cm2c2cm3c1c36cm2cm3c1c1cm2cm4c2c1c0_signal;
    yo_13 <= x_c1cm3c1c1cm1c0c2c2c0cm3cm2c15cm3c2c21c1_signal;
    yo_14 <= x_cm3c0c1c0cm8cm1cm3cm1cm1c1c0cm36cm1c0c3cm2_signal;
    yo_15 <= x_c1c5cm1cm2c1cm6c0c6cm7c0c3c5cm1c4c11cm1_signal;
    yo_16 <= x_c4c1c0c0cm3c3cm2cm4c5c0cm5c0c2c5c7c0_signal;
    yo_17 <= x_c0c0c1cm5cm2c0c1c2c0c0c2c1c10c4c1c4_signal;
    yo_18 <= x_c1c1cm2cm1cm4cm5c1cm7cm2c3c0c8c5c1c0cm2_signal;
    yo_19 <= x_cm1cm1cm3cm1c1cm2cm26c5cm6cm2c0c0c2c2c5cm4_signal;
    yo_20 <= x_cm5cm2c0c0c1c16cm2cm2c0c0cm6c2c3cm3c0c45_signal;
    yo_21 <= x_cm1c0cm4c1cm1c1c2c0c21c0c6c25c2c0c12cm1_signal;
    yo_22 <= x_cm2c0c0c2cm1c3cm13cm33cm3c1c0c0c9c1c6cm13_signal;
    yo_23 <= x_c0cm1cm1c1c1cm3cm1cm14c0cm5cm10c4cm15cm2c6cm6_signal;
    yo_24 <= x_cm4cm1c0c1cm1cm3cm4c2c2cm3c2c8c3cm8c10c0_signal;
    yo_25 <= x_c3cm1c1cm1cm6cm2c0cm3c4c14c0cm13c1cm1cm8cm4_signal;
    yo_26 <= x_c0c2cm1cm3c0c0cm113c1c2c0c4c3c1c1cm1c1_signal;
    yo_27 <= x_c2c0c0c0cm1cm1c3c0c22c1c1cm1cm3c4c11cm4_signal;
    yo_28 <= x_c1cm1cm2cm2cm16cm3c10cm1cm1cm2cm1cm47c11c5c3cm3_signal;
    yo_29 <= x_c3cm1c0c5cm3c2c7c0cm1c0cm1c1c1c3cm1cm5_signal;
    yo_30 <= x_c4cm2cm1c3c4c1cm6c4c2c1c1cm2cm14c1c0c8_signal;
    yo_31 <= x_c1c1c3cm2cm2cm3c5cm5cm49c16c4c0cm1cm5c3c2_signal;
    yo_32 <= x_c1c0c4cm2c1c0cm4c4cm12cm2c0c0c0c4c0cm1_signal;



end structural;