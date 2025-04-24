LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv8_settings.all;

entity conv8_core7 is
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
        kpu_1_input_3 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_4 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_5 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_6 : out std_logic_vector(12-1 downto 0) ;  --	sfix(4, -8)
        kpu_1_input_7 : out std_logic_vector(14-1 downto 0) ;  --	sfix(6, -8)
        kpu_1_input_8 : out std_logic_vector(15-1 downto 0) ;  --	sfix(7, -8)
        kpu_1_input_9 : out std_logic_vector(14-1 downto 0)  --	sfix(6, -8)
    );
end conv8_core7;

architecture structural of conv8_core7 is

    -- like this: signal x_wc3c1_signal :   std_logic_vector(14 downto 0);
    signal  x_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5_signal : std_logic_vector(13-1 downto 0);
    signal  x_cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6_signal : std_logic_vector(14-1 downto 0);
    signal  x_cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4_signal : std_logic_vector(14-1 downto 0);
    signal  x_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8_signal : std_logic_vector(14-1 downto 0);
    signal  x_c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9_signal : std_logic_vector(15-1 downto 0);
    signal  x_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4_signal : std_logic_vector(12-1 downto 0);
    signal  x_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5_signal : std_logic_vector(14-1 downto 0);
    signal  x_c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5_signal : std_logic_vector(15-1 downto 0);
    signal  x_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1_signal : std_logic_vector(14-1 downto 0);
    signal  x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : std_logic_vector(9-1 downto 0);

    -- like this: signal x_C1_TR_K1_R1_C1_Wm69 : ACCU_TYPE;
    signal x_f_f1_r1_c1_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5 : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c2_cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c1_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4 : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r3_c1_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5 : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c2_c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5 : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r3_c3_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1 : std_logic_vector(14-1 downto 0);

    -- like this: signal x_C1_k1_r1_c1_mux_out : ACCU_TYPE;
    signal x_f_f1_r1_c1_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5_mux_out : std_logic_vector(13-1 downto 0);
    signal x_f_f1_r1_c2_cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r1_c3_cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c1_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r2_c2_c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r2_c3_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4_mux_out : std_logic_vector(12-1 downto 0);
    signal x_f_f1_r3_c1_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5_mux_out : std_logic_vector(14-1 downto 0);
    signal x_f_f1_r3_c2_c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5_mux_out : std_logic_vector(15-1 downto 0);
    signal x_f_f1_r3_c3_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1_mux_out : std_logic_vector(14-1 downto 0);













    signal zeros 		: ACCU_TYPE;
    --signal x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal : ACCU_TYPE;
    --signal xi_reg      : XI_TYPE;
    signal sel_reg     : SEL_CONFIGURATIONS_TYPE;

begin
    zeros <= (others => '0');
    sel_reg <= sel_config;
    --input_reg   : entity work.reg generic map(DATA_WIDTH => XI_WIDTH) port map(clk, reset, xi, xi_reg);
    
















    rmcm_block  : entity work.conv8_core7_rmcm
        generic map(PIPELINE_STEPS => PIPELINE_STEPS)
        port map
        (
            
                clk,
                sel_reg,
                xi,
                --like this: c3c1 => x_wc3c1_signal,
                R_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5 => x_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5_signal, 
                R_cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6 => x_cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6_signal, 
                R_cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4 => x_cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4_signal, 
                R_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8 => x_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8_signal, 
                R_c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9 => x_c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9_signal, 
                R_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4 => x_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4_signal, 
                R_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5 => x_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5_signal, 
                R_c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5 => x_c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5_signal, 
                R_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1 => x_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1_signal, 
                R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 => x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal
       );

    -- like this: x_C1_TR_K1_R1_C1_Wm69 <= std_logic_vector(resize(signed(x_wc3c1_signal),(XI_WIDTH+WI_WIDTH)));
    --x_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_signal <= zeros;
    x_f_f1_r1_c1_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5 <= x_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5_signal;
    x_f_f1_r1_c2_cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6 <= x_cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6_signal;
    x_f_f1_r1_c3_cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4 <= x_cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4_signal;
    x_f_f1_r2_c1_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8 <= x_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8_signal;
    x_f_f1_r2_c2_c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9 <= x_c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9_signal;
    x_f_f1_r2_c3_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4 <= x_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4_signal;
    x_f_f1_r3_c1_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5 <= x_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5_signal;
    x_f_f1_r3_c2_c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5 <= x_c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5_signal;
    x_f_f1_r3_c3_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1 <= x_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1_signal;

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
    PADMUX_f_f1_r1_c1_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c1_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5'length)
       port map(x_f_f1_r1_c1_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5,(others => '0'),sel_1,x_f_f1_r1_c1_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5_mux_out);
    PADMUX_f_f1_r1_c2_cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c2_cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6'length)
       port map(x_f_f1_r1_c2_cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6,(others => '0'),sel_2,x_f_f1_r1_c2_cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6_mux_out);
    PADMUX_f_f1_r1_c3_cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r1_c3_cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4'length)
       port map(x_f_f1_r1_c3_cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4,(others => '0'),sel_3,x_f_f1_r1_c3_cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4_mux_out);
    PADMUX_f_f1_r2_c1_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c1_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8'length)
       port map(x_f_f1_r2_c1_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8,(others => '0'),sel_1,x_f_f1_r2_c1_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8_mux_out);
    PADMUX_f_f1_r2_c2_c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c2_c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9'length)
       port map(x_f_f1_r2_c2_c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9,(others => '0'),sel_2,x_f_f1_r2_c2_c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9_mux_out);
    PADMUX_f_f1_r2_c3_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r2_c3_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4'length)
       port map(x_f_f1_r2_c3_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4,(others => '0'),sel_3,x_f_f1_r2_c3_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4_mux_out);
    PADMUX_f_f1_r3_c1_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c1_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5'length)
       port map(x_f_f1_r3_c1_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5,(others => '0'),sel_1,x_f_f1_r3_c1_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5_mux_out);
    PADMUX_f_f1_r3_c2_c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c2_c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5'length)
       port map(x_f_f1_r3_c2_c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5,(others => '0'),sel_2,x_f_f1_r3_c2_c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5_mux_out);
    PADMUX_f_f1_r3_c3_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1: entity work.mux_2to1 generic map(DATA_WIDTH => x_f_f1_r3_c3_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1'length)
       port map(x_f_f1_r3_c3_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1,(others => '0'),sel_3,x_f_f1_r3_c3_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1_mux_out);


    kpu_1_input_1 <= x_f_f1_r1_c1_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5_mux_out; -- sfix(5, -8)
    kpu_1_input_2 <= x_f_f1_r1_c2_cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6_mux_out; -- sfix(6, -8)
    kpu_1_input_3 <= x_f_f1_r1_c3_cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4_mux_out; -- sfix(6, -8)
    kpu_1_input_4 <= x_f_f1_r2_c1_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8_mux_out; -- sfix(6, -8)
    kpu_1_input_5 <= x_f_f1_r2_c2_c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9_mux_out; -- sfix(7, -8)
    kpu_1_input_6 <= x_f_f1_r2_c3_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4_mux_out; -- sfix(4, -8)
    kpu_1_input_7 <= x_f_f1_r3_c1_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5_mux_out; -- sfix(6, -8)
    kpu_1_input_8 <= x_f_f1_r3_c2_c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5_mux_out; -- sfix(7, -8)
    kpu_1_input_9 <= x_f_f1_r3_c3_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1_mux_out; -- sfix(6, -8)

























end structural;