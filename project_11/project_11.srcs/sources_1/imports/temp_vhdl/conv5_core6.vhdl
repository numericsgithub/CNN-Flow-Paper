LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core6 is
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
        yo_4  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_6  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_7  : out std_logic_vector(10-1 downto 0);  --	sfix(2, -8)
        yo_8  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_9  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_11  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_12  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_13  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_14  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_15  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_17  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_18  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_19  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_20  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_21  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_22  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_23  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_24  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_26  : out std_logic_vector(10-1 downto 0);  --	sfix(2, -8)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_28  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_29  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_30  : out std_logic_vector(10-1 downto 0);  --	sfix(2, -8)
        yo_31  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_32  : out std_logic_vector(12-1 downto 0) --	sfix(4, -8)
    );
end conv5_core6;

architecture structural of conv5_core6 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c0c1c5c2c2c1c1c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c1c2cm3c19c0c3c8cm10c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm20cm2c11c9cm1cm8cm5c72c0c0c0c0c0c0c0c0_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_cm2cm6c28cm3c4cm24c43cm6c0c0c0c0c0c0c0c0_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm2cm12c1cm2cm1cm10c54cm5c0c0c0c0c0c0c0c0_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm2c3cm7c6c0c5cm6cm4c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_cm1cm2cm2c0cm2cm4c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(10-1 downto 0); --	sfix(2, -8)
    signal  x_cm15c6c15cm1cm23c2cm15c5c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm1c2cm3c2c7c4c4c4c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_cm6c12cm3cm29c0c3c10c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1c1c2c1c0cm1cm8c3c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c0c5cm1c0c2c1cm2c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c0cm1c4c4c0c2cm1c14c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0cm1c0c57c0c0c0c15c0c0c0c0c0c0c0c0_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c3c2cm2cm1c3c6cm3cm5c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_cm2cm2c5c1c0c1c17c4c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c0c5cm5c1c2c8c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c1c1c0cm10c1cm1c1cm7c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm9c1c0c2cm16cm2c2c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c2c1cm1c4cm3cm1cm5c2c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c14c0c10cm20c5cm1c1c2c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c3c3c1cm2c2cm7cm1cm21c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c13c7cm14cm1cm23c0c8c2c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1cm5c4cm3cm4c1c7cm1c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c4c33c2c7c3c1c0c18c0c0c0c0c0c0c0c0_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c0c0c3c3c1cm1c2cm2c0c0c0c0c0c0c0c0_signal : std_logic_vector(10-1 downto 0); --	sfix(2, -8)
    signal  x_c13c1c1cm2c17c1cm4c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm26cm1c2c50c2c4c1cm1c0c0c0c0c0c0c0c0_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c2c0cm1c2c2c4cm3c3c0c0c0c0c0c0c0c0_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_c2c0c2cm1c0c0c2c2c0c0c0c0c0c0c0c0_signal : std_logic_vector(10-1 downto 0); --	sfix(2, -8)
    signal  x_cm7c2c5c0cm18cm2cm4cm1c0c0c0c0c0c0c0c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm12cm2c4c1cm13c0cm8c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core6_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c0c1c5c2c2c1c1c0c0c0c0c0c0c0c0c0 => x_c0c1c5c2c2c1c1c0c0c0c0c0c0c0c0c0_signal, 
                R_c1c2cm3c19c0c3c8cm10c0c0c0c0c0c0c0c0 => x_c1c2cm3c19c0c3c8cm10c0c0c0c0c0c0c0c0_signal, 
                R_cm20cm2c11c9cm1cm8cm5c72c0c0c0c0c0c0c0c0 => x_cm20cm2c11c9cm1cm8cm5c72c0c0c0c0c0c0c0c0_signal, 
                R_cm2cm6c28cm3c4cm24c43cm6c0c0c0c0c0c0c0c0 => x_cm2cm6c28cm3c4cm24c43cm6c0c0c0c0c0c0c0c0_signal, 
                R_cm2cm12c1cm2cm1cm10c54cm5c0c0c0c0c0c0c0c0 => x_cm2cm12c1cm2cm1cm10c54cm5c0c0c0c0c0c0c0c0_signal, 
                R_cm2c3cm7c6c0c5cm6cm4c0c0c0c0c0c0c0c0 => x_cm2c3cm7c6c0c5cm6cm4c0c0c0c0c0c0c0c0_signal, 
                R_cm1cm2cm2c0cm2cm4c0c0c0c0c0c0c0c0c0c0 => x_cm1cm2cm2c0cm2cm4c0c0c0c0c0c0c0c0c0c0_signal, 
                R_cm15c6c15cm1cm23c2cm15c5c0c0c0c0c0c0c0c0 => x_cm15c6c15cm1cm23c2cm15c5c0c0c0c0c0c0c0c0_signal, 
                R_cm1c2cm3c2c7c4c4c4c0c0c0c0c0c0c0c0 => x_cm1c2cm3c2c7c4c4c4c0c0c0c0c0c0c0c0_signal, 
                R_cm6c12cm3cm29c0c3c10c0c0c0c0c0c0c0c0c0 => x_cm6c12cm3cm29c0c3c10c0c0c0c0c0c0c0c0c0_signal, 
                R_c1c1c2c1c0cm1cm8c3c0c0c0c0c0c0c0c0 => x_c1c1c2c1c0cm1cm8c3c0c0c0c0c0c0c0c0_signal, 
                R_c0c5cm1c0c2c1cm2c0c0c0c0c0c0c0c0c0 => x_c0c5cm1c0c2c1cm2c0c0c0c0c0c0c0c0c0_signal, 
                R_c0cm1c4c4c0c2cm1c14c0c0c0c0c0c0c0c0 => x_c0cm1c4c4c0c2cm1c14c0c0c0c0c0c0c0c0_signal, 
                R_c0cm1c0c57c0c0c0c15c0c0c0c0c0c0c0c0 => x_c0cm1c0c57c0c0c0c15c0c0c0c0c0c0c0c0_signal, 
                R_c3c2cm2cm1c3c6cm3cm5c0c0c0c0c0c0c0c0 => x_c3c2cm2cm1c3c6cm3cm5c0c0c0c0c0c0c0c0_signal, 
                R_cm2cm2c5c1c0c1c17c4c0c0c0c0c0c0c0c0 => x_cm2cm2c5c1c0c1c17c4c0c0c0c0c0c0c0c0_signal, 
                R_c0c0c5cm5c1c2c8c0c0c0c0c0c0c0c0c0 => x_c0c0c5cm5c1c2c8c0c0c0c0c0c0c0c0c0_signal, 
                R_c1c1c0cm10c1cm1c1cm7c0c0c0c0c0c0c0c0 => x_c1c1c0cm10c1cm1c1cm7c0c0c0c0c0c0c0c0_signal, 
                R_cm9c1c0c2cm16cm2c2c0c0c0c0c0c0c0c0c0 => x_cm9c1c0c2cm16cm2c2c0c0c0c0c0c0c0c0c0_signal, 
                R_c2c1cm1c4cm3cm1cm5c2c0c0c0c0c0c0c0c0 => x_c2c1cm1c4cm3cm1cm5c2c0c0c0c0c0c0c0c0_signal, 
                R_c14c0c10cm20c5cm1c1c2c0c0c0c0c0c0c0c0 => x_c14c0c10cm20c5cm1c1c2c0c0c0c0c0c0c0c0_signal, 
                R_c3c3c1cm2c2cm7cm1cm21c0c0c0c0c0c0c0c0 => x_c3c3c1cm2c2cm7cm1cm21c0c0c0c0c0c0c0c0_signal, 
                R_c13c7cm14cm1cm23c0c8c2c0c0c0c0c0c0c0c0 => x_c13c7cm14cm1cm23c0c8c2c0c0c0c0c0c0c0c0_signal, 
                R_c1cm5c4cm3cm4c1c7cm1c0c0c0c0c0c0c0c0 => x_c1cm5c4cm3cm4c1c7cm1c0c0c0c0c0c0c0c0_signal, 
                R_c4c33c2c7c3c1c0c18c0c0c0c0c0c0c0c0 => x_c4c33c2c7c3c1c0c18c0c0c0c0c0c0c0c0_signal, 
                R_c0c0c3c3c1cm1c2cm2c0c0c0c0c0c0c0c0 => x_c0c0c3c3c1cm1c2cm2c0c0c0c0c0c0c0c0_signal, 
                R_c13c1c1cm2c17c1cm4c0c0c0c0c0c0c0c0c0 => x_c13c1c1cm2c17c1cm4c0c0c0c0c0c0c0c0c0_signal, 
                R_cm26cm1c2c50c2c4c1cm1c0c0c0c0c0c0c0c0 => x_cm26cm1c2c50c2c4c1cm1c0c0c0c0c0c0c0c0_signal, 
                R_c2c0cm1c2c2c4cm3c3c0c0c0c0c0c0c0c0 => x_c2c0cm1c2c2c4cm3c3c0c0c0c0c0c0c0c0_signal, 
                R_c2c0c2cm1c0c0c2c2c0c0c0c0c0c0c0c0 => x_c2c0c2cm1c0c0c2c2c0c0c0c0c0c0c0c0_signal, 
                R_cm7c2c5c0cm18cm2cm4cm1c0c0c0c0c0c0c0c0 => x_cm7c2c5c0cm18cm2cm4cm1c0c0c0c0c0c0c0c0_signal, 
                R_cm12cm2c4c1cm13c0cm8c0c0c0c0c0c0c0c0c0 => x_cm12cm2c4c1cm13c0cm8c0c0c0c0c0c0c0c0c0_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c0c1c5c2c2c1c1c0c0c0c0c0c0c0c0c0_signal;
    yo_2 <= x_c1c2cm3c19c0c3c8cm10c0c0c0c0c0c0c0c0_signal;
    yo_3 <= x_cm20cm2c11c9cm1cm8cm5c72c0c0c0c0c0c0c0c0_signal;
    yo_4 <= x_cm2cm6c28cm3c4cm24c43cm6c0c0c0c0c0c0c0c0_signal;
    yo_5 <= x_cm2cm12c1cm2cm1cm10c54cm5c0c0c0c0c0c0c0c0_signal;
    yo_6 <= x_cm2c3cm7c6c0c5cm6cm4c0c0c0c0c0c0c0c0_signal;
    yo_7 <= x_cm1cm2cm2c0cm2cm4c0c0c0c0c0c0c0c0c0c0_signal;
    yo_8 <= x_cm15c6c15cm1cm23c2cm15c5c0c0c0c0c0c0c0c0_signal;
    yo_9 <= x_cm1c2cm3c2c7c4c4c4c0c0c0c0c0c0c0c0_signal;
    yo_10 <= x_cm6c12cm3cm29c0c3c10c0c0c0c0c0c0c0c0c0_signal;
    yo_11 <= x_c1c1c2c1c0cm1cm8c3c0c0c0c0c0c0c0c0_signal;
    yo_12 <= x_c0c5cm1c0c2c1cm2c0c0c0c0c0c0c0c0c0_signal;
    yo_13 <= x_c0cm1c4c4c0c2cm1c14c0c0c0c0c0c0c0c0_signal;
    yo_14 <= x_c0cm1c0c57c0c0c0c15c0c0c0c0c0c0c0c0_signal;
    yo_15 <= x_c3c2cm2cm1c3c6cm3cm5c0c0c0c0c0c0c0c0_signal;
    yo_16 <= x_cm2cm2c5c1c0c1c17c4c0c0c0c0c0c0c0c0_signal;
    yo_17 <= x_c0c0c5cm5c1c2c8c0c0c0c0c0c0c0c0c0_signal;
    yo_18 <= x_c1c1c0cm10c1cm1c1cm7c0c0c0c0c0c0c0c0_signal;
    yo_19 <= x_cm9c1c0c2cm16cm2c2c0c0c0c0c0c0c0c0c0_signal;
    yo_20 <= x_c2c1cm1c4cm3cm1cm5c2c0c0c0c0c0c0c0c0_signal;
    yo_21 <= x_c14c0c10cm20c5cm1c1c2c0c0c0c0c0c0c0c0_signal;
    yo_22 <= x_c3c3c1cm2c2cm7cm1cm21c0c0c0c0c0c0c0c0_signal;
    yo_23 <= x_c13c7cm14cm1cm23c0c8c2c0c0c0c0c0c0c0c0_signal;
    yo_24 <= x_c1cm5c4cm3cm4c1c7cm1c0c0c0c0c0c0c0c0_signal;
    yo_25 <= x_c4c33c2c7c3c1c0c18c0c0c0c0c0c0c0c0_signal;
    yo_26 <= x_c0c0c3c3c1cm1c2cm2c0c0c0c0c0c0c0c0_signal;
    yo_27 <= x_c13c1c1cm2c17c1cm4c0c0c0c0c0c0c0c0c0_signal;
    yo_28 <= x_cm26cm1c2c50c2c4c1cm1c0c0c0c0c0c0c0c0_signal;
    yo_29 <= x_c2c0cm1c2c2c4cm3c3c0c0c0c0c0c0c0c0_signal;
    yo_30 <= x_c2c0c2cm1c0c0c2c2c0c0c0c0c0c0c0c0_signal;
    yo_31 <= x_cm7c2c5c0cm18cm2cm4cm1c0c0c0c0c0c0c0c0_signal;
    yo_32 <= x_cm12cm2c4c1cm13c0cm8c0c0c0c0c0c0c0c0c0_signal;



end structural;