LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv8_settings.all;

entity conv8_core4 is
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
        kpu_1_input_3 : out std_logic_vector(12-1 downto 0) ;  --	sfix(4, -8)
        kpu_1_input_4 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_5 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_6 : out std_logic_vector(13-1 downto 0) ;  --	sfix(5, -8)
        kpu_1_input_7 : out std_logic_vector(12-1 downto 0) ;  --	sfix(4, -8)
        kpu_1_input_8 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_9 : out std_logic_vector(13-1 downto 0)  --	sfix(5, -8)
    );
end conv8_core4;

architecture structural of conv8_core4 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7_signal : std_logic_vector(12-1 downto 0);
    signal  x_cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5_signal : std_logic_vector(12-1 downto 0);
    signal  x_cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1_signal : std_logic_vector(13-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7 : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r2_c1_cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c2_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c3_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5 : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r3_c2_cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c3_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1 : std_logic_vector(13-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c2_cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7_mux_out : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r2_c1_cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c2_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r2_c3_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r3_c1_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5_mux_out : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r3_c2_cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c3_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1_mux_out : std_logic_vector(13-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv8_core4_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7 => x_cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7_signal, 
                R_cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12 => x_cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12_signal, 
                R_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7 => x_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7_signal, 
                R_cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11 => x_cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11_signal, 
                R_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14 => x_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14_signal, 
                R_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6 => x_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6_signal, 
                R_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5 => x_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5_signal, 
                R_cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5 => x_cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5_signal, 
                R_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1 => x_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7 <= x_cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7_signal;
    x_f_f1_r1_c2_cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12 <= x_cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12_signal;
    x_f_f1_r1_c3_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7 <= x_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7_signal;
    x_f_f1_r2_c1_cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11 <= x_cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11_signal;
    x_f_f1_r2_c2_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14 <= x_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14_signal;
    x_f_f1_r2_c3_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6 <= x_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6_signal;
    x_f_f1_r3_c1_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5 <= x_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5_signal;
    x_f_f1_r3_c2_cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5 <= x_cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5_signal;
    x_f_f1_r3_c3_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1 <= x_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1_signal;

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
    PADMUX_f_f1_r1_c1_cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7'length)
       port map(x_f_f1_r1_c1_cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7,(others => '0'),sel_1,x_f_f1_r1_c1_cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7_mux_out);
    PADMUX_f_f1_r1_c2_cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12'length)
       port map(x_f_f1_r1_c2_cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12,(others => '0'),sel_2,x_f_f1_r1_c2_cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12_mux_out);
    PADMUX_f_f1_r1_c3_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7'length)
       port map(x_f_f1_r1_c3_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7,(others => '0'),sel_3,x_f_f1_r1_c3_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7_mux_out);
    PADMUX_f_f1_r2_c1_cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11'length)
       port map(x_f_f1_r2_c1_cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11,(others => '0'),sel_1,x_f_f1_r2_c1_cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11_mux_out);
    PADMUX_f_f1_r2_c2_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14'length)
       port map(x_f_f1_r2_c2_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14,(others => '0'),sel_2,x_f_f1_r2_c2_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14_mux_out);
    PADMUX_f_f1_r2_c3_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6'length)
       port map(x_f_f1_r2_c3_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6,(others => '0'),sel_3,x_f_f1_r2_c3_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6_mux_out);
    PADMUX_f_f1_r3_c1_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5'length)
       port map(x_f_f1_r3_c1_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5,(others => '0'),sel_1,x_f_f1_r3_c1_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5_mux_out);
    PADMUX_f_f1_r3_c2_cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5'length)
       port map(x_f_f1_r3_c2_cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5,(others => '0'),sel_2,x_f_f1_r3_c2_cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5_mux_out);
    PADMUX_f_f1_r3_c3_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1'length)
       port map(x_f_f1_r3_c3_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1,(others => '0'),sel_3,x_f_f1_r3_c3_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7_mux_out; -- sfix(6, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12_mux_out; -- sfix(6, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7_mux_out; -- sfix(4, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11_mux_out; -- sfix(5, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14_mux_out; -- sfix(5, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6_mux_out; -- sfix(5, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5_mux_out; -- sfix(4, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5_mux_out; -- sfix(6, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1_mux_out; -- sfix(5, -8)

























end structural;