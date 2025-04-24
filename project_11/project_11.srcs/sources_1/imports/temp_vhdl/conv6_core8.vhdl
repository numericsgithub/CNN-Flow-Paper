LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv6_settings.all;

entity conv6_core8 is
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
        kpu_1_input_6 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_7 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_8 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_9 : out std_logic_vector(14-1 downto 0)  --	sfix(6, -8)
    );
end conv6_core8;

architecture structural of conv6_core8 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98_signal : std_logic_vector(15-1 downto 0);
    signal  x_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71_signal : std_logic_vector(15-1 downto 0);
    signal  x_c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24_signal : std_logic_vector(15-1 downto 0);
    signal  x_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6_signal : std_logic_vector(13-1 downto 0);
    signal  x_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13_signal : std_logic_vector(14-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r1_c3_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r3_c1_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13 : std_logic_vector(14-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r1_c3_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r3_c1_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13_mux_out : std_logic_vector(14-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv6_core8_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37 => x_cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37_signal, 
                R_cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98 => x_cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98_signal, 
                R_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1 => x_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1_signal, 
                R_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55 => x_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55_signal, 
                R_cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71 => x_cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71_signal, 
                R_c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24 => x_c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24_signal, 
                R_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10 => x_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10_signal, 
                R_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6 => x_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6_signal, 
                R_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13 => x_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37 <= x_cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37_signal;
    x_f_f1_r1_c2_cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98 <= x_cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98_signal;
    x_f_f1_r1_c3_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1 <= x_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1_signal;
    x_f_f1_r2_c1_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55 <= x_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55_signal;
    x_f_f1_r2_c2_cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71 <= x_cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71_signal;
    x_f_f1_r2_c3_c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24 <= x_c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24_signal;
    x_f_f1_r3_c1_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10 <= x_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10_signal;
    x_f_f1_r3_c2_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6 <= x_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6_signal;
    x_f_f1_r3_c3_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13 <= x_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13_signal;

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
    PADMUX_f_f1_r1_c1_cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37'length)
       port map(x_f_f1_r1_c1_cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37,(others => '0'),sel_1,x_f_f1_r1_c1_cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37_mux_out);
    PADMUX_f_f1_r1_c2_cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98'length)
       port map(x_f_f1_r1_c2_cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98,(others => '0'),sel_2,x_f_f1_r1_c2_cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98_mux_out);
    PADMUX_f_f1_r1_c3_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1'length)
       port map(x_f_f1_r1_c3_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1,(others => '0'),sel_3,x_f_f1_r1_c3_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1_mux_out);
    PADMUX_f_f1_r2_c1_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55'length)
       port map(x_f_f1_r2_c1_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55,(others => '0'),sel_1,x_f_f1_r2_c1_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55_mux_out);
    PADMUX_f_f1_r2_c2_cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71'length)
       port map(x_f_f1_r2_c2_cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71,(others => '0'),sel_2,x_f_f1_r2_c2_cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71_mux_out);
    PADMUX_f_f1_r2_c3_c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24'length)
       port map(x_f_f1_r2_c3_c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24,(others => '0'),sel_3,x_f_f1_r2_c3_c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24_mux_out);
    PADMUX_f_f1_r3_c1_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10'length)
       port map(x_f_f1_r3_c1_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10,(others => '0'),sel_1,x_f_f1_r3_c1_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10_mux_out);
    PADMUX_f_f1_r3_c2_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6'length)
       port map(x_f_f1_r3_c2_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6,(others => '0'),sel_2,x_f_f1_r3_c2_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6_mux_out);
    PADMUX_f_f1_r3_c3_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13'length)
       port map(x_f_f1_r3_c3_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13,(others => '0'),sel_3,x_f_f1_r3_c3_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37_mux_out; -- sfix(6, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98_mux_out; -- sfix(7, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1_mux_out; -- sfix(5, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55_mux_out; -- sfix(6, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71_mux_out; -- sfix(7, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24_mux_out; -- sfix(7, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10_mux_out; -- sfix(5, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6_mux_out; -- sfix(5, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13_mux_out; -- sfix(6, -8)

























end structural;