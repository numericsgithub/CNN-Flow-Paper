LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv6_settings.all;

entity conv6_core6 is
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
        kpu_1_input_2 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_3 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_4 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_5 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_6 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_7 : out std_logic_vector(12-1 downto 0) ;  --	sfix(4, -8)
        kpu_1_input_8 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_9 : out std_logic_vector(12-1 downto 0)  --	sfix(4, -8)
    );
end conv6_core6;

architecture structural of conv6_core6 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0_signal : std_logic_vector(14-1 downto 0);
    signal  x_c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8_signal : std_logic_vector(15-1 downto 0);
    signal  x_cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1_signal : std_logic_vector(12-1 downto 0);
    signal  x_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0_signal : std_logic_vector(12-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c2_cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c1_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1 : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r3_c2_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0 : std_logic_vector(12-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c2_cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c1_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1_mux_out : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r3_c2_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0_mux_out : std_logic_vector(12-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv6_core6_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2 => x_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2_signal, 
                R_cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18 => x_cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18_signal, 
                R_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3 => x_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3_signal, 
                R_cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0 => x_cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0_signal, 
                R_c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8 => x_c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8_signal, 
                R_cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3 => x_cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3_signal, 
                R_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1 => x_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1_signal, 
                R_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1 => x_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1_signal, 
                R_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0 => x_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2 <= x_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2_signal;
    x_f_f1_r1_c2_cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18 <= x_cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18_signal;
    x_f_f1_r1_c3_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3 <= x_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3_signal;
    x_f_f1_r2_c1_cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0 <= x_cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0_signal;
    x_f_f1_r2_c2_c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8 <= x_c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8_signal;
    x_f_f1_r2_c3_cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3 <= x_cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3_signal;
    x_f_f1_r3_c1_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1 <= x_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1_signal;
    x_f_f1_r3_c2_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1 <= x_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1_signal;
    x_f_f1_r3_c3_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0 <= x_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0_signal;

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
    PADMUX_f_f1_r1_c1_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2'length)
       port map(x_f_f1_r1_c1_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2,(others => '0'),sel_1,x_f_f1_r1_c1_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2_mux_out);
    PADMUX_f_f1_r1_c2_cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18'length)
       port map(x_f_f1_r1_c2_cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18,(others => '0'),sel_2,x_f_f1_r1_c2_cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18_mux_out);
    PADMUX_f_f1_r1_c3_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3'length)
       port map(x_f_f1_r1_c3_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3,(others => '0'),sel_3,x_f_f1_r1_c3_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3_mux_out);
    PADMUX_f_f1_r2_c1_cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0'length)
       port map(x_f_f1_r2_c1_cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0,(others => '0'),sel_1,x_f_f1_r2_c1_cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0_mux_out);
    PADMUX_f_f1_r2_c2_c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8'length)
       port map(x_f_f1_r2_c2_c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8,(others => '0'),sel_2,x_f_f1_r2_c2_c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8_mux_out);
    PADMUX_f_f1_r2_c3_cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3'length)
       port map(x_f_f1_r2_c3_cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3,(others => '0'),sel_3,x_f_f1_r2_c3_cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3_mux_out);
    PADMUX_f_f1_r3_c1_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1'length)
       port map(x_f_f1_r3_c1_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1,(others => '0'),sel_1,x_f_f1_r3_c1_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1_mux_out);
    PADMUX_f_f1_r3_c2_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1'length)
       port map(x_f_f1_r3_c2_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1,(others => '0'),sel_2,x_f_f1_r3_c2_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1_mux_out);
    PADMUX_f_f1_r3_c3_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0'length)
       port map(x_f_f1_r3_c3_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0,(others => '0'),sel_3,x_f_f1_r3_c3_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2_mux_out; -- sfix(5, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18_mux_out; -- sfix(6, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3_mux_out; -- sfix(5, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0_mux_out; -- sfix(6, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8_mux_out; -- sfix(7, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3_mux_out; -- sfix(6, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1_mux_out; -- sfix(4, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1_mux_out; -- sfix(5, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0_mux_out; -- sfix(4, -8)

























end structural;