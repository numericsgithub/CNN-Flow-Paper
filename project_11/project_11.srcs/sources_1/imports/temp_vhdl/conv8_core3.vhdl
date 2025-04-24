LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv8_settings.all;

entity conv8_core3 is
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




    
        kpu_1_input_1 : out std_logic_vector(12-1 downto 0) ;  --	sfix(4, -8)
        kpu_1_input_2 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_3 : out std_logic_vector(12-1 downto 0) ;  --	sfix(4, -8)
        kpu_1_input_4 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_5 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_6 : out std_logic_vector(12-1 downto 0) ;  --	sfix(4, -8)
        kpu_1_input_7 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_8 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_9 : out std_logic_vector(12-1 downto 0)  --	sfix(4, -8)
    );
end conv8_core3;

architecture structural of conv8_core3 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6_signal : std_logic_vector(12-1 downto 0);
    signal  x_cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4_signal : std_logic_vector(12-1 downto 0);
    signal  x_cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5_signal : std_logic_vector(12-1 downto 0);
    signal  x_cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2_signal : std_logic_vector(12-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6 : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r1_c2_cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c3_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4 : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r2_c1_cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c2_cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c3_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5 : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r3_c1_cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2 : std_logic_vector(12-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6_mux_out : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r1_c2_cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c3_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4_mux_out : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r2_c1_cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c2_cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c3_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5_mux_out : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r3_c1_cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2_mux_out : std_logic_vector(12-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv8_core3_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6 => x_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6_signal, 
                R_cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9 => x_cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9_signal, 
                R_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4 => x_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4_signal, 
                R_cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10 => x_cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10_signal, 
                R_cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14 => x_cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14_signal, 
                R_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5 => x_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5_signal, 
                R_cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4 => x_cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4_signal, 
                R_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5 => x_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5_signal, 
                R_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2 => x_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6 <= x_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6_signal;
    x_f_f1_r1_c2_cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9 <= x_cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9_signal;
    x_f_f1_r1_c3_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4 <= x_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4_signal;
    x_f_f1_r2_c1_cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10 <= x_cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10_signal;
    x_f_f1_r2_c2_cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14 <= x_cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14_signal;
    x_f_f1_r2_c3_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5 <= x_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5_signal;
    x_f_f1_r3_c1_cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4 <= x_cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4_signal;
    x_f_f1_r3_c2_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5 <= x_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5_signal;
    x_f_f1_r3_c3_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2 <= x_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2_signal;

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
    PADMUX_f_f1_r1_c1_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6'length)
       port map(x_f_f1_r1_c1_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6,(others => '0'),sel_1,x_f_f1_r1_c1_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6_mux_out);
    PADMUX_f_f1_r1_c2_cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9'length)
       port map(x_f_f1_r1_c2_cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9,(others => '0'),sel_2,x_f_f1_r1_c2_cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9_mux_out);
    PADMUX_f_f1_r1_c3_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4'length)
       port map(x_f_f1_r1_c3_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4,(others => '0'),sel_3,x_f_f1_r1_c3_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4_mux_out);
    PADMUX_f_f1_r2_c1_cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10'length)
       port map(x_f_f1_r2_c1_cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10,(others => '0'),sel_1,x_f_f1_r2_c1_cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10_mux_out);
    PADMUX_f_f1_r2_c2_cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14'length)
       port map(x_f_f1_r2_c2_cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14,(others => '0'),sel_2,x_f_f1_r2_c2_cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14_mux_out);
    PADMUX_f_f1_r2_c3_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5'length)
       port map(x_f_f1_r2_c3_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5,(others => '0'),sel_3,x_f_f1_r2_c3_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5_mux_out);
    PADMUX_f_f1_r3_c1_cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4'length)
       port map(x_f_f1_r3_c1_cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4,(others => '0'),sel_1,x_f_f1_r3_c1_cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4_mux_out);
    PADMUX_f_f1_r3_c2_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5'length)
       port map(x_f_f1_r3_c2_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5,(others => '0'),sel_2,x_f_f1_r3_c2_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5_mux_out);
    PADMUX_f_f1_r3_c3_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2'length)
       port map(x_f_f1_r3_c3_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2,(others => '0'),sel_3,x_f_f1_r3_c3_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6_mux_out; -- sfix(4, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9_mux_out; -- sfix(5, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4_mux_out; -- sfix(4, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10_mux_out; -- sfix(5, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14_mux_out; -- sfix(6, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5_mux_out; -- sfix(4, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4_mux_out; -- sfix(5, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5_mux_out; -- sfix(5, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2_mux_out; -- sfix(4, -8)

























end structural;