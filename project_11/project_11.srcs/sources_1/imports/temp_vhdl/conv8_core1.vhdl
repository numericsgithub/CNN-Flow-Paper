LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv8_settings.all;

entity conv8_core1 is
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
        kpu_1_input_4 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_5 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_6 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_7 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_8 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_9 : out std_logic_vector(13-1 downto 0)  --	sfix(5, -8)
    );
end conv8_core1;

architecture structural of conv8_core1 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10_signal : std_logic_vector(14-1 downto 0);
    signal  x_c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12_signal : std_logic_vector(14-1 downto 0);
    signal  x_c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4_signal : std_logic_vector(13-1 downto 0);
    signal  x_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14_signal : std_logic_vector(13-1 downto 0);
    signal  x_c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19_signal : std_logic_vector(14-1 downto 0);
    signal  x_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9_signal : std_logic_vector(13-1 downto 0);
    signal  x_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6_signal : std_logic_vector(13-1 downto 0);
    signal  x_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10_signal : std_logic_vector(13-1 downto 0);
    signal  x_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7_signal : std_logic_vector(13-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c2_c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c3_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7 : std_logic_vector(13-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c2_c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c3_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7_mux_out : std_logic_vector(13-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv8_core1_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10 => x_c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10_signal, 
                R_c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12 => x_c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12_signal, 
                R_c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4 => x_c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4_signal, 
                R_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14 => x_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14_signal, 
                R_c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19 => x_c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19_signal, 
                R_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9 => x_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9_signal, 
                R_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6 => x_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6_signal, 
                R_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10 => x_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10_signal, 
                R_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7 => x_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10 <= x_c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10_signal;
    x_f_f1_r1_c2_c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12 <= x_c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12_signal;
    x_f_f1_r1_c3_c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4 <= x_c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4_signal;
    x_f_f1_r2_c1_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14 <= x_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14_signal;
    x_f_f1_r2_c2_c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19 <= x_c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19_signal;
    x_f_f1_r2_c3_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9 <= x_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9_signal;
    x_f_f1_r3_c1_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6 <= x_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6_signal;
    x_f_f1_r3_c2_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10 <= x_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10_signal;
    x_f_f1_r3_c3_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7 <= x_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7_signal;

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
    PADMUX_f_f1_r1_c1_c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10'length)
       port map(x_f_f1_r1_c1_c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10,(others => '0'),sel_1,x_f_f1_r1_c1_c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10_mux_out);
    PADMUX_f_f1_r1_c2_c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12'length)
       port map(x_f_f1_r1_c2_c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12,(others => '0'),sel_2,x_f_f1_r1_c2_c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12_mux_out);
    PADMUX_f_f1_r1_c3_c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4'length)
       port map(x_f_f1_r1_c3_c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4,(others => '0'),sel_3,x_f_f1_r1_c3_c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4_mux_out);
    PADMUX_f_f1_r2_c1_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14'length)
       port map(x_f_f1_r2_c1_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14,(others => '0'),sel_1,x_f_f1_r2_c1_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14_mux_out);
    PADMUX_f_f1_r2_c2_c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19'length)
       port map(x_f_f1_r2_c2_c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19,(others => '0'),sel_2,x_f_f1_r2_c2_c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19_mux_out);
    PADMUX_f_f1_r2_c3_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9'length)
       port map(x_f_f1_r2_c3_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9,(others => '0'),sel_3,x_f_f1_r2_c3_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9_mux_out);
    PADMUX_f_f1_r3_c1_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6'length)
       port map(x_f_f1_r3_c1_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6,(others => '0'),sel_1,x_f_f1_r3_c1_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6_mux_out);
    PADMUX_f_f1_r3_c2_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10'length)
       port map(x_f_f1_r3_c2_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10,(others => '0'),sel_2,x_f_f1_r3_c2_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10_mux_out);
    PADMUX_f_f1_r3_c3_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7'length)
       port map(x_f_f1_r3_c3_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7,(others => '0'),sel_3,x_f_f1_r3_c3_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10_mux_out; -- sfix(6, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12_mux_out; -- sfix(6, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4_mux_out; -- sfix(5, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14_mux_out; -- sfix(5, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19_mux_out; -- sfix(6, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9_mux_out; -- sfix(5, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6_mux_out; -- sfix(5, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10_mux_out; -- sfix(5, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7_mux_out; -- sfix(5, -8)

























end structural;