LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core12 is
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
    
        yo_1  : out std_logic_vector(10-1 downto 0);  --	sfix(2, -8)
        yo_2  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_3  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_4  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_5  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_6  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_7  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_8  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_9  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_10  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_11  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_12  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_13  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_14  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_15  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_16  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_17  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_18  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_19  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_20  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_21  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_22  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_23  : out std_logic_vector(15-1 downto 0);  --	sfix(7, -8)
        yo_24  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_25  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_26  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_27  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_28  : out std_logic_vector(13-1 downto 0);  --	sfix(5, -8)
        yo_29  : out std_logic_vector(12-1 downto 0);  --	sfix(4, -8)
        yo_30  : out std_logic_vector(11-1 downto 0);  --	sfix(3, -8)
        yo_31  : out std_logic_vector(14-1 downto 0);  --	sfix(6, -8)
        yo_32  : out std_logic_vector(13-1 downto 0) --	sfix(5, -8)
    );
end conv5_core12;

architecture structural of conv5_core12 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c0cm1c2c2cm1cm2cm2c0cm1c0c2c0c3cm1c1c0_signal : std_logic_vector(10-1 downto 0); --	sfix(2, -8)
    signal  x_c8c4cm25c2c5c5cm14c8cm2cm3cm29c1c4c2c1c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c1c5cm18cm7c7c0c3c10cm1c2cm2c10c0c3cm1c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c2cm1c15cm1c1c2cm18c89c0cm3cm2c52c18cm5cm4cm1_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_c2c1cm13cm8cm3c1c39cm2cm1c0c0cm7cm21c0cm2cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm1cm1cm1c3c1c12cm10c1c2cm5cm15c2cm7c1cm1c19_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm13cm1cm3c1c2cm2cm18c0cm1cm1cm50c0c0c56c4c0_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm4c1cm5c37cm4cm2c0c2c3c1cm1cm14cm1cm1cm1c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c5c1c2c5c22c0cm11c2c16c0c5cm1cm3cm2cm3cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c3c2c3c5cm2cm14cm12c2c0cm26c5cm1cm20c0cm5c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm2cm5cm2cm2c1cm2cm7c41c0cm2c8c23c0cm4c3c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c2cm1c2cm3cm6cm28cm1c1c3cm51c1cm1cm6c3c4c0_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c1c0cm2cm13c0cm2c20c1c0c0cm9cm1cm2c2c12c0_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm4c0c1c10cm1c0cm4cm2cm2cm2c2c5c4c0cm3cm3_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_c28c2c8c2cm8c1c0cm2cm1cm2c0c3cm1c6c16c16_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm5cm18cm14c2c1c3c7c1c1cm2cm5c1c0c1c1c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c5cm2c5cm3c0c2c12cm2c2cm1c10cm1cm86c0cm1cm9_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_cm3cm5c0c26c1cm6c1cm9cm1c2c0c4cm1c1c0cm5_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm7cm5c7c0cm3c4cm5c7cm3c0c4cm2c0cm6cm7c1_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_cm4c0cm1c3c0cm2c6c1c0c0cm5c0cm1c2c0c3_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_cm12c0c34cm24cm7c0cm1cm7cm1cm1cm7c2cm1cm3cm2c1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c1c1cm1c2cm2cm3cm1cm23c2c89c1c19cm4cm1cm7c3_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_cm26cm6c5cm2cm6c0c72c1c7cm1c30cm1cm5cm1c0cm3_signal : std_logic_vector(15-1 downto 0); --	sfix(7, -8)
    signal  x_c0cm1c5c0c1c4cm1cm1cm1cm1c2c2cm25c4c5c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c2cm6c1c10cm5cm5cm1c52c3c3c1c9cm1c4cm3cm1_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_cm3c1c1cm12cm8c4c1cm2cm17cm2c0c1c0cm1cm6cm1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm16c5c1c1cm9c3c3cm9cm23cm2cm4cm22cm1c0c5c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_cm29c0c2c19c1cm1cm1c7c1cm2cm1cm9c2cm2cm1c2_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c3c0c0c4c5cm4c15c1cm2cm2cm7cm2c2c1cm2c1_signal : std_logic_vector(12-1 downto 0); --	sfix(4, -8)
    signal  x_cm3cm4c3c1c4cm1c3c0cm5c1cm2c0c2c0cm2cm4_signal : std_logic_vector(11-1 downto 0); --	sfix(3, -8)
    signal  x_cm40cm6cm2c2cm28c26cm3c0cm37c22c3c0c6c3c0c2_signal : std_logic_vector(14-1 downto 0); --	sfix(6, -8)
    signal  x_c4c4cm16c2c2cm15cm6cm1cm1c1cm17c0cm1c3cm3c1_signal : std_logic_vector(13-1 downto 0); --	sfix(5, -8)
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    signal zeros 	   : std_logic_vector(1 downto 0 );
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(1 downto 0 );
    --signal xi_reg      : std_logic_vector((XI_WIDTH-1) downto 0);

    signal sel_reg     : std_logic_vector(bits(16-1)-1 downto 0);


