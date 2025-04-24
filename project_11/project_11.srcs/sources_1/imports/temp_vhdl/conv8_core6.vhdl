LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv8_settings.all;

entity conv8_core6 is
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




    
        kpu_1_input_1 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_2 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_3 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_4 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_5 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_6 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_7 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_8 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_9 : out std_logic_vector(13-1 downto 0)  --	sfix(5, -8)
    );
end conv8_core6;

architecture structural of conv8_core6 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17_signal : std_logic_vector(13-1 downto 0);
    signal  x_c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22_signal : std_logic_vector(13-1 downto 0);
    signal  x_c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8_signal : std_logic_vector(13-1 downto 0);
    signal  x_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2_signal : std_logic_vector(13-1 downto 0);
    signal  x_c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6_signal : std_logic_vector(14-1 downto 0);
    signal  x_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9_signal : std_logic_vector(13-1 downto 0);
    signal  x_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10_signal : std_logic_vector(13-1 downto 0);
    signal  x_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14_signal : std_logic_vector(13-1 downto 0);
    signal  x_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6_signal : std_logic_vector(13-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c2_c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c3_c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c2_c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c3_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6 : std_logic_vector(13-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c2_c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c3_c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c2_c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c3_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6_mux_out : std_logic_vector(13-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv8_core6_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17 => x_c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17_signal, 
                R_c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22 => x_c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22_signal, 
                R_c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8 => x_c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8_signal, 
                R_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2 => x_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2_signal, 
                R_c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6 => x_c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6_signal, 
                R_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9 => x_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9_signal, 
                R_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10 => x_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10_signal, 
                R_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14 => x_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14_signal, 
                R_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6 => x_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17 <= x_c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17_signal;
    x_f_f1_r1_c2_c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22 <= x_c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22_signal;
    x_f_f1_r1_c3_c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8 <= x_c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8_signal;
    x_f_f1_r2_c1_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2 <= x_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2_signal;
    x_f_f1_r2_c2_c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6 <= x_c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6_signal;
    x_f_f1_r2_c3_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9 <= x_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9_signal;
    x_f_f1_r3_c1_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10 <= x_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10_signal;
    x_f_f1_r3_c2_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14 <= x_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14_signal;
    x_f_f1_r3_c3_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6 <= x_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6_signal;

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
    PADMUX_f_f1_r1_c1_c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17'length)
       port map(x_f_f1_r1_c1_c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17,(others => '0'),sel_1,x_f_f1_r1_c1_c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17_mux_out);
    PADMUX_f_f1_r1_c2_c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22'length)
       port map(x_f_f1_r1_c2_c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22,(others => '0'),sel_2,x_f_f1_r1_c2_c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22_mux_out);
    PADMUX_f_f1_r1_c3_c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8'length)
       port map(x_f_f1_r1_c3_c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8,(others => '0'),sel_3,x_f_f1_r1_c3_c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8_mux_out);
    PADMUX_f_f1_r2_c1_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2'length)
       port map(x_f_f1_r2_c1_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2,(others => '0'),sel_1,x_f_f1_r2_c1_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2_mux_out);
    PADMUX_f_f1_r2_c2_c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6'length)
       port map(x_f_f1_r2_c2_c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6,(others => '0'),sel_2,x_f_f1_r2_c2_c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6_mux_out);
    PADMUX_f_f1_r2_c3_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9'length)
       port map(x_f_f1_r2_c3_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9,(others => '0'),sel_3,x_f_f1_r2_c3_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9_mux_out);
    PADMUX_f_f1_r3_c1_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10'length)
       port map(x_f_f1_r3_c1_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10,(others => '0'),sel_1,x_f_f1_r3_c1_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10_mux_out);
    PADMUX_f_f1_r3_c2_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14'length)
       port map(x_f_f1_r3_c2_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14,(others => '0'),sel_2,x_f_f1_r3_c2_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14_mux_out);
    PADMUX_f_f1_r3_c3_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6'length)
       port map(x_f_f1_r3_c3_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6,(others => '0'),sel_3,x_f_f1_r3_c3_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17_mux_out; -- sfix(5, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22_mux_out; -- sfix(5, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8_mux_out; -- sfix(5, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2_mux_out; -- sfix(5, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6_mux_out; -- sfix(6, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9_mux_out; -- sfix(5, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10_mux_out; -- sfix(5, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14_mux_out; -- sfix(5, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6_mux_out; -- sfix(5, -8)

























end structural;