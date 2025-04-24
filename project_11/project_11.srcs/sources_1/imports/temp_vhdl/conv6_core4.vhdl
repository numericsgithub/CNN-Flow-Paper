LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv6_settings.all;

entity conv6_core4 is
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
        kpu_1_input_4 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_5 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_6 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_7 : out std_logic_vector(12-1 downto 0) ;  --	sfix(4, -8)
        kpu_1_input_8 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_9 : out std_logic_vector(13-1 downto 0)  --	sfix(5, -8)
    );
end conv6_core4;

architecture structural of conv6_core4 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1_signal : std_logic_vector(12-1 downto 0);
    signal  x_cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8_signal : std_logic_vector(13-1 downto 0);
    signal  x_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3_signal : std_logic_vector(12-1 downto 0);
    signal  x_cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5_signal : std_logic_vector(15-1 downto 0);
    signal  x_c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17_signal : std_logic_vector(15-1 downto 0);
    signal  x_cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8_signal : std_logic_vector(13-1 downto 0);
    signal  x_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5_signal : std_logic_vector(12-1 downto 0);
    signal  x_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1_signal : std_logic_vector(13-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1 : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r1_c2_cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c3_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3 : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r2_c1_cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c2_c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5 : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r3_c2_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1 : std_logic_vector(13-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1_mux_out : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r1_c2_cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c3_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3_mux_out : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r2_c1_cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c2_c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5_mux_out : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r3_c2_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1_mux_out : std_logic_vector(13-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv6_core4_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1 => x_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1_signal, 
                R_cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8 => x_cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8_signal, 
                R_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3 => x_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3_signal, 
                R_cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5 => x_cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5_signal, 
                R_c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17 => x_c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17_signal, 
                R_cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8 => x_cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8_signal, 
                R_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5 => x_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5_signal, 
                R_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2 => x_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2_signal, 
                R_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1 => x_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1 <= x_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1_signal;
    x_f_f1_r1_c2_cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8 <= x_cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8_signal;
    x_f_f1_r1_c3_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3 <= x_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3_signal;
    x_f_f1_r2_c1_cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5 <= x_cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5_signal;
    x_f_f1_r2_c2_c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17 <= x_c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17_signal;
    x_f_f1_r2_c3_cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8 <= x_cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8_signal;
    x_f_f1_r3_c1_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5 <= x_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5_signal;
    x_f_f1_r3_c2_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2 <= x_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2_signal;
    x_f_f1_r3_c3_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1 <= x_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1_signal;

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
    PADMUX_f_f1_r1_c1_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1'length)
       port map(x_f_f1_r1_c1_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1,(others => '0'),sel_1,x_f_f1_r1_c1_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1_mux_out);
    PADMUX_f_f1_r1_c2_cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8'length)
       port map(x_f_f1_r1_c2_cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8,(others => '0'),sel_2,x_f_f1_r1_c2_cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8_mux_out);
    PADMUX_f_f1_r1_c3_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3'length)
       port map(x_f_f1_r1_c3_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3,(others => '0'),sel_3,x_f_f1_r1_c3_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3_mux_out);
    PADMUX_f_f1_r2_c1_cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5'length)
       port map(x_f_f1_r2_c1_cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5,(others => '0'),sel_1,x_f_f1_r2_c1_cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5_mux_out);
    PADMUX_f_f1_r2_c2_c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17'length)
       port map(x_f_f1_r2_c2_c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17,(others => '0'),sel_2,x_f_f1_r2_c2_c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17_mux_out);
    PADMUX_f_f1_r2_c3_cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8'length)
       port map(x_f_f1_r2_c3_cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8,(others => '0'),sel_3,x_f_f1_r2_c3_cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8_mux_out);
    PADMUX_f_f1_r3_c1_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5'length)
       port map(x_f_f1_r3_c1_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5,(others => '0'),sel_1,x_f_f1_r3_c1_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5_mux_out);
    PADMUX_f_f1_r3_c2_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2'length)
       port map(x_f_f1_r3_c2_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2,(others => '0'),sel_2,x_f_f1_r3_c2_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2_mux_out);
    PADMUX_f_f1_r3_c3_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1'length)
       port map(x_f_f1_r3_c3_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1,(others => '0'),sel_3,x_f_f1_r3_c3_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1_mux_out; -- sfix(4, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8_mux_out; -- sfix(5, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3_mux_out; -- sfix(4, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5_mux_out; -- sfix(7, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17_mux_out; -- sfix(7, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8_mux_out; -- sfix(5, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5_mux_out; -- sfix(4, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2_mux_out; -- sfix(5, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1_mux_out; -- sfix(5, -8)

























end structural;