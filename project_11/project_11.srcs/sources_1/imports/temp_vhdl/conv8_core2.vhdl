LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv8_settings.all;

entity conv8_core2 is
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
        kpu_1_input_4 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_5 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_6 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_7 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_8 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_9 : out std_logic_vector(11-1 downto 0)  --	sfix(3, -8)
    );
end conv8_core2;

architecture structural of conv8_core2 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14_signal : std_logic_vector(14-1 downto 0);
    signal  x_c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18_signal : std_logic_vector(14-1 downto 0);
    signal  x_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7_signal : std_logic_vector(13-1 downto 0);
    signal  x_c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18_signal : std_logic_vector(14-1 downto 0);
    signal  x_c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26_signal : std_logic_vector(15-1 downto 0);
    signal  x_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12_signal : std_logic_vector(13-1 downto 0);
    signal  x_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6_signal : std_logic_vector(13-1 downto 0);
    signal  x_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12_signal : std_logic_vector(13-1 downto 0);
    signal  x_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7_signal : std_logic_vector(11-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7 : std_logic_vector(11-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c1_c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c2_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c3_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7_mux_out : std_logic_vector(11-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv8_core2_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14 => x_c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14_signal, 
                R_c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18 => x_c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18_signal, 
                R_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7 => x_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7_signal, 
                R_c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18 => x_c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18_signal, 
                R_c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26 => x_c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26_signal, 
                R_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12 => x_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12_signal, 
                R_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6 => x_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6_signal, 
                R_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12 => x_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12_signal, 
                R_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7 => x_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14 <= x_c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14_signal;
    x_f_f1_r1_c2_c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18 <= x_c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18_signal;
    x_f_f1_r1_c3_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7 <= x_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7_signal;
    x_f_f1_r2_c1_c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18 <= x_c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18_signal;
    x_f_f1_r2_c2_c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26 <= x_c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26_signal;
    x_f_f1_r2_c3_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12 <= x_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12_signal;
    x_f_f1_r3_c1_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6 <= x_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6_signal;
    x_f_f1_r3_c2_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12 <= x_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12_signal;
    x_f_f1_r3_c3_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7 <= x_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7_signal;

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
    PADMUX_f_f1_r1_c1_c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14'length)
       port map(x_f_f1_r1_c1_c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14,(others => '0'),sel_1,x_f_f1_r1_c1_c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14_mux_out);
    PADMUX_f_f1_r1_c2_c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18'length)
       port map(x_f_f1_r1_c2_c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18,(others => '0'),sel_2,x_f_f1_r1_c2_c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18_mux_out);
    PADMUX_f_f1_r1_c3_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7'length)
       port map(x_f_f1_r1_c3_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7,(others => '0'),sel_3,x_f_f1_r1_c3_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7_mux_out);
    PADMUX_f_f1_r2_c1_c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18'length)
       port map(x_f_f1_r2_c1_c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18,(others => '0'),sel_1,x_f_f1_r2_c1_c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18_mux_out);
    PADMUX_f_f1_r2_c2_c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26'length)
       port map(x_f_f1_r2_c2_c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26,(others => '0'),sel_2,x_f_f1_r2_c2_c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26_mux_out);
    PADMUX_f_f1_r2_c3_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12'length)
       port map(x_f_f1_r2_c3_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12,(others => '0'),sel_3,x_f_f1_r2_c3_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12_mux_out);
    PADMUX_f_f1_r3_c1_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6'length)
       port map(x_f_f1_r3_c1_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6,(others => '0'),sel_1,x_f_f1_r3_c1_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6_mux_out);
    PADMUX_f_f1_r3_c2_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12'length)
       port map(x_f_f1_r3_c2_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12,(others => '0'),sel_2,x_f_f1_r3_c2_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12_mux_out);
    PADMUX_f_f1_r3_c3_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7'length)
       port map(x_f_f1_r3_c3_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7,(others => '0'),sel_3,x_f_f1_r3_c3_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14_mux_out; -- sfix(6, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18_mux_out; -- sfix(6, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7_mux_out; -- sfix(5, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18_mux_out; -- sfix(6, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26_mux_out; -- sfix(7, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12_mux_out; -- sfix(5, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6_mux_out; -- sfix(5, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12_mux_out; -- sfix(5, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7_mux_out; -- sfix(3, -8)

























end structural;