begin
    zeros <= (others => '0');

    sel_reg <= sel_config;

    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, rst, xi, xi_reg);

    rmcm_block  : entity work.conv5_core12_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
            
                xi,
                --like this: x_wc3c1_signal,
                R_c0cm1c2c2cm1cm2cm2c0cm1c0c2c0c3cm1c1c0 => x_c0cm1c2c2cm1cm2cm2c0cm1c0c2c0c3cm1c1c0_signal, 
                R_c8c4cm25c2c5c5cm14c8cm2cm3cm29c1c4c2c1c2 => x_c8c4cm25c2c5c5cm14c8cm2cm3cm29c1c4c2c1c2_signal, 
                R_c1c5cm18cm7c7c0c3c10cm1c2cm2c10c0c3cm1c0 => x_c1c5cm18cm7c7c0c3c10cm1c2cm2c10c0c3cm1c0_signal, 
                R_c2cm1c15cm1c1c2cm18c89c0cm3cm2c52c18cm5cm4cm1 => x_c2cm1c15cm1c1c2cm18c89c0cm3cm2c52c18cm5cm4cm1_signal, 
                R_c2c1cm13cm8cm3c1c39cm2cm1c0c0cm7cm21c0cm2cm1 => x_c2c1cm13cm8cm3c1c39cm2cm1c0c0cm7cm21c0cm2cm1_signal, 
                R_cm1cm1cm1c3c1c12cm10c1c2cm5cm15c2cm7c1cm1c19 => x_cm1cm1cm1c3c1c12cm10c1c2cm5cm15c2cm7c1cm1c19_signal, 
                R_cm13cm1cm3c1c2cm2cm18c0cm1cm1cm50c0c0c56c4c0 => x_cm13cm1cm3c1c2cm2cm18c0cm1cm1cm50c0c0c56c4c0_signal, 
                R_cm4c1cm5c37cm4cm2c0c2c3c1cm1cm14cm1cm1cm1c1 => x_cm4c1cm5c37cm4cm2c0c2c3c1cm1cm14cm1cm1cm1c1_signal, 
                R_c5c1c2c5c22c0cm11c2c16c0c5cm1cm3cm2cm3cm1 => x_c5c1c2c5c22c0cm11c2c16c0c5cm1cm3cm2cm3cm1_signal, 
                R_c3c2c3c5cm2cm14cm12c2c0cm26c5cm1cm20c0cm5c2 => x_c3c2c3c5cm2cm14cm12c2c0cm26c5cm1cm20c0cm5c2_signal, 
                R_cm2cm5cm2cm2c1cm2cm7c41c0cm2c8c23c0cm4c3c1 => x_cm2cm5cm2cm2c1cm2cm7c41c0cm2c8c23c0cm4c3c1_signal, 
                R_c2cm1c2cm3cm6cm28cm1c1c3cm51c1cm1cm6c3c4c0 => x_c2cm1c2cm3cm6cm28cm1c1c3cm51c1cm1cm6c3c4c0_signal, 
                R_c1c0cm2cm13c0cm2c20c1c0c0cm9cm1cm2c2c12c0 => x_c1c0cm2cm13c0cm2c20c1c0c0cm9cm1cm2c2c12c0_signal, 
                R_cm4c0c1c10cm1c0cm4cm2cm2cm2c2c5c4c0cm3cm3 => x_cm4c0c1c10cm1c0cm4cm2cm2cm2c2c5c4c0cm3cm3_signal, 
                R_c28c2c8c2cm8c1c0cm2cm1cm2c0c3cm1c6c16c16 => x_c28c2c8c2cm8c1c0cm2cm1cm2c0c3cm1c6c16c16_signal, 
                R_cm5cm18cm14c2c1c3c7c1c1cm2cm5c1c0c1c1c2 => x_cm5cm18cm14c2c1c3c7c1c1cm2cm5c1c0c1c1c2_signal, 
                R_c5cm2c5cm3c0c2c12cm2c2cm1c10cm1cm86c0cm1cm9 => x_c5cm2c5cm3c0c2c12cm2c2cm1c10cm1cm86c0cm1cm9_signal, 
                R_cm3cm5c0c26c1cm6c1cm9cm1c2c0c4cm1c1c0cm5 => x_cm3cm5c0c26c1cm6c1cm9cm1c2c0c4cm1c1c0cm5_signal, 
                R_cm7cm5c7c0cm3c4cm5c7cm3c0c4cm2c0cm6cm7c1 => x_cm7cm5c7c0cm3c4cm5c7cm3c0c4cm2c0cm6cm7c1_signal, 
                R_cm4c0cm1c3c0cm2c6c1c0c0cm5c0cm1c2c0c3 => x_cm4c0cm1c3c0cm2c6c1c0c0cm5c0cm1c2c0c3_signal, 
                R_cm12c0c34cm24cm7c0cm1cm7cm1cm1cm7c2cm1cm3cm2c1 => x_cm12c0c34cm24cm7c0cm1cm7cm1cm1cm7c2cm1cm3cm2c1_signal, 
                R_c1c1cm1c2cm2cm3cm1cm23c2c89c1c19cm4cm1cm7c3 => x_c1c1cm1c2cm2cm3cm1cm23c2c89c1c19cm4cm1cm7c3_signal, 
                R_cm26cm6c5cm2cm6c0c72c1c7cm1c30cm1cm5cm1c0cm3 => x_cm26cm6c5cm2cm6c0c72c1c7cm1c30cm1cm5cm1c0cm3_signal, 
                R_c0cm1c5c0c1c4cm1cm1cm1cm1c2c2cm25c4c5c1 => x_c0cm1c5c0c1c4cm1cm1cm1cm1c2c2cm25c4c5c1_signal, 
                R_c2cm6c1c10cm5cm5cm1c52c3c3c1c9cm1c4cm3cm1 => x_c2cm6c1c10cm5cm5cm1c52c3c3c1c9cm1c4cm3cm1_signal, 
                R_cm3c1c1cm12cm8c4c1cm2cm17cm2c0c1c0cm1cm6cm1 => x_cm3c1c1cm12cm8c4c1cm2cm17cm2c0c1c0cm1cm6cm1_signal, 
                R_cm16c5c1c1cm9c3c3cm9cm23cm2cm4cm22cm1c0c5c1 => x_cm16c5c1c1cm9c3c3cm9cm23cm2cm4cm22cm1c0c5c1_signal, 
                R_cm29c0c2c19c1cm1cm1c7c1cm2cm1cm9c2cm2cm1c2 => x_cm29c0c2c19c1cm1cm1c7c1cm2cm1cm9c2cm2cm1c2_signal, 
                R_c3c0c0c4c5cm4c15c1cm2cm2cm7cm2c2c1cm2c1 => x_c3c0c0c4c5cm4c15c1cm2cm2cm7cm2c2c1cm2c1_signal, 
                R_cm3cm4c3c1c4cm1c3c0cm5c1cm2c0c2c0cm2cm4 => x_cm3cm4c3c1c4cm1c3c0cm5c1cm2c0c2c0cm2cm4_signal, 
                R_cm40cm6cm2c2cm28c26cm3c0cm37c22c3c0c6c3c0c2 => x_cm40cm6cm2c2cm28c26cm3c0cm37c22c3c0c6c3c0c2_signal, 
                R_c4c4cm16c2c2cm15cm6cm1cm1c1cm17c0cm1c3cm3c1 => x_c4c4cm16c2c2cm15cm6cm1cm1c1cm17c0cm1c3cm3c1_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros; -- YES THIS IS NEEDED! DO NOT DELETE!!! FloPoCo does not generate this coefficient! So we keep it here so it is there when needed.
    yo_1 <= x_c0cm1c2c2cm1cm2cm2c0cm1c0c2c0c3cm1c1c0_signal;
    yo_2 <= x_c8c4cm25c2c5c5cm14c8cm2cm3cm29c1c4c2c1c2_signal;
    yo_3 <= x_c1c5cm18cm7c7c0c3c10cm1c2cm2c10c0c3cm1c0_signal;
    yo_4 <= x_c2cm1c15cm1c1c2cm18c89c0cm3cm2c52c18cm5cm4cm1_signal;
    yo_5 <= x_c2c1cm13cm8cm3c1c39cm2cm1c0c0cm7cm21c0cm2cm1_signal;
    yo_6 <= x_cm1cm1cm1c3c1c12cm10c1c2cm5cm15c2cm7c1cm1c19_signal;
    yo_7 <= x_cm13cm1cm3c1c2cm2cm18c0cm1cm1cm50c0c0c56c4c0_signal;
    yo_8 <= x_cm4c1cm5c37cm4cm2c0c2c3c1cm1cm14cm1cm1cm1c1_signal;
    yo_9 <= x_c5c1c2c5c22c0cm11c2c16c0c5cm1cm3cm2cm3cm1_signal;
    yo_10 <= x_c3c2c3c5cm2cm14cm12c2c0cm26c5cm1cm20c0cm5c2_signal;
    yo_11 <= x_cm2cm5cm2cm2c1cm2cm7c41c0cm2c8c23c0cm4c3c1_signal;
    yo_12 <= x_c2cm1c2cm3cm6cm28cm1c1c3cm51c1cm1cm6c3c4c0_signal;
    yo_13 <= x_c1c0cm2cm13c0cm2c20c1c0c0cm9cm1cm2c2c12c0_signal;
    yo_14 <= x_cm4c0c1c10cm1c0cm4cm2cm2cm2c2c5c4c0cm3cm3_signal;
    yo_15 <= x_c28c2c8c2cm8c1c0cm2cm1cm2c0c3cm1c6c16c16_signal;
    yo_16 <= x_cm5cm18cm14c2c1c3c7c1c1cm2cm5c1c0c1c1c2_signal;
    yo_17 <= x_c5cm2c5cm3c0c2c12cm2c2cm1c10cm1cm86c0cm1cm9_signal;
    yo_18 <= x_cm3cm5c0c26c1cm6c1cm9cm1c2c0c4cm1c1c0cm5_signal;
    yo_19 <= x_cm7cm5c7c0cm3c4cm5c7cm3c0c4cm2c0cm6cm7c1_signal;
    yo_20 <= x_cm4c0cm1c3c0cm2c6c1c0c0cm5c0cm1c2c0c3_signal;
    yo_21 <= x_cm12c0c34cm24cm7c0cm1cm7cm1cm1cm7c2cm1cm3cm2c1_signal;
    yo_22 <= x_c1c1cm1c2cm2cm3cm1cm23c2c89c1c19cm4cm1cm7c3_signal;
    yo_23 <= x_cm26cm6c5cm2cm6c0c72c1c7cm1c30cm1cm5cm1c0cm3_signal;
    yo_24 <= x_c0cm1c5c0c1c4cm1cm1cm1cm1c2c2cm25c4c5c1_signal;
    yo_25 <= x_c2cm6c1c10cm5cm5cm1c52c3c3c1c9cm1c4cm3cm1_signal;
    yo_26 <= x_cm3c1c1cm12cm8c4c1cm2cm17cm2c0c1c0cm1cm6cm1_signal;
    yo_27 <= x_cm16c5c1c1cm9c3c3cm9cm23cm2cm4cm22cm1c0c5c1_signal;
    yo_28 <= x_cm29c0c2c19c1cm1cm1c7c1cm2cm1cm9c2cm2cm1c2_signal;
    yo_29 <= x_c3c0c0c4c5cm4c15c1cm2cm2cm7cm2c2c1cm2c1_signal;
    yo_30 <= x_cm3cm4c3c1c4cm1c3c0cm5c1cm2c0c2c0cm2cm4_signal;
    yo_31 <= x_cm40cm6cm2c2cm28c26cm3c0cm37c22c3c0c6c3c0c2_signal;
    yo_32 <= x_c4c4cm16c2c2cm15cm6cm1cm1c1cm17c0cm1c3cm3c1_signal;



end structural;