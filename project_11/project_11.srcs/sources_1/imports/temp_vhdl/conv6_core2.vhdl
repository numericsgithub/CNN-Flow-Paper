LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv6_settings.all;

entity conv6_core2 is
    generic
    (
        PIPELINE_STEPS             : natural := 0
    );
    port
    (
        clk   : in std_logic;
        reset : in std_logic;

        xi    : in XI_TYPE;









    
        sel_config: in SEL_CONFIGURATIONS_TYPE;
        sel_1, sel_2, sel_3 : in std_logic;




    
        kpu_1_input_1 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_2 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_3 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_4 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_5 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_6 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_7 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_8 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_9 : out std_logic_vector(12-1 downto 0)  --	sfix(4, -8)
    );
end conv6_core2;

architecture structural of conv6_core2 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1_signal : std_logic_vector(14-1 downto 0);
    signal  x_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36_signal : std_logic_vector(15-1 downto 0);
    signal  x_cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0_signal : std_logic_vector(15-1 downto 0);
    signal  x_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5_signal : std_logic_vector(14-1 downto 0);
    signal  x_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13_signal : std_logic_vector(12-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c2_cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c1_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c3_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13 : std_logic_vector(12-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c2_cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c1_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c3_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13_mux_out : std_logic_vector(12-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv6_core2_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20 => x_cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20_signal, 
                R_cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1 => x_cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1_signal, 
                R_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15 => x_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15_signal, 
                R_cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36 => x_cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36_signal, 
                R_cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0 => x_cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0_signal, 
                R_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53 => x_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53_signal, 
                R_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15 => x_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15_signal, 
                R_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5 => x_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5_signal, 
                R_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13 => x_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20 <= x_cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20_signal;
    x_f_f1_r1_c2_cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1 <= x_cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1_signal;
    x_f_f1_r1_c3_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15 <= x_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15_signal;
    x_f_f1_r2_c1_cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36 <= x_cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36_signal;
    x_f_f1_r2_c2_cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0 <= x_cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0_signal;
    x_f_f1_r2_c3_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53 <= x_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53_signal;
    x_f_f1_r3_c1_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15 <= x_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15_signal;
    x_f_f1_r3_c2_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5 <= x_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5_signal;
    x_f_f1_r3_c3_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13 <= x_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13_signal;

    -- like this:
    --MUX_K1_R1_C1_Wm69:     mux_2to1     generic map(DATA_WIDTH => (XI_WIDTH+WI_WIDTH))
    --port map(x_C1_TR_K1_R1_C1_Wm69,zeros,sel_1,x_C1_k1_r1_c1_mux_out);
    --MUX_K1_R1_C2_Wm6:     mux_2to1     generic map(DATA_WIDTH => (XI_WIDTH+WI_WIDTH))
    --port map(x_C1_TR_K1_R1_C2_Wm6,zeros,sel_2,x_C1_k1_r1_c2_mux_out);
    --MUX_K1_R1_C3_W42:     mux_2to1     generic map(DATA_WIDTH => (XI_WIDTH+WI_WIDTH))
    --port map(x_C1_TR_K1_R1_C3_W42,zeros,sel_3,x_C1_k1_r1_c3_mux_out);
    --MUX_K1_R1_C4_Wm10:     mux_2to1     generic map(DATA_WIDTH => (XI_WIDTH+WI_WIDTH))
    --port map(x_C1_TR_K1_R1_C4_Wm10,zeros,sel_4,x_C1_k1_r1_c4_mux_out);
    --MUX_K1_R1_C5_W164:     mux_2to1     generic map(DATA_WIDTH => (XI_WIDTH+WI_WIDTH))
    --port map(x_C1_TR_K1_R1_C5_W164,zeros,sel_5,x_C1_k1_r1_c5_mux_out);
    PADMUX_f_f1_r1_c1_cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20'length)
       port map(x_f_f1_r1_c1_cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20,(others => '0'),sel_1,x_f_f1_r1_c1_cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20_mux_out);
    PADMUX_f_f1_r1_c2_cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1'length)
       port map(x_f_f1_r1_c2_cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1,(others => '0'),sel_2,x_f_f1_r1_c2_cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1_mux_out);
    PADMUX_f_f1_r1_c3_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15'length)
       port map(x_f_f1_r1_c3_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15,(others => '0'),sel_3,x_f_f1_r1_c3_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15_mux_out);
    PADMUX_f_f1_r2_c1_cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36'length)
       port map(x_f_f1_r2_c1_cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36,(others => '0'),sel_1,x_f_f1_r2_c1_cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36_mux_out);
    PADMUX_f_f1_r2_c2_cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0'length)
       port map(x_f_f1_r2_c2_cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0,(others => '0'),sel_2,x_f_f1_r2_c2_cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0_mux_out);
    PADMUX_f_f1_r2_c3_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53'length)
       port map(x_f_f1_r2_c3_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53,(others => '0'),sel_3,x_f_f1_r2_c3_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53_mux_out);
    PADMUX_f_f1_r3_c1_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15'length)
       port map(x_f_f1_r3_c1_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15,(others => '0'),sel_1,x_f_f1_r3_c1_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15_mux_out);
    PADMUX_f_f1_r3_c2_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5'length)
       port map(x_f_f1_r3_c2_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5,(others => '0'),sel_2,x_f_f1_r3_c2_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5_mux_out);
    PADMUX_f_f1_r3_c3_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13'length)
       port map(x_f_f1_r3_c3_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13,(others => '0'),sel_3,x_f_f1_r3_c3_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20_mux_out; -- sfix(6, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1_mux_out; -- sfix(6, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15_mux_out; -- sfix(5, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36_mux_out; -- sfix(7, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0_mux_out; -- sfix(7, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53_mux_out; -- sfix(6, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15_mux_out; -- sfix(5, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5_mux_out; -- sfix(6, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13_mux_out; -- sfix(4, -8)

























end structural;