LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv6_settings.all;

entity conv6_core1 is
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




    
        kpu_1_input_1 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_2 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_3 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_4 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_5 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_6 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_7 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_8 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_9 : out std_logic_vector(12-1 downto 0)  --	sfix(4, -8)
    );
end conv6_core1;

architecture structural of conv6_core1 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8_signal : std_logic_vector(15-1 downto 0);
    signal  x_c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16_signal : std_logic_vector(14-1 downto 0);
    signal  x_c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20_signal : std_logic_vector(15-1 downto 0);
    signal  x_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10_signal : std_logic_vector(13-1 downto 0);
    signal  x_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5_signal : std_logic_vector(12-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r1_c2_c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c1_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5 : std_logic_vector(12-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r1_c2_c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c1_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5_mux_out : std_logic_vector(12-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv6_core1_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8 => x_cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8_signal, 
                R_c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16 => x_c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16_signal, 
                R_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0 => x_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0_signal, 
                R_cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16 => x_cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16_signal, 
                R_c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20 => x_c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20_signal, 
                R_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13 => x_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13_signal, 
                R_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2 => x_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2_signal, 
                R_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10 => x_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10_signal, 
                R_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5 => x_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8 <= x_cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8_signal;
    x_f_f1_r1_c2_c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16 <= x_c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16_signal;
    x_f_f1_r1_c3_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0 <= x_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0_signal;
    x_f_f1_r2_c1_cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16 <= x_cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16_signal;
    x_f_f1_r2_c2_c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20 <= x_c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20_signal;
    x_f_f1_r2_c3_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13 <= x_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13_signal;
    x_f_f1_r3_c1_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2 <= x_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2_signal;
    x_f_f1_r3_c2_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10 <= x_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10_signal;
    x_f_f1_r3_c3_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5 <= x_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5_signal;

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
    PADMUX_f_f1_r1_c1_cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8'length)
       port map(x_f_f1_r1_c1_cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8,(others => '0'),sel_1,x_f_f1_r1_c1_cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8_mux_out);
    PADMUX_f_f1_r1_c2_c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16'length)
       port map(x_f_f1_r1_c2_c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16,(others => '0'),sel_2,x_f_f1_r1_c2_c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16_mux_out);
    PADMUX_f_f1_r1_c3_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0'length)
       port map(x_f_f1_r1_c3_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0,(others => '0'),sel_3,x_f_f1_r1_c3_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0_mux_out);
    PADMUX_f_f1_r2_c1_cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16'length)
       port map(x_f_f1_r2_c1_cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16,(others => '0'),sel_1,x_f_f1_r2_c1_cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16_mux_out);
    PADMUX_f_f1_r2_c2_c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20'length)
       port map(x_f_f1_r2_c2_c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20,(others => '0'),sel_2,x_f_f1_r2_c2_c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20_mux_out);
    PADMUX_f_f1_r2_c3_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13'length)
       port map(x_f_f1_r2_c3_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13,(others => '0'),sel_3,x_f_f1_r2_c3_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13_mux_out);
    PADMUX_f_f1_r3_c1_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2'length)
       port map(x_f_f1_r3_c1_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2,(others => '0'),sel_1,x_f_f1_r3_c1_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2_mux_out);
    PADMUX_f_f1_r3_c2_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10'length)
       port map(x_f_f1_r3_c2_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10,(others => '0'),sel_2,x_f_f1_r3_c2_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10_mux_out);
    PADMUX_f_f1_r3_c3_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5'length)
       port map(x_f_f1_r3_c3_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5,(others => '0'),sel_3,x_f_f1_r3_c3_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8_mux_out; -- sfix(7, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16_mux_out; -- sfix(6, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0_mux_out; -- sfix(5, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16_mux_out; -- sfix(6, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20_mux_out; -- sfix(7, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13_mux_out; -- sfix(6, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2_mux_out; -- sfix(5, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10_mux_out; -- sfix(5, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5_mux_out; -- sfix(4, -8)

























end structural;