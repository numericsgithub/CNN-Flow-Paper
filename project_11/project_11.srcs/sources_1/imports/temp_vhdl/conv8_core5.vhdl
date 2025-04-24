LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv8_settings.all;

entity conv8_core5 is
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
        kpu_1_input_2 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_3 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_4 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_5 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_6 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_7 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_8 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_9 : out std_logic_vector(12-1 downto 0)  --	sfix(4, -8)
    );
end conv8_core5;

architecture structural of conv8_core5 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9_signal : std_logic_vector(12-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c3_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c3_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9 : std_logic_vector(12-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c3_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c3_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9_mux_out : std_logic_vector(12-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv8_core5_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18 => x_cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18_signal, 
                R_cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14 => x_cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14_signal, 
                R_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11 => x_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11_signal, 
                R_cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31 => x_cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31_signal, 
                R_cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15 => x_cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15_signal, 
                R_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17 => x_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17_signal, 
                R_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21 => x_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21_signal, 
                R_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3 => x_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3_signal, 
                R_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9 => x_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18 <= x_cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18_signal;
    x_f_f1_r1_c2_cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14 <= x_cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14_signal;
    x_f_f1_r1_c3_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11 <= x_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11_signal;
    x_f_f1_r2_c1_cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31 <= x_cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31_signal;
    x_f_f1_r2_c2_cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15 <= x_cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15_signal;
    x_f_f1_r2_c3_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17 <= x_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17_signal;
    x_f_f1_r3_c1_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21 <= x_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21_signal;
    x_f_f1_r3_c2_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3 <= x_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3_signal;
    x_f_f1_r3_c3_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9 <= x_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9_signal;

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
    PADMUX_f_f1_r1_c1_cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18'length)
       port map(x_f_f1_r1_c1_cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18,(others => '0'),sel_1,x_f_f1_r1_c1_cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18_mux_out);
    PADMUX_f_f1_r1_c2_cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14'length)
       port map(x_f_f1_r1_c2_cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14,(others => '0'),sel_2,x_f_f1_r1_c2_cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14_mux_out);
    PADMUX_f_f1_r1_c3_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11'length)
       port map(x_f_f1_r1_c3_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11,(others => '0'),sel_3,x_f_f1_r1_c3_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11_mux_out);
    PADMUX_f_f1_r2_c1_cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31'length)
       port map(x_f_f1_r2_c1_cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31,(others => '0'),sel_1,x_f_f1_r2_c1_cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31_mux_out);
    PADMUX_f_f1_r2_c2_cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15'length)
       port map(x_f_f1_r2_c2_cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15,(others => '0'),sel_2,x_f_f1_r2_c2_cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15_mux_out);
    PADMUX_f_f1_r2_c3_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17'length)
       port map(x_f_f1_r2_c3_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17,(others => '0'),sel_3,x_f_f1_r2_c3_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17_mux_out);
    PADMUX_f_f1_r3_c1_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21'length)
       port map(x_f_f1_r3_c1_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21,(others => '0'),sel_1,x_f_f1_r3_c1_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21_mux_out);
    PADMUX_f_f1_r3_c2_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3'length)
       port map(x_f_f1_r3_c2_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3,(others => '0'),sel_2,x_f_f1_r3_c2_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3_mux_out);
    PADMUX_f_f1_r3_c3_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9'length)
       port map(x_f_f1_r3_c3_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9,(others => '0'),sel_3,x_f_f1_r3_c3_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18_mux_out; -- sfix(6, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14_mux_out; -- sfix(5, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11_mux_out; -- sfix(5, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31_mux_out; -- sfix(6, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15_mux_out; -- sfix(6, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17_mux_out; -- sfix(5, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21_mux_out; -- sfix(5, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3_mux_out; -- sfix(5, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9_mux_out; -- sfix(4, -8)

























end structural;