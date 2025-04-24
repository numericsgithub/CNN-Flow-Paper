LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv6_settings.all;

entity conv6_core3 is
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
        kpu_1_input_2 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_3 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_4 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_5 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_6 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_7 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_8 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_9 : out std_logic_vector(13-1 downto 0)  --	sfix(5, -8)
    );
end conv6_core3;

architecture structural of conv6_core3 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2_signal : std_logic_vector(14-1 downto 0);
    signal  x_c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5_signal : std_logic_vector(15-1 downto 0);
    signal  x_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3_signal : std_logic_vector(13-1 downto 0);
    signal  x_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15_signal : std_logic_vector(14-1 downto 0);
    signal  x_c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10_signal : std_logic_vector(15-1 downto 0);
    signal  x_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3_signal : std_logic_vector(15-1 downto 0);
    signal  x_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1_signal : std_logic_vector(13-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r1_c3_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r3_c3_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1 : std_logic_vector(13-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r1_c3_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r3_c3_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1_mux_out : std_logic_vector(13-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv6_core3_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2 => x_c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2_signal, 
                R_c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5 => x_c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5_signal, 
                R_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3 => x_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3_signal, 
                R_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15 => x_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15_signal, 
                R_c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10 => x_c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10_signal, 
                R_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7 => x_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7_signal, 
                R_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3 => x_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3_signal, 
                R_cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3 => x_cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3_signal, 
                R_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1 => x_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2 <= x_c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2_signal;
    x_f_f1_r1_c2_c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5 <= x_c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5_signal;
    x_f_f1_r1_c3_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3 <= x_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3_signal;
    x_f_f1_r2_c1_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15 <= x_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15_signal;
    x_f_f1_r2_c2_c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10 <= x_c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10_signal;
    x_f_f1_r2_c3_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7 <= x_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7_signal;
    x_f_f1_r3_c1_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3 <= x_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3_signal;
    x_f_f1_r3_c2_cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3 <= x_cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3_signal;
    x_f_f1_r3_c3_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1 <= x_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1_signal;

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
    PADMUX_f_f1_r1_c1_c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2'length)
       port map(x_f_f1_r1_c1_c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2,(others => '0'),sel_1,x_f_f1_r1_c1_c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2_mux_out);
    PADMUX_f_f1_r1_c2_c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5'length)
       port map(x_f_f1_r1_c2_c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5,(others => '0'),sel_2,x_f_f1_r1_c2_c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5_mux_out);
    PADMUX_f_f1_r1_c3_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3'length)
       port map(x_f_f1_r1_c3_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3,(others => '0'),sel_3,x_f_f1_r1_c3_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3_mux_out);
    PADMUX_f_f1_r2_c1_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15'length)
       port map(x_f_f1_r2_c1_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15,(others => '0'),sel_1,x_f_f1_r2_c1_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15_mux_out);
    PADMUX_f_f1_r2_c2_c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10'length)
       port map(x_f_f1_r2_c2_c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10,(others => '0'),sel_2,x_f_f1_r2_c2_c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10_mux_out);
    PADMUX_f_f1_r2_c3_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7'length)
       port map(x_f_f1_r2_c3_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7,(others => '0'),sel_3,x_f_f1_r2_c3_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7_mux_out);
    PADMUX_f_f1_r3_c1_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3'length)
       port map(x_f_f1_r3_c1_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3,(others => '0'),sel_1,x_f_f1_r3_c1_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3_mux_out);
    PADMUX_f_f1_r3_c2_cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3'length)
       port map(x_f_f1_r3_c2_cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3,(others => '0'),sel_2,x_f_f1_r3_c2_cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3_mux_out);
    PADMUX_f_f1_r3_c3_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1'length)
       port map(x_f_f1_r3_c3_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1,(others => '0'),sel_3,x_f_f1_r3_c3_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2_mux_out; -- sfix(6, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5_mux_out; -- sfix(7, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3_mux_out; -- sfix(5, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15_mux_out; -- sfix(6, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10_mux_out; -- sfix(7, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7_mux_out; -- sfix(5, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3_mux_out; -- sfix(5, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3_mux_out; -- sfix(7, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1_mux_out; -- sfix(5, -8)

























end structural;