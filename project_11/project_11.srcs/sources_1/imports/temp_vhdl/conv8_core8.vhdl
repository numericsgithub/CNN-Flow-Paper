LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv8_settings.all;

entity conv8_core8 is
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
        kpu_1_input_5 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_6 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_7 : out std_logic_vector(12-1 downto 0) ;  --	sfix(4, -8)
        kpu_1_input_8 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_9 : out std_logic_vector(12-1 downto 0)  --	sfix(4, -8)
    );
end conv8_core8;

architecture structural of conv8_core8 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20_signal : std_logic_vector(13-1 downto 0);
    signal  x_c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23_signal : std_logic_vector(13-1 downto 0);
    signal  x_c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10_signal : std_logic_vector(13-1 downto 0);
    signal  x_c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25_signal : std_logic_vector(13-1 downto 0);
    signal  x_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30_signal : std_logic_vector(13-1 downto 0);
    signal  x_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15_signal : std_logic_vector(13-1 downto 0);
    signal  x_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10_signal : std_logic_vector(12-1 downto 0);
    signal  x_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14_signal : std_logic_vector(13-1 downto 0);
    signal  x_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7_signal : std_logic_vector(12-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c2_c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c3_c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c2_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c3_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10 : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r3_c2_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7 : std_logic_vector(12-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c2_c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c3_c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c2_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c3_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10_mux_out : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r3_c2_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7_mux_out : std_logic_vector(12-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv8_core8_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20 => x_c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20_signal, 
                R_c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23 => x_c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23_signal, 
                R_c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10 => x_c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10_signal, 
                R_c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25 => x_c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25_signal, 
                R_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30 => x_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30_signal, 
                R_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15 => x_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15_signal, 
                R_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10 => x_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10_signal, 
                R_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14 => x_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14_signal, 
                R_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7 => x_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20 <= x_c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20_signal;
    x_f_f1_r1_c2_c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23 <= x_c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23_signal;
    x_f_f1_r1_c3_c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10 <= x_c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10_signal;
    x_f_f1_r2_c1_c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25 <= x_c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25_signal;
    x_f_f1_r2_c2_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30 <= x_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30_signal;
    x_f_f1_r2_c3_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15 <= x_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15_signal;
    x_f_f1_r3_c1_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10 <= x_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10_signal;
    x_f_f1_r3_c2_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14 <= x_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14_signal;
    x_f_f1_r3_c3_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7 <= x_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7_signal;

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
    PADMUX_f_f1_r1_c1_c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20'length)
       port map(x_f_f1_r1_c1_c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20,(others => '0'),sel_1,x_f_f1_r1_c1_c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20_mux_out);
    PADMUX_f_f1_r1_c2_c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23'length)
       port map(x_f_f1_r1_c2_c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23,(others => '0'),sel_2,x_f_f1_r1_c2_c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23_mux_out);
    PADMUX_f_f1_r1_c3_c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10'length)
       port map(x_f_f1_r1_c3_c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10,(others => '0'),sel_3,x_f_f1_r1_c3_c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10_mux_out);
    PADMUX_f_f1_r2_c1_c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25'length)
       port map(x_f_f1_r2_c1_c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25,(others => '0'),sel_1,x_f_f1_r2_c1_c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25_mux_out);
    PADMUX_f_f1_r2_c2_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30'length)
       port map(x_f_f1_r2_c2_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30,(others => '0'),sel_2,x_f_f1_r2_c2_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30_mux_out);
    PADMUX_f_f1_r2_c3_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15'length)
       port map(x_f_f1_r2_c3_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15,(others => '0'),sel_3,x_f_f1_r2_c3_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15_mux_out);
    PADMUX_f_f1_r3_c1_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10'length)
       port map(x_f_f1_r3_c1_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10,(others => '0'),sel_1,x_f_f1_r3_c1_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10_mux_out);
    PADMUX_f_f1_r3_c2_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14'length)
       port map(x_f_f1_r3_c2_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14,(others => '0'),sel_2,x_f_f1_r3_c2_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14_mux_out);
    PADMUX_f_f1_r3_c3_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7'length)
       port map(x_f_f1_r3_c3_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7,(others => '0'),sel_3,x_f_f1_r3_c3_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20_mux_out; -- sfix(5, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23_mux_out; -- sfix(5, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10_mux_out; -- sfix(5, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25_mux_out; -- sfix(5, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30_mux_out; -- sfix(5, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15_mux_out; -- sfix(5, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10_mux_out; -- sfix(4, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14_mux_out; -- sfix(5, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7_mux_out; -- sfix(4, -8)

























end structural;