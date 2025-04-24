LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core13 is
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
        yo_2  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_3  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_4  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_5  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_7  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_8  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_9  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_11  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_12  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_14  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_15  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_17  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_18  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_19  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_20  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_21  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_22  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_23  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_25  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_26  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_28  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_29  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_30  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_31  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_32  : out std_logic_vector(12-1 downto 0) --	sfix(4, -8)
    );
end conv5_core13;

architecture structural of conv5_core13 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm6c5c7cm2cm7cm2c5c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c32c5c1cm10cm1cm24c4cm17c0c0c0c0c0c0c0c0_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c5c4cm22c6cm4c0cm14c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1cm1cm15c15c2cm6cm5c14c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm4c1c3cm2c5c1cm14c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c10cm14c0cm2c0cm29cm8c12c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c2c3cm7cm2cm2cm1cm13c2c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm3cm2c1cm3c0cm10cm1c2c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm14cm2cm5c0c7c0cm6cm21c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm28cm1cm2c1cm16cm9c5c1c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c3cm7cm3cm6cm1cm2c5cm14c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm21c4cm3c4c0cm4c3c6c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c6cm17cm25c1cm3cm2c10c1c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c6cm1c17c0c0c1cm6cm1c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c4cm6cm9c5c0cm9c6c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm20c2cm5cm14cm2cm2cm15cm5c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c13cm6c0c8c2cm2c2c1c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1c4cm3cm6cm6cm2c3c3c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c0c15cm17c31cm4cm2c5c2c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c7cm1c17c3c1c0c17cm4c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c0cm9c0c3c0cm16cm2c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c4c7c6c2c12cm7cm1cm29c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c3c0cm4cm11cm4cm2cm15c1c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c7c11c11c7cm2c4c18c8c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c7cm1c2c0cm6c14c4c9c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1cm4cm1c4c2c4cm1cm3c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c0cm2cm12c16c7c16c18cm2c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm2cm4c12c0cm9c12c5cm2c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c8c4cm2cm6cm15c21c5cm10c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm6c1c11cm3cm2cm4cm7c13c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm4cm8c3c13cm3cm4c5c5c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1c1cm3c2c1c13cm9cm2c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core13_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_cm6c5c7cm2cm7cm2c5c0c0c0c0c0c0c0c0c0 => x_cm6c5c7cm2cm7cm2c5c0c0c0c0c0c0c0c0c0_signal, 
                R_c32c5c1cm10cm1cm24c4cm17c0c0c0c0c0c0c0c0 => x_c32c5c1cm10cm1cm24c4cm17c0c0c0c0c0c0c0c0_signal, 
                R_c5c4cm22c6cm4c0cm14c0c0c0c0c0c0c0c0c0 => x_c5c4cm22c6cm4c0cm14c0c0c0c0c0c0c0c0c0_signal, 
                R_cm1cm1cm15c15c2cm6cm5c14c0c0c0c0c0c0c0c0 => x_cm1cm1cm15c15c2cm6cm5c14c0c0c0c0c0c0c0c0_signal, 
                R_cm4c1c3cm2c5c1cm14c0c0c0c0c0c0c0c0c0 => x_cm4c1c3cm2c5c1cm14c0c0c0c0c0c0c0c0c0_signal, 
                R_c10cm14c0cm2c0cm29cm8c12c0c0c0c0c0c0c0c0 => x_c10cm14c0cm2c0cm29cm8c12c0c0c0c0c0c0c0c0_signal, 
                R_c2c3cm7cm2cm2cm1cm13c2c0c0c0c0c0c0c0c0 => x_c2c3cm7cm2cm2cm1cm13c2c0c0c0c0c0c0c0c0_signal, 
                R_cm3cm2c1cm3c0cm10cm1c2c0c0c0c0c0c0c0c0 => x_cm3cm2c1cm3c0cm10cm1c2c0c0c0c0c0c0c0c0_signal, 
                R_cm14cm2cm5c0c7c0cm6cm21c0c0c0c0c0c0c0c0 => x_cm14cm2cm5c0c7c0cm6cm21c0c0c0c0c0c0c0c0_signal, 
                R_cm28cm1cm2c1cm16cm9c5c1c0c0c0c0c0c0c0c0 => x_cm28cm1cm2c1cm16cm9c5c1c0c0c0c0c0c0c0c0_signal, 
                R_c3cm7cm3cm6cm1cm2c5cm14c0c0c0c0c0c0c0c0 => x_c3cm7cm3cm6cm1cm2c5cm14c0c0c0c0c0c0c0c0_signal, 
                R_cm21c4cm3c4c0cm4c3c6c0c0c0c0c0c0c0c0 => x_cm21c4cm3c4c0cm4c3c6c0c0c0c0c0c0c0c0_signal, 
                R_c6cm17cm25c1cm3cm2c10c1c0c0c0c0c0c0c0c0 => x_c6cm17cm25c1cm3cm2c10c1c0c0c0c0c0c0c0c0_signal, 
                R_c6cm1c17c0c0c1cm6cm1c0c0c0c0c0c0c0c0 => x_c6cm1c17c0c0c1cm6cm1c0c0c0c0c0c0c0c0_signal, 
                R_c4cm6cm9c5c0cm9c6c0c0c0c0c0c0c0c0c0 => x_c4cm6cm9c5c0cm9c6c0c0c0c0c0c0c0c0c0_signal, 
                R_cm20c2cm5cm14cm2cm2cm15cm5c0c0c0c0c0c0c0c0 => x_cm20c2cm5cm14cm2cm2cm15cm5c0c0c0c0c0c0c0c0_signal, 
                R_c13cm6c0c8c2cm2c2c1c0c0c0c0c0c0c0c0 => x_c13cm6c0c8c2cm2c2c1c0c0c0c0c0c0c0c0_signal, 
                R_c1c4cm3cm6cm6cm2c3c3c0c0c0c0c0c0c0c0 => x_c1c4cm3cm6cm6cm2c3c3c0c0c0c0c0c0c0c0_signal, 
                R_c0c15cm17c31cm4cm2c5c2c0c0c0c0c0c0c0c0 => x_c0c15cm17c31cm4cm2c5c2c0c0c0c0c0c0c0c0_signal, 
                R_c7cm1c17c3c1c0c17cm4c0c0c0c0c0c0c0c0 => x_c7cm1c17c3c1c0c17cm4c0c0c0c0c0c0c0c0_signal, 
                R_c0c0cm9c0c3c0cm16cm2c0c0c0c0c0c0c0c0 => x_c0c0cm9c0c3c0cm16cm2c0c0c0c0c0c0c0c0_signal, 
                R_c4c7c6c2c12cm7cm1cm29c0c0c0c0c0c0c0c0 => x_c4c7c6c2c12cm7cm1cm29c0c0c0c0c0c0c0c0_signal, 
                R_c3c0cm4cm11cm4cm2cm15c1c0c0c0c0c0c0c0c0 => x_c3c0cm4cm11cm4cm2cm15c1c0c0c0c0c0c0c0c0_signal, 
                R_c7c11c11c7cm2c4c18c8c0c0c0c0c0c0c0c0 => x_c7c11c11c7cm2c4c18c8c0c0c0c0c0c0c0c0_signal, 
                R_c7cm1c2c0cm6c14c4c9c0c0c0c0c0c0c0c0 => x_c7cm1c2c0cm6c14c4c9c0c0c0c0c0c0c0c0_signal, 
                R_c1cm4cm1c4c2c4cm1cm3c0c0c0c0c0c0c0c0 => x_c1cm4cm1c4c2c4cm1cm3c0c0c0c0c0c0c0c0_signal, 
                R_c0cm2cm12c16c7c16c18cm2c0c0c0c0c0c0c0c0 => x_c0cm2cm12c16c7c16c18cm2c0c0c0c0c0c0c0c0_signal, 
                R_cm2cm4c12c0cm9c12c5cm2c0c0c0c0c0c0c0c0 => x_cm2cm4c12c0cm9c12c5cm2c0c0c0c0c0c0c0c0_signal, 
                R_c8c4cm2cm6cm15c21c5cm10c0c0c0c0c0c0c0c0 => x_c8c4cm2cm6cm15c21c5cm10c0c0c0c0c0c0c0c0_signal, 
                R_cm6c1c11cm3cm2cm4cm7c13c0c0c0c0c0c0c0c0 => x_cm6c1c11cm3cm2cm4cm7c13c0c0c0c0c0c0c0c0_signal, 
                R_cm4cm8c3c13cm3cm4c5c5c0c0c0c0c0c0c0c0 => x_cm4cm8c3c13cm3cm4c5c5c0c0c0c0c0c0c0c0_signal, 
                R_c1c1cm3c2c1c13cm9cm2c0c0c0c0c0c0c0c0 => x_c1c1cm3c2c1c13cm9cm2c0c0c0c0c0c0c0c0_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_cm6c5c7cm2cm7cm2c5c0c0c0c0c0c0c0c0c0_signal;
    yo_2 <= x_c32c5c1cm10cm1cm24c4cm17c0c0c0c0c0c0c0c0_signal;
    yo_3 <= x_c5c4cm22c6cm4c0cm14c0c0c0c0c0c0c0c0c0_signal;
    yo_4 <= x_cm1cm1cm15c15c2cm6cm5c14c0c0c0c0c0c0c0c0_signal;
    yo_5 <= x_cm4c1c3cm2c5c1cm14c0c0c0c0c0c0c0c0c0_signal;
    yo_6 <= x_c10cm14c0cm2c0cm29cm8c12c0c0c0c0c0c0c0c0_signal;
    yo_7 <= x_c2c3cm7cm2cm2cm1cm13c2c0c0c0c0c0c0c0c0_signal;
    yo_8 <= x_cm3cm2c1cm3c0cm10cm1c2c0c0c0c0c0c0c0c0_signal;
    yo_9 <= x_cm14cm2cm5c0c7c0cm6cm21c0c0c0c0c0c0c0c0_signal;
    yo_10 <= x_cm28cm1cm2c1cm16cm9c5c1c0c0c0c0c0c0c0c0_signal;
    yo_11 <= x_c3cm7cm3cm6cm1cm2c5cm14c0c0c0c0c0c0c0c0_signal;
    yo_12 <= x_cm21c4cm3c4c0cm4c3c6c0c0c0c0c0c0c0c0_signal;
    yo_13 <= x_c6cm17cm25c1cm3cm2c10c1c0c0c0c0c0c0c0c0_signal;
    yo_14 <= x_c6cm1c17c0c0c1cm6cm1c0c0c0c0c0c0c0c0_signal;
    yo_15 <= x_c4cm6cm9c5c0cm9c6c0c0c0c0c0c0c0c0c0_signal;
    yo_16 <= x_cm20c2cm5cm14cm2cm2cm15cm5c0c0c0c0c0c0c0c0_signal;
    yo_17 <= x_c13cm6c0c8c2cm2c2c1c0c0c0c0c0c0c0c0_signal;
    yo_18 <= x_c1c4cm3cm6cm6cm2c3c3c0c0c0c0c0c0c0c0_signal;
    yo_19 <= x_c0c15cm17c31cm4cm2c5c2c0c0c0c0c0c0c0c0_signal;
    yo_20 <= x_c7cm1c17c3c1c0c17cm4c0c0c0c0c0c0c0c0_signal;
    yo_21 <= x_c0c0cm9c0c3c0cm16cm2c0c0c0c0c0c0c0c0_signal;
    yo_22 <= x_c4c7c6c2c12cm7cm1cm29c0c0c0c0c0c0c0c0_signal;
    yo_23 <= x_c3c0cm4cm11cm4cm2cm15c1c0c0c0c0c0c0c0c0_signal;
    yo_24 <= x_c7c11c11c7cm2c4c18c8c0c0c0c0c0c0c0c0_signal;
    yo_25 <= x_c7cm1c2c0cm6c14c4c9c0c0c0c0c0c0c0c0_signal;
    yo_26 <= x_c1cm4cm1c4c2c4cm1cm3c0c0c0c0c0c0c0c0_signal;
    yo_27 <= x_c0cm2cm12c16c7c16c18cm2c0c0c0c0c0c0c0c0_signal;
    yo_28 <= x_cm2cm4c12c0cm9c12c5cm2c0c0c0c0c0c0c0c0_signal;
    yo_29 <= x_c8c4cm2cm6cm15c21c5cm10c0c0c0c0c0c0c0c0_signal;
    yo_30 <= x_cm6c1c11cm3cm2cm4cm7c13c0c0c0c0c0c0c0c0_signal;
    yo_31 <= x_cm4cm8c3c13cm3cm4c5c5c0c0c0c0c0c0c0c0_signal;
    yo_32 <= x_c1c1cm3c2c1c13cm9cm2c0c0c0c0c0c0c0c0_signal;



end structural